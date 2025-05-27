WITH first_login AS (
    SELECT 
        player_id,
        MIN(event_date) AS first_date
    FROM Activity
    GROUP BY player_id
),
next_day_login AS (
    SELECT 
        a.player_id
    FROM Activity a
    JOIN first_login f
      ON a.player_id = f.player_id
     AND a.event_date = DATE_ADD(f.first_date, INTERVAL 1 DAY)
),
total_players AS (
    SELECT COUNT(DISTINCT player_id) AS total FROM Activity
)
SELECT 
    case when COUNT(DISTINCT n.player_id) / t.total  then ROUND(COUNT(DISTINCT n.player_id) / t.total, 2) 
    else 0
    end as fraction
FROM next_day_login n
JOIN total_players t;
