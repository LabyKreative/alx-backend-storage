-- This SQL script creates a trigger to decrease item quantity after adding a new order.
DROP TRIGGER IF EXISTS after_insert_order;
DELIMITER //
CREATE TRIGGER after_insert_order
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE items
    SET quantity = quantity - NEW.quantity
    WHERE item_id = NEW.item_id;
END //
DELIMITER ;
