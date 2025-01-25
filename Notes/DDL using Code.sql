-- This SQL file demonstrates DDL (Data Definition Language) statements in SQL Server (MSSQL)
-- Each section includes example queries and explanations in comments.

-- CREATE TABLE Example
-- The CREATE TABLE statement is used to define a new table in the database.
-- Example: Create a table for storing customer data.

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY, -- Primary key ensures uniqueness
    Name NVARCHAR(100) NOT NULL, -- Name cannot be NULL
    Email NVARCHAR(100) UNIQUE, -- Email must be unique
    Phone NVARCHAR(15), -- Phone number is optional
    CreatedDate DATETIME DEFAULT GETDATE() -- Default value for CreatedDate
);
-- Explanation: This table has a primary key, a unique constraint, and a default value for CreatedDate.

-- ALTER TABLE Example
-- The ALTER TABLE statement is used to modify an existing table structure.
-- Example 1: Add a new column to the Customers table.

ALTER TABLE Customers
ADD Address NVARCHAR(200);
-- Explanation: Adds a new column named Address to the Customers table.

-- Example 2: Modify the data type of an existing column.

ALTER TABLE Customers
ALTER COLUMN Phone NVARCHAR(20);
-- Explanation: Changes the Phone column to allow longer phone numbers.

-- Example 3: Drop a column from the table.

ALTER TABLE Customers
DROP COLUMN Address;
-- Explanation: Removes the Address column from the Customers table.

-- DROP TABLE Example
-- The DROP TABLE statement is used to delete an existing table from the database.
-- Example: Delete the Customers table.

DROP TABLE Customers;
-- Explanation: Permanently deletes the Customers table and all its data.
