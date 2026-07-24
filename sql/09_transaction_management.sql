-- Drop dependent tables first
DROP TABLE IF EXISTS Ledger;
DROP TABLE IF EXISTS Transaction;

-- Create Transaction table
CREATE TABLE Transaction (
    txn_id INT PRIMARY KEY AUTO_INCREMENT,
    txn_type ENUM('DEPOSIT', 'WITHDRAW', 'TRANSFER') NOT NULL,
    amount DECIMAL(18, 2) NOT NULL,
    currency VARCHAR(10) DEFAULT 'INR',
    sender_account_id INT NULL,
    receiver_account_id INT NULL,
    status ENUM('PENDING', 'SUCCESS', 'FAILED') DEFAULT 'PENDING',
    txn_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (sender_account_id)
        REFERENCES Account (account_id)
        ON DELETE SET NULL,

    FOREIGN KEY (receiver_account_id)
        REFERENCES Account (account_id)
        ON DELETE SET NULL,

    INDEX (sender_account_id),
    INDEX (receiver_account_id)

    -- CHECK ((txn_type = 'DEPOSIT' AND receiver_account_id IS NOT NULL AND sender_account_id IS NULL)
    --      OR (txn_type = 'WITHDRAW' AND sender_account_id IS NOT NULL AND receiver_account_id IS NULL)
    --      OR (txn_type = 'TRANSFER' AND sender_account_id IS NOT NULL AND receiver_account_id IS NOT NULL))
);

-- Create Ledger table
CREATE TABLE Ledger (
    ledger_id INT PRIMARY KEY AUTO_INCREMENT,
    txn_id INT NOT NULL,
    account_id INT NOT NULL,
    entry_type ENUM('DEBIT', 'CREDIT') NOT NULL,
    amount DECIMAL(18, 2) NOT NULL,
    balance_after_txn DECIMAL(18, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (txn_id) REFERENCES Transaction(txn_id) ON DELETE CASCADE,
    FOREIGN KEY (account_id) REFERENCES Account(account_id) ON DELETE CASCADE,

    INDEX(txn_id),
    INDEX(account_id)
);