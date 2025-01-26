-- Creating a table to demonstrate aggregate functions
CREATE TABLE Sales (
    SalesID INT PRIMARY KEY,
    ProductName TEXT,
    Quantity INT,
    Price REAL
);

-- Inserting sample data into the Sales table
INSERT INTO Sales (SalesID, ProductName, Quantity, Price) VALUES
(1, 'Laptop', 2, 1200.00),
(2, 'Mobile', 5, 800.00),
(3, 'Tablet', 3, 400.00),
(4, 'Laptop', 1, 1200.00),
(5, 'Mobile', 2, 800.00);

-- COUNT Examples
-- Example 1: Count the total number of rows
SELECT COUNT(*) AS TotalRecords FROM Sales;

-- Example 2: Count the number of rows where the product is 'Laptop'
SELECT COUNT(*) AS LaptopCount FROM Sales WHERE ProductName = 'Laptop';

-- SUM Examples
-- Example 1: Calculate the total quantity sold
SELECT SUM(Quantity) AS TotalQuantity FROM Sales;

-- Example 2: Calculate the total quantity sold for laptops
SELECT SUM(Quantity) AS LaptopQuantity FROM Sales WHERE ProductName = 'Laptop';

-- AVG Examples
-- Example 1: Find the average price of products
SELECT AVG(Price) AS AveragePrice FROM Sales;

-- Example 2: Find the average price of laptops
SELECT AVG(Price) AS LaptopAveragePrice FROM Sales WHERE ProductName = 'Laptop';

-- MAX Examples
-- Example 1: Find the highest price in the table
SELECT MAX(Price) AS HighestPrice FROM Sales;

-- Example 2: Find the highest quantity sold in a single transaction
SELECT MAX(Quantity) AS HighestQuantity FROM Sales;

-- MIN Examples
-- Example 1: Find the lowest price in the table
SELECT MIN(Price) AS LowestPrice FROM Sales;

-- Example 2: Find the lowest quantity sold in a single transaction
SELECT MIN(Quantity) AS LowestQuantity FROM Sales;

-- GROUP BY Examples
-- Example 1: Find the total quantity sold for each product
SELECT ProductName, SUM(Quantity) AS TotalQuantitySold
FROM Sales
GROUP BY ProductName;

-- Example 2: Find the average price for each product
SELECT ProductName, AVG(Price) AS AveragePrice
FROM Sales
GROUP BY ProductName;

-- HAVING Examples
-- Example 1: Find products with total quantity sold greater than 3
SELECT ProductName, SUM(Quantity) AS TotalQuantitySold
FROM Sales
GROUP BY ProductName
HAVING SUM(Quantity) > 3;

-- Example 2: Find products with an average price above 500
SELECT ProductName, AVG(Price) AS AveragePrice
FROM Sales
GROUP BY ProductName
HAVING AVG(Price) > 500;
