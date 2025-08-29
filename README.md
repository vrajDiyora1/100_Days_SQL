# 100\_Days\_SQL


## Day1 [Binary_tree_Node]

#### Purpose
> You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.

#### Step by Step
> Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

- Root: If node is root node.
- Leaf: If node is leaf node.
- Inner: If node is neither root nor leaf node.

#### Code
```SQL
select
N,
    case 
        when P is NULL then 'Root'
        when P is not null and N IN (select distinct P from BST) then "Inner"
        else 'Leaf'
    END
from BST
Order By N ASC;
```
#### Success
<img width="358" height="171" alt="image" src="https://github.com/user-attachments/assets/0f49ef13-561d-48b8-940a-6337193f720c" />

## Day2 [Blunder] 

#### Purpose
> Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  key was broken until after completing the calculation.

#### Step by Step
> Write a query calculating the amount of error (i.e.: actual - miscalculation average monthly salaries), and round it up to the next integer.

#### Code
```SQL
SELECT CEIL(
    AVG(Salary) - AVG(CAST(REPLACE(Salary, '0', '') AS UNSIGNED))
) 
FROM EMPLOYEES;
```

#### Success
<img width="857" height="477" alt="image" src="https://github.com/user-attachments/assets/db1e3222-b385-4755-8b2b-28bcde7f28d9" />
