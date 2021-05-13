create database tester;
use tester;

CREATE TABLE PEOPLE(
PERSONID INT,
FIRST_NAME VARCHAR(20),
LAST_NAME VARCHAR(20)
);
 ALTER TABLE PEOPLE
 ADD CONSTRAINT pk_PERSONID PRIMARY KEY (PERSONID);
 
 
 CREATE TABLE PEOPLE1(
PERSONID INT NOT NULL AUTO_INCREMENT,
FIRST_NAME VARCHAR(20),
LAST_NAME VARCHAR(20),
PRIMARY KEY (PERSONID)
);

DROP TABLE PEOPLE;

ALTER TABLE PEOPLE1 ADD COLUMN DOB DATE NULL;

ALTER TABLE PEOPLE1 DROP COLUMN DOB;

DROP TABLE ACTOR;
DROP TABLE MOVIES;
 CREATE TABLE ACTOR(
 ACTORID INT NOT NULL auto_increment,
 FIRST_NAME VARCHAR(10),
 LAST_NAME VARCHAR(10),
 primary key (ACTORID)
 );
 
 CREATE TABLE MOVIES(
 MOVIEID INT NOT NULL auto_increment,
 TITLE VARCHAR(20),
 RELEASE_YEAR INT,
 RATING INT,
 primary key (MOVIEID)
 );


INSERT INTO ACTOR (FIRST_NAME,LAST_NAME) VALUES ('VANITA','ISRANI');
INSERT INTO ACTOR (FIRST_NAME,LAST_NAME) VALUES('ROHAN','DUBEY');
INSERT INTO ACTOR (FIRST_NAME,LAST_NAME) VALUES('SARUKH','KHAN');
INSERT INTO ACTOR (FIRST_NAME,LAST_NAME) VALUES('VARUN','DHAWAN');
INSERT INTO ACTOR (FIRST_NAME,LAST_NAME) VALUES('KAREENA','KAPOOR');

SELECT * FROM ACTOR;
SELECT * FROM MOVIES;

INSERT INTO MOVIES (TITLE, RELEASE_YEAR,RATING) VALUES ('SPIDERMAN',2020,3);
 INSERT INTO MOVIES (TITLE, RELEASE_YEAR,RATING) VALUES ('PARI',2014,1);
 INSERT INTO MOVIES (TITLE, RELEASE_YEAR) VALUES ('SPIDERMAN2',2016);
 INSERT INTO MOVIES (TITLE, RELEASE_YEAR,RATING) VALUES ('MALANG',2018,2);
 INSERT INTO MOVIES (TITLE, RELEASE_YEAR,RATING) VALUES ('AAVTAR',2021,5);
 INSERT INTO MOVIES (TITLE, RELEASE_YEAR,RATING) VALUES ('ANDHADHUN',2014,1);
 

SELECT  CONCAT (LAST_NAME, ',',FIRST_NAME) FROM ACTOR ;
 SELECT  CONCAT (LAST_NAME, ',',FIRST_NAME) AS ACTORNAME FROM ACTOR ;
 
SELECT LAST_NAME, substring(LAST_NAME,1,3) FROM ACTOR; -- NAME,STARTPOINT,LENGHTH
 SELECT LAST_NAME, substring(LAST_NAME,3,1) FROM ACTOR;
 
 SELECT FIRST_NAME, LAST_NAME, substring(FIRST_NAME,1,1) as "first  letter", CONCAT(substring(FIRST_NAME,1,1),LAST_NAME) AS USERNAME FROM ACTOR;
 
 create table TOURNAMENT(
 FNAME VARCHAR(20),
 LNAME VARCHAR(20),
 GAME1 INT,
 GAME2 INT,
GAME3 INT,
GAME4 INT
 );
 
 INSERT INTO TOURNAMENT (FNAME,LNAME,GAME1,GAME2,GAME3,GAME4) VALUES 
 ('VANITA','ISRANI',10,20,30,40);
  INSERT INTO TOURNAMENT (FNAME,LNAME,GAME1,GAME2,GAME3,GAME4) VALUES 
 ('PALAK','SETIYA',21,35,43,89);
  INSERT INTO TOURNAMENT (FNAME,LNAME,GAME1,GAME2,GAME3,GAME4) VALUES 
 ('NIKITA','PARASWANI',20,50,60,32);
  INSERT INTO TOURNAMENT (FNAME,LNAME,GAME1,GAME2,GAME3,GAME4) VALUES 
 ('RISHABH','SHARMA',20,89,43,50);
 
 
 SELECT * FROM TOURNAMENT
 
 SELECT CONCAT(LNAME,' ',FNAME) AS PLAYER ,CONCAT(substring(FNAME,1,1),substring(LNAME,1,1)) AS INITIALS,
 GAME1 AS G1,GAME2 AS G2,GAME3 AS G3,GAME4 AS G4, GAME1+GAME2+GAME3+GAME4 AS "TOURNAMENT TOTAL",
(GAME1+GAME2+GAME3+GAME4)/4 AS "TOURNAMENT AVERAGE" FROM TOURNAMENT;
 

 SELECT FNAME,LNAME,GAME1,GAME2,GAME3,GAME4, CONCAT(FNAME,',',LNAME) AS NAME, AVG(GAME1,GAME2,GAME3) FROM TOURNAMENT; 
 
 
 SELECT * FROM ACTOR LIMIT 3;
 
 SELECT * FROM ACTOR ORDER BY 3; -- ASESNDING ORDER (A-Z)
 SELECT * FROM ACTOR ORDER BY LAST_NAME;
  SELECT * FROM ACTOR ORDER BY LAST_NAME DESC, FIRST_NAME ASC limit 2;
  SELECT DISTINCT RATING FROM MOVIES ;
  
  SELECT COUNT(*) AS CNT FROM MOVIES;
  
   SELECT COUNT(*) AS TOTAL_ACTORS FROM ACTOR; 
   SELECT * FROM MOVIES;
   SELECT RATING, COUNT(*) AS TITLE FROM MOVIES GROUP BY TITLE;
  
  SELECT * FROM MOVIES WHERE TITLE LIKE '%m%';
  
  SELECT  COUNT(*) AS SPIDERSERIES FROM MOVIES WHERE TITLE LIKE '%SPIDER%' ;
  
  SELECT * FROM MOVIES;
  SELECT max(RELEASE_YEAR) AS LATEST_MOVIES  FROM MOVIES;
 SELECT MIN(RELEASE_YEAR) AS LATEST_MOVIES  FROM MOVIES;
 
 CREATE TABLE BOWLRESULTS (BOWLRESULTID INT NOT NULL AUTO_INCREMENT,
 FNAME VARCHAR(20),
 LNAME VARCHAR(20),
 GAME_NUM INT,
 GAME_SCORE INT,
 PRIMARY KEY(BOWLRESULTID)
 );
  INSERT INTO BOWLRESULTS (FNAME,LNAME ,GAME_NUM,GAME_SCORE) VALUES
 ('VANITA','ISRANI',10,20),
 ('PALAK','SETIYA',21,35),
 ('NIKITA','PARASWANI',20,50),
 ('RISHABH','SHARMA',20,89);
 
 SELECT * FROM BOWLRESULTS;
 
 
 SELECT CONCAT(FNAME,' ',LNAME) AS PLAYERS,
 SUM(GAME_SCORE) AS "tOURNAMENT TOTAL",
 SUM(GAME_SCORE)/COUNT(*) AS "TOURNAMENT AVARAGE" 
 FROM BOWLRESULTS
 GROUP BY FNAME, LNAME
 ORDER BY SUM(GAME_SCORE)/COUNT(*) DESC
 LIMIT 3;
 
 
 SELECT CONCAT(FNAME,' ',LNAME) AS PLAYERS,
 MAX(GAME_SCORE) AS BEST_GAME
  FROM BOWLRESULTS
  GROUP BY FNAME,LNAME
  ORDER BY MAX(GAME_SCORE) DESC;
 
 SELECT * FROM ACTOR;
 SELECT * FROM MOVIES;
 SELECT TITLE FROM MOVIES WHERE 1=1; -- TRUE
 SELECT TITLE FROM MOVIES WHERE 1=0; -- FALSE
 
SELECT 1 AS RESULT FROM MOVIES WHERE RATING=3;

SELECT * from MOVIES where RATING=3 AND TITLE LIKE 'S%' ;
 
 SELECT * from MOVIES where RATING=3 AND TITLE NOT LIKE 'S%' ;
 SELECT * FROM MOVIES;
 SELECT TITLE,RATING, CASE
 WHEN RATING=3 THEN 'THREE_STAR'
 WHEN RATING=1 THEN 'ONE_STAR'
WHEN RATING=5 THEN 'FIVE_START'
ELSE 'NO INFORMATION'
END
AS DESCRIPTION
FROM MOVIES;


-- DATES AND TIME
SelecT NOW(),CURDATE(),curtime(),YEAR(NOW()),YEAR(CURDATE());


UPDATE MOVIES
SET RELEASE_YEAR= 2021
WHERE TITLE = 'PARI';
 
 use tester;
 select * from bowlresults;
 select * from movies;
 select * from actor;
 alter table actor
 add column MOVIEID INT NULL;
 
 UPDATE ACTOR
 SET MOVIEID = 4
 WHERE ACTORID= 5; 
 -- IN(2,4,1);
  SELECT * FROM ACTOR, MOVIES
  WHERE ACTOR.MOVIEID=MOVIES.MOVIEID;
  
  SELECT ACTOR.ACTORID,
  ACTOR.MOVIEID,MOVIES.TITLE,
concat(ACTOR.FIRST_NAME,' ',ACTOR.LAST_NAME) AS ACTORNAME
FROM MOVIES,ACTOR
WHERE ACTOR.MOVIEID=MOVIES.MOVIEID;

 SELECT A.ACTORID,
  A.MOVIEID,M.TITLE,
concat(A.FIRST_NAME,' ',A.LAST_NAME) AS ACTORNAME
FROM MOVIES M,ACTOR A
WHERE A.MOVIEID=M.MOVIEID;
 
 SELECT * FROM ACTOR 
LEFT OUTER JOIN MOVIES
 ON ACTOR.MOVIEID=MOVIES.MOVIEID;
 

 
 
 
 
 
 