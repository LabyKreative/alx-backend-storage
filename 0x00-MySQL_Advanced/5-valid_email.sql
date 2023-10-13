-- This SQL script creates a trigger to reset valid_email when the email is updated.
DROP TRIGGER IF EXISTS before_update_email;
DELIMITER //
CREATE TRIGGER before_update_email
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    IF OLD.email != NEW.email THEN
        SET NEW.valid_email = 0;
    ELSE
        SET NEW.valid_email = NEW.valid_email;
    END IF;
END //
DELIMITER ;
