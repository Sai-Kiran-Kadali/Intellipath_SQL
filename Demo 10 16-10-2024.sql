--Self join , merge, set operators 
--#######################################################

--Self learning  
--	https://learn.microsoft.com/en-us/training/modules/transform-data-by-implementing-pivot-unpivot-rollup-cube/
--	https://learn.microsoft.com/en-us/sql/t-sql/functions/functions?view=sql-server-ver16
--#########################################################################
use AdventureWorks2022
select * from information_schema.TABLES
select * from information_schema.
select * from information_schema.columns where COLUMN_NAME ='jobtitle'

select  he.BusinessEntityID,he.JobTitle, Department from
HumanResources.VEmployee he full join HumanResources.[vEmployeeDepartment]  hd
on he.BusinessEntityID=hd.BusinessEntityID

select * from [HumanResources].[vEmployeeDepartment]

--Self Join 

	Create database Scenario
	go
	use Scenario
	go
	CREATE TABLE Department
	  (
		  did INT,
		  ename VARCHAR(50) ,
		  gender VARCHAR(50) ,
		  salary INT ,
		  dept VARCHAR(50) 
	   )

	go
		INSERT INTO Department  VALUES
	  (1, 'David', 'Male', 5000, 'Sales'),
	  (5, 'Shane', 'Female', 5500, 'Finance'),
	  (6, 'Shed', 'Male', 8000, 'Sales'),
	  (7, 'Vik', 'Male', 7200, 'HR'),
	  (2, 'Jim', 'Female', 6000, 'HR'),
	  (13, 'Julie', 'Female', 7100, 'IT'),
	  (14, 'Elice', 'Female', 6800,'Marketing'),
	  (3, 'Kate', 'Female', 7500, 'IT'),
	  (4, 'Will', 'Male', 6500, 'Marketing'),
	  (10, 'Laura', 'Female', 6300, 'Finance'),
	  (11, 'Mac', 'Male', 5700, 'Sales'),
	  (12, 'Pat', 'Male', 7000, 'HR'),
	  (8, 'Vince', 'Female', 6600, 'IT'),
	  (9, 'Jane', 'Female', 5400, 'Marketing'),
	  (15, 'Wayne', 'Male', 6800, 'Finance')

	 go

	 select * from department

--, employee name and manager name 



--#################################################

  
	CREATE TABLE info (
		EmployeeID int PRIMARY KEY,
		EmployeeName varchar(255),
		ManagerID int
	);

	INSERT INTO info (EmployeeID, EmployeeName, ManagerID) VALUES
	(1, 'Alice Johnson', NULL),
	(2, 'Bob Smith', 1),
	(3, 'Catherine Brown', 1),
	(4, 'Daniel Garcia', 1),
	(5, 'Emma Wilson', 1),
	(6, 'Franklin Moore', 2),
	(7, 'Georgia Taylor', 2),
	(8, 'Henry Anderson', 2),
	(9, 'Isabel Thomas', 3),
	(10, 'Jack Martinez', 3),
	(11, 'Kylie Robinson', 3),
	(12, 'Liam Clark', 4),
	(13, 'Mia Rodriguez', 4),
	(14, 'Noah Lewis', 4),
	(15, 'Olivia Lee', 5),
	(16, 'Parker Walker', 5),
	(17, 'Quinn Hall', 5),
	(18, 'Ryan Allen', 6),
	(19, 'Sophia Young', 6),
	(20, 'Tyler Hernandez', 6);

	select * from info



	select EE.EmployeeName,MM.EmployeeName as ManagerName 
	from info EE left join  info MM
	on MM.EmployeeID=EE.ManagerID


--#############################################

---Product with same price 

CREATE TABLE Prod (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(50),
    ListPrice DECIMAL(10, 2)
)

INSERT INTO Prod (ProductID, ProductName, ListPrice)
VALUES 
(1, 'Product A', 100.00),
(2, 'Product B', 150.00),
(3, 'Product C', 100.00),
(4, 'Product D', 200.00),
(5, 'Product E', 150.00);


---Product with same price 

CREATE TABLE Prod (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(50),
    ListPrice DECIMAL(10, 2)
)

INSERT INTO Prod (ProductID, ProductName, ListPrice)
VALUES 
(1, 'Product A', 100.00),
(2, 'Product B', 150.00),
(3, 'Product C', 100.00),
(4, 'Product D', 200.00),
(5, 'Product E', 150.00);

INSERT INTO Prod (ProductID, ProductName, ListPrice)
values(6, 'Product f', 150.00)

SELECT * FROm PROD




SELECT * FROm PROD P1 inner join Prod p2 
on P1.ListPrice=p2.ListPrice
where P1.ProductID!=p2.ProductID and P1.ProductID<p2.ProductID


--###########################################



SELECT MAX(salary) FROm Department


SELECT  top 1 *  FROm Department order by salary desc


SELECT  *  FROm Department
where salary=(SELECT MAX(salary) FROm Department)



SELECT  *  FROm Department
where salary in(SELECT salary FROm Department)



--############################################################


Create table employee
( empid int, ename varchar(20), eage int , dob date)


Create table department 
(depid int ,empname varchar(20),salary int ,age int  ,
Company varchar(20) Default 'IBM')

INSERT INTO EMPLOYEE values 
(101,'ALPHA',21,'2010-08-11') ,
(103,'BETA',22,'2009-08-11'),
(102,'CHARLIE',21,'2010-08-11'),
(105,'DELTA',25,'2008-08-11'),
(106,'ECHO',23,'2006-08-11'),
(104,'FOX',21,'2004-08-11'),
(109,'CHARLIE',24,'2010-08-11'),
(107,NULL,25,'2008-08-11')


