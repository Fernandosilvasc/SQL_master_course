USE sql_store;

SELECT
	o.order_id,
    o.order_date,
    c.first_name,
    c.last_name,
    os.name AS status
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id
JOIN order_statuses os
	ON o.status = os.order_status_id;
    
USE sql_invoicing;
    
SELECT
	p.payment_id,
    c.name,
    p.invoice_id,
    p.date,
    p.amount,
    pm.name AS payment_method
FROM payments p
JOIN clients c
	ON p.client_id = c.client_id
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id;

USE sql_store;

SELECT 
	c.customer_id,
    c.first_name,
    o.order_id,
    sh.name AS shipper
FROM customers c
LEFT JOIN orders o
	ON c.customer_id = o.customer_id
LEFT JOIN shippers sh
	ON o.shipper_id = sh.shipper_id
ORDER BY c.customer_id;

SELECT
	o.order_date,
    o.order_id,
    c.first_name,
    sh.name AS shipper,
    os.name AS status
FROM orders o
LEFT JOIN customers c
	ON o.customer_id = c.customer_id
LEFT JOIN shippers sh
	ON o.shipper_id = sh.shipper_id
LEFT JOIN order_statuses os
	ON o.status = os.order_status_id
ORDER BY status;


USE sql_store;
SELECT *
FROM order_items oi
JOIN order_item_notes oin USING (order_id, product_id);

USE sql_invoicing;
SELECT
	p.date,
    c.name AS client,
    p.amount,
    pm.name AS payment_method
FROM payments p
LEFT JOIN clients c USING (client_id)
LEFT JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id;
    
USE sql_store;
SELECT
	c.first_name AS customer,
    p.name AS product
FROM customers c
CROSS JOIN products p
ORDER BY c.first_name;

SELECT
	sh.name AS shipper_name,
    p.name AS products
FROM products p
CROSS JOIN shippers sh;

SELECT
	order_id,
    order_date,
    'ACTIVE' AS status
FROM orders
WHERE order_date >= '2019-01-01'
UNION
SELECT
	order_id,
    order_date,
    'ARCHIVED' AS status
FROM orders
WHERE order_date < '2019-01-01';

SELECT
	customer_id,
    first_name,
    points,
    'Bronze' AS type
FROM customers
WHERE points < 2000
UNION
SELECT
	customer_id,
    first_name,
    points,
    'Silver' AS type
FROM customers
WHERE points BETWEEN 2000 and 3000
UNION
SELECT
	customer_id,
    first_name,
    points,
    'Gold' AS type
FROM customers
WHERE points > 3000
ORDER BY first_name;

USE sql_store;

INSERT INTO shippers (name)
	VALUES ('SHIPPERS 1'),
	 	   ('SHIPPERS 2'),
           ('SHIPPERS 3');
           
INSERT INTO orders (customer_id, order_date, status)
	VALUES (1, '2019-01-02', 1);

INSERT INTO order_items
VALUES 
	(last_insert_id(), 1, 1, 2.95 ),
	(last_insert_id(), 2, 1, 3.95 );

    
USE sql_invoicing;

CREATE TABLE invoices_archived AS
SELECT
	i.invoice_id,
    i.number,
    c.name AS client,
    i.invoice_total,
    i.payment_total,
    i.invoice_date,
    i.payment_date,
    i.due_date
FROM invoices i
JOIN clients c
	USING (client_id)
WHERE payment_date IS NOT NULL;

UPDATE invoices
SET
	payment_total = invoice_total * 0.5,
    payment_date = due_date
WHERE invoice_id = 3;

UPDATE orders
SET comments = 'Gold Customer'
WHERE customer_id IN (
SELECT customer_id
FROM customers
WHERE points > 3000);
	



