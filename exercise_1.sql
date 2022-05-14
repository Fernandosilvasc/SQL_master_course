USE sql_store;

SELECT *, quantity * unit_price AS total_price
FROM order_items
WHERE order_id = 6 AND ((quantity * unit_price) > 30);

SELECT * 
FROM Customers
WHERE state IN ( 'VA', 'LA', 'GA');

USE sql_inventory;

SELECT * 
FROM products
WHERE quantity_in_stock IN ( 49, 38, 72 );

USE sql_store;
SELECT *
FROM Customers
WHERE points BETWEEN 1000 AND 3000;

USE sql_store;
SELECT *
FROM Customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';

USE sql_store;
SELECT *
FROM Customers
WHERE last_name LIKE 'b%';
 
USE sql_store;
SELECT *
FROM Customers
WHERE address LIKE '%trail%' OR address LIKE '%avenue%';

USE sql_store;
SELECT *
FROM Customers
WHERE phone LIKE '%9';

