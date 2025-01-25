-- This SQL file demonstrates various types of JOINs in SQL Server (MSSQL)
-- Each section includes example queries and explanations in comments.

-- Create sample tables to demonstrate joins
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name NVARCHAR(50),
    DepartmentID INT
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(50)
);

-- Insert sample data into Employees table
INSERT INTO Employees (EmployeeID, Name, DepartmentID)
VALUES (1, 'Alice', 101),
       (2, 'Bob', 102),
       (3, 'Charlie', NULL);

-- Insert sample data into Departments table
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES (101, 'HR'),
       (102, 'Finance'),
       (103, 'IT');

-- INNER JOIN Example
-- An INNER JOIN returns only the rows that have matching values in both tables.
-- Example: Get a list of employees along with their department names.
SELECT E.EmployeeID, E.Name, D.DepartmentName
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID;
-- Explanation: This query joins Employees and Departments on DepartmentID. Only employees with matching departments will be shown.

-- LEFT JOIN Example
-- A LEFT JOIN returns all rows from the left table and matching rows from the right table.
-- If no match is found, NULL values are returned for columns from the right table.
-- Example: Get a list of employees and their department names (including employees without departments).
SELECT E.EmployeeID, E.Name, D.DepartmentName
FROM Employees E
LEFT JOIN Departments D ON E.DepartmentID = D.DepartmentID;
-- Explanation: All employees are shown. If an employee has no department, DepartmentName will be NULL.

-- RIGHT JOIN Example
-- A RIGHT JOIN returns all rows from the right table and matching rows from the left table.
-- If no match is found, NULL values are returned for columns from the left table.
-- Example: Get a list of all departments and the employees in them (including departments with no employees).
SELECT E.EmployeeID, E.Name, D.DepartmentName
FROM Employees E
RIGHT JOIN Departments D ON E.DepartmentID = D.DepartmentID;
-- Explanation: All departments are shown. If a department has no employees, EmployeeID and Name will be NULL.

-- FULL OUTER JOIN Example
-- A FULL OUTER JOIN returns all rows from both tables, with NULLs for non-matching rows.
-- Example: Get a list of all employees and all departments, including unmatched ones.
SELECT E.EmployeeID, E.Name, D.DepartmentName
FROM Employees E
FULL OUTER JOIN Departments D ON E.DepartmentID = D.DepartmentID;
-- Explanation: This query includes all employees and all departments. Unmatched rows have NULLs in place of missing data.

-- CROSS JOIN Example
-- A CROSS JOIN returns the Cartesian product of two tables (all possible combinations).
-- Use with caution as it can produce a large number of rows.
-- Example: Get all possible combinations of employees and departments.
SELECT E.EmployeeID, E.Name, D.DepartmentName
FROM Employees E
CROSS JOIN Departments D;
-- Explanation: This query pairs each employee with every department, regardless of any relationship.

-- CLEANUP: Drop tables after examples
DROP TABLE Employees;
DROP TABLE Departments;
