/* 

Nick Carrozza 

CMPT 308

SQL Script for Final Design Project - Database for "Monsters Inc." the movie

08 December 2016

Using PostgreSQL v9.5; continued in PostgreSQL v9.6

*/


/*

Drop views if they exist in current instance of the database to avoid repeating view creation  

*/

DROP VIEW IF EXISTS SullysHelpers; 

DROP VIEW IF EXISTS RandallsPoints;

DROP VIEW IF EXISTS MostScares; 


/* 

Drop tables if they exist in current instance of database to avoid repeating table creation

*/ 

DROP TABLE IF EXISTS worksOn;

DROP TABLE IF EXISTS helpsOn; 

DROP TABLE IF EXISTS scares;

DROP TABLE IF EXISTS children;

DROP TABLE IF EXISTS laughs;

DROP TABLE IF EXISTS doors;

DROP TABLE IF EXISTS entersBy; 

DROP TABLE IF EXISTS executives; 

DROP TABLE IF EXISTS secretaries;

DROP TABLE IF EXISTS scarers;

DROP TABLE IF EXISTS helpers;

DROP TABLE IF EXISTS monsters;


 
/*

Drop roles if they exist in the current instance of the database to avoid repeat role creations

*/


DROP ROLE IF EXISTS Admins;

DROP ROLE IF EXISTS PointCounters; 

DROP ROLE IF EXISTS Execs;


/*

Create supertype table 'monsters' 

*/

CREATE TABLE monsters (

	mid 		int 		not null unique,

	name 		char(40) 	not null,

	age 		int 	 	not null,
 
	dob 		date 		not null, 

 	address	 	char(50)  	not null,


		primary key(mid)
);


insert into monsters 	(mid, name, age, dob, address)
	values 				(1, 'Sully', 36, to_date('03161972', 'MMDDYYYY'), '12 scary lane');

insert into monsters 	(mid, name, age, dob, address)
	values 				(2, 'Mike Wazowski', 24, to_date('05231981', 'MMDDYYYY'),  '12 scary lane');

insert into monsters 	(mid, name, age, dob, address)
	values 				(3, 'Roz' , 68, to_date('10241948', 'MMDDYYYY'), '88 whiny drive');

insert into monsters 	(mid, name, age, dob, address)
	values 				(4, 'Mr. Waternoose', 71, to_date('09221945', 'MMDDYYYY'), '146 meanie avenue'); 

insert into monsters 	(mid, name, age, dob, address)
	values 				(5, 'Randall', 27, to_date('02291982', 'MMDDYYYY'), '14 jerk drive'); 

insert into monsters 	(mid, name, age, dob, address)
	values  			(6, 'Fungus', 19, to_date('07141992', 'MMDDYYYY'), 'P.O. Box 138');

insert into monsters 	(mid, name, age, dob, address)
	values  			(7, 'Celia', 24, to_date('09191986', 'MMDDYYYY'), '34 curly road'); 

insert into monsters  	(mid, name, age, dob, address)
	values   			(8, 'Bile', 31, to_date('08231979', 'MMDDYYYY'), '89 green street'); 

insert into monsters  	(mid, name, age, dob, address)
	values   			(9, 'Flint', 25, to_date('11011981', 'MMDDYYYY'), '88 green street'); 
 
/*

Create scarers table as an entity subtype of 'monsters'| all scarers are monsters 

*/ 

CREATE TABLE scarers (

	mid  			int			not null unique,

	FavScareTactic  char(50)	not null,

	scarepoints 	int 		, 	

		primary key(mid)

);

insert into scarers (mid, FavScareTactic, scarepoints)
	values			(1, 'Roaring', 100467);

insert into scarers (mid, FavScareTactic, scarepoints)
	values  		(5, 'Squirming Around', 99857); 

insert into scarers (mid, FavScareTactic, scarepoints)
	values 			(8, 'Waving arms like a maniac', null); 


/*

Create helpers table as an entity subtype of 'monsters' | all helpers are monsters

*/


CREATE TABLE helpers (

	mid 		int 	not null unique,

	yrsHelping 	int 	not null, 

		primary key(mid)

);

insert into helpers (mid, yrsHelping)
	values 			(2, 8);

insert into helpers (mid, yrsHelping)
	values 			(6, 3); 

