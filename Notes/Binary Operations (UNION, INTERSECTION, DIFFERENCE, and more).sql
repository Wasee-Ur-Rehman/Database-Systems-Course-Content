-- SQL Binary Operations Tutorial: UNION, INTERSECTION, DIFFERENCE, and DIVISION
-- This tutorial helps beginners understand and practice binary operations in SQL step by step.

-- STEP 1: UNION
-- Task: Combine the results of two tables, eliminating duplicates.
SELECT Name, Email
FROM Customers
UNION
SELECT Name, Email
FROM Leads;
-- Explanation: Combines rows from the Customers and Leads tables. Duplicates are automatically removed.

-- STEP 2: UNION ALL
-- Task: Combine the results of two tables, including duplicates.
SELECT Name, Email
FROM Customers
UNION ALL
SELECT Name, Email
FROM Leads;
-- Explanation: Similar to UNION but retains duplicates in the result set.

-- STEP 3: INTERSECTION (Simulated using INNER JOIN)
-- Task: Find common rows between two tables.
SELECT Name, Email
FROM Customers
INNER JOIN Leads
ON Customers.Name = Leads.Name AND Customers.Email = Leads.Email;
-- Explanation: Finds rows that are present in both the Customers and Leads tables.

-- STEP 4: DIFFERENCE (Simulated using EXCEPT)
-- Task: Find rows in Customers that are not in Leads.
SELECT Name, Email
FROM Customers
EXCEPT
SELECT Name, Email
FROM Leads;
-- Explanation: Returns rows from Customers that do not exist in Leads.

-- STEP 5: DIVISION
-- Task: Find customers who bought all available products.
-- Tables: Customers(CustomerID, Name), Orders(CustomerID, ProductID), Products(ProductID)
SELECT CustomerID
FROM Orders o1
WHERE NOT EXISTS (
    SELECT ProductID
    FROM Products p
    WHERE NOT EXISTS (
        SELECT 1
        FROM Orders o2
        WHERE o2.CustomerID = o1.CustomerID AND o2.ProductID = p.ProductID
    )
);
-- Explanation: This double NOT EXISTS query ensures that only customers who have ordered every product in the Products table are returned.

-- End of SQL Binary Operations Tutorial.