-- Drop log tables if they already exist
DROP TABLE IF EXISTS SystemLog;
DROP TABLE IF EXISTS AuditLog;

-- Create AuditLog table
CREATE TABLE AuditLog (
    audit_id INT PRIMARY KEY AUTO_INCREMENT,
    actor_type ENUM('ADMIN','EMPLOYEE','CUSTOMER') NOT NULL,
    actor_id INT NOT NULL,
    action ENUM('INSERT','UPDATE','DELETE','LOGIN','LOGOUT','APPROVE','REJECT') NOT NULL,
    entity_type VARCHAR(50) NOT NULL,
    entity_id INT NOT NULL,
    old_value TEXT,
    new_value TEXT,
    ip_address VARCHAR(45),
    device_info VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    INDEX(actor_type),
    INDEX(ip_address)
);

-- Create SystemLog table
CREATE TABLE SystemLog (
    log_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    record_type ENUM('EVENT','METRIC') NOT NULL,
    actor_type ENUM('ADMIN','EMPLOYEE','CUSTOMER','SYSTEM') DEFAULT 'SYSTEM',
    actor_id INT NULL,
    component_name VARCHAR(100) NOT NULL,
    action ENUM('INSERT','UPDATE','DELETE','LOGIN','LOGOUT','ERROR','WARNING','INFO'),
    entity_type VARCHAR(50),
    entity_id INT,
    metric_name VARCHAR(100),
    metric_value DECIMAL(12,4),
    description TEXT,
    ip_address VARCHAR(45),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    INDEX(record_type),
    INDEX(component_name),
    INDEX(created_at)
);