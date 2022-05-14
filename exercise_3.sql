USE sql_store;

SELECT *
FROM orders
WHERE shipped_date IS NULL;

SELECT *, quantity * unit_price AS total_price
FROM order_items
WHERE order_id = 2 ORDER BY total_price DESC;

SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3;

SELECT order_id, first_name, last_name
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.customer_id;

SELECT order_id, oi.product_id, name, quantity, oi.unit_price
FROM order_items oi
INNER JOIN products p
ON oi.product_id = p.product_id;

SELECT *
FROM order_items oi
JOIN sql_inventory.products p
ON oi.product_id = p.product_id;

USE sql_hr;

SELECT 
	e.employee_id,
    e.first_name,
    m.first_name AS manager
FROM employees e
JOIN employees m
ON e.reports_to = m.employee_id;