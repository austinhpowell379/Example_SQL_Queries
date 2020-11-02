USE sql_store;

SELECT 
	o.order_id AS "Order ID",
    -- Find the total price of each order
    SUM(oi.unit_price * oi.quantity) AS "Order Total", 
    -- Find the total number of products in each order
    SUM(oi.quantity) AS "Number of Products",
    c.first_name AS "First Name",
    c.last_name AS "Last Name",
    c.points AS "Customer Points"
FROM orders o
JOIN customers c USING (customer_id)
JOIN order_items oi USING (order_id)
-- Group by the order
GROUP BY order_id
ORDER BY 2 DESC;


