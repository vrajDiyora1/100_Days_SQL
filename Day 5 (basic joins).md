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

