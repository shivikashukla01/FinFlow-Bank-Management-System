CREATE TABLE Branch(
    branch_id INT PRIMARY KEY AUTO_INCREMENT,
    ifsc_code VARCHAR(11) UNIQUE NOT NULL,
    branch_name VARCHAR(100) NOT NULL,
    contact_no VARCHAR(15) NOT NULL,
    email_id VARCHAR(100) NOT NULL,
    opening_date DATE NOT NULL,
    manager_id INT NULL,
    
    INDEX(manager_id)
);

CREATE TABLE Role(
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Employee(
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL,
    middle_name VARCHAR(20),
    last_name VARCHAR(20),
    dob DATE,
    gender ENUM('Male','Female','Other','Prefer Not To Say'),
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    role_id INT NOT NULL,
    branch_id INT NOT NULL,
    reporting_manager_id INT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (role_id) REFERENCES Role(role_id),
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id),
    FOREIGN KEY (reporting_manager_id) 
        REFERENCES Employee(employee_id)
        ON DELETE SET NULL,

    INDEX(branch_id),
    INDEX(role_id),
    INDEX(reporting_manager_id)
);

ALTER TABLE Branch 
ADD FOREIGN KEY (manager_id)
REFERENCES Employee(employee_id)
ON DELETE SET NULL;