--DML(select , INsert, update, delete, truncate),import/ export

--######################################################################

	create database SQLDEMO

	use SQLDEMO

	create table employee 
	(eid int, ename varchar(10) , age smallint, gender char(10), salary decimal(10,2))

--DML(Data Manipulation language) --> manipulate data in a database.

---Select (Retrieves data from one or more tables.)
	--Syntax: SELECT column1, column2, ... FROM table_name
	use SQLDEMO

	select eid ,ename ,age , gender , salary from employee
		
	select eid , gender , salary,ename ,age from employee
	
	select age from employee

	select * from employee


--INSERT (Adds new rows of data into a table)
	--Syntax:	INSERT INTO table_name (column1, column2, ...) VALUES (value1, value2, ...)

		insert into employee(eid ,ename ,age , gender , salary)
		values (101, 'Alpha',21,'Male',78992)

		
		insert into employee( gender , salary,eid ,ename ,age )
		values ('Female',987654,102, 'Beta',23)
		
		insert into employee values
		(105, 'charlie',24,'feMale',21992),
		(103, 'echo',28,'Male',65992),
		(106, 'delta',26,'Male',678992),
		(104, 'fox',33,'feMale',78992),
		(107, 'tom',38,'Male',78992)
		
		insert into employee values
		(105,null, null, 'feMale',21992)
		
	
		insert into employee(eid,salary) values
		(108,21992)
			
		insert into employee(eid,salary) values
		('hh',21992)
--Null=Absent/ unknown, notavailable 

	select * from employee
--#######################################################

--UPDATE (Modifies existing data in a table)
	--Syntax:		UPDATE table_name SET column1 = value1, column2 = value2, ... WHERE condition;

-- Fix the gender for eid =102

	UPdate employee 
	set gender ='Female'
	where eid =102
		
	select * from employee
	
	UPdate employee 
	set gender ='Female'
	where gender ='Female'

	UPdate employee 
	set 	ename ='John',	age =35 ,	gender='Female'
	where eid =108

	UPdate employee 
	set 	ename ='david',	age =42  
	where ename is null



	select * from employee

		UPdate employee 
	set ename ='david'
--##################################################################################
--DELETE (Removes data from a table).
	--Syntax:	DELETE FROM table_name WHERE condition;

	DElete from employee where eid =101
	
	DElete from employee where eid  in (102, 105, 107)
		
	DElete from employee
	
	select * from employee

--Truncate(removing data from a table)

	--Syntax:	TRUNCATE TABLE table_name;

	Truncate table employee 

--###############################################
	Create table test
	(id int, ename varchar(20), phnum int)

	insert into test values 
	(101, 'alphabetacharlie',3456789)
	go 5000

	select  * from test
--batch (go n )


---capture the time to delete
	DECLARE @StartTime_Delete DATETIME2 = SYSDATETIME(); --capture start time 
	delete from  test
	DECLARE @EndTime_Delete DATETIME2 = SYSDATETIME(); --capture end time 
	SELECT 'Time taken to delete : ' + CONVERT(VARCHAR(20), DATEDIFF(MILLISECOND, @StartTime_Delete, @EndTime_Delete)) + ' milliseconds';

--Time taken to delete : 29 milliseconds
--Time taken to Truncate : 7 milliseconds


--capture the time to Truncate
	DECLARE @StartTime_Delete DATETIME2 = SYSDATETIME(); --capture start time 
	Truncate table  test
	DECLARE @EndTime_Delete DATETIME2 = SYSDATETIME(); --capture end time 
	SELECT 'Time taken to Truncate : ' + CONVERT(VARCHAR(20), DATEDIFF(MILLISECOND, @StartTime_Delete, @EndTime_Delete)) + ' milliseconds';






















































































































































































































































































































































