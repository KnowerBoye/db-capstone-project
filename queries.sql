CREATE DATABASE littlelemon;

USE littlelemon;

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(15) NOT NULL,
    Email VARCHAR(100),
    UNIQUE(ContactNumber)
);

CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    BookingDate DATE NOT NULL,
    TableNumber INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


CREATE TABLE Menu (
    MenuItemID INT AUTO_INCREMENT PRIMARY KEY,
    ItemName VARCHAR(100) NOT NULL,
    Category ENUM('Cuisine', 'Starter', 'Course', 'Drink', 'Dessert') NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);


CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    BookingID INT NOT NULL,
    OrderDate DATE NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    TotalCost DECIMAL(10, 2) NOT NULL CHECK (TotalCost >= 0),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);


CREATE TABLE OrderDeliveryStatus (
    DeliveryID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    DeliveryDate DATE,
    Status ENUM('Pending', 'Delivered', 'Cancelled') NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);


CREATE TABLE Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Role VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL CHECK (Salary > 0)
);
