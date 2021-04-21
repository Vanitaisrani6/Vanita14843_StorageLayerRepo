
-- USE MYSQL;
 -- CREATE DATABASE 
 USE TESTING;
 -- CREATE ddl DATA DEFINATION
 -- CREATE TABLE DEPT(
-- DEPTNO INT NOT NULL,
-- DNAME VARCHAR(20) NOT NULL,
-- LOC VARCHAR(20) NOT NULL
 -- );
 
 -- DROP TABLE DEPT;

--  ALTER TABLE DEPT
 -- ADD CONSTRAINT Pk_DEPTNO PRIMARY KEY (DEPTNO);-
 
 -- DML DATA MANIPULATION
 
INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');


CREATE TABLE EMP
(
 EMPNO int NOT NULL ,
 ENAME VARCHAR(20),
  JOB VARCHAR(9),
   MGR int ,
    HIREDATE DATETIME,
    SAL NUmeric(7, 2),
    COMM Numeric(7, 2),
    DEPTNO int 
 );
 
 ALTER TABLE EMP
 ADD constraint  pk_EMPNO PRIMARY KEY (EMPNO);
 
 ALTER TABLE EMP
 ADD foreign key (DEPTNO) REFERENCES DEPT(DEPTNO);

-- EMP NO IS SUPERSET AND MGR NO IS SUBSET
  ALTER TABLE EMP
 ADD foreign key (MGR) REFERENCES EMP(EMPNO);
 
 
 INSERT INTO EMP VALUES   (7839, 'KING',   'PRESIDENT', NULL,    str_to_date('11/17/1981','%m/%d/%Y') , 5000, NULL, null);   
INSERT INTO EMP VALUES   (7566, 'JONES',  'MANAGER',   		7839, str_to_date('04/2/1981'	,'%m/%d/%Y'),  2975, NULL, 20);
INSERT INTO EMP VALUES   (7698, 'BLAKE',  'MANAGER',   		7839, str_to_date('05/01/1981'	,'%m/%d/%Y'),  2850, NULL, 30);
INSERT INTO EMP VALUES   (7782, 'CLARK',  'MANAGER',   		7839, str_to_date('06/09/1981'	,'%m/%d/%Y'),  2450, NULL, 10);
INSERT INTO EMP VALUES   (7999, 'RAHUL_DRAVID', 'MANAGER',  7839, str_to_date('01/01/2011'  ,'%m/%d/%Y'), 4000, NULL, 10);
INSERT INTO EMP VALUES   (7788, 'SCOTT',  'ANALYST',   		7566, str_to_date('12/09/1982'  ,'%m/%d/%Y'), 3000, NULL, 20);
INSERT INTO EMP VALUES   (7902, 'FORD',   'ANALYST',   		7566, str_to_date('12/03/1981'  ,'%m/%d/%Y'),  3000, NULL, 20);
INSERT INTO EMP VALUES   (7499, 'ALLEN',  'SALESMAN',  		7698, str_to_date('02/20/1981'  ,'%m/%d/%Y'), 1600,  300, 30);
INSERT INTO EMP VALUES   (7521, 'WARD',   'SALESMAN',  		7698, str_to_date('02/22/1981'  ,'%m/%d/%Y'), 1250,  500, 30);
INSERT INTO EMP VALUES   (7654, 'MARTIN', 'SALESMAN',  		7698, str_to_date('09/28/1981'  ,'%m/%d/%Y'), 1250, 1400, 30);
INSERT INTO EMP VALUES   (7844, 'TURNER', 'SALESMAN',  		7698, str_to_date('09/08/1981'  ,'%m/%d/%Y'),  1500,    0, 30);
INSERT INTO EMP VALUES   (7900, 'JAMES',  'CLERK',			7698, str_to_date('12/03/1981'  ,'%m/%d/%Y'),   950, NULL, 30);
INSERT INTO EMP VALUES   (7369, 'SMITH',  'CLERK',			7902, str_to_date('12/17/1980'  ,'%m/%d/%Y'), 800, NULL, 20);
INSERT INTO EMP VALUES   (7876, 'ADAMS',  'CLERK',			7788, str_to_date('01/12/2003'  ,'%m/%d/%Y'), 1100, NULL, 20);
INSERT INTO EMP VALUES   (7934, 'MILLER', 'CLERK',			7782, str_to_date('01/23/2002'  ,'%m/%d/%Y'), 1300, NULL, 10);
INSERT INTO EMP VALUES   (7901, 'RAHUL_DRAVID', 'MANAGER',  7839, str_to_date('01/23/2012'  ,'%m/%d/%Y'), 3000, NULL, 10);

 USE TESTING;
SELECT * FROM EMP;
SELECT * FROM dEPT;

-- SELECT <PROJECTION> FROM <TABLE> SELECTING COLUMS FROM TBALES IS PROJECTION

SELECT EMPNO,ENAME,MGR FROM EMP;

SELECT EMPNO,ENAME,DEPTNO,MGR FROM EMP;
-- RESTRICTION --WHERE CLAUSE

SELECT * FROM EMP WHERE DEPTNO=20;
SELECT * FROM EMP WHERE DEPTNO<20;
SELECT * FROM EMP WHERE DEPTNO>20;


SELECT * FROM EMP WHERE JOB='MANAGER'; 

SELECT EMPNO,ENAME,JOB FROM EMP WHERE JOB='CLERK'OR JOB='MANAGER' OR JOB='ANALYST';

SELECT EMPNO,ENAME,JOB FROM EMP WHERE JOB='CLERK'AND JOB='MANAGER' AND JOB='ANALYST';

-- LIST EMP WHO ARE EARNING SAL BETWEEN 3000 AND 5000 
SELECT EMPNO,ENAME,SAL FROM EMP WHERE SAL>=3000 AND SAL<=5000;
SELECT EMPNO,ENAME,SAL,JOB FROM EMP WHERE SAL between 3000 AND 5000;
SELECT EMPNO,ENAME,SAL FROM EMP WHERE SAL>3000 AND SAL<5000;


-- LIST EMP WHO ARE 
-- WORKING AS MANAGER OR ANALYST OR CLERK
-- AND
-- EARNING SAL BETWEEN 3000 AND 5000

SELECT EMPNO,ENAME,JOB,SAL FROM EMP 
WHERE 
(JOB='CLERK'OR JOB='MANAGER' OR JOB='ANALYST' )AND
SAL BETWEEN 3000 AND 5000;


SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE 
JOB IN ('CLERK','MANAGER','ANALYST') AND SAL BETWEEN 3000 AND 5000; -- EXACT MATCH

select * from emp;
Select * from dept;
-- order by asc ->natural a-z 0-9
select * from emp order by empno;

select job,empno,ename,mgr,hiredate,sal,comm,deptno from emp
order by job asc,empno desc;

select job,empno,ename,mgr,hiredate,sal,comm,deptno from emp
order by job asc,empno ;
select job,empno,ename,mgr,hiredate,sal,comm,deptno from emp
order by job asc,empno,sal desc;

select job,empno,ename,mgr,hiredate,sal,comm,deptno from emp
order by job asc,sal ;

-- Aggreate functions 
select max(sal) from emp;
select min(sal) from emp;
select avg(sal) from emp;
select sum(sal) from emp;
-- Employees getting comm

select count(comm)  from emp;
-- Total number of employees
select count(*) from emp;
select count(*), count(comm) from emp;
-- Group by Aggregation
-- count of employee getting commission with their name
select ename,comm from emp where comm is not null;
select deptno,count(comm)  from emp
group by deptno;
-- Each department and total no. of employee working in that department
-- 10 5
select deptno,count(empno) from emp group by deptno;
-- how many employee having same job
-- manager ? analyst ? cleark ?
select job,count(empno) from emp group by job;
-- ##################################################
-- empno,ename, department name 
select * from dept;
-- below query gives the soulution but it has problem of 
-- giving cross join if we forgot where clause
select empno,ename, dname from emp,dept 
where emp.deptno=dept.deptno;


