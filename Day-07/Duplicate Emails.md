
## Day 7 Duplicate Emails

#### Purpose
> Write a solution to report all the duplicate emails. Note that it's guaranteed that the email field is not NULL.

> Return the result table in any order.

> The result format is in the following example.



#### Code
```SQL
Select email as email
from Person
group by email
having count(*)>1;

```
