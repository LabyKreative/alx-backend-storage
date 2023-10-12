-- This SQL script creates a table named 'users' with the specified attributes and requirements:
-- - id: Integer, auto increment, and primary key.
-- - email: String of maximum 255 characters, not null, and unique.
-- - name: String of maximum 255 characters.
-- If the table already exists, the script will not fail.
CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255)
);
