--2. Left Join:
--Question: Write a query to list all persons with their addresses, including those who do not have an 
--address. Use the `Person.Person` table and the `Person.Address` table, joining on `BusinessEntityID`.

Use AdventureWorks2022
Select PP.FirstName, PP.LastName, PA.AddressLine1
from Person.Person as PP
Left Join Person.Address as PA on PP.BusinessEntityID=PA.AddressID

--3. Right Join:
--	 Question: Write a query to list all product reviews along with the names of the reviewers.
--	 Include all reviews even if the reviewers name is not available. 
--	Use the `Production.ProductReview` table and the `Person.Person` table, joining on 	`ReviewerID`.

Select PP.FirstName, PP.LastName, PA.AddressLine1
from Person.Person as PP
Left Join Person.Address as PA on PP.BusinessEntityID=PA.AddressID

--4. Full Outer Join:
--	Question: Write a query to list all employees and their associated departments. 
--	Include employees without departments and departments without employees.
--	 Use the `HumanResources.Employee` and `HumanResources.Department` tables, joining on `DepartmentID`.

select  HE.LoginID, HD.Name, HD.GroupName, HE.JobTitle from HumanResources.Employee as HE
Full outer join HumanResources.Department as HD on HE.BusinessEntityID = HD.DepartmentID

--5. Join with Aggregates:
--	Question: Write a query to find the total sales amount for each sales person.
--	 Use the `Sales.SalesOrderHeader` and `Sales.SalesPerson` tables, joining on `SalesPersonID`.

select SO.SalesPersonID, sum(SP.SalesQuota) from Sales.SalesOrderHeader as SO
Inner join Sales.SalesPerson as SP on SO.SalesPersonID=SP.BusinessEntityID
Group by SO.SalesPersonID

--6. Join with Multiple Tables:
--	Question: Write a query to retrieve the `ProductID`, `Name`, `SalesOrderID`, and `OrderDate`
--	 for all sales orders. Use the `Sales.SalesOrderDetail`, `Production.Product`, and `Sales.SalesOrderHeader` 
--	tables, joining on `ProductID` and `SalesOrderID`.

select SD.ProductID, PP.Name, SH.OrderDate from Sales.SalesOrderDetail as SD
Inner Join Production.Product as PP on SD.ProductID=PP.ProductID
Inner Join Sales.SalesOrderHeader as SH on SD.SalesOrderID=SH.SalesOrderID


--7. Join with Subquery:
--	Question: Write a query to find the names of employees who have placed an order. 
--	Use a subquery to find the `EmployeeID` from the `Sales.SalesOrderHeader` table and join it with the 
--	`HumanResources.Employee` and `Person.Person` tables to get the `FirstName` and `LastName`.

select * from 

Select top 1 * from Sales.SalesOrderHeader
Select top 1 * from HumanResources.Employee
Select top 1 * from Person.Person