insert into helpers (mid, yrsHelping)
	values 			(9, 1);


/*

Create secretaries table as an entity subtype of monsters | all secreatries are monsters

*/ 

CREATE TABLE secretaries (

	mid 		int 	not null unique,

	yrsWorking	int 	not null, 

		primary key(mid)

); 

insert into secretaries (mid, yrsWorking)
	values 				(3, 26); 

insert into secretaries (mid, yrsWorking)
	values 				(7, 3); 

/*

create table executives as an entity subtype of monsters | all secretaries are monsters 

*/ 

CREATE TABLE executives  (

	mid 		int 		not null unique,

	title 		char(40) 	not null,

	yrsWorking 	int 		not null,

		primary key(mid)

);

insert into executives (mid, title, yrsWorking)
	values 			   (4, 'manager', 25); 


/*

Table that documents history of which doors a 'scarer' has accessed  

*/

CREATE TABLE worksOn (

	mid 		int 	not null,

	doornum 	int 	not null, 

		primary key(mid, doornum)

);

insert into worksOn (mid, doornum)
	values 			(1, 3); 

insert into worksOn (mid, doornum)
	values 			(5, 1); 	

insert into worksOn (mid, doornum)
	values 			(8, 2);


/*

Table that documents history of which doors a 'helper' has accessed

*/ 


CREATE TABLE helpsOn (

	mid 		int 	not null, 

	doornum 	int 	not null, 

		primary key(mid, doornum) 

);

insert into helpsOn (mid, doornum)
	values 			(2, 3);

insert into helpsOn (mid, doornum)
	values 			(6, 1);

insert into helpsOn (mid, doornum)
	values 			(9, 2);


/* 

Create a table that shows all the children a given scarer has scared. Serves as an associative
entity between the scarers and children table.

*/ 


CREATE TABLE scares (

	mid 	int 	not null,

	cid 	int 	not null,

		primary key(mid, cid)

);

insert into scares (mid, cid)
	values         (1, 3);

insert into scares (mid, cid)
	values         (5, 1);

insert into scares (mid, cid)
	values         (1, 4);

/*

Create a table that shows all the children that helpers have worked with. Serves as an associative 
entity between helpers and children

*/

CREATE TABLE laughs (

	mid 	int 	not null,

	cid 	int 	not null, 

		primary key(mid, cid)

);

insert into laughs (mid, cid)
	values 			(2, 2);

insert into laughs (mid, cid)
	values 			(6, 3);	

insert into laughs (mid, cid)
	values 		    (6, 4); 

/*

create a table for the strong entity children 

*/ 

CREATE TABLE children (

	cid 		int 		not null unique, 

	name 		char(40)	not null,

	age 		int 		not null,

	dob			date 		not null, 

	address 	char(50) 	not null, 

	FavToy 		char(30), 

	doornum 	int 		not null, 
	
		primary key(cid)

);


insert into children (cid, name, age, dob, address, FavToy, doornum)
	values 			 (1, 'Boo', 5, to_date('06202002', 'MMDDYYYY'), '728 small lane', 'blocks', 1); 

insert into children (cid, name, age, dob, address, FavToy, doornum)
	values 			 (2, 'Billy', 7, to_date('04102001', 'MMDDYYYY'), '10 tiny terrace', 'model cars', 2); 

insert into children (cid, name, age, dob, address, FavToy, doornum)
	values 			 (3, 'Sam', 4, to_date('12242003', 'MMDDYYYY'), '1987 gerard way', 'blocks', 3); 

insert into children (cid, name, age, dob, address, FavToy, doornum)
	values 			 (4, 'Lily', 6, to_date('10112002', 'MMDDYYYY'), '1987 gerard way', 'blocks', 4); 




/*

Below, create a table to account for the doors to a given childrens room. This serves multiple functions,
as it is necessary to account for the door that belongs to a particular child. Also, this keeps a 
history of any doors that are removed and replaced, as they may change. This is allowed since multiple
cid's can have multiple rooms. This is handled in the 'entersBy' associative entity.

*/


CREATE TABLE doors (

	doornum 		int 		not null unique, 

	color 			char(40) 	not null,

	knobType 		char(15) 	not null, 

	installDate 	date 		not null,

		primary key(doornum)

);


insert into doors (doornum, color, knobtype, installDate)
	values		  (1, 'white with flowers', 'round', to_date('04252003', 'MMDDYYYY')); 

insert into doors (doornum, color, knobtype, installDate)
	values		  (2, 'blue', 'round', to_date('02051999', 'MMDDYYYY'));

insert into doors (doornum, color, knobtype, installDate)
	values		  (3, 'red and black', 'handle', to_date('02172004', 'MMDDYYYY'));

insert into doors (doornum, color, knobtype, installDate)
	values 		  (4, 'pink', 'round', to_date('01082001', 'MMDDYYYY'));

/* 

Create a table that records a given child and the door to their individual room. This also 
accounts for the fact that a child may have more than one door (if one is replaced, the child 
has more than one room, etc.)

*/ 

CREATE TABLE entersBy (
 
	cid 	int 	not null, 

	doornum int 	not null, 

		primary key(cid, doornum)

);

insert into entersBy (cid, doornum)
	values 			 (1, 1); 

insert into entersBy (cid, doornum)
	values 			 (2, 2); 

insert into entersBy (cid, doornum)
	values 			 (3, 3); 

insert into entersBy (cid, doornum)
	values 			 (4, 4); 
 

/* 

QUERIES - Various queries written to retrieve useful information from the 
database. 

*/ 

-- Query to find all the children 'Sully', one of the main characters, has scared: 

SELECT name

FROM children 

WHERE cid IN (	SELECT distinct cid

    			FROM scares

    			WHERE mid IN (	SELECT mid

								FROM monsters 

								WHERE name = 'Sully'
							 )
    		 ); 


-- Query to show all scarers names and all the scare points they've scored, from highest to lowest:


SELECT monsters.name, coalesce(scarers.scarepoints, '0') 

	AS TotalPoints

FROM monsters, scarers

WHERE monsters.mid = scarers.mid

ORDER BY TotalPoints desc;  


-- Query to show all the monsters that have worked with child 'Boo' regardless if they are scarers or helpers: 

	SELECT monsters.name

	FROM monsters 

	INNER JOIN helpers ON helpers.mid = monsters.mid

	INNER JOIN helpsOn ON helpsOn.mid = helpers.mid 

	INNER JOIN doors ON doors.doornum = helpsOn.doornum 

	INNER JOIN entersBy ON entersBy.doornum = doors.doornum 

	INNER JOIN children ON entersBy.cid = children.cid 

		WHERE children.name = 'Boo' 
	
UNION  

	SELECT monsters.name 

	FROM monsters 

	INNER JOIN scarers ON scarers.mid = monsters.mid 

	INNER JOIN scares ON scares.mid = scarers.mid 

	INNER JOIN children ON children.cid = scares.cid  

		WHERE children.name = 'Boo';  




/* 

VIEWS - Some helpful views written for the database so that different users with different
needs can access information that is particularly useful to them.  

*/ 

 
-- View to show all the helpers that 'Sully', one of the main characters, has worked with: 

CREATE VIEW SullysHelpers AS 

	SELECT name 

	FROM monsters 

	WHERE mid IN (	SELECT helpsOn.mid 

					FROM helpsOn 

					INNER JOIN children ON helpsOn.doornum = children.doornum 

					INNER JOIN worksOn ON worksOn.doornum = children.doornum 

					INNER JOIN scarers ON scarers.mid = worksOn.mid 

					INNER JOIN monsters ON monsters.mid = scarers.mid 

						WHERE monsters.name = 'Sully'

			 	 );


 -- View to show Randall how many scare points he's accumulated:


CREATE VIEW RandallsPoints AS

	SELECT coalesce(scarepoints, '0')  

	FROM scarers 

	WHERE mid IN ( 	SELECT mid 
               
            		FROM monsters 
              
              		WHERE name = 'Randall' 
    
    		 	 );
 
-- View to display the monster with the most scares. May be useful for an executive to monitor performance
 
 CREATE VIEW MostScares AS
   
 
    SELECT monsters.name, scares.mid, count(scares.mid) 

    	AS qty_children_scared

	FROM scares 

    INNER JOIN scarers ON scarers.mid = scares.mid 

    INNER JOIN monsters ON monsters.mid = scarers.mid

		GROUP BY monsters.name, scares.mid 

		ORDER BY qty_children_scared desc 

   			 LIMIT 1; 


/*

SECURITY - Grant and Revoke Statements to allow particular users to access 
particular sets of information  

*/ 


CREATE ROLE Admins;

CREATE ROLE PointCounters;

CREATE ROLE Execs; 


/* 

Administrator "Admins" Role: 

Allow the administrator to access all priviliges on all tables 
 
*/ 

GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER ON MostScares TO Admins; 

GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER ON SullysHelpers TO Admins;

GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER ON RandallsPoints TO Admins;

GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER ON monsters TO Admins;

GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER ON helpers TO Admins;

GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER ON scarers TO Admins;

GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER ON secretaries TO Admins;

GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER ON executives TO Admins;

GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER ON laughs TO Admins;

GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER ON helpsOn TO Admins;

GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER ON worksOn TO Admins;

GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER ON scares TO Admins;

GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER ON doors TO Admins;

GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER ON entersBy TO Admins;

GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER ON children TO Admins;





/* 

Point Counters Role:

Allow point counters to modify the scarers table through updating only so they can modify 
the scarepoints column in the scarers table only, and revoke them from the ability to access
all other tables in the database. 

*/ 

GRANT SELECT, UPDATE ON scarers TO PointCounters; 
	
	REVOKE INSERT, DELETE, TRUNCATE, REFERENCES, TRIGGER ON scarers FROM PointCounters;

		REVOKE ALL PRIVILEGES ON MostScares FROM PointCounters; 

		REVOKE ALL PRIVILEGES ON RandallsPoints FROM PointCounters; 

		REVOKE ALL PRIVILEGES ON SullysHelpers FROM PointCounters; 

		REVOKE ALL PRIVILEGES ON monsters FROM PointCounters;

		REVOKE ALL PRIVILEGES ON helpers  FROM PointCounters;

		REVOKE ALL PRIVILEGES ON secretaries FROM PointCounters;

		REVOKE ALL PRIVILEGES ON executives FROM PointCounters;

		REVOKE ALL PRIVILEGES ON laughs FROM PointCounters;

		REVOKE ALL PRIVILEGES ON helpsOn FROM PointCounters;

		REVOKE ALL PRIVILEGES ON worksOn FROM PointCounters;

		REVOKE ALL PRIVILEGES ON scares FROM PointCounters;

		REVOKE ALL PRIVILEGES ON doors FROM PointCounters;

		REVOKE ALL PRIVILEGES ON entersBy FROM PointCounters;

		REVOKE ALL PRIVILEGES ON children FROM PointCounters;



/*

Executives "Execs" Role: 

Create a role for the executives of Monsters Inc. that have the ability to select information from 
certain tables, including views and stored procedures. However, they cannot update, delete or otherwise
modify any information, and a revoke statement is included to prevent them from modifying their own 
table.

*/ 

GRANT SELECT ON MostScares TO Execs; 

GRANT SELECT ON SullysHelpers TO Execs;

GRANT SELECT ON RandallsPoints TO Execs;

GRANT SELECT ON monsters TO Execs;

GRANT SELECT ON helpers TO Execs;

GRANT SELECT ON scarers TO Execs;

GRANT SELECT ON secretaries TO Execs;

GRANT SELECT ON executives TO Execs;

GRANT SELECT ON laughs TO Execs;

GRANT SELECT ON helpsOn TO Execs;

GRANT SELECT ON worksOn TO Execs;

GRANT SELECT ON scares TO Execs;

GRANT SELECT ON doors TO Execs;

GRANT SELECT ON entersBy TO Execs;

