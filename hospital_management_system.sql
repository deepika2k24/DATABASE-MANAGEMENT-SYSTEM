-- ==============================================================
--  Project     : HOSPITAL MANAGEMENT SYSTEM
--  Exercise    : 2 – Database Design & Implementation
--  Description : Manages departments, doctors, patients, 
--                appointments, and billing information.
--  Author      : Deepika P
--  Date        : October 2025
-- ==============================================================

-- 🏥 Step 1: Create Database
CREATE DATABASE HOSPITAL_MANAGEMENT;
USE HOSPITAL_MANAGEMENT;

-- 🧩 Step 2: Create Department Table
CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) UNIQUE NOT NULL
);

-- 🩺 Step 3: Create Doctor Table
CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(50) NOT NULL,
    DeptID INT,
    Phone VARCHAR(15),
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- 👩‍⚕️ Step 4: Create Patient Table
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(50) NOT NULL,
    DOB DATE,
    Gender CHAR(1),
    Address VARCHAR(100)
);

-- 📅 Step 5: Create Appointment Table
CREATE TABLE Appointment (
    ApptID INT PRIMARY KEY,
    DoctorID INT,
    PatientID INT,
    ApptDate DATE,
    Status VARCHAR(10) DEFAULT 'Pending',
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- 💳 Step 6: Create Bill Table
CREATE TABLE Bill (
    BillID INT PRIMARY KEY,
    PatientID INT,
    Amount DECIMAL(10,2) CHECK (Amount > 0),
    BillDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- ✅ Step 7: Confirmation
SHOW TABLES;

-- 🏥 Insert Departments
INSERT INTO Department VALUES (1, 'Cardiology');
INSERT INTO Department VALUES (2, 'Neurology');
INSERT INTO Department VALUES (3, 'Orthopedics');
INSERT INTO Department VALUES (4, 'Pediatrics');

-- 🩺 Insert Doctors
INSERT INTO Doctor VALUES (101, 'Dr. Mehta', 1, '9876543210');
INSERT INTO Doctor VALUES (102, 'Dr. Sharma', 2, '8765432109');
INSERT INTO Doctor VALUES (103, 'Dr. Nair', 3, '9123456780');
INSERT INTO Doctor VALUES (104, 'Dr. Rao', 4, '9988776655');

-- 👩‍⚕️ Insert Patients
INSERT INTO Patient VALUES (201, 'Aarav Kumar', '2000-05-12', 'M', 'Bangalore');
INSERT INTO Patient VALUES (202, 'Sneha Reddy', '1998-10-22', 'F', 'Mangalore');
INSERT INTO Patient VALUES (203, 'Rohan Das', '1995-03-09', 'M', 'Udupi');

-- 📅 Insert Appointments
INSERT INTO Appointment VALUES (301, 101, 201, '2025-10-27', 'Pending');
INSERT INTO Appointment VALUES (302, 102, 202, '2025-10-28', 'Confirmed');
INSERT INTO Appointment VALUES (303, 103, 203, '2025-10-29', 'Pending');

-- 💳 Insert Bills
INSERT INTO Bill VALUES (401, 201, 2500.00, '2025-10-27');
INSERT INTO Bill VALUES (402, 202, 1800.00, '2025-10-28');
INSERT INTO Bill VALUES (403, 203, 3000.00, '2025-10-29');

-- ==============================================================
--  🔍 QUERY DEMONSTRATIONS
-- ==============================================================

-- 1️⃣ View all Doctors with their Departments
SELECT D.DoctorID, D.DoctorName, Dept.DeptName
FROM Doctor D
JOIN Department Dept ON D.DeptID = Dept.DeptID;

-- 2️⃣ List all Appointments with Doctor and Patient details
SELECT A.ApptID, P.PatientName, D.DoctorName, A.ApptDate, A.Status
FROM Appointment A
JOIN Doctor D ON A.DoctorID = D.DoctorID
JOIN Patient P ON A.PatientID = P.PatientID;

-- 3️⃣ Display Bills with Patient Names
SELECT B.BillID, P.PatientName, B.Amount, B.BillDate
FROM Bill B
JOIN Patient P ON B.PatientID = P.PatientID;

-- 4️⃣ Total Billing Amount per Patient
SELECT P.PatientName, SUM(B.Amount) AS TotalAmount
FROM Patient P
JOIN Bill B ON P.PatientID = B.PatientID
GROUP BY P.PatientName;

-- 5️⃣ Show Pending Appointments
SELECT * FROM Appointment WHERE Status = 'Pending';

-- 6️⃣ Update Appointment Status
UPDATE Appointment
SET Status = 'Completed'
WHERE ApptID = 301;

-- 7️⃣ Delete a Bill (if needed)
DELETE FROM Bill WHERE BillID = 403;

-- ==============================================================
--  HOSPITAL MANAGEMENT SYSTEM – SQL OPERATIONS DEMONSTRATION
--  Covers: AND/OR/NOT, ORDER BY, NULL, UPDATE, LIMIT, 
--          MIN/MAX, COUNT/AVG/SUM, LIKE, IN, BETWEEN, 
--          ALIASES, VIEWS, GROUP BY, HAVING, EXISTS, NESTED QUERIES, JOINS
-- ==============================================================

USE HOSPITAL_MANAGEMENT;

-- ==============================================================
--  1️⃣ AND, OR, NOT
-- ==============================================================
-- Doctors in Dept 1 OR Dept 2
SELECT * FROM Doctor WHERE DeptID = 1 OR DeptID = 2;

-- Patients not from 'Bangalore'
SELECT * FROM Patient WHERE NOT Address = 'Bangalore';

-- Appointments confirmed AND scheduled after 2025-10-27
SELECT * FROM Appointment 
WHERE Status = 'Confirmed' AND ApptDate > '2025-10-27';


-- ==============================================================
--  2️⃣ ORDER BY
-- ==============================================================
-- List all bills sorted by highest amount first
SELECT * FROM Bill ORDER BY Amount DESC;

-- List patients alphabetically
SELECT * FROM Patient ORDER BY PatientName ASC;


-- ==============================================================
--  3️⃣ NULL VALUES
-- ==============================================================
-- Find doctors without a phone number (if any)
SELECT * FROM Doctor WHERE Phone IS NULL;


-- ==============================================================
--  4️⃣ UPDATE
-- ==============================================================
-- Update patient address
UPDATE Patient SET Address = 'Mysuru' WHERE PatientID = 202;


-- ==============================================================
--  5️⃣ LIMIT
-- ==============================================================
-- Show only top 2 bills
SELECT * FROM Bill ORDER BY Amount DESC LIMIT 2;


-- ==============================================================
--  6️⃣ MIN AND MAX
-- ==============================================================
SELECT MIN(Amount) AS MinBill, MAX(Amount) AS MaxBill FROM Bill;


-- ==============================================================
--  7️⃣ COUNT, AVG, SUM
-- ==============================================================
SELECT COUNT(*) AS TotalPatients FROM Patient;
SELECT AVG(Amount) AS AverageBill FROM Bill;
SELECT SUM(Amount) AS TotalBilling FROM Bill;


-- ==============================================================
--  8️⃣ LIKE
-- ==============================================================
-- Find patients whose name starts with 'S'
SELECT * FROM Patient WHERE PatientName LIKE 'S%';

-- Find doctors whose name contains 'r'
SELECT * FROM Doctor WHERE DoctorName LIKE '%r%';


-- ==============================================================
--  9️⃣ IN
-- ==============================================================
-- Doctors in specific departments
SELECT * FROM Doctor WHERE DeptID IN (1, 3);

-- Patients in certain cities
SELECT * FROM Patient WHERE Address IN ('Bangalore', 'Mysuru');


-- ==============================================================
-- 🔟 BETWEEN
-- ==============================================================
-- Bills between 1000 and 3000
SELECT * FROM Bill WHERE Amount BETWEEN 1000 AND 3000;


-- ==============================================================
-- 1️⃣1️⃣ ALIASES
-- ==============================================================
SELECT D.DoctorName AS Doctor, Dept.DeptName AS Department
FROM Doctor D
JOIN Department Dept ON D.DeptID = Dept.DeptID;


-- ==============================================================
-- 1️⃣2️⃣ JOINS
-- ==============================================================
-- INNER JOIN: Doctors with their department names
SELECT Doctor.DoctorName, Department.DeptName
FROM Doctor
INNER JOIN Department ON Doctor.DeptID = Department.DeptID;

-- LEFT JOIN: All patients, even if no appointment
SELECT P.PatientName, A.ApptDate
FROM Patient P
LEFT JOIN Appointment A ON P.PatientID = A.PatientID;

-- RIGHT JOIN: All doctors, even if no appointment
SELECT D.DoctorName, A.ApptDate
FROM Appointment A
RIGHT JOIN Doctor D ON A.DoctorID = D.DoctorID;


-- ==============================================================
-- 1️⃣3️⃣ GROUP BY
-- ==============================================================
-- Total bills per patient
SELECT PatientID, SUM(Amount) AS TotalAmount
FROM Bill
GROUP BY PatientID;


-- ==============================================================
-- 1️⃣4️⃣ HAVING
-- ==============================================================
-- Patients whose total bill > 2000
SELECT PatientID, SUM(Amount) AS TotalAmount
FROM Bill
GROUP BY PatientID
HAVING SUM(Amount) > 2000;


-- ==============================================================
-- 1️⃣5️⃣ NESTED QUERIES (Subqueries)
-- ==============================================================
-- Patients who have bills above average
SELECT PatientName 
FROM Patient 
WHERE PatientID IN (
    SELECT PatientID FROM Bill 
    WHERE Amount > (SELECT AVG(Amount) FROM Bill)
);

-- Find doctor(s) from department ‘Cardiology’
SELECT DoctorName
FROM Doctor
WHERE DeptID = (
    SELECT DeptID FROM Department WHERE DeptName = 'Cardiology'
);


-- ==============================================================
-- 1️⃣6️⃣ EXISTS
-- ==============================================================
-- Show patients who have at least one appointment
SELECT P.PatientName
FROM Patient P
WHERE EXISTS (
    SELECT 1 FROM Appointment A WHERE A.PatientID = P.PatientID
);


-- ==============================================================
-- 1️⃣7️⃣ VIEWS
-- ==============================================================
-- Create a view for patient billing summary
CREATE VIEW PatientBilling AS
SELECT P.PatientName, SUM(B.Amount) AS TotalBill
FROM Patient P
JOIN Bill B ON P.PatientID = B.PatientID
GROUP BY P.PatientName;

-- View data
SELECT * FROM PatientBilling;


-- ==============================================================
-- 1️⃣8️⃣ DELETE
-- ==============================================================
-- Delete an appointment record
DELETE FROM Appointment WHERE ApptID = 303;

-- Delete all bills below ₹2000
DELETE FROM Bill WHERE Amount < 2000;
