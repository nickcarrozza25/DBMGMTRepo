/* 

Nick Carrozza

Lab 10 Stored Procedures

CMPT 308

*/ 

/* 

Stored Procedure 1 - Pass through course number and retrieve prerequisutes 

*/ 


CREATE FUNCTION prereqsByCoursenum (int, refcursor) 

	RETURNS refcursor AS

$$ 

DECLARE 

	thisCourseNum 	int 	:= $1;

    thisResult	  refcursor := $2; 

   

BEGIN 

	OPEN thisResult for 

    	SELECT preReqNum 

        FROM Prerequisites 

        WHERE coursenum = thisCoursenum; 

    RETURN thisResult;

END;

$$


LANGUAGE PLPGSQL;


--example query for testing 


SELECT prereqsByCoursenum (308, 'results'); 

FETCH all from results; 


/* 

Stored Procedure 2 - Retrieve course number for passed in prerequisite 

*/ 

CREATE FUNCTION coursesByPrereqnum (int, refcursor) 

	RETURNS refcursor AS 

$$

DECLARE 

	thisPrereqnum 	int 	  := $1;

	thisResult 		refcursor := $2; 

BEGIN 

	OPEN thisResult for 

		SELECT coursenum 

		FROM Prerequisites

		WHERE preReqNum = thisPrereqnum; 

RETURN thisResult;

END ;

$$

LANGUAGE PLPGSQL;


--example query for testing 

SELECT coursesByPrereqnum (120, 'results'); 

FETCH ALL FROM results; 






