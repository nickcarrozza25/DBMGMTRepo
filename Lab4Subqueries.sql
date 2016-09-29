--Nick Carrozza
--CMPT 308
--Lab 4 Subqueries
-- 29 September 2016




--Number 1 

--Find all the cids equal to c006
----Find all the aids where the cid is c006
-----Find the cities that correspond to the aids taken in the second query

SELECT city

FROM agents

WHERE aid in (

			SELECT aid

			FROM orders

			WHERE cid in (	SELECT cid

          					FROM orders

							WHERE cid = 'c006'
   			             ) 
    	     ); 


--Number 2 

--list all customers with city = 'kyoto'
----list all the aid's with a where that applies to the first line 
-----list pid and aid from orders where aid equals the second line 

SELECT distinct pid

FROM orders

WHERE aid in ( SELECT aid 

			   FROM orders 

			   WHERE cid in ( SELECT cid

				   			  FROM customers

				   			  WHERE city = 'Kyoto'
				 			)

			)
            
	ORDER BY pid DESC;



--Number 3 

--First select all aids where agent is not a03
-----Next, select all cids where the aid is not a03; distinct for no repeats
------select the cid and name for all the cids that correspond to the second query

SELECT cid, name

FROM customers

WHERE cid in (	SELECT distinct cid

        		FROM orders 

        		WHERE aid in (	SELECT aid

								FROM agents 

								WHERE aid != 'a03'
							 )
              );

--Number 4 

----select the cid where pid is p01, then intersect where cid is p07

SELECT cid

FROM orders 

WHERE pid = 'p01'

	INTERSECT 

		SELECT cid 

		FROM orders 

		WHERE pid = 'p07';


--Number 5 

----First, select all aids where the aid is not equal to a08
-----Next, select the cids that correspond to the aids not equal to a08
------Finally, select the pids where these cids exist; distinct to eliminate duplicates

SELECT distinct pid

FROM orders

WHERE cid in (	SELECT cid 

				FROM orders 

				WHERE aid in ( 	SELECT aid

								FROM orders 

								WHERE aid != 'a08'

					 		  )
              )
              

	ORDER BY pid DESC;



--Number 6 

----First take all aids where the city is Dallas or New York
-------Next take all cids that correspond to the aid in the orders table; distinct for no repeats
---------Finally select name, discount, and city where the second query applies

SELECT name, discount, city 

FROM customers

WHERE cid in (	SELECT distinct cid

				FROM orders 

				WHERE aid in (	SELECT aid 

								FROM agents 

								WHERE city = 'Dallas'  or  city = 'New York'
							 )
    		 );



--Number 7

---First select discounts for cities dallas and london
----Then select cids that correspond to these discounts queried 

SELECT cid

FROM customers 

WHERE discount in (	SELECT discount 

					FROM customers 

					WHERE city = 'Dallas' or city = 'London'

				   );  



--Number 8 

/* 	A check constraint is used to restrict the range of values that can 
 	exist in a column. In addition, they could also be applied to an entire table, 
 	where values in certain columns can be limited based on other values in columns in 
 	the given row. They are established in the "create table" declaration of SQL. These
 	are particularly useful when you would like to pervent certain values from being 
 	inserted into a table, depending on the nature of the data being inserted. For example,
 	in a data table that includes ID numbers for customers, much like the cap3 database used
 	in our course, it would make sense to establish a check constraint on the value that this 
 	ID could be, where the ID number cannot be less than zero, or that the id number must 
 	contain an integer etc. This must be the case as an "ID number" means that values must 
 	in fact be positive numbers that do not contain any other type of character. Another example 
 	could be a colunm that contains years as values. With this, we know that years are always 
 	represented as a four digit number, no decimal, no other characters etc. In order to ensure
 	that this is satisfied with values being inserted into the table, one would establish a check 
 	constraint that restricts the number of digits that could exist for a value in that column. A
 	bad example of a check constraint may include restricting the number of characters that exists 
 	in a column that includes customers last names. Some customers may have longer names than other
 	customers, and resricting the column to a certain number of characters could manipulate the 
 	accuracy of the data, which is unfavorable. Another bad example could include a check constraint 
 	on a column that includes percentage returns of a particular investment where a value must be 
 	greater than zero. It is possible that the return on an investment could be negative, so 
 	restricting the data to only positive values is not something that should be done to ensure data 
 	is correct and accurate. 

 */ 








