CREATE TABLE Address(
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    house_building_no VARCHAR(50) NOT NULL,
    street_locality VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    pincode VARCHAR(6) NOT NULL
);

CREATE TABLE BranchAddress(
    address_id INT NOT NULL,
    branch_id INT NOT NULL,

    PRIMARY KEY (address_id, branch_id),

    FOREIGN KEY (address_id) REFERENCES Address(address_id) ON DELETE CASCADE,
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id) ON DELETE CASCADE
);

CREATE TABLE EmployeeAddress(
    address_id INT NOT NULL,
    employee_id INT NOT NULL,

    PRIMARY KEY (address_id, employee_id),

    FOREIGN KEY (address_id) REFERENCES Address(address_id) ON DELETE CASCADE,
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id) ON DELETE CASCADE
);

CREATE TABLE CustomerAddress(
    address_id INT NOT NULL,
    customer_id INT NOT NULL,
    
    PRIMARY KEY (address_id, customer_id),

    FOREIGN KEY (address_id) REFERENCES Address(address_id) ON DELETE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE
);

CREATE TABLE GuarantorAddress(
    address_id INT NOT NULL,
    guarantor_id INT NOT NULL,

    PRIMARY KEY (address_id, guarantor_id),

    FOREIGN KEY (address_id) REFERENCES Address(address_id) ON DELETE CASCADE,
    FOREIGN KEY (guarantor_id) REFERENCES Guarantor(guarantor_id) ON DELETE CASCADE
);
