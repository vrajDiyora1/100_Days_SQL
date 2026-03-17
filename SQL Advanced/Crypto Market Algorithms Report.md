<img width="1147" height="1213" alt="image" src="https://github.com/user-attachments/assets/7f1ce00b-837c-427b-8742-e286efd0c926" />
<img width="745" height="1057" alt="image" src="https://github.com/user-attachments/assets/8581cfbe-a47b-46a0-a7b7-6b3a38b493ca" />

```sql
SELECT 
    c.algorithm,
    
    ROUND(SUM(CASE 
        WHEN QUARTER(STR_TO_DATE(t.dt, '%Y-%m-%d %H:%i:%s')) = 1 
        THEN t.volume ELSE 0 END), 6) AS Q1,
        
    ROUND(SUM(CASE 
        WHEN QUARTER(STR_TO_DATE(t.dt, '%Y-%m-%d %H:%i:%s')) = 2 
        THEN t.volume ELSE 0 END), 6) AS Q2,
        
    ROUND(SUM(CASE 
        WHEN QUARTER(STR_TO_DATE(t.dt, '%Y-%m-%d %H:%i:%s')) = 3 
        THEN t.volume ELSE 0 END), 6) AS Q3,
        
    ROUND(SUM(CASE 
        WHEN QUARTER(STR_TO_DATE(t.dt, '%Y-%m-%d %H:%i:%s')) = 4 
        THEN t.volume ELSE 0 END), 6) AS Q4

FROM coins c
JOIN transactions t 
    ON c.code = t.coin_code

WHERE YEAR(STR_TO_DATE(t.dt, '%Y-%m-%d %H:%i:%s')) = 2020

GROUP BY c.algorithm
ORDER BY c.algorithm;
```
