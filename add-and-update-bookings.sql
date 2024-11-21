USE littlelemon;

-- Task 1

DELIMITER $$

CREATE PROCEDURE AddBooking(
    IN inputCustomerID INT,
    IN inputBookingDate DATE,
    IN inputTableNumber INT
)
BEGIN
    -- Insert a new record into the Bookings table using the provided input parameters
    INSERT INTO Bookings (CustomerID, BookingDate, TableNumber)
    VALUES (inputCustomerID, inputBookingDate, inputTableNumber);

    -- Optionally, you can return a success message or any other result
    SELECT 'Booking has been successfully added.' AS Status;
END $$

DELIMITER ;

-- Task 2

DELIMITER $$

CREATE PROCEDURE UpdateBooking(
    IN inputBookingID INT,
    IN inputBookingDate DATE
)
BEGIN
    -- Update the BookingDate for the specified BookingID
    UPDATE Bookings
    SET BookingDate = inputBookingDate
    WHERE BookingID = inputBookingID;

    -- Optionally, you can return a success message or any other result
    SELECT 'Booking has been successfully updated.' AS Status;
END $$

DELIMITER ;


-- Task 3

DELIMITER $$

CREATE PROCEDURE CancelBooking(
    IN inputBookingID INT
)
BEGIN
    -- Delete the booking record with the specified BookingID
    DELETE FROM Bookings
    WHERE BookingID = inputBookingID;

    -- Optionally, you can return a success message or any other result
    SELECT 'Booking has been successfully canceled.' AS Status;
END $$

DELIMITER ;
