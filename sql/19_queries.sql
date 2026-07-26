CALL TransferMoney(2, 1, 5000.00);

SELECT * From Transaction;

SELECT * From Ledger;

SELECT account_id FROM account WHERE current_status = "SUSPENDED";
CALL TransferMoney(13, 2, 7000.00);

SELECT * FROM account WHERE account_type = "CURRENT";
CALL TransferMoney(11, 14, 50001);
CALL TransferMoney(14, 4, 100000);


-- DROP PROCEDURE IF EXISTS loopTransfer;
-- Delimiter //
-- CREATE PROCEDURE loopTransfer()
-- BEGIN
-- 	DECLARE counter1 INT DEFAULT 1;
-- 	DECLARE counter2 INT;
--     DECLARE acc_status VARCHAR(20);
--     REPEAT 
--         SET counter2 = 2;
--         REPEAT 
-- 			SELECT status INTO acc_status FROM Account WHERE id = counter2;
--             IF acc_status = 'ACTIVE' THEN 
-- 				CALL TransferMoney(counter2,1,1);
-- 			END IF;
--             SET counter2 = counter2 + 1;
--         UNTIL counter2 > 20
--         END REPEAT;
-- 		SET counter1 = counter1 + 1;
--     UNTIL counter1 > 1000
--     END REPEAT;
-- END //
-- Delimiter ;
-- CALL loopTransfer();

