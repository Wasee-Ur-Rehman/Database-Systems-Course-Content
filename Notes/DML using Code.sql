-- This SQL file demonstrates DML (Data Manipulation Language) statements in SQL Server (MSSQL)
-- Each section includes example queries and explanations in comments.

-- INSERT Example
-- The INSERT statement is used to add new rows to a table.
-- Example: Insert a new customer into the Customers table.

INSERT INTO Customers (CustomerID, Name, Email, Phone)
VALUES (1, 'John Doe', 'john.doe@example.com', '1234567890');
-- Explanation: Adds a new customer with ID 1, name "John Doe", email "john.doe@example.com", and phone "1234567890".

-- Example: Insert multiple rows at once.

INSERT INTO Customers (CustomerID, Name, Email, Phone)
VALUES 
    (2, 'Jane Smith', 'jane.smith@example.com', '0987654321'),
    (3, 'Alice Johnson', 'alice.johnson@example.com', '5551234567');
-- Explanation: Adds two customers in a single query.

-- SELECT Example
-- The SELECT statement is used to retrieve data from a table.
-- Example: Retrieve all columns from the Customers table.

SELECT * FROM Customers;
-- Explanation: Displays all columns and rows from the Customers table.

-- Example: Retrieve specific columns.

SELECT Name, Email FROM Customers;
-- Explanation: Fetches only the Name and Email columns for all rows.

-- UPDATE Example
-- The UPDATE statement is used to modify existing rows in a table.
-- Example: Update the phone number of a specific customer.

UPDATE Customers
SET Phone = '1112223333'
WHERE CustomerID = 1;
-- Explanation: Updates the phone number of the customer with ID 1.

-- DELETE Example
-- The DELETE statement is used to remove rows from a table.
-- Example: Delete a specific customer by their ID.

DELETE FROM Customers
WHERE CustomerID = 2;
-- Explanation: Removes the customer with ID 2 from the Customers table.

-- Example: Delete all customers (use with caution!).
DELETE FROM Customers;
-- Explanation: Removes all rows from the Customers table, but the table structure and any auto-increment settings remain.
-- Difference from TRUNCATE: DELETE is slower because it logs individual row deletions, and it can include a WHERE clause to delete specific rows.

-- TRUNCATE TABLE Example
-- The TRUNCATE TABLE statement is used to quickly remove all rows from a table.
TRUNCATE TABLE Customers;
-- Explanation: Deletes all rows from the Customers table but keeps the table structure intact. 
-- Difference from DELETE: TRUNCATE is faster as it does not log individual row deletions, and it cannot include a WHERE clause. It resets any auto-increment counters.
