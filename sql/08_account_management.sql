CREATE TABLE Account(
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    account_no VARCHAR(20) UNIQUE NOT NULL,
    account_type ENUM('CURRENT','SAVINGS','SALARY','FIXED_DEPOSIT','RECURRING_DEPOSIT'),
    interest_rate DECIMAL(5,2) NOT NULL,
    branch_id INT NOT NULL,
    balance DECIMAL(18,2) NOT NULL DEFAULT 0 CHECK (balance >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    current_status ENUM('ACTIVE','CLOSED','SUSPENDED') DEFAULT 'ACTIVE',

    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id),

    INDEX(branch_id),
    INDEX(current_status)
);

ALTER TABLE Account
DROP CHECK account_chk_1;

ALTER TABLE Account
ADD CONSTRAINT overdraft_limit
CHECK(
    (account_type = 'CURRENT' AND balance >= -50000.00) OR
    (account_type != 'CURRENT' AND balance >= 0.00)
);

CREATE TABLE AccountHolder(
    account_id INT NOT NULL,
    customer_id INT NOT NULL,
    role ENUM('PRIMARY','SECONDARY') NOT NULL,
    ownership_percentage DECIMAL(5,2),

    PRIMARY KEY (account_id, customer_id),

    FOREIGN KEY (account_id) REFERENCES Account(account_id) ON DELETE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE,

    INDEX(customer_id)
);
