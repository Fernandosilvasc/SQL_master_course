USE sql_store;

SELECT *
FROM customers
WHERE first_name REGEXP 'elka|ambur';

SELECT *
FROM customers
WHERE last_name REGEXP 'ey$|on$';

SELECT *
FROM customers
WHERE last_name REGEXP 'ˆmi|se';

SELECT *
FROM customers
WHERE last_name REGEXP 'b[r|u]';