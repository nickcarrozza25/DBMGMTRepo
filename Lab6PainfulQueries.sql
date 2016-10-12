/* 

Nick Carrozza

CMPT 308

Lab 6 Painful Queries

13 October 2016

*/



--Number 1 
/* 
The inner most query is used to select the max value for products.city. Once this is retrieved,
we next select a count of the products.city column and another to determine the corresponding products.city
value to the max count. Next, this is nested in a query that selects the name and city of customers where
customers.city is the value of the three level subquery nested in the most outer query.
*/ 

SELECT customers.name, customers.city

FROM customers

WHERE customers.city in (
            
            
            SELECT products.city

			FROM products

			GROUP BY products.city

			HAVING count(products.city) =  	(   SELECT count(products.city)

												FROM products

												GROUP BY products.city

												HAVING products.city = ( SELECT max(products.city)

												       	     			 FROM products

                              						   	    		   )
                                		   ) 
    
    					); 


--Number 2 
/*
First, list all the priceUSD values that are less than the average priceUSD. Next, nest that in a 
query that selects the names of the products that correspond to those price values. Order by desc for 
reverse alphabetical. 
*/ 

SELECT name 

FROM products

WHERE priceUSD in (


			SELECT priceUSD

			FROM products

			GROUP BY pid

			HAVING priceUSD < (	SELECT avg(priceUSD)

								FROM products
				  			  )

				  )

	ORDER BY name DESC; 


--Number 3 
/* 
First, select the desired columns from each of the three tables. Next, inner join
each corrsponding table of interest to the orders table on the join condition that 
each foreign table must have a corresponding primary key value with respect to orders.
Group by the customers name to the fullest extent and orders.pid the same, and order by
asc to display from lowest to highest value. 
*/

SELECT customers.name, orders.pid, sum(orders.totalUSD) AS totalCost

FROM orders

	INNER JOIN customers ON customers.cid = orders.cid

	INNER JOIN products ON products.pid = orders.pid

	GROUP BY customers.name, orders.pid

	ORDER BY totalCost ASC; 


--Number 4 
/*
Select all customer names and the sum of orders in the orders table with a right outer join,
use coalesce to insert '0' for any values that are null when the totalUSD column is summed, and
then order by ASC to display the names in alpha order.
*/

SELECT customers.name, coalesce(sum(orders.totalUSD), '0') AS total_cost

FROM orders

	RIGHT OUTER JOIN customers ON customers.cid = orders.cid 

	GROUP BY customers.cid

	ORDER BY customers.name ASC;



--Number 5 
/* 
Select the target columns by inner joining all the tables together by each tables respective
primary key then restrict the columns to where the agents city is New York.
*/ 


SELECT customers.name, products.name, agents.name, agents.city

FROM agents

	INNER JOIN orders ON agents.aid = orders.aid

	INNER JOIN customers ON customers.cid = orders.cid 

	INNER JOIN products ON products.pid = orders.pid

		WHERE agents.city = 'New York'; 


--Number 6 
/*
Select columns of interest from the orders table, then join the products table where the pids of products exist in the orders table. This 
confirms that the products were in fact ordered and are not just picked without ensuring 
*/ 

SELECT orders.ordnum, orders.mon, orders.cid, orders.aid, orders.pid, orders.qty, orders.totalUSD

FROM orders

	RIGHT OUTER JOIN products ON products.pid = orders.pid

	GROUP BY products.pid, orders.ordnum

	HAVING (orders.qty * products.priceUSD) != orders.totalUSD

		ORDER BY ordnum ASC; 



--Number 7
/* 

A left outer join retrieves all rows in the left table, regardless if there is a 
row that matches in the right table. A right outer join retrieves all rows in the 
right table, regardless if there is a row that matches in the left table. The left 
table is denoted as the first table after the FROM clause, and the right table is 
denotes after declaring OUTER JOIN. Any non-matching columns as specified in the join 
condition are returned with NULL. 

The following is an example fo the syntax of an outer join:

SELECT colunmName
FROM LeftTable
	OUTER JOIN RightTable ON (join-condition);

	--In addition, one must specify whether it is a left or a right join before 
	 the OUTER JOIN is written. 

*/ 

















