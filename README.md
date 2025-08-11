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

## Day66. [LeetCode-#184] Department Highest Salary

### Purpose
Find employees who have the highest salary in each of the departments.

### Column
Department, Employee, Salary

### Skill
SQL (Window functions, Ranking)

### Code
```sql
SELECT
    d.Name AS Department,
    Sel.Name AS Employee,
    Sel.Salary AS Salary
FROM
(
    SELECT
        Name,
        Salary,
        DepartmentId,
        DENSE_RANK() OVER (PARTITION BY DepartmentId ORDER BY Salary DESC) AS dr
    FROM Employee
) AS Sel
INNER JOIN Department d
    ON d.Id = Sel.DepartmentId
WHERE Sel.dr = 1;
