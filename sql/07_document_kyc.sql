CREATE TABLE Document(
    document_id INT PRIMARY KEY AUTO_INCREMENT,
    document_type ENUM('PAN_CARD','AADHAAR','INCOME_CERTIFICATE') NOT NULL,
    document_no VARCHAR(20) NOT NULL UNIQUE,
    secure_file_reference VARCHAR(100) NOT NULL,

    CHECK (
        (document_type = 'PAN_CARD' AND document_no REGEXP '^[A-Z]{5}[0-9]{4}[A-Z]$')
        OR
        (document_type = 'AADHAAR' AND document_no REGEXP '^[0-9]{12}$')
        OR
        (document_type = 'INCOME_CERTIFICATE')
    )
);

CREATE TABLE CustomerDocument(
    document_id INT NOT NULL,
    customer_id INT NOT NULL,

    PRIMARY KEY (document_id, customer_id),

    FOREIGN KEY (document_id) REFERENCES Document(document_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE GuarantorDocument(
    document_id INT NOT NULL,
    guarantor_id INT NOT NULL,

    PRIMARY KEY (document_id, guarantor_id),

    FOREIGN KEY (document_id) REFERENCES Document(document_id),
    FOREIGN KEY (guarantor_id) REFERENCES Guarantor(guarantor_id)
);

CREATE TABLE EmployeeDocument(
    document_id INT NOT NULL,
    employee_id INT NOT NULL,

    PRIMARY KEY (document_id, employee_id),

    FOREIGN KEY (document_id) REFERENCES Document(document_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

CREATE TABLE LoanDocument(
    document_id INT NOT NULL,
    loan_id INT NOT NULL,

    PRIMARY KEY (document_id, loan_id),

    FOREIGN KEY (document_id) REFERENCES Document(document_id),
    FOREIGN KEY (loan_id) REFERENCES Loan(loan_id)
);

-- ===================== 7. KYC =====================

CREATE TABLE KYC(
    kyc_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL UNIQUE,
    verification_status ENUM('REGISTERED','VERIFIED','ON_HOLD','REJECTED')
        NOT NULL DEFAULT 'REGISTERED',
    verified_by INT,
    verification_date DATE,

    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (verified_by) REFERENCES Employee(employee_id) ON DELETE SET NULL,

    INDEX(verified_by),
    INDEX(verification_status),
    INDEX(verification_date)
);
