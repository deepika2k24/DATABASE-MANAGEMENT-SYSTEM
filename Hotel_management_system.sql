-- ==============================================================
-- 🏨 HOTEL MANAGEMENT SYSTEM
--  Exercise – 4 : Database Design & Implementation
--  Description : Manages hotel rooms, guests, staff, bookings, and payments.
-- ==============================================================

-- 🛠 Step 1: Create Database
CREATE DATABASE HOTEL_MANAGEMENT;
USE HOTEL_MANAGEMENT;

-- 🏢 Step 2: Create Hotel Table
CREATE TABLE Hotel (
    HotelID INT PRIMARY KEY,
    HotelName VARCHAR(100) NOT NULL,
    Location VARCHAR(100),
    Rating DECIMAL(2,1) CHECK (Rating BETWEEN 1 AND 5)
);

-- 🚪 Step 3: Create Room Table
CREATE TABLE Room (
    RoomID INT PRIMARY KEY,
    HotelID INT,
    RoomNumber VARCHAR(10) NOT NULL,
    RoomType VARCHAR(30),
    PricePerNight DECIMAL(10,2) CHECK (PricePerNight > 0),
    AvailabilityStatus VARCHAR(20) DEFAULT 'Available',
    FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID)
);

-- 👤 Step 4: Create Guest Table
CREATE TABLE Guest (
    GuestID INT PRIMARY KEY,
    GuestName VARCHAR(50) NOT NULL,
    Gender CHAR(1),
    Phone VARCHAR(15),
    Address VARCHAR(100)
);

-- 🧾 Step 5: Create Booking Table
CREATE TABLE Booking (
    BookingID INT PRIMARY KEY,
    GuestID INT,
    RoomID INT,
    CheckInDate DATE,
    CheckOutDate DATE,
    BookingStatus VARCHAR(20) DEFAULT 'Confirmed',
    FOREIGN KEY (GuestID) REFERENCES Guest(GuestID),
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);

-- 💳 Step 6: Create Payment Table
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    BookingID INT,
    Amount DECIMAL(10,2) CHECK (Amount > 0),
    PaymentDate DATE,
    PaymentMode VARCHAR(20),
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);

-- 🧹 Step 7: Create Staff Table
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    StaffName VARCHAR(50) NOT NULL,
    Role VARCHAR(30),
    Salary DECIMAL(10,2) CHECK (Salary > 0),
    HotelID INT,
    FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID)
);

-- ✅ Step 8: Confirmation
SHOW TABLES;
