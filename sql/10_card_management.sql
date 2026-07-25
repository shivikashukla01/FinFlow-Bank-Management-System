CREATE TABLE Card(
    card_id INT PRIMARY KEY AUTO_INCREMENT,
    card_number VARCHAR(16) UNIQUE NOT NULL,
    card_type ENUM('DEBIT','CREDIT') NOT NULL,
    card_network ENUM('VISA','MASTERCARD','RUPAY') NOT NULL,
    account_id INT NOT NULL,
    issue_date DATE NOT NULL,
    expiry_date DATE NOT NULL,
    cvv VARCHAR(4) NOT NULL,
    pin_hash VARCHAR(255) NOT NULL,
    status ENUM('ACTIVE','BLOCKED','EXPIRED') DEFAULT 'ACTIVE',
    credit_limit DECIMAL(12,2) ,
    available_credit DECIMAL(12,2) ,

    FOREIGN KEY (account_id) REFERENCES Account(account_id) ON DELETE CASCADE
);
