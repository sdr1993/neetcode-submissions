-- Write your query below
WITH CTE AS(
    SELECT DISTINCT user_id, SUM(distance) OVER(PARTITION BY user_id) AS  total_distance FROM rides 
), CTE2 AS (
SELECT u.name, c.total_distance AS travelled_distance FROM users u LEFT JOIN
CTE c ON u.id = c.user_id)

SELECT 
    name, 
    CASE 
        WHEN travelled_distance IS NULL THEN 0
        ELSE travelled_distance END 
        AS travelled_distance
  FROM CTE2 ORDER BY travelled_distance DESC, name ASC
