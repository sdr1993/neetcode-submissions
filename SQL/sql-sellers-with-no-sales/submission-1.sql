-- Write your query below
SELECT s.seller_name FROM seller s WHERE s.seller_id NOT IN (
    SELECT seller_id FROM orders WHERE DATE_PART('year', sale_date) = '2020'
) ORDER BY s.seller_name ASC