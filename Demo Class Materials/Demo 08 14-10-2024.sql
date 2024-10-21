
--Index, primary  key , unique , foreign key,

--########################################
--Self Learning 
https://learn.microsoft.com/en-us/sql/relational-databases/performance/joins?view=sql-server-ver16


---##########################################
 --Index 
	 --CLustered 

	 --non clustered index


Create database SQLdemo
go
use SQLdemo
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
-- --Execution plan =Cntrl+m

 select *  from department
 where did =3

 --Index (search fast , improve the speed of read)
 --B-tree

 --Clustered Index
	--Sort and store data  in Asc/desc(existing & new records)
	--1 clustered index in 1 table
	-- improve the speed of read when searching

 --Syntax: Create clustered Index Indexname  on tablename(column name)

	Create clustered Index CI_DID  on department(did)

	drop index ci_did on department 

	Create clustered Index CI_two  on department(did, gender)

	 select * from department  where did =15

--Non Clustered Index
	--999 non clustered index in 1 table
	-- improve the speed of read when searching

 --Syntax: Create nonclustered Index Indexname  on tablename(column name)
	 
	Create nonclustered Index CI_ename  on department(ename)
	
	 
	 select ename from department  where ename ='Pat'
--##################
	select ename,salary,dept  from department where
	ename='Kate' and salary=7500 and dept='IT'

--Composite index( clustered or nonclustered)
	
	Create nonclustered Index NCI_three  on department(ename,salary,dept)
	
	select ename,salary,dept  from department where
	ename='Kate' and salary=7500 and dept='IT'

	select ename,salary,dept  from department where
	ename='Kate' and salary=7500  
	
	select ename,salary,dept  from department where
	ename='Kate' and dept='IT'
	 
	select ename,salary,dept  from department where
	 salary=7500 and dept='IT'

--#####################################################

--primary key(unique + not null)// column (or a set of columns)
	--1 primary key  in table 
	--CLUSTERED INDEX (SORT & STORE, SEEK FASTER)

--unique  
	--NON CLUSTERED INDEX (SEEK FASTER)
	--999 UK IN 1 TABLE 


--foreign key 
--Primary Key or Unique Key 
	--referential integrity --> insert(primary , unique)
	--cascading integrity	--> delete (foreign key )

	CREATE TABLE Employees (
		EmployeeID INT primary key  ,
		FirstName NVARCHAR(50),
		LastName NVARCHAR(50)
	)

	CREATE TABLE Users (
		UserID INT  primary key ,
		Email NVARCHAR(100)  unique,
		Username NVARCHAR(50) 
	)
	CREATE TABLE Orders (
		OrderID INT ,
		OrderDate DATE,
		CustomerID INT,
		EID INT ,
		Email NVARCHAR(100) ,
		foreign key (EID) references Employees (EmployeeID),
		foreign key (CustomerID) references  Users (UserID),
		foreign key (Email) references  Users (Email)
		)



--REFRENCTIAL INTEGRITY 

	INSERT INTO Employees VALUES 
	(1, 'John', 'Doe'),
	(2, 'Jane', 'Smith'),
	(3, 'Michael', 'Johnson'),
	(4, 'Emily', 'Davis'),
	(5, 'Chris', 'Brown')

	INSERT INTO Users VALUES 
	(1, 'john.doe@example.com', 'johndoe'),
	(2, 'jane.smith@example.com', 'janesmith'),
	(3, 'michael.johnson@example.com', 'mikejohnson'),
	(4, 'emily.davis@example.com', 'emilydavis'),
	(5, 'chris.brown@example.com', 'chrisbrown')

	INSERT INTO Orders VALUES 
	(1, '2024-08-15', 1, 1, 'john.doe@example.com'),
	(2, '2024-08-16', 2, 2, 'jane.smith@example.com'),
	(3, '2024-08-17', 3, 3, 'michael.johnson@example.com'),
	(4, '2024-08-18', 4, 4, 'emily.davis@example.com'),
	(5, '2024-08-19', 5, 5, 'chris.brown@example.com'),
	(6, '2024-08-15', 1, 1, 'john.doe@example.com'),
	(7, '2024-08-16', 2, 2, 'jane.smith@example.com'),
	(8, '2024-08-17', 3, 3, 'michael.johnson@example.com')



	SELECT * FROM Employees;
	SELECT * FROM Users;
	SELECT * FROM Orders;


--Cascading integrity (delete , update)

	delete  FROM Employees;
	delete  FROM Users;
	delete FROM Orders;

---#####################################################

	ALTER TABLE Department
	ALTER COLUMN DID INT  NOT NULL

	ALTER TABLE table_name
	ADD CONSTRAINT pk_constraint_name PRIMARY KEY (column)


	-- Adding a Foreign Key Constraint
	ALTER TABLE table_name
	ADD CONSTRAINT fk_constraint_name FOREIGN KEY (column_name) REFERENCES referenced_table_name (referenced_column_name);


	

---#####################################################

































































































































































































































































































































































