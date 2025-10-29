-- ==============================================================
-- ✈️ AIRLINE RESERVATION SYSTEM
--  Exercise – 3 : Database Design & Implementation
--  Description : Manages airports, flights, passengers, bookings, and tickets
-- ==============================================================

-- 🛠 Step 1: Create Database
CREATE DATABASE AIRLINE_RESERVATION;
USE AIRLINE_RESERVATION;

-- 🏢 Step 2: Create Airport Table
CREATE TABLE Airport (
    AirportID INT PRIMARY KEY,
    AirportName VARCHAR(100) NOT NULL,
    Location VARCHAR(50)
);

-- 🛫 Step 3: Create Flight Table
CREATE TABLE Flight (
    FlightID INT PRIMARY KEY,
    FlightNo VARCHAR(20) UNIQUE NOT NULL,
    SourceID INT,
    DestinationID INT,
    DepartureTime DATETIME,
    FOREIGN KEY (SourceID) REFERENCES Airport(AirportID),
    FOREIGN KEY (DestinationID) REFERENCES Airport(AirportID)
);

-- 👨‍💼 Step 4: Create Passenger Table
CREATE TABLE Passenger (
    PassengerID INT PRIMARY KEY,
    PassengerName VARCHAR(50) NOT NULL,
    Gender CHAR(1),
    Age INT CHECK (Age > 0)
);

-- 🎫 Step 5: Create Booking Table
CREATE TABLE Booking (
    BookingID INT PRIMARY KEY,
    PassengerID INT,
    FlightID INT,
    BookingDate DATE,
    Status VARCHAR(20) DEFAULT 'Confirmed',
    FOREIGN KEY (PassengerID) REFERENCES Passenger(PassengerID),
    FOREIGN KEY (FlightID) REFERENCES Flight(FlightID)
);

-- 🧾 Step 6: Create Ticket Table
CREATE TABLE Ticket (
    TicketID INT PRIMARY KEY,
    BookingID INT,
    SeatNo VARCHAR(10),
    Fare DECIMAL(8,2) CHECK (Fare > 0),
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);

-- ✅ Step 7: Confirmation
SHOW TABLES;
