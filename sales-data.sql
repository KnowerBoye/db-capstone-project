USE littlelemon;
-- Task 1 
CREATE VIEW OrdersView AS
SELECT 
    OrderID,
    Quantity,
    TotalCost
FROM 
    Orders
WHERE 
    Quantity > 2;
    
    
-- Task 2

SELECT 
    Customers.CustomerID,
    Customers.Name AS CustomerName,
    Orders.OrderID,
    Orders.TotalCost AS Cost,
    Menu.ItemName AS MenuName,
    MenuItems.CourseName,
    MenuItems.StarterName,
    MenuItems.DesertName
FROM 
    Customers
JOIN 
    Bookings ON Customers.CustomerID = Bookings.CustomerID
JOIN 
    Orders ON Bookings.BookingID = Orders.BookingID
JOIN 
    Menu ON Menu.MenuItemID = Orders.OrderID
JOIN 
    MenuItems ON Menu.MenuItemID = MenuItems.MenuItemID
WHERE 
    Orders.TotalCost > 150
ORDER BY 
    Orders.TotalCost ASC;
    
-- Taks 3

SELECT 
    ItemName
FROM 
    Menu
WHERE 
    MenuItemID = ANY (
        SELECT 
            OrderID
        FROM 
            Orders
        WHERE 
            Quantity > 2
    );

