-- Drop junction tables first to remove foreign key references to Address
DROP TABLE IF EXISTS GuarantorAddress;
DROP TABLE IF EXISTS CustomerAddress;
DROP TABLE IF EXISTS EmployeeAddress;
DROP TABLE IF EXISTS BranchAddress;

-- Drop base Address table
DROP TABLE IF EXISTS Address;

-- Create Address table
CREATE TABLE Address (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    house_building_no VARCHAR(50) NOT NULL,
    street_locality VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    pincode VARCHAR(6) NOT NULL
);

-- Create BranchAddress table
CREATE TABLE BranchAddress (
    address_id INT NOT NULL,
    branch_id INT NOT NULL,

    PRIMARY KEY (address_id, branch_id),

    FOREIGN KEY (address_id) REFERENCES Address(address_id) ON DELETE CASCADE,
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id) ON DELETE CASCADE
);

-- Create EmployeeAddress table
CREATE TABLE EmployeeAddress (
    address_id INT NOT NULL,
    employee_id INT NOT NULL,

    PRIMARY KEY (address_id, employee_id),

    FOREIGN KEY (address_id) REFERENCES Address(address_id) ON DELETE CASCADE,
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id) ON DELETE CASCADE
);

-- Create CustomerAddress table
CREATE TABLE CustomerAddress (
    address_id INT NOT NULL,
    customer_id INT NOT NULL,
    
    PRIMARY KEY (address_id, customer_id),

    FOREIGN KEY (address_id) REFERENCES Address(address_id) ON DELETE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE
);

-- Create GuarantorAddress table
CREATE TABLE GuarantorAddress (
    address_id INT NOT NULL,
    guarantor_id INT NOT NULL,

    PRIMARY KEY (address_id, guarantor_id),

    FOREIGN KEY (address_id) REFERENCES Address(address_id) ON DELETE CASCADE,
    FOREIGN KEY (guarantor_id) REFERENCES Guarantor(guarantor_id) ON DELETE CASCADE
);