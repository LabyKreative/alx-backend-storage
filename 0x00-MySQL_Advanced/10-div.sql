-- This SQL script creates a function SafeDiv that performs a
-- safe division or returns 0 if the denominator is 0.
DROP FUNCTION IF EXISTS SafeDiv;
DELIMITER //
CREATE FUNCTION SafeDiv(a INT, b INT)
RETURNS FLOAT
BEGIN
    IF b = 0 THEN
        RETURN 0;
    ELSE
        RETURN a / b;
    END IF;
    RETURN result;
END //
DELIMITER ;