select empno,ename, dname 
from emp join dept 
on emp.deptno=dept.deptno;

select empno,ename, dname 
from emp left outer join dept 
on emp.deptno=dept.deptno;

select empno,ename, dname 
from emp right outer join dept 
on emp.deptno=dept.deptno;

-- select empno,ename, dname 
-- from emp full outer join dept 
-- on emp.deptno=dept.deptno;
-- subquery returning exactly one value 
-- display employees earning less than max salary
select * from emp
where sal=(select max(sal) from emp);

-- i need people working in Turner's department
-- a. get deptno of Turner
-- b. find people working in that department
select * from emp
where deptno=(select deptno from emp where ename='Turner');
-- 
select empno from emp
where deptno=(select deptno from emp where ename='Turner');

-- display employee name and mgr name for people working with
-- terner
select ename,mgr from emp
where deptno=(select deptno from emp where ename='Turner');

-- subquery returning more than one row
select ename,mgr,dname 
from emp join dept 
on emp.DEPTNO=dept.deptno
where empno in
(select empno from emp
where deptno=(select deptno from emp where ename='Turner'));
-- salary less than max salary

select empno,ename,sal from emp
where sal > ANY (select sal from emp
where sal <(select max(sal) from emp))
ORDER BY SAL DESC;

select empno,ename,sal from emp
where sal > ALL (select sal from emp
where sal <(select max(sal) from emp))
ORDER BY SAL DESC;

select sal from emp
where sal <(select max(sal) from emp)
order by sal desc;


select empno,ename,sal from emp
where sal < ANY (select sal from emp
where sal <(select max(sal) from emp))
ORDER BY SAL DESC;

-- select empno,ename,sal from emp
-- where sal < ALL (select sal from emp
-- where sal <(select max(sal) from emp))
-- ORDER BY SAL DESC;

create view vw_empdept as
select empno,ename,dname,sal,comm 
from emp join dept
on emp.deptno=dept.deptno;

select * from vw_empdept;


alter view vw_empdept as
select empno,ename,dname,sal,comm,job 
from emp join dept
on emp.deptno=dept.deptno;










-- assignment queries

-- list all manager data
Select empno,ename,job from emp where job='Manager';

-- LIST EMP WHO ARE WORKING AS MANAGER OR ANALYST OR CLERK
SELECT EMPNO,ENAME,JOB FROM EMP WHERE (JOB= 'CLERK'OR JOB='MANAGER' OR JOB='ANALYST');
SELECT EMPNO,ENAME,JOB FROM EMP WHERE JOB IN ('CLERK','MANAGER','ANALYST');

-- LIST EMP WHO ARE EARNING SAL BETWEEN 3000 AND 5000 (INCLUSIVE OF LIMIT)
SELECT EMPNO,ENAME,SAL FROM EMP WHERE SAL between 3000 AND 5000;

-- LIST EMP WHO ARE WORKING AS MANAGER OR ANALYST OR CLERK AND EARNING SAL BETWEEN 3000 AND 5000
SELECT EMPNO,ENAME,SAL,JOB FROM EMP 
WHERE (JOB='CLERK'OR JOB='MANAGER' OR JOB='ANALYST')AND
SAL BETWEEN 3000 AND 5000;

-- LIST ALL EMP WHO ARE EARNING COMM
SELECT * FROM EMP  WHERE COMM>0;

 -- LIST ALL EMP WHOSE COMM IS NOT NULL
Select  EMPNO,ENAME,SAL,JOB,COMM FROM EMP
WHERE COMM IS NOT NULL;

-- LIST ALL EMP WHOSE NAME STARTS WITH S
sELECT * FROM EMP WHERE ENAME LIKE 'S%';

-- LIST ALL EMP WHOSE NAME ENDS WITH R
SELECT * FROM EMP WHERE ENAME LIKE '%R';

