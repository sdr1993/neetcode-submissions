-- Write your query below
WITH CTE AS (
    SELECT sales_id FROM (
        SELECT o.order_id,  
        com.name AS company, 
        o.sales_id, 
        s.name FROM orders o 
        JOIN company com 
            ON o.com_id = com.com_id 
        JOIN sales_person s 
            ON o.sales_id = s.sales_id
        ) r WHERE company LIKE 'CRIMSON'
)

SELECT name FROM sales_person WHERE sales_id NOT IN (SELECT sales_id FROM CTE) 
