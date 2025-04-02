WITH poor_query AS (
    SELECT query_name, COUNT(CASE WHEN rating < 3 THEN 1 END) AS poor_count
    FROM Queries
    GROUP BY query_name
),
total_query AS (
    SELECT query_name, COUNT(rating) AS total_count
    FROM Queries
    GROUP BY query_name
),
poor_query_percentage AS (
    SELECT pq.query_name,
           Round((pq.poor_count * 100.0) / tq.total_count,2) AS poor_query_percentage
    FROM poor_query pq
    JOIN total_query tq
    ON pq.query_name = tq.query_name
),
sum_table AS (
    SELECT query_name, avg(rating / position) AS s
    FROM Queries
    GROUP BY query_name
)

SELECT st.query_name,
       ROUND(st.s, 2) AS quality,
       pqp.poor_query_percentage
FROM sum_table st
JOIN poor_query_percentage pqp
ON st.query_name = pqp.query_name

