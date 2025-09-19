## Day? [Implementation] ?

#### Purpose
Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as  space-separated integers.
> 

#### Code
```sql
select (salary * months) as earnings , count(*)
from Employee
group by earnings
order by earnings DESC
limit 1;


```

#### Success
![](PNG/)
