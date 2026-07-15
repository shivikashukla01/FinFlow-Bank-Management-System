CREATE TABLE Loan (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    amount DECIMAL(12 , 2 ) NOT NULL CHECK (amount > 0),
    tenure INT NOT NULL CHECK (tenure > 0),
    tenure_unit ENUM('MONTH', 'YEAR') DEFAULT 'MONTH',
    loan_type ENUM('PERSONAL', 'CAR', 'TWO_WHEELER', 'HOME', 'BUSINESS', 'EDUCATIONAL', 'COMMERCIAL_VEHICLE') NOT NULL,
    interest_rate DECIMAL(5 , 2 ) NOT NULL CHECK (interest_rate > 0),
    status ENUM('SANCTIONED', 'PENDING', 'REJECTED', 'ACTIVE', 'CLOSED') DEFAULT 'PENDING',
    value_date DATE NOT NULL,
    disbursement_date DATE,
    maturity_date DATE, -- Made nullable Usually, the maturity date is calculated from the date the money is actually give If a loan is still PENDING, you might not know the exact maturity date yet.
    credit_score INT CHECK (credit_score BETWEEN 300 AND 900),
    collateral_security_type ENUM ('REAL_ESTATE', 'VEHICLE', 'GOLD', 'MACHINERY', 'INVENTORY', 'STOCKS', 'BONDS', 'MUTUAL_FUNDS', 'FIXED_DEPOSITS') DEFAULT NULL,
    collateral_security_value DECIMAL(20 , 2 ) CHECK (collateral_security_value >= 0) DEFAULT NULL,
    FOREIGN KEY (customer_id)
        REFERENCES Customer (customer_id)
        ON DELETE CASCADE,
	INDEX(status), 
    INDEX(customer_id)
);

CREATE TABLE LoanGuarantor(
    loan_id INT NOT NULL,
    guarantor_id INT NOT NULL,
    relationship VARCHAR(50),

    PRIMARY KEY (loan_id, guarantor_id),

    FOREIGN KEY (loan_id) REFERENCES Loan(loan_id) ON DELETE CASCADE,
    FOREIGN KEY (guarantor_id) REFERENCES Guarantor(guarantor_id) ON DELETE CASCADE
);

CREATE TABLE RepaymentSchedule(
    schedule_id INT PRIMARY KEY AUTO_INCREMENT,
    loan_id INT NOT NULL,
    installment_no INT NOT NULL,
    due_date DATE NOT NULL,
    amount_due DECIMAL(12,2) NOT NULL,
    principal_component DECIMAL(12,2) NOT NULL,
    interest_component DECIMAL(12,2) NOT NULL,
    status ENUM('PENDING','PAID','OVERDUE') DEFAULT 'PENDING',
    paid_date DATE,

    UNIQUE (loan_id, installment_no),

    FOREIGN KEY (loan_id) REFERENCES Loan(loan_id) ON DELETE CASCADE
);

CREATE TABLE LoanRepayment(
    repayment_id INT PRIMARY KEY AUTO_INCREMENT,
    loan_id INT NOT NULL,
    amount_paid DECIMAL(12,2) NOT NULL CHECK (amount_paid > 0),
    payment_date DATE NOT NULL,
    schedule_id INT,
    payment_mode ENUM(
        'CASH','DEBIT_CARD','CREDIT_CARD','UPI','NET_BANKING','DIGITAL_WALLET'
    ) NOT NULL,
    payment_type ENUM('EMI','PRE-PAYMENT','LATE_FEE'),

    FOREIGN KEY (loan_id) REFERENCES Loan(loan_id) ON DELETE CASCADE,
    FOREIGN KEY (schedule_id) REFERENCES RepaymentSchedule(schedule_id) ON DELETE CASCADE
);
