CREATE TABLE Permission(
    permission_id INT PRIMARY KEY AUTO_INCREMENT,
    permission_name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(500)
);

CREATE TABLE RolePermission(
    role_id INT NOT NULL,
    permission_id INT NOT NULL,

    PRIMARY KEY (role_id, permission_id),

    FOREIGN KEY (role_id)
        REFERENCES Role(role_id)
        ON DELETE CASCADE,
    FOREIGN KEY (permission_id)
        REFERENCES Permission(permission_id)
        ON DELETE CASCADE
);