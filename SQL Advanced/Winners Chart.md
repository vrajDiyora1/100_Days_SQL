
<img width="1150" height="1239" alt="image" src="https://github.com/user-attachments/assets/e10c7a60-728b-4d53-9ff4-f747e746a82e" />

```SQL
WITH max_scores AS (
    SELECT 
        event_id,
        participant_name,
        MAX(score) AS max_score
    FROM scoretable
    GROUP BY event_id, participant_name
),

ranked AS (
    SELECT 
        event_id,
        participant_name,
        max_score,
        DENSE_RANK() OVER (
            PARTITION BY event_id 
            ORDER BY max_score DESC
        ) AS rnk
    FROM max_scores
)

SELECT 
    event_id,
    
    GROUP_CONCAT(
        CASE WHEN rnk = 1 THEN participant_name END 
        ORDER BY participant_name SEPARATOR ','
    ) AS rank_1,
    
    GROUP_CONCAT(
        CASE WHEN rnk = 2 THEN participant_name END 
        ORDER BY participant_name SEPARATOR ','
    ) AS rank_2,
    
    GROUP_CONCAT(
        CASE WHEN rnk = 3 THEN participant_name END 
        ORDER BY participant_name SEPARATOR ','
    ) AS rank_3

FROM ranked
WHERE rnk <= 3
GROUP BY event_id
ORDER BY event_id;
```
