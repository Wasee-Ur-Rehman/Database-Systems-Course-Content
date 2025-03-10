-- QUIZ 02 CS-4D
CREATE TABLE Orders (
    PONumber VARCHAR(10),
    POItem INT,
    DateOfDelivery DATE,
    QuantityDelivered INT
);

INSERT INTO Orders (PONumber, POItem, DateOfDelivery, QuantityDelivered) 
VALUES 
('C0001', 01, '2018-03-12', 300),
('C0001', 02, '2018-03-13', 600),
('C0001', 02, '2018-04-17', 1300),
('C0002', 01, '2018-04-24', 250),
('C0003', 01, '2018-05-03', 1400),
('C0003', 02, '2018-05-10', 1200);

--Q1
SELECT DISTINCT(PONumber), POItem from Orders

--Q2
GO
CREATE PROCEDURE GetMaxQuantityInfo
AS
BEGIN
    -- Variables
    DECLARE @MaxTotalQuantity INT, @MaxSingleOrderQuantity INT, @ProductCount INT;

	-- Both Approaches are correct!
	-- Approach 1

    -- Item with the highest total delivery quantity (Summed across all deliveries)
    SELECT @MaxTotalQuantity = MAX(TotalQuantity)
    FROM (
        SELECT POItem, SUM(QuantityDelivered) AS TotalQuantity
        FROM Orders
        GROUP BY POItem
    ) AS ItemTotals;


	-- Appraoch 2
    -- Maximum quantity delivered in a single order
    SELECT @MaxSingleOrderQuantity = MAX(QuantityDelivered) FROM Orders;

    -- Total count of distinct products (POItems)
    SELECT @ProductCount = COUNT(DISTINCT POItem) FROM Orders;

	 SELECT 
        @MaxTotalQuantity AS MaxTotalQuantityDelivered, 
        @MaxSingleOrderQuantity AS MaxSingleOrderDelivered, 
        @ProductCount AS ProductCount;
END;

EXEC GetMaxQuantityInfo

-----------------------------------------------------------------------

--QUIZ 02 SE-4B

SELECT 
    i.Category, 
    SUM(i.Quantity) 
    - SUM(CASE WHEN ia.Status = 'Assigned' THEN ia.QuantityAssigned ELSE 0 END) 
    + SUM(CASE WHEN ia.Status = 'Returned' THEN ia.QuantityAssigned ELSE 0 END) AS TotalAvailableItems
FROM Inventory i
LEFT JOIN InventoryAssignment ia ON i.InventoryID = ia.InventoryID
GROUP BY i.Category; 