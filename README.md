# 100\_Days\_SQL

## Day 1 [Binary_tree_Node] ?

#### Purpose
> 

#### Step by Step
> 

#### Code
> select
N,
    case 
        when P is NULL then 'Root'
        when P is not null and N IN (select distinct P from BST) then "Inner"
        else 'Leaf'
    END
from BST
Order By N ASC;


#### Success

<img width="163" height="408" alt="image" src="https://github.com/user-attachments/assets/149bfd0a-936e-490f-9fea-7b3ce90e44f6" />

## Day1 [Binary_tree_Node]

#### Purpose
> You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.

#### Step by Step
> Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.

#### Code
select
N,
    case 
        when P is NULL then 'Root'
        when P is not null and N IN (select distinct P from BST) then "Inner"
        else 'Leaf'
    END
from BST
Order By N ASC;

#### Success
<img width="358" height="171" alt="image" src="https://github.com/user-attachments/assets/0f49ef13-561d-48b8-940a-6337193f720c" />
## Day? [Implementation] ?

#### Purpose
> 

#### Step by Step
> 

#### Code

SELECT
  N,
  CASE
    WHEN P IS NULL THEN 'Inner'
    ELSE 'Other'
  END AS somecolumn
FROM BST;


#### Success
![](PNG/)