insert into department values 
(101,'Alpha',6000,21,'Vendor'), 
(102,'fox',7000,21,'Vendor'), 
(105,'Echo',5100,29,'Vendor'),
(103,'beta',5100,29,'Vendor'),
(104,'fox',5100,21,'Vendor'), 
(105,'tim',5100,25,'Vendor')

select * from employee
select * from department

---#################################################################

select * from employee inner join department on empid=depid

--Set operators
	--All queries combined using a UNION, INTERSECT or EXCEPT operator 
	--must have an equal number of expressions in their target lists.
--union all (Combine + duplicate values)
	select empid,ename,eage from employee
	 union all 
	select depid,empname,age	  from department


	select empid,ename,eage from employee
	 union all 
	select depid,empname,age from department order by empid asc

--union  (Combine + Unique values)

	select empid,ename,eage from employee
	union 
	select depid,empname,age from department order by empid asc
--intersect  (matching  + Unique values)

	select empid,ename,eage from employee
	intersect 
	select depid,empname,age from department order by empid asc



--Except   (minus Unique values)


	select empid,ename,eage from employee
	Except 
	select depid,empname,age from department order by empid asc



---#############################################
--############################################

/*Merge Syntax
		MERGE  target_table USING source_table ON merge_condition
		WHEN MATCHED THEN
			UPDATE SET column1 = value1, column2 = value2, ...
		WHEN NOT MATCHED BY TARGET THEN
			INSERT (column1, column2, ...) VALUES (value1, value2, ...)
		WHEN NOT MATCHED BY SOURCE THEN
			DELETE;
*/


--#############################

CREATE TABLE SourceProducts(
    ProductID INT,
    ProductName VARCHAR(50),
    Price	DECIMAL(9,2)
)

    
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(1,'Table',100)
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(2,'Desk',80)
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(3,'Chair',50)
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(4,'Computer',300)

    
CREATE TABLE TargetProducts(
    ProductID INT,
    ProductName VARCHAR(50),
    Price	DECIMAL(9,2)
)

    
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(1,'Tablesss',9)
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(2,'Deskss',8)
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(5,'Bed',50)
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(6,'Cupboard',300)

    
 --#############################
   
SELECT * FROM SourceProducts
SELECT *  FROM TargetProducts

Merge TargetProducts as TP using SourceProducts as SP on TP.productid=SP.productid
--update
	when matched then 
	update set 
	tp.ProductName=Sp.ProductName	, tp.Price=Sp.Price
;



Merge TargetProducts as TP using SourceProducts as SP on TP.productid=SP.productid
--INSERT
	when NOT matched BY TARGET then 
	INSERT (ProductID,ProductName, Price)
	VALUES  (SP.ProductID,SP.ProductName, SP.Price)
;


Merge TargetProducts as TP using SourceProducts as SP on TP.productid=SP.productid
--DELETE
	when NOT matched BY sOURCE then 
	DELETE
;



SELECT * FROM SourceProducts
SELECT *  FROM TargetProducts

Merge TargetProducts as TP using SourceProducts as SP on TP.productid=SP.productid
	--update
		when matched then 
		update set 
		tp.ProductName=Sp.ProductName	, tp.Price=Sp.Price
	--INSERT
		when NOT matched BY TARGET then 
		INSERT (ProductID,ProductName, Price)
		VALUES  (SP.ProductID,SP.ProductName, SP.Price)
	--DELETE
		when NOT matched BY sOURCE then 
		DELETE
	;


--################################################################################

  -- Set Operators Questions

--1. UNION:
--   - Question: Write a query to list all `BusinessEntityID` values that appear in either the `Person.Person` table or the `Sales.Customer` table, or both.

--2. UNION ALL:
--   - Question: Write a query to list all `BusinessEntityID` values, including duplicates, from both the `Person.Person` table and the `Sales.Customer` table.

--3. INTERSECT:
--   - Question: Write a query to find all `BusinessEntityID` values that are present in both the `Person.Person` table and the `Sales.Customer` table.

--4. EXCEPT:
--   - Question: Write a query to find all `BusinessEntityID` values that are present in the `Person.Person` table but not in the `Sales.Customer` table.

--5. UNION with additional columns:
--   - Question: Write a query to list all `FirstName` and `LastName` combinations from both the `Person.Person` table and the `HumanResources.Employee` table. Ensure there are no duplicates.

--6. UNION ALL with filtering:
--   - Question: Write a query to list all `EmailAddress` values from the `Person.EmailAddress` table and `Sales.SalesPersonEmailAddress` table, including duplicates.

--7. INTERSECT with condition:
--   - Question: Write a query to find all `ProductID` values that are in both the `Sales.SalesOrderDetail` table and the `Production.Product` table and have a `ProductID` less than 1000.

--8. EXCEPT with condition:
--   - Question: Write a query to find all `SalesOrderID` values in the `Sales.SalesOrderHeader` table that are not in the `Sales.SalesOrderDetail` table and where the `OrderDate` is in the year 2022.

--9. Complex UNION:
--   - Question: Write a query to combine the `Name` from `Production.Product` and `Production.ProductSubcatery` tables. Ensure that the combined list is unique.

--10. Complex EXCEPT:
--    - Question: Write a query to list all `EmployeeID` values from the `HumanResources.Employee` table that do not appear in the `Sales.SalesOrderHeader` table, ensuring that the list only includes active employees.
































































































































































































































































































































































































































































































































































































































