-- LIST ALL EMP WHOSE NAME CONTAINS A
SELECT * FROM EMP WHERE ENAME LIKE '%A%';

-- LIST ALL EMP WHOSE NAME CONTAINS A AS SECOND LETTER
SELECT * FROM EMP WHERE substring(ENAME, 2,1)='A';
SELECT * FROM EMP WHERE ENAME LIKE '_A%';

-- LIST ALL EMP WHOSE NAME STARTS WITH EITHER M OR S
SELECT * FROM EMP WHERE ENAME LIKE 'M%' OR ENAME LIKE 'S%';

-- LIST ALL EMP WHOSE NAME STARTS BETWEEN A TO M  CHECK ONCE 
SELECT * FROM EMP WHERE ENAME regexp'^[A-M]';

-- LIST ALL EMP WHOSE NAME CONTAINS _ 
SELECT * FROM EMP WHERE ENAME regexp '_';

-- LIST ALL EMP WHO ARE WORKING AS MANAGER IN EITHER DEPT 10 OR 20 
-- AND ALL CLERK FOR DEPT3 30

SELECT ENAME,JOB,DEPTNO,DEPTNO FROM EMP
WHERE JOB='MANAGER' AND DEPTNO IN ('10','20') OR JOB='CLERK' AND DEPTNO=30; 

-- LIST ENAME, SAL AND BONUS AS 10% OF SALARY
SELECT ENAME, SAL, (SAL*10/100) AS BONUS FROM EMP;

-- LIST EMP DATA AS PER THE ASCENDING ORDER OF NAME
SELECT * FROM EMP ORDER BY ENAME ASC ;

-- LIST ALL AS PER THEIR SALARY HIGHEST TO LOWEST
SELECT * FROM EMP ORDER BY SAL DESC;

-- LIST EMP AS PER THEIR DEPT, WITH IN DEPT HIGHEST TO LOWESET SAL
SELECT * FROM EMP  ORDER BY SAL DESC LIMIT 3;

-- list top 3 highest paid emp
SELECT * FROM EMP  ORDER BY SAL ASC LIMIT 3; 


-- RETURN SEQUENTIAL NUMBER 
-- RETURN RANK BASED ON SPECIFED CRITERIA IF TWO EMP HAVE SAME SALARY THEY BOTH GET SAME NUMBER AND NEXT NUMBER WILL BE SKIPPED
SELECT EMPNO,ENAME,DEPTNO,SAL,
RANK() OVER (PARTITION BY DEPTNO ORDER BY SAL DESC)
AS 'RANK' FROM EMP;

--  RETURN CONSECUTIVE RANKING VALUES BASED ON A SPECIFIED CRITERIA


-- LIST THE DIFFERNT JOB NAME
SELECT distinct JOB FROM EMP;

-- LIST TOTAL ORGANIZATION SALARY
select sum(sal) TOTAL_ORG_SALR from emp; 

--  LIST DEPTWISE TOTAL SALARY
SELECT DEPTNO,SUM(SAL) AS TOTAL_ORG_SALARY FROM EMP GROUP BY DEPTNO;

-- LIST JOBWISE EMP COUNT.
SELECT JOB, COUNT(*) AS EMP_COUNT FROM EMP GROUP BY JOB;

-- LIST ALL EMP WHO HAVE JOINED IN MONTH OF FEB
SELECT * FROM EMP WHERE MONTH(HIREDATE)=2; 

-- LIST EMP COUNT  JOINED BETWEEN 1981 AND 1983
SELECT COUNT(*) AS "1981_1983" FROM EMP  WHERE HIREDATE BETWEEN '1981-01-01' AND '1983-1-31';

-- LIST HOW MANY YEARS OF SERVICE COMPLETED BY EACH EMP ARRANGE BASED ON TENURE HIGHEST TO LOWEST
SELECT ENAME,YEAR (NOW())-YEAR(HIREDATE) AS 'TENURE' FROM EMP ORDER BY TENURE DESC;


