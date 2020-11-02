USE sql_store;

-- Query Goal: Find each customers most ordered (favorite) item

-- First create calculation table that sums up total items across all orders for each customer and for each item they ordered
WITH calc1 AS (
SELECT o.customer_id, oi.product_id, SUM(quantity) total_quantity
	FROM order_items oi
JOIN orders o USING(order_id)
GROUP BY customer_id, product_id)

-- Define our final table selection
SELECT 
	c.first_name AS 'First Name',
    c.last_name AS 'Last Name',
    c.points AS 'Customer Loyalty Points',
    a.customer_id AS 'Customer ID',
    p.name AS 'Most-Ordered Product',
    a.total_quantity AS 'Total Quantity Ordered',
    p.quantity_in_stock AS 'Quantity in Stock'
  	FROM calc1 a

-- Join our calculation table with itself to find which item each customer ordered the most of
JOIN(
	SELECT customer_id, product_id, MAX(total_quantity) total_quantity
	FROM calc1 
	GROUP BY customer_id
	) b ON a.customer_id=b.customer_id AND a.total_quantity=b.total_quantity

-- Join customer and product information for ease of use
JOIN customers c ON a.customer_id=c.customer_id
JOIN products p ON a.product_id=p.product_id

-- order by the quantity in stock so we can run targeted sales on our most overstocked items
ORDER BY p.quantity_in_stock DESC;