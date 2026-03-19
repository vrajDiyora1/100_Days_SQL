## Day7 Employees Earning More Than Their Managers ?

#### Purpose
> Write a solution to find the employees who earn more than their managers.

> Return the result table in any order.

> The result format is in the following example.


#### Code
```SQL
Select e1.name as employee
from Employee e1
inner join Employee e2
on e1.managerId = e2.id
where e1.salary > e2.salary
```

#### Success
<img width="308" height="220" alt="image" src="https://github.com/user-attachments/assets/d3451f32-bca4-4776-b534-7c6f3f619f79" />
