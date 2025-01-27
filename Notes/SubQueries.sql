-- SQL Subqueries Tutorial: From Basic to Advanced
-- This tutorial will help beginners master SQL subqueries step by step.

-- STEP 1: Basic Subquery
-- Task: Find all customers who placed orders.
SELECT CustomerID
FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Orders
);
-- Explanation: The subquery fetches all CustomerIDs from the Orders table. The main query checks which CustomerIDs exist in the Customers table.

-- STEP 2: Subquery with Aggregation
-- Task: Find products that have a price higher than the average price of all products.
SELECT ProductName, Price
FROM Products
WHERE Price > (
    SELECT AVG(Price)
    FROM Products
);
-- Explanation: The subquery calculates the average product price. The main query fetches products with prices above this average.

-- STEP 3: Correlated Subquery
-- Task: Find customers who have placed more than 3 orders.
SELECT DISTINCT CustomerID
FROM Orders o1
WHERE (
    SELECT COUNT(*)
    FROM Orders o2
    WHERE o1.CustomerID = o2.CustomerID
) > 3;
-- Explanation: The subquery counts orders for each customer. It runs once for each row in the outer query.

-- STEP 4: Subquery in SELECT Clause
-- Task: Show each product with its total quantity sold.
SELECT ProductName,
    (SELECT SUM(Quantity)
     FROM OrderDetails
     WHERE OrderDetails.ProductID = Products.ProductID) AS TotalSold
FROM Products;
-- Explanation: The subquery calculates the total quantity sold for each product and displays it as a column.

-- STEP 5: Subquery with EXISTS
-- Task: Find customers who have placed at least one order.
SELECT CustomerID, Name
FROM Customers
WHERE EXISTS (
    SELECT 1
    FROM Orders
    WHERE Orders.CustomerID = Customers.CustomerID
);
-- Explanation: The EXISTS keyword checks if the subquery returns any rows.

-- STEP 6: Subquery with NOT EXISTS
-- Task: Find customers who have not placed any orders.
SELECT CustomerID, Name
FROM Customers
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders
    WHERE Orders.CustomerID = Customers.CustomerID
);
-- Explanation: NOT EXISTS ensures the subquery does not return any rows for these customers.

-- STEP 7: Subquery in FROM Clause (Derived Table)
-- Task: Find the total number of orders placed by each customer.
SELECT CustomerID, TotalOrders
FROM (
    SELECT CustomerID, COUNT(*) AS TotalOrders
    FROM Orders
    GROUP BY CustomerID
) AS OrderSummary;
-- Explanation: The subquery creates a temporary table (derived table) with customer order counts.

-- STEP 8: Advanced Nested Subqueries
-- Task: Find the products sold in the highest quantity by each customer.
SELECT ProductID, CustomerID, Quantity
FROM OrderDetails od1
WHERE Quantity = (
    SELECT MAX(Quantity)
    FROM OrderDetails od2
    WHERE od1.CustomerID = od2.CustomerID
);
-- Explanation: The subquery fetches the highest quantity sold for each customer. The outer query retrieves matching records.

-- STEP 9: Combining Subqueries with Joins
-- Task: List customers and the total amount they spent on orders.
SELECT c.CustomerID, c.Name, (
    SELECT SUM(od.Quantity * p.Price)
    FROM OrderDetails od
    JOIN Products p ON od.ProductID = p.ProductID
    WHERE od.CustomerID = c.CustomerID
) AS TotalSpent
FROM Customers c;
-- Explanation: The subquery calculates the total spent by each customer using a join with Products.

-- STEP 10: Recursive Subqueries (CTE)
-- Task: Find all employees who report directly or indirectly to a specific manager.
WITH EmployeeHierarchy AS (
    SELECT EmployeeID, ManagerID
    FROM Employees
    WHERE ManagerID = 1 -- Start with a specific manager
    UNION ALL
    SELECT e.EmployeeID, e.ManagerID
    FROM Employees e
    JOIN EmployeeHierarchy eh ON e.ManagerID = eh.EmployeeID
)
SELECT *
FROM EmployeeHierarchy;
-- Explanation: This Common Table Expression (CTE) recursively finds all employees reporting to a given manager.

-- End of SQL Subqueries Tutorial.
