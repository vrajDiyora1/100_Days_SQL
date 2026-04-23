## Q1 [African cities] 
#### Purpose
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| student     | varchar |
+-------------+---------+
id is the primary key (unique value) column for this table.
Each row of this table indicates the name and the ID of a student.
The ID sequence always starts from 1 and increments continuously
```
Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

Return the result table ordered by id in ascending order.

The result format is in the following example.

 
#### Code
```sql
With total as ( select max(id) as max_id from seat)
select 
case
when id % 2 = 1 and id = max_id then id
when id % 2 = 1 then id + 1
else id-1
END as id , student
from seat,total
order  by id ;
```
