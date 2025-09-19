## Day 4 [ Top Earners ] 

#### Purpose
Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as  space-separated integers.

#### Code
```sql
select (salary * months) as earnings , count(*)
from Employee
group by earnings
order by earnings DESC
limit 1;


```

#### Success
<img width="404" height="221" alt="image" src="https://github.com/user-attachments/assets/ba04f542-17a3-4a5b-9164-ca396c43b1d2" />


