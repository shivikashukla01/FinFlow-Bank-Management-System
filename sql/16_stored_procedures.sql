DROP PROCEDURE IF EXISTS TransferMoney;


DELIMITER //

CREATE PROCEDURE TransferMoney(
    IN p_sender_id INT,
    IN p_receiver_id INT,
    IN p_amount DECIMAL(18,2)
)
proc_label: BEGIN
    DECLARE v_sender_balance DECIMAL(18,2);
    DECLARE v_receiver_balance DECIMAL(18,2);
    DECLARE v_sender_status VARCHAR(20);
    DECLARE v_receiver_status VARCHAR(20);
    DECLARE v_sender_type VARCHAR(20);        
    DECLARE v_min_allowed_bal DECIMAL(18,2);
    DECLARE v_sender_new_bal DECIMAL(18,2);
    DECLARE v_receiver_new_bal DECIMAL(18,2);
    DECLARE v_first_id INT;
    DECLARE v_second_id INT;
    DECLARE v_txn_id INT;
    DECLARE v_dummy_status VARCHAR(20);

    -- Variable to capture error details in the handler
    DECLARE v_err_msg VARCHAR(255);

    -- Centralized Exit Handler for ALL failures
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Capture the message from the SIGNAL or system exception
        GET DIAGNOSTICS CONDITION 1 v_err_msg = MESSAGE_TEXT;

        -- 1. Rollback any partial updates (balances, lock state, etc.)
        ROLLBACK;
        
        -- 2. Audit log the failure outside the rolled-back state
        INSERT INTO Transaction (txn_type, amount, currency, sender_account_id, receiver_account_id, status, failure_reason)
        VALUES ('TRANSFER', p_amount, 'INR', p_sender_id, p_receiver_id, 'FAILED', v_err_msg);

        -- 3. Re-raise the error so the caller knows it failed
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = v_err_msg;
    END;

    -- Basic Validation (Before transaction starts)
    IF p_sender_id = p_receiver_id THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Sender and receiver accounts cannot be the same.';
    END IF;

    IF p_amount <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Transfer amount must be greater than zero.';
    END IF;

    START TRANSACTION;

    
    -- 1. Deterministic Locking (Prevents Deadlocks)
    -- Always lock the account with the smaller ID first
    IF p_sender_id < p_receiver_id THEN
        SET v_first_id = p_sender_id;
        SET v_second_id = p_receiver_id;
    ELSE
        SET v_first_id = p_receiver_id;
        SET v_second_id = p_sender_id;
    END IF;

    -- Acquire locks on both rows in order, Here the status might get swapped, but we will fetch the actual statuses later, this is just to lock the rows to prevent concurrent modifications, so don't get confused by the variable names, they are just for locking purposes
    SELECT current_status INTO v_dummy_status FROM Account WHERE account_id = v_first_id FOR UPDATE;
    SELECT current_status INTO v_dummy_status FROM Account WHERE account_id = v_second_id FOR UPDATE;

    -- Fetch actual balances and statuses
    -- FIXED: Added account_type to SELECT and INTO clauses
    SELECT balance, current_status, account_type 
    INTO v_sender_balance, v_sender_status, v_sender_type
    FROM Account WHERE account_id = p_sender_id;

    SELECT balance, current_status INTO v_receiver_balance, v_receiver_status
    FROM Account WHERE account_id = p_receiver_id;

    -- 2. Business Logic Validation
    -- Throwing SIGNAL here automatically routes to the EXIT HANDLER
    IF v_sender_status IS NULL OR v_receiver_status IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Transfer failed: One or both account IDs do not exist.';
    END IF;

    IF v_sender_status != 'ACTIVE' OR v_receiver_status != 'ACTIVE' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Transfer failed: One or both accounts are not ACTIVE.';
    END IF;

    -- Set overdraft limit depending on account type
    IF v_sender_type = 'CURRENT' THEN
        SET v_min_allowed_bal = -50000.00; -- 50000 overdraft limit
    ELSE
        SET v_min_allowed_bal = 0.00;
    END IF;

    -- Check if transfer exceeds the account's specific minimum limit
    IF (v_sender_balance - p_amount) < v_min_allowed_bal THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Transfer failed: Transaction exceeds maximum allowed limit/overdraft.';
    END IF;

    -- Calculate post-transaction balances
    SET v_sender_new_bal = v_sender_balance - p_amount;
    SET v_receiver_new_bal = v_receiver_balance + p_amount;

    -- 3. Log Master Transaction
    INSERT INTO Transaction (txn_type, amount, currency, sender_account_id, receiver_account_id, status)
    VALUES ('TRANSFER', p_amount, 'INR', p_sender_id, p_receiver_id, 'SUCCESS');

    SET v_txn_id = LAST_INSERT_ID();

    -- 4. Update Account Balances
    UPDATE Account SET balance = v_sender_new_bal WHERE account_id = p_sender_id;
    UPDATE Account SET balance = v_receiver_new_bal WHERE account_id = p_receiver_id;

    -- 5. Write Ledger Entries
    INSERT INTO Ledger (txn_id, account_id, entry_type, amount, balance_after_txn)
    VALUES 
        (v_txn_id, p_sender_id, 'DEBIT', p_amount, v_sender_new_bal),
        (v_txn_id, p_receiver_id, 'CREDIT', p_amount, v_receiver_new_bal);

    COMMIT;
END //

DELIMITER ;