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

# Day2 [Blunder] 

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

# Day3 [Advance select, Occuption] 

#### Purpose
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output should consist of four columns (Doctor, Professor, Singer, and Actor) in that specific order, with their respective names listed alphabetically under each column.

Note: Print NULL when there are no more names corresponding to an occupation.

#### Step by Step
Occupation will only contain one of the following values: Doctor, Professor, Singer or Actor.

Explanation

The first column is an alphabetically ordered list of Doctor names.
The second column is an alphabetically ordered list of Professor names.
The third column is an alphabetically ordered list of Singer names.
The fourth column is an alphabetically ordered list of Actor names.
The empty cell data for columns with less than the maximum number of names per occupation (in this case, the Professor and Actor columns) are filled with NULL values.

#### Code
```SQL
with cte as (
    select name, occupation, row_number() over(partition by occupation order by name) as rn 
    from occupations
)
select
    max(case when occupation = 'Doctor' then name end) as Doctor,
    max(case when occupation = 'Professor' then name end) as Professor,
    max(case when occupation = 'Singer' then name end) as Singer,
    max(case when occupation = 'Actor' then name end) as Actor

from cte
group by rn;
```
#### Success
<img width="623" height="497" alt="image" src="https://github.com/user-attachments/assets/c472b343-2818-4643-936d-2360281a5327" />
