/* 

Nick Carrozza

Lab 5 Joins 

CMPT 308

6 October 2016

*/

-- Number 1 
---First, select the cities from the agents table where agents.aid corresponds with orders.aid 
---and where orders.cid is equal to c006

SELECT agents.city

FROM agents

	INNER JOIN orders ON agents.aid = orders.aid

		WHERE orders.cid = 'c006'; 


--Number 2
---select the distinct pid from the orders table where the agents aid exists in the orders table
--- and where the customers cid corresponds to the orders cid and where customer city is equal 
--- to Kyoto, then order them by descending order 




SELECT distinct pid

FROM orders 

	INNER JOIN agents ON agents.aid = orders.aid

	INNER JOIN customers ON customers.cid = orders.cid

		WHERE customers.city = 'Kyoto'

	ORDER BY pid DESC;







--Number 3 
---To show the names of customers who never placed an order using a subquery, first write a query to
--- intersect customers.cid and orders.cid to find the commonalities between the two of them, then find
---the opposite by using not in the where clause 

SELECT cid

FROM customers 

WHERE cid not in  ( SELECT customers.cid

               		FROM customers
         
               			intersect 
                   
               		SELECT orders.cid 

               		FROM orders

               	   ); 



--Number 4 
---To show the customers who never placed an order using a join condition, display the 
---orders table and left outer join the customers table, and finally restict the rows to only 
---include where orders.cid does not exist 

SELECT customers.cid

FROM customers 

	LEFT OUTER JOIN orders ON customers.cid = orders.cid 

	WHERE orders.cid is null;



--Number 5 
---select a distict value for customer name and the agent name that corresponds to it where 
----agents.city corresponds to customers.city, and where agents aid exists in the orders table 
----to ensure that these agents have placed an order

SELECT distinct customers.name, agents.name

FROM customers 

	INNER JOIN agents ON agents.city = customers.city 

	INNER JOIN orders ON agents.aid = orders.aid;



--Number 6 
--Select the appropriate columns, and Inner Join to display the rows with agents and 
---customer cities in common 


SELECT customers.name, agents.name, customers.city

FROM customers

	INNER JOIN agents ON agents.city = customers.city;


--Number 7 
/* 
I was having a hard time writing a query where I could nest what is written below. 
The below query returns the two columns of interest, which are the city that has the fewest
products and the amount in the table using count. I could not write an outer query to nest 
this in where I can return the products.city value. Most error messages I was getting were in the 
form of 'you cannot subquery multiple columns'. 

Further, I could not isolate the products.city value that corresponds to the count(products.city)
value as returned in the below query. This is where I think the majority of the issues were stemming from. 
*/ 		



		SELECT products.city, count(products.city) AS frequency 

		FROM products
    
		GROUP BY products.city 
      
      	ORDER BY frequency ASC
      
      	LIMIT 1 

/* 
'Limit 1' is used as a restriction to select only the very first column. This works to return 
the minimum value created by the aggregate 'count' as I have ordered it by ascending, which causes the 
lowest 'count' frequency to be displayed in the very first column, as we have limited it to.  

Below, I have written a query that will allow one to select the customers name and city as it corresponds to 
the products table. 
*/ 

 SELECT distinct customers.name, customers.city
 FROM customers, products
 WHERE customers.city = products.city 

 /* 
 I am assuming that there must be some restriction in the where clause of this query
 to display the result of the first query. I was not able to figure out this connection.
 */ 



    

