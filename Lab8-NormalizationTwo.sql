DROP TABLE IF EXISTS ActorAppearances;

DROP TABLE IF EXISTS DirectorAppearances; 

DROP TABLE IF EXISTS spouses; 

DROP TABLE IF EXISTS actors; 

DROP TABLE IF EXISTS directors;

DROP TABLE IF EXISTS movies;

DROP TABLE IF EXISTS people;


CREATE TABLE people (

	pid			int			not null unique,

	address		char(25)	not null,

	name		char(25)	not null,

		primary key (pid)

);

insert into people (pid, address, name) 
	values		   (1, '15 Hollywood lane', 'Sean Connery');

insert into people (pid, address, name)
	values		   (2, '42 wallowy way', 'Michael Cera');

insert into people (pid, address, name)
	values 		   (3, '16 cherry street', 'Jonah Hill');

insert into people (pid, address, name)
	values 		   (4, '771 dentyne ice blvd', 'Mila Kunis');

insert into people (pid, address, name)
	values 		   (5, '65 cranberry drive', 'Pierce Brosnan');

insert into people (pid, address, name)
	values 			(6, '123 golden blvd', 'Matt Dallas'); 

insert into people (pid, address, name)
	values 			(7, '539 salsbury lane', 'John Smith'); 

insert into people (pid, address, name)
	values 			(8, '2963 wooden street', 'Christopher Nolan'); 

insert into people (pid, address, name)
	values		   (9, '482 branch lane', 'Stephen Spielburg'); 

insert into people (pid, address, name)
	values		   (10, '15 Hollywood lane', 'Sean Connerys wife')








CREATE TABLE actors (

	pid			int		 	not null unique,

	BirthDate	date 		not null,

	HairColor	char(15)	not null,

	EyeColor	char(10)	not null,

	heightIn	int			not null,

	WeightLBS	int			not null,

	FavColor 	char(10)	not null,

	MovieName	char(40)	not null,

		primary key(pid)


); 

--think about getting rid of MovieName here: handled in the appearances table

insert into actors (pid, BirthDate, HairColor, EyeColor, heightIn, WeightLBS, FavColor, MovieName) 
	values		   (1, to_date('01151942', 'MMDDYYYY'), 'Brown', 'Brown', 70, 168, 'Blue', 'From Russia With Love');

insert into actors  (pid, BirthDate, HairColor, EyeColor, heightIn, WeightLBS, FavColor, MovieName) 
	values		  	(2, to_date('07051986', 'MMDDYYYY'), 'Light Brown', 'Brown', 68, 156, 'Red', 'Superbad'); 

insert into actors (pid, BirthDate, HairColor, EyeColor, heightIn, WeightLBS, FavColor, MovieName) 
	values		    (3, to_date('08141984', 'MMDDYYYY'), 'Brown', 'Blue', 67, 204, 'Blue', 'Superbad');

insert into actors (pid, BirthDate, HairColor, EyeColor, heightIn, WeightLBS, FavColor, MovieName) 
	values		    (4, to_date('10231983', 'MMDDYYYY'), 'Black', 'Green', 64, 148, 'Blue', 'Bad Santa');	

insert into actors (pid, BirthDate, HairColor, EyeColor, heightIn, WeightLBS, FavColor, MovieName)
	values   		(5, to_date('09161951', 'MMDDYYYY'), 'Brown', 'Brown', 69, 171, 'Black', 'Die Another Day'); 

insert into actors (pid, BirthDate, HairColor, EyeColor, heightIn, WeightLBS, FavColor, MovieName)
	values		   (6, to_date('05221973', 'MMDDYYYY'), 'Blonde', 'Blue', 71, 182, 'Yellow', 'Inception'); 




CREATE TABLE directors (

	pid				int			not null unique,

	FilmSchoolAtt	char(20), 

	FavLens			char(20) 	not null,

		primary key(pid)

); 


insert into directors  (pid, FilmSchoolAtt, FavLens)
	values		       (5, 'Harvard', 'Kodak'); 

insert into directors  (pid, FilmSchoolAtt, FavLens)
	values			   (8, 'Marist', 'Concave');

insert into directors (pid, FilmSchoolAtt, FavLens)
	values			  (9, 'NYU', 'Concave'); 



CREATE TABLE ActorAppearances (

	pid		int 		not null,

	mid  	int 		not null,

	name 	char(25) 	not null,

		primary key(pid, mid)

);


insert into ActorAppearances (pid, mid, name)
	values					 (1, 1, 'Sean Connery');

insert into ActorAppearances (pid, mid, name)
	values					 (2, 2, 'Michael Cera');

insert into ActorAppearances (pid, mid, name)
	values					 (3, 2, 'Jonah Hill');

insert into ActorAppearances (pid, mid, name)
	values					 (4, 3, 'Mila Kunis');

insert into ActorAppearances (pid, mid, name)
	values				     (5, 4, 'Pierce Brosnan');

insert into ActorAppearances (pid, mid, name)
	values					 (6, 5, 'Matt Dallas'); 

insert into ActorAppearances (pid, mid, name)
	values					 (1, 6, 'Sean Connery'); 





CREATE TABLE DirectorAppearances (

	pid		int 		not null,

	mid 	int 		not null,

	name 	char(25) 	not null, 

		primary key(pid, mid)

);


insert into DirectorAppearances (pid, mid, name)
	values						(5, 4, 'Pierce Brosnan');

insert into DirectorAppearances (pid, mid, name)
	values						(8, 1, 'Christopher Nolan'); 

insert into DirectorAppearances (pid, mid, name)
	values						(9, 6, 'Stephen Speilburg'); 





CREATE TABLE movies (

	mid			int 		not null unique, 

	MovieName	char(40)	not null, 

	YearRel		int 		not null,

	mpaa		char(6)		not null,

	DomBoxUSD	decimal(18,2),

	ForBoxUSD	decimal(18,2),

	DVDBluUSD	decimal(18,2), 

		primary key(mid)

);	

insert into movies (mid, MovieName, YearRel, mpaa, DomBoxUSD, ForBoxUSD, DVDBluUSD)
	values		   (1, 'From Russia With Love', 1960, 'PG-13', 18996978.45, 15960764.36, 10596843.21); 

insert into movies (mid, MovieName, YearRel, mpaa, DomBoxUSD, ForBoxUSD, DVDBluUSD)
	values		   (2, 'Superbad', 2008, 'R', 167920002.63, 726392002.89, 71899920.22); 

insert into movies (mid, MovieName, YearRel, mpaa, DomBoxUSD, ForBoxUSD, DVDBluUSD)
	values   	   (3, 'Bad Santa', 2006, 'PG-13', 722292190.32, 29984721.73, 199283731.25);

insert into movies (mid, MovieName, YearRel, mpaa, DomBoxUSD, ForBoxUSD, DVDBluUSD)
	values 		   (4, 'Die Another Day', 2002, 'PG-13', 399372029.93, 82018374.63, 88272993.78); 

insert into movies (mid, MovieName, YearRel, mpaa, DomBoxUSD, ForBoxUSD, DVDBluUSD)
	values 		   (5, 'Inception', 2010, 'PG-13', 731922933.46, 193834719.46, 28462820.12); 

insert into movies (mid, MovieName, YearRel, mpaa, DomBoxUSD, ForBoxUSD, DVDBluUSD)
	values 		   (6, 'Octopussy', 1965, 'PG-13', 13, 14, 15); 






CREATE TABLE spouses (

	pid 		int			not null,

	spouseId	int 		not null, 

	SpouseName	char(25)	not null,

	AnnivDate	date 		not null,

		primary key(pid, spouseId)

); 

insert into spouses (pid, spouseId, SpouseName, AnnivDate)
	values 			(10, 1, 'Sean Connery', to_date('08251992', 'MMDDYYYY')); 




-- This query will return all the directors actor 'Sean Connery' has appeared in a movie with a.k.a 'worked with'



SELECT *
FROM people 
WHERE pid in ( 


		SELECT pid
		FROM DirectorAppearances
		WHERE mid in (

		
        
        		SELECT mid
				FROM ActorAppearances
				WHERE pid in (


							SELECT pid 
							FROM people 
							WHERE name = 'Sean Connery'))); 





















