USE littlelemon;


-- Task 1

DELIMITER $$

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS MaxQuantity
    FROM Orders;
END $$

DELIMITER ;


-- Task 2

PREPARE GetOrderDetail FROM 
    'SELECT Orders.OrderID, Orders.Quantity, Orders.TotalCost
     FROM Orders
     JOIN Bookings ON Orders.BookingID = Bookings.BookingID
     WHERE Bookings.CustomerID = ?';
SET @id = 1; 
EXECUTE GetOrderDetail USING @id;


-- Task 3

DELIMITER $$

CREATE PROCEDURE CancelOrder(IN inputOrderID INT)
BEGIN
    DELETE FROM Orders
    WHERE OrderID = inputOrderID;
END $$

DELIMITER ;
