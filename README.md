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
