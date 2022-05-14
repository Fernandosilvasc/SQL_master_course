-- SUBQUERIES

USE sql_inventory;

SELECT *
FROM products
WHERE unit_price > (
	SELECT unit_price
    FROM products
    WHERE product_id = 3 
);

-- EXERCISE

USE sql_hr;

SELECT *
FROM employees
WHERE salary > (
	SELECT AVG(salary)
    FROM employees
);

-- THE IN OPERATOR

USE sql_store;

SELECT *
FROM products
WHERE product_id NOT IN (
	SELECT DISTINCT product_id
	FROM order_items
);

-- EXERCISE - FIND CLIENTS WITHOUT INVOICES

USE sql_invoicing;

SELECT *
FROM clients
WHERE client_id NOT IN (
	SELECT DISTINCT client_id
    FROM invoices
);

-- SUBQUERIES VS JOIN
-- Same example as above, however using the join!
SELECT *
FROM clients
LEFT JOIN invoices USING (client_id)
WHERE invoice_id IS NULL;

-- EXERCISE - FIND CUSTOMERS WHO HAVE ORDERED LETTUCE (ID = 3) - SELECT CUSTOMER_ID, FIRST_NAME, LAST_NAME
SELECT DISTINCT
	customer_id,
    first_name,
    last_name
FROM customers c
LEFT JOIN orders o USING (customer_id)
LEFT JOIN order_items oi USING (order_id)
WHERE oi.product_id = 3;
-- ANOTHER WAY TODO USING SUBQUERIES
SELECT DISTINCT
	customer_id,
    first_name,
    last_name
FROM customers
WHERE customer_id IN (
	SELECT o.customer_id
    FROM order_items oi
    JOIN orders o USING (order_id)
    WHERE product_id = 3
);

-- THE 'ALL' KEYWORD
-- Example - select invoices larger than all invoices of client 3

SELECT *
FROM invoices
WHERE invoice_total > ALL (
	SELECT invoice_total
    FROM invoices
    WHERE client_id = 3
);
-- ANOTHER WAY TODO IT

SELECT *
FROM invoices
WHERE invoice_total > (
	SELECT MAX(invoice_total)
    FROM invoices
    WHERE client_id = 3
)