GRANT SELECT ON children TO Execs;


	REVOKE UPDATE, INSERT, DELETE, TRUNCATE, REFERENCES, TRIGGER ON MostScares FROM Execs; 

	REVOKE UPDATE, INSERT, DELETE, TRUNCATE, REFERENCES, TRIGGER ON SullysHelpers FROM Execs; 

	REVOKE UPDATE, INSERT, DELETE, TRUNCATE, REFERENCES, TRIGGER ON RandallsPoints FROM Execs; 

	REVOKE UPDATE, INSERT, DELETE, TRUNCATE, REFERENCES, TRIGGER ON executives FROM Execs; 

	REVOKE UPDATE, INSERT, DELETE, TRUNCATE, REFERENCES, TRIGGER ON monsters FROM Execs; 

	REVOKE UPDATE, INSERT, DELETE, TRUNCATE, REFERENCES, TRIGGER ON helpers FROM Execs; 

	REVOKE UPDATE, INSERT, DELETE, TRUNCATE, REFERENCES, TRIGGER ON scarers FROM Execs; 

	REVOKE UPDATE, INSERT, DELETE, TRUNCATE, REFERENCES, TRIGGER ON secretaries FROM Execs; 

	REVOKE UPDATE, INSERT, DELETE, TRUNCATE, REFERENCES, TRIGGER ON laughs FROM Execs; 

	REVOKE UPDATE, INSERT, DELETE, TRUNCATE, REFERENCES, TRIGGER ON helpsOn FROM Execs; 

	REVOKE UPDATE, INSERT, DELETE, TRUNCATE, REFERENCES, TRIGGER ON worksOn FROM Execs; 

	REVOKE UPDATE, INSERT, DELETE, TRUNCATE, REFERENCES, TRIGGER ON scares FROM Execs;

	REVOKE UPDATE, INSERT, DELETE, TRUNCATE, REFERENCES, TRIGGER ON doors FROM Execs; 

	REVOKE UPDATE, INSERT, DELETE, TRUNCATE, REFERENCES, TRIGGER ON entersBy FROM Execs; 

	REVOKE UPDATE, INSERT, DELETE, TRUNCATE, REFERENCES, TRIGGER ON children FROM Execs; 


/* 

STORED PROCEDURES - Functions that take parameters are written for the database and can be 
run without the need to re-write the same query over and over again 

*/ 


-- Function that takes a scarers name and displays all the helpers that scarer has worked with 


CREATE FUNCTION show_scarers_helpers (text, refcursor) 
	
	RETURNS refcursor AS 

	$$ 

	DECLARE 

		thisScarers_name 	text 			:= $1; 

		thisResult 			refcursor 		:= $2;  

	BEGIN  

		OPEN thisResult for 


				SELECT name 

				FROM monsters 

				WHERE mid IN (	SELECT helpsOn.mid 

								FROM helpsOn 

								INNER JOIN children ON helpsOn.doornum = children.doornum 

								INNER JOIN worksOn ON worksOn.doornum = children.doornum 

								INNER JOIN scarers ON scarers.mid = worksOn.mid 

								INNER JOIN monsters ON monsters.mid = scarers.mid 

									WHERE monsters.name = thisScarers_name 

			 	 			 );

		RETURN thisResult;

	END;

	$$

	LANGUAGE PLPGSQL; 


-- To show all the helpers "Sully" has worked with 

	SELECT show_scarers_helpers ('Sully', 'results');

	FETCH ALL FROM results; 



-- To show all the helpers "Randall" has worked with 

	SELECT show_scarers_helpers ('Randall', 'results');

	FETCH ALL FROM results; 

-- To show all the helpers "Bile" has worked with 

	SELECT show_scarers_helpers ('Bile', 'results');

	FETCH ALL FROM results; 



-- function that takes a childs name and returns all the monsters that have made them laugh 

CREATE FUNCTION made_children_laugh (text, refcursor) 

	RETURNS refcursor AS 

	$$

	DECLARE 

		thisChilds_name 	text		:=	$1; 

		thisResult 			refcursor 	:=  $2; 

	BEGIN 

		OPEN thisResult for 

		
		SELECT monsters.name

		FROM monsters

		INNER JOIN helpers ON helpers.mid = monsters.mid

		INNER JOIN laughs ON laughs.mid = helpers.mid

		INNER JOIN children ON children.cid = laughs.cid

			WHERE children.name = thisChilds_name; 

		RETURN thisResult; 

	END;

	$$

	LANGUAGE PLPGSQL;  



--To show all the monsters thatr made child 'Lily' laugh 


SELECT made_children_laugh ('Lily' , 'results');

FETCH all from results;


--To show all the monsters that made child 'Sam' laugh


SELECT made_children_laugh ('Sam' , 'results');

FETCH all from results;


--To show all the monsters that made child 'Billy' laugh 


SELECT made_children_laugh ('Billy' , 'results');

FETCH all from results










































































































































































































































































































