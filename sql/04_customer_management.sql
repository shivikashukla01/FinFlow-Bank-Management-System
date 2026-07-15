CREATE TABLE Customer(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL,
    middle_name VARCHAR(20),
    last_name VARCHAR(20),
    dob DATE,
    gender ENUM('Male','Female','Other','Prefer Not To Say'),
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Guarantor(
    guarantor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL,
    middle_name VARCHAR(20),
    last_name VARCHAR(20),
    dob DATE,
    financial_stability ENUM('LOW','MEDIUM','HIGH') NOT NULL,
    credit_score INT CHECK (credit_score BETWEEN 300 AND 900),
    income DECIMAL(12,2) CHECK (income >= 0)
);