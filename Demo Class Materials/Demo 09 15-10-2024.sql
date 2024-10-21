--sqL SERVER JOINS,Crossjoins, equi joins
--#########################################################################
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


 -- Creating Customer Table
CREATE TABLE Customer (
    CustomerID INT primary key,
    Name NVARCHAR(100),
    Email NVARCHAR(100) UNIQUE
)

-- Creating Account Table
CREATE TABLE Account (
    AccountID INT primary key ,
    CustID INT ,
    AccountType NVARCHAR(50),
    Balance DECIMAL(10, 2),
	foreign key (CustID) references Customer (CustomerID)
)

-- Creating Transaction Table
CREATE TABLE Transactions (
    TransactionID INT primary key ,
    AccountID INT ,
    TransactionDate DATE,
    Amount DECIMAL(10, 2),
	foreign key (AccountID) references Account (AccountID)
)

---#################################
INSERT INTO Customer VALUES
 (1, 'Alice Smith', 'alice.smith@example.com'),
 (2, 'Bob Johnson', 'bob.johnson@example.com'),
 (3, 'Charlie Brown', 'charlie.brown@example.com'),
 (4, 'Diana Prince', 'diana.prince@example.com'),
 (5, 'Ethan Hunt', 'ethan.hunt@example.com')


 INSERT INTO Account VALUES 
(101, 1, 'Savings', 1500.00),
 (102, 2, 'Checking', 2450.50),
 (103, 3, 'Savings', 3200.75),
 (104, 4, 'Savings', 1800.00),
 (105, 5, 'Checking', 1280.90)

 INSERT INTO Transactions VALUES 
(1001, 101, '2023-10-01', 150.00),
(1002, 102, '2023-10-02', -200.50),
(1003, 103, '2023-10-03', 300.75),
(1004, 104, '2023-10-04', -450.00),
(1005, 105, '2023-10-05', 280.90)

select * from Customer
select * from Account
select * from Transactions



 INSERT INTO Account VALUES 
(106, 6, 'Savings', 1500.00)
--#####################################################
Create database Ecommerce
go
Use Ecommerce
go
-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);
go

INSERT INTO Customers (CustomerID, CustomerName)
VALUES
    (1, 'John Smith'),
    (2, 'Jane Doe'),
    (3, 'Alice Johnson'),
    (4, 'Bob Williams'),
    (15, 'Emily Brown'),
    (6, 'Michael Davis'),
    (17, 'Olivia Wilson'),
    (8, 'William Taylor'),
    (19, 'Sophia Martinez'),
    (10, 'Liam Anderson');

go
-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);
go

INSERT INTO Orders (OrderID, CustomerID, OrderDate)
VALUES
    (101, 1, '2023-08-01'),
    (102, 2, '2023-08-02'),
    (103, 3, '2023-08-03'),
    (104, 4, '2023-08-04'),
    (115, 5, '2023-08-05'),
    (106, 6, '2023-08-06'),
    (117, 7, '2023-08-07'),
    (108, 8, '2023-08-08'),
    (119, 9, '2023-08-09'),
    (110, 10, '2023-08-10');

go
-- Create Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2)
);

go
INSERT INTO Products (ProductID, ProductName, Price)
VALUES
    (501, 'Widget', 10.99),
    (502, 'Gadget', 24.99),
    (503, 'Accessory', 5.99),
    (504, 'Tool', 15.49),
    (515, 'Toy', 7.95),
    (506, 'Device', 49.99),
    (517, 'Appliance', 89.00),
    (508, 'Book', 12.50),
    (519, 'Clothing', 29.95),
    (510, 'Jewelry', 59.00);

go
-- Create OrderDetails table
CREATE TABLE OrderDetails (
    DetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT
);
go
INSERT INTO OrderDetails (DetailID, OrderID, ProductID, Quantity)
VALUES
    (1001, 101, 501, 3),
    (1002, 101, 502, 2),
    (1003, 102, 503, 5),
    (1004, 103, 504, 1),
    (1005, 104, 505, 2),
    (1006, 105, 506, 1),
    (1007, 106, 507, 1),
    (1008, 107, 508, 3),
    (1009, 108, 509, 2),
    (1010, 109, 510, 1);



Select top 1 * from Customers
Select top 1 * from Orders
Select top 1  * from OrderDetails
Select top 1 * from products

--###############################################
--Relationship 
	--Customers -->Orders		=CUSTOMERID
	--Orders -->OrderDetails	=ORDERID
	--OrderDetails-->products	=PRODUCTID
	--Customers -->products		=CustomerID-->OrderID-->ProductID


--###############################################
--inner join 
/*
	SYNTAX:
	SELECT columns
	FROM table1  JOIN table2 	ON table1.column = table2.column
	 JOIN table3 	ON table1.column = table3.column
	 JOIN table4 	ON table2.column = table4.column
*/

	Select top 1 * from Customers
	Select top 1 * from Orders
	Select top 1  * from OrderDetails
	Select top 1 * from products

	   	
	Select * from 
	Customers as C inner join  Orders as O
	on C.CUSTOMERID=O.CUSTOMERID	
		
	Select * from 
	Customers as C inner join  Orders as O 	on C.CUSTOMERID=O.CUSTOMERID
	inner join OrderDetails as OD  on O.ORDERID=OD.ORDERID

	Select * from 
	Customers as C inner join  Orders as O 	on C.CUSTOMERID=O.CUSTOMERID
	inner join OrderDetails as OD  on O.ORDERID=OD.ORDERID
	inner join products as p  on P.PRODUCTID=OD.PRODUCTID
	   	 
	--Customers -->Orders		=CUSTOMERID
	--Orders -->OrderDetails	=ORDERID
	--OrderDetails-->products	=PRODUCTID
	--Customers -->products		=CustomerID-->OrderID-->ProductID



	
	Select top 1 * from products

	Select top 1 * from Customers
	Select top 1 * from Orders
	Select top 1  * from OrderDetails
	Select top 1 * from products





	Select top 1 * from Customers
	Select top 1 * from Orders

	
	Select * from Customers inner join  Orders
	on Orders.CustomerID=Customers.CustomerID

--Left join 	   	
	Select * from 
	Customers as C Left outer join  Orders as O	on C.CUSTOMERID=O.CUSTOMERID	
	   	
	Select * from 
	Customers as C  Left join  Orders as O	on C.CUSTOMERID=O.CUSTOMERID	
		
--Display the records of customers without order
	Select * from 
	Customers as C  Left join  Orders as O	on C.CUSTOMERID=O.CUSTOMERID	
	where o.OrderID is null


--Right  join 	   	
	Select * from 
	Customers as C Right outer join  Orders as O	on C.CUSTOMERID=O.CUSTOMERID	
	   	
	Select * from 
	Customers as C  Right join  Orders as O	on C.CUSTOMERID=O.CUSTOMERID	
		
--Display the records of order MISSING  customers INFO

	Select * from 
	Customers as C  Right join  Orders as O	on C.CUSTOMERID=O.CUSTOMERID	
	where C.CUSTOMERID is null



---########################################################


--Full  join 	   	
	Select * from 
	Customers as C Full outer join  Orders as O	on C.CUSTOMERID=O.CUSTOMERID	
	   	
	Select * from 
	Customers as C  Full join  Orders as O	on C.CUSTOMERID=O.CUSTOMERID	
		
----Display the records of order without  customers  and customers without order

	Select * from 
	Customers as C  Full join  Orders as O	on C.CUSTOMERID=O.CUSTOMERID	
	where C.CUSTOMERID is null or o.CUSTOMERID is null

--############################################################

 --CROSS JOIN:

	--Cartesian product of the two tables
	--possible combinations of rows between two or more tables.

	CREATE TABLE Meals(MealName VARCHAR(100))
	CREATE TABLE Drinks(DrinkName VARCHAR(100))

	INSERT INTO Drinks VALUES('Orange Juice'), ('Tea'), ('Cofee')
	INSERT INTO Meals VALUES('Omlet'), ('Fried Egg'), ('Sausage')

	SELECT * FROM Meals
	SELECT * FROM Drinks
	
	SELECT * FROM Meals cross join Drinks
----###########################

CREATE TABLE emp(
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50)
)

INSERT INTO emp(employee_id, employee_name)
VALUES
    (1, 'John Smith'),
    (2, 'Jane Doe'),
    (3, 'Bob Johnson');



CREATE TABLE dep(
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);



INSERT INTO dep(department_id, department_name)
VALUES
    (101, 'HR'),
    (102, 'Engineering'),
    (103, 'Sales');


	SELECT * FROM emp
	SELECT * FROM dep

	
	SELECT * FROM emp cross join dep



--###########################	
-- join (comparison)
	Select * from Customers inner join  Orders 	on Orders.CustomerID=Customers.CustomerID

--equi join (equality)
	Select * from Customers, Orders where  Orders.CustomerID=Customers.CustomerID


--###########################	
-- cross join
	Select * from Customers cross join Orders

--equi join (equality)
	Select * from Customers, Orders 


--#############################################################


	Select * from Customers join  Orders
	on Orders.CustomerID=Customers.CustomerID

--################################################################################################

--Practice Question for AdventureWorks2022 database 

--1. Inner Join:
	 Question: Write a query to retrieve the `BusinessEntityID`, `JobTitle`, `FirstName`, and `LastName` of 
	all employees by joining the `HumanResources.Employee` and `Person.Person` tables on `BusinessEntityID`.

	select He.BusinessEntityID,JobTitle,FirstName,lastname
	from humanResources.Employee HE Inner Join Person.Person  PP on He.BusinessEntityID=PP.BusinessEntityID

--2. Left Join:
	Question: Write a query to list all persons with their addresses, including those who do not have an 
	address. Use the `Person.Person` table and the `Person.Address` table, joining on `BusinessEntityID`.

--3. Right Join:
	 Question: Write a query to list all product reviews along with the names of the reviewers.
	 Include all reviews even if the reviewer s name is not available. 
	Use the `Production.ProductReview` table and the `Person.Person` table, joining on 	`ReviewerID`.

--4. Full Outer Join:
	Question: Write a query to list all employees and their associated departments. 
	Include employees without departments and departments without employees.
	 Use the `HumanResources.Employee` and `HumanResources.Department` tables, joining on `DepartmentID`.

--5. Join with Aggregates:
	Question: Write a query to find the total sales amount for each sales person.
	 Use the `Sales.SalesOrderHeader` and `Sales.SalesPerson` tables, joining on `SalesPersonID`.

--6. Join with Multiple Tables:
	Question: Write a query to retrieve the `ProductID`, `Name`, `SalesOrderID`, and `OrderDate`
	 for all sales orders. Use the `Sales.SalesOrderDetail`, `Production.Product`, and `Sales.SalesOrderHeader` 
	tables, joining on `ProductID` and `SalesOrderID`.

--7. Join with Subquery:
	Question: Write a query to find the names of employees who have placed an order. 
	Use a subquery to find the `EmployeeID` from the `Sales.SalesOrderHeader` table and join it with the 
	`HumanResources.Employee` and `Person.Person` tables to get the `FirstName` and `LastName`.




















































































































































































































































































