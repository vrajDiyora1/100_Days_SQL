# 100\_Days\_SQL

## Day 1 
-- Query: Top 5 customers by total purchase amount in the last year
-- This query retrieves the top customers along with their purchase counts and average order values

WITH CustomerOrders AS (
    SELECT
        c.CustomerID,
        c.CustomerName,
        o.OrderID,
        o.OrderDate,
        o.TotalAmount
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    WHERE o.OrderDate >= DATEADD(year, -1, GETDATE())  -- Last 1 year of data
),

AggregatedData AS (
    SELECT
        CustomerID,
        CustomerName,
        COUNT(OrderID) AS TotalOrders,
        SUM(TotalAmount) AS TotalSpent,
        AVG(TotalAmount) AS AvgOrderValue
    FROM CustomerOrders
    GROUP BY CustomerID, CustomerName
),

RankedCustomers AS (
    SELECT
        CustomerID,
        CustomerName,
        TotalOrders,
        TotalSpent,
        AvgOrderValue,
        RANK() OVER (ORDER BY TotalSpent DESC) AS Rank
    FROM AggregatedData
)

SELECT
    CustomerID,
    CustomerName,
    TotalOrders,
    TotalSpent,
    AvgOrderValue
FROM RankedCustomers
WHERE Rank <= 5
ORDER BY TotalSpent DESC;


<img width="165" height="91" alt="image" src="https://github.com/user-attachments/assets/dbd317ab-cc4b-41d8-a951-bdb5b59deb12" />
