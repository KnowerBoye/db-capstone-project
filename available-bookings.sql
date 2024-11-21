USE littlelemon;


-- TASK 1
INSERT INTO Customers (Name, ContactNumber, Email)
VALUES
    ('John Doe', '123-456-7890', 'john.doe@example.com'),
    ('Jane Smith', '234-567-8901', 'jane.smith@example.com'),
    ('Sam Brown', '345-678-9012', 'sam.brown@example.com');


INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TableNumber)
VALUES
    (1, 1, '2024-11-21', 5),
    (2, 2, '2024-11-22', 3),
    (3, 3, '2024-11-23', 8);

-- TASK 2 

DELIMITER $$

CREATE PROCEDURE CheckBooking(IN inputBookingDate DATE, IN inputTableNumber INT)
BEGIN

    DECLARE bookingCount INT;


    SELECT COUNT(*) INTO bookingCount
    FROM Bookings
    WHERE BookingDate = inputBookingDate
      AND TableNumber = inputTableNumber;

    -- Conditional check based on the booking count
    IF bookingCount > 0 THEN
        SELECT 'The table is already booked for this date.' AS BookingStatus;
    ELSE
        SELECT 'The table is available for booking.' AS BookingStatus;
    END IF;
END $$

DELIMITER ;


-- Task 3
DELIMITER $$

CREATE PROCEDURE AddValidBooking(IN inputBookingDate DATE, IN inputTableNumber INT)
BEGIN
    
    DECLARE bookingCount INT;


    START TRANSACTION;

    
    SELECT COUNT(*) INTO bookingCount
    FROM Bookings
    WHERE BookingDate = inputBookingDate
      AND TableNumber = inputTableNumber;

   
    IF bookingCount > 0 THEN
        ROLLBACK;
        SELECT 'The table is already booked for this date. Booking has been declined.' AS Status;
    ELSE
       
        INSERT INTO Bookings (CustomerID, BookingDate, TableNumber)
        VALUES (NULL, inputBookingDate, inputTableNumber);  

        -- Commit the transaction
        COMMIT;
        SELECT 'The booking has been successfully added.' AS Status;
    END IF;
END $$

DELIMITER ;
