
CREATE TABLE Notification(
    notification_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_type ENUM('CUSTOMER','EMPLOYEE','ADMIN') NOT NULL,
    user_id INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    message TEXT NOT NULL,
    notification_type ENUM('TRANSACTION','LOAN','SECURITY','SYSTEM') NOT NULL,
    priority ENUM('LOW','MEDIUM','HIGH') DEFAULT 'MEDIUM',
    channel ENUM('IN_APP','EMAIL','SMS','PUSH') DEFAULT 'IN_APP',
    status ENUM('PENDING','SENT','DELIVERED','FAILED') DEFAULT 'PENDING',
    is_read BOOLEAN DEFAULT FALSE,
    read_at TIMESTAMP NULL,
    reference_type VARCHAR(50),
    reference_id INT,
    error_log TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    sent_at TIMESTAMP NULL,

    INDEX(user_type, user_id),
    INDEX(status),
    INDEX(notification_type),
    INDEX(created_at)
);
