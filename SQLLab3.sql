-- Nick Carrozza
-- Lab 3: Getting Started With SQL Queries
-- 22 September 2016
-- *all SQL queries are in numerical order as stated in the lab 



SELECT ordnum, totalUSD 
FROM orders;

SELECT agents.name, agents.city 
FROM agents 
WHERE name = 'Smith';

SELECT pid, name, priceUSD
FROM products 
WHERE quantity > '201000';

SELECT name, city
FROM customers
WHERE city = 'Duluth';

SELECT name 
FROM agents
WHERE city != 'New York' 
AND city != 'Duluth';

SELECT * 
FROM products 
WHERE city != 'Dallas'  	
AND city != 'Duluth'     
AND priceUSD >= '1.00';

SELECT * 
FROM orders 
WHERE mon = 'feb' 
OR mon = 'mar';


SELECT * 
FROM orders 
WHERE mon = 'feb'  	
AND totalUSD >= '600.00';

SELECT ordnum 
FROM orders 
WHERE cid = 'c005';
