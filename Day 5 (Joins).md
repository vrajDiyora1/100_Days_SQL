## Q1 [African cities] 
#### Purpose
> Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

#### Code
```sql
SELECT CITY.NAME
FROM CITY
LEFT JOIN COUNTRY
ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE COUNTRY.CONTINENT = 'AFRICA'

```
#### Success
<img width="364" height="331" alt="image" src="https://github.com/user-attachments/assets/99d9c611-b566-44ee-8437-66b08d1bd555" />

## Q2 [Average Population of Each Continent] 

#### Purpose
Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.


#### Code
```SQL
select  COUNTRY.CONTINENT, FLOOR(AVG(CITY.POPULATION))
FROM COUNTRY
INNER JOIN CITY
ON CITY.COUNTRYCODE = COUNTRY.CODE
GROUP BY COUNTRY.CONTINENT

```

#### Success
<img width="526" height="411" alt="image" src="https://github.com/user-attachments/assets/cf03d693-e066-422e-90ea-8026ee3e4b00" />


## Q3 [The Report] 

#### Purpose



#### Code
```SQL
select 
case
    when g.grade >= 8 then s.name 
    else Null end as Name,
g.grade as Grade ,s.marks as Marks
from Students as s
inner join Grades as g
on s.Marks between  g.Min_mark and  g.Max_mark
order by g.Grade desc, 
case
    when g.grade between 8 and 10 then lower(s.name)  end,
case 
    when g.grade < 8 then s.Marks end


```

#### Success
<img width="410" height="534" alt="image" src="https://github.com/user-attachments/assets/13a37d03-46a9-4166-8ab3-3ebdcd5a363c" />

