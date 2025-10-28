-- ==============================================================
--  Project     : NITTE UNIVERSITY DATABASE
--  Exercise    : 1 – University Management System
--  Description : Database to manage Students, Departments, Courses,
--                Faculty, and Enrollments with relational integrity.
--  Author      : Deepika P
--  Date        : October 2025
-- ==============================================================

-- 🎓 Step 1: Create Database
CREATE DATABASE NITTE_UNIVERSITY;
USE NITTE_UNIVERSITY;

-- 🏢 Step 2: Create Department Table
CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) UNIQUE NOT NULL
);

-- 👨‍🏫 Step 3: Create Faculty Table
CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(50),
    DeptID INT,
    Email VARCHAR(100) UNIQUE,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- 👩‍🎓 Step 4: Create Student Table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    DOB DATE,
    DeptID INT,
    Gender CHAR(1),
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- 📘 Step 5: Create Course Table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    Credits INT CHECK (Credits > 0),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- 🧾 Step 6: Create Enrollment Table
CREATE TABLE Enrollment (
    EnrollID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Semester VARCHAR(10),
    Grade CHAR(2) DEFAULT 'NA',
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- ✅ Step 7: Confirmation
SHOW TABLES;


--different ways to implement foreign keys--
--1. Inline (Column-level) Foreign Key
CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(50),
    DeptID INT REFERENCES Department(DeptID)  -- inline FK
);

--2.Table-level Foreign Key
CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(50),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

--3. Adding Foreign Key After Table Creation (ALTER TABLE)
ALTER TABLE Faculty
ADD CONSTRAINT fk_faculty_department
FOREIGN KEY (DeptID)
REFERENCES Department(DeptID)
ON DELETE SET NULL;

--4. Composite Foreign Key (Multiple Columns)
CREATE TABLE Enrollment (
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID, CourseID)
        REFERENCES CourseRegistration(StudentID, CourseID)
);
--5. Self-referencing Foreign Key
CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(50),
    ManagerID INT,
    FOREIGN KEY (ManagerID) REFERENCES Faculty(FacultyID)
);

