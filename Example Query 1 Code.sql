USE sql_store;

-- Query Goal: Find which customers are placing the largest orders to offer bulk discounts or promotional campaigns

-- Define selection, sum up each order price using the unit price and quantity
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

-- Join customers and order items for ease of use
JOIN customers c USING (customer_id)
JOIN order_items oi USING (order_id)

-- Group by the order 
GROUP BY order_id

-- Sort largest to smallest order
ORDER BY 2 DESC;


