-- Functions
-- Aggregate sum,avg,min,max,count
-- IPO
-- Inputs parameters
-- process instruction set which works on your inputs
-- output retrun value from your function
-- output may be a single value or table
USE TESTING;
SELECT * FROM EMP;
select empno,ename,sal,comm,sal+comm as 'Total Salary' 
from emp;

-- value+null=null
select empno,ename,sal,comm,sal+ifnull(comm,0) as 'Total Salary' 
from emp;

-- create a function procdure outparatemeters
-- []-->optional
-- semi colon -> mysql ; delimiter end of instruction
-- we have define delimiter for the block of instruction
-- delimiter //
-- begin 
-- statement 1;
-- statement 2;
-- end; //


CREATE FUNCTION function_name [ (parameter datatype [, parameter datatype]) ]
RETURNS return_datatype

BEGIN

   declaration_section

   executable_section

END;

-- create table tabname()
-- create view vw_name as ....
-- display(); declaration
-- display(int i, int j){return i+j;} definition

drop function  getTotalSalary

delimiter //
create function getTotalSalary
(sal decimal(7,2),comm decimal(7,2))
returns decimal(7,2)
DETERMINISTIC
begin
	
    return sal+ifnull(comm,0);	
end;//
delimiter ;

-- create function
-- parameters 
-- delimiters
-- returns ans return 
select empno,ename,sal,comm,getTotalSalary(sal,comm) 
from emp
order by getTotalsalary(sal,comm);

-- declaring varibles in begin block
-- using variables within block
-- printing values
 

select empno,sal,comm from emp where comm is not null;
-- if comm is  null or 0 adding 500 in salary
-- if comm < 500 add 200 sal+comm+200
-- if comm > 500 sal+comm
delimiter //
create function addCommision(sal decimal(7,2), comm decimal(7,2))
returns int
DETERMINISTIC
begin
	DECLARE RESULT int;
    SET RESULT=0;
	if comm is null or comm = 0 then
		SET RESULT=sal+500;
	elseif comm<500 then
		SET RESULT=sal+200+ifnull(comm,0);
	else
		SET RESULT=sal+ifNull(comm,0);
	end if;
    
    return RESULT;
    
end;//
delimiter ;

select empno,sal,comm,addcommision(sal,comm) from emp ;

delimiter //
create function demo(sal decimal(7,2),comm decimal(7,2))
returns decimal(7,2)
DETERMINISTIC
begin 
	DECLARE totalsal decimal(7,2);
    set totalsal=0;
	set totalsal=sal+ifnull(comm,0);
    return totalsal;
end; //
delimiter ;
-- if comm < 500 add 200 sal+comm+200
-- if comm > 500 sal+comm
-- if comm is  null or 0 and sal < max(sal) adding 500 in salary 
 
delimiter //
create function addCommision1(sal decimal(7,2), comm decimal(7,2))
returns int
DETERMINISTIC
begin
	DECLARE RESULT int;
    SET RESULT=0;
	if (comm is null or comm = 0) and sal<5000 then
		SET RESULT=sal+500;
	elseif comm<500 then
		SET RESULT=sal+200+ifnull(comm,0);
	else
		SET RESULT=sal+ifNull(comm,0);
	end if;
    
    return RESULT;
    
end;//
delimiter ;
 
============= Procedure 
-- procedure -> modules 
-- parameters In Out Inout
-- does not return a value like a function
-- delimiter //
-- create procedure prc_demo([in|out parameter <datatype>,[]])
-- begin
-- 	declarations
--     execution
-- end; //
-- delimiter ;

prc_totalSalarydelimiter //
create procedure prc_totalSalary(in sal decimal(7,2),in comm decimal(7,2),out totalsalary decimal(7,2))
begin
	set totalsalary=sal+ifnull(comm,0);
    
end;// 
delimiter ;


select * from emp;

ALTER view VW_emp_not_mng AS
select ename, job,mgr
from emp
 WHERE job='manager';
 
 drop function GETMAXSAL;
 
 
 DELIMITER //
create FUNCTION GETMAXSAL (sal DECIMAL(7,2))
 RETURNS DECIMAL(7,2)
 DETERMINISTIC
 BEGIN
	RETURN max(sal); 

 END;//
 DELIMITER ;

SELECT ENAME,sal,GETMAXSAL(sal) FROM EMP;
SELECT * FROM VW_emp_not_mng ;



prc_maxsaldelimiter //
create procedure prc_maxsal (in sal decimal (7,2),out maxsal decimal (7,2))
begin
 maxsal= 5000;

end;//
delimiter;





select empno,ename,sal,comm,getTotalSalary(sal,comm) 
from emp;




-- 1. FUNCTION VS PROCEDURE
2. VIEW VS PROCDURE (ASSIGNMENT)
view 
It is  a virtual table.
A view can be thought of as a virtual table
 and works much the same as any other table in your database when it comes to querying data. 
Using a SELECT statement, you can query all or query a specific portion of the view using
A view represents a virtual table. 
You can join multiple tables in a view and use the 
view to present the data as if the data were coming from a single table.

Can contain only one single Select query.
Can contain several statement like if, else, loop etc.

A stored procedure uses parameters to do a function...
 whether it is updating and inserting data, or returning single values or data sets.

3. IN WHAT SCENARIO YOU WILL CREATE A 
PROCEDURE 
	A. VIEW
	B. FUNCTION
	C. SELECT STATEMENT
4. ONE EXAMPLE WE USED IN and out  parameters 
	create a procedure which uses inout example
5.  how to use below programming constructs:
	1. if else statement
	2. looping construct : while / do-while
	3. variables within begin and end block
select
view 
Function 
Procedure 
===========================
1. documentation -> tutorial/ getting started 
    documentation <name jargon> 
2. Error => error code + mysql/technology
	solutions-> Stackoverflow
3. see code on site -> writing 
	minute check else if -> elseif -> elif 
	word by word -> keyword
4. scenario totalsalary verify your assumptions 
	sal+comm
	sal+ifNull(comm,0) 
	sal+ifNull(comm,500) 
	if then
Product  : InStock / OutStock
Product 
pid: p1001
name:     Pepsi500ml 
quantity: 100 
unit price: 20


3 customers
c1001	->p1001-> quantity 30-> 100-30=> 70
c1002	->p1001-> quantity 60-> 100-30=> 10
c1003	->p1001-> quantity 20->only 10 avialable

insert order c1001-> update on product -> quantity p1001	
insert order c1002-> update on product -> quantity p1001
insert order c1003-> update on product -> quantity p1001->rollback -> only 10 availble





 

