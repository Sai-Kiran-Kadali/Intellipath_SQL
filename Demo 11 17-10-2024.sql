--  Function (string, date &  time )
--#######################################################

--Self learning  
--	https://learn.microsoft.com/en-us/training/modules/transform-data-by-implementing-pivot-unpivot-rollup-cube/
--	https://learn.microsoft.com/en-us/sql/t-sql/functions/functions?view=sql-server-ver16


--Function 
--Aggregate (Sum, count, max, min, avg)


--System
	--String 

 'abc SDFGHJK 123456789 @#$%^&*()'

 'alpha beta charlie' 

 select len('alpha beta charlie')

 --len =18

 use AdventureWorks2022

 select BusinessEntityID, FirstName, LastName from Person.Person 

--len(expression/ column name )

 select BusinessEntityID, FirstName, LastName from Person.Person 

 select  FirstName, LEN(FirstName) as Lengths from Person.Person 
 
  select len('alpha 1232 #$%^&*')
  select len('alpha 1232 #$%^&*')--=17
  
  select len('    alpha 1232 #$%^&*')


  select len('    alpha 1232 #$%^&*     ')


--trim(expression) remove the lead and trial spaces 

  select trim('    alpha 1232 #$%^&*     ')

    select len(trim('    alpha 1232 #$%^&*     '))





 select  FirstName, LEN(trim(FirstName)) as Lengths from Person.Person 

 --Left(expression, n) & Right(expression, n)
 
  select  FirstName, LEFT(FirstName,1) as newval1 from Person.Person 

  select  FirstName, LEFT(FirstName,2) as newval1 from Person.Person 

  select  FirstName, LEFT(FirstName,5) as newval1 from Person.Person 

  
  select  FirstName, LEFT(FirstName,1) as newval1,
  RIGHT(firstname,LEN(firstname)-1) as newval2
  from Person.Person 



  
--Upper(expression) and lower(expression)
 select  FirstName, upper(FirstName)  as newval1
 , lower(FirstName)  as newval1
 from Person.Person 




--Concat(expression,expression,expression,...)

 select  FirstName, MiddleName,lastname, 
 Concat(FirstName, MiddleName,lastname)AS  Fullname 
 from Person.Person 

 select  FirstName, MiddleName,lastname, 
 Concat(FirstName,' ', MiddleName,' ',lastname)AS  Fullname 
 from Person.Person 

 
 select  FirstName, MiddleName,lastname, 
 Concat(FirstName,';', MiddleName,';',lastname)AS  Fullname 
 from Person.Person 


 
--Concat_ws('',expression,expression,expression,...)

 select  FirstName, MiddleName,lastname, 
 Concat_WS(';',FirstName, MiddleName, lastname)AS  Fullname 
 from Person.Person 





 
--Input = syed  or SYED

--Output =Syed

select CONCAT(upper(LEFT('Syed',1)),lower(RIGHT('Syed',LEN('Syed')-1)))

--##############################################################
--replace ( string , old value, new value)
 select  FirstName, REPLACE( FirstName,'Kim','123456') as Newinfo from Person.Person 


 select  FirstName, REPLACE( FirstName,'a','123456') as Newinfo from Person.Person 


--STUFF ( string, start, length, new_string )

Hello World
12345678901
Hello SQL Server


 select STUFF('Hello World',7,0,'SQL Server')

 select STUFF('Hello World',7,2,'SQL Server')

 select STUFF('Hello World',7,4,'SQL Server')

 select STUFF('Hello World',7,LEN('Hello World'),'SQL Server')



 MOUNTAIN
 1234567890
 MOUNT-TABU

  select STUFF('MOUNTAIN',6,LEN('MOUNTAIN'),'-TABU')

--CHARINDEX ( substring, string, [start_position] )

	  select charindex('O','MOUNTAIN')

	  select charindex('@','Alpha@gmail.com')

Alpha@gmail.com
123456789012345 

'1234-5643-4677'

MOUNaTAIoaius
123456789012345

	  select charindex('a','MOUNaTAIoaius')
	  
	  select charindex('a','MOUNaTAIoaius', 6)

	  select charindex('a','MOUNaTAIoaius', 8)


with cte as 
(
 select charindex('a','MOUNaTAIoaiaus') as pos , 1 as startpos
 union all 
 select charindex('a','MOUNaTAIoaiaus', Pos +1), pos +1 from cte
 where   charindex('a','MOUNaTAIoaiaus', Pos +1)>0

 )
 select Pos from cte 


 ---#################################
 --SUBSTRING ( string, start, length )

  select SUBSTRING ('MOUNTAIN',1,5)
 
 MOUNTAIN
 1234567890
 MOUNT-TABU
 
  select SUBSTRING ('SQL Server',1,3)
 

 
Hello World
12345678901
Hello SQL Server


  select SUBSTRING ('Hello SQL Server',11,6)
 
 ----######################################################################
 


create table empemail
(email varchar(100))


INSERT INTO empemail VALUES 
('jane.doe@example.com'),
('john.smith@workmail.net'),
('alex.jones@university.edu'),
('lisa.wong@techhub.org'),
('mike.brown@services.co.uk'),
('sara.lee@marketplace.com'),
('dave.wilson@creativeagency.us'),
('emily.harris@globalenterprise.com'),
('carlos.garcia@networksolutions.es'),
('anna.zhao@researchinst.cn');

select email from empemail


--input--> jane.doe@example.com

--output--> example.com




select substring('jane.doe@example.com',CHARINDEX('@', 'jane.doe@example.com')+1, LEN('jane.doe@example.com'))




select email, CHARINDEX('@', email)+1,
substring(email,CHARINDEX('@', email)+1, LEN(email))
from empemail

--> Input = Syed Abbas

--> output col1 = Syed, col2 =Abbas

--####################################################################
--###############################
--Date 'yyyy-mm-dd hh:mm:Ss'
	--Date(Year, month, day, quarter, week, weekday, day of year)
	--Time (Hours, minutes, second, miliseconds, microseconds, nanoseconds)


	SELECT GETDATE()

	SELECT SYSDATETIME()


--######################

Select businessentityid,
BirthDate, HireDate from HumanResources.Employee


Select 
BirthDate, YEAR(BirthDate),  MONTH(BirthDate),DAY(BirthDate) 
 from HumanResources.Employee


Select GETDATE(), YEAR(GETDATE()),  MONTH(GETDATE()),DAY(GETDATE()) 

	--Date(Year, month, day, quarter, week, weekday, day of year)
	--Time (Hours, minutes, second, miliseconds, microseconds, nanoseconds)

--Datename ( date and time parts - returns nvarchar )
	select Datename(YEAR,GETDATE())
	select Datename(MONTH,GETDATE())
	select Datename(DAY,GETDATE())
	select Datename(WEEK,GETDATE())
	select Datename(WEEKDAY,GETDATE())
	select Datename(QUARTER,GETDATE())
	select Datename(DAYOFYEAR,GETDATE())

	select Datename(HOUR,GETDATE())
	select Datename(MINUTE,GETDATE())
	select Datename(SECOND,GETDATE())
	select Datename(MILLISECOND,GETDATE())
	select Datename(MICROSECOND,GETDATE())
	select Datename(NANOSECOND,GETDATE())

--#########
--DATEPART()returns an integer corresponding to the datepart specified
--( date and time parts - returns int)

	select Datepart(YEAR,GETDATE())
	select Datepart(MONTH,GETDATE())
	select Datepart(DAY,GETDATE())
	select Datepart(WEEK,GETDATE())
	select Datepart(WEEKDAY,GETDATE())
	select Datepart(QUARTER,GETDATE())
	select Datepart(DAYOFYEAR,GETDATE())

	select Datepart(HOUR,GETDATE())
	select Datepart(MINUTE,GETDATE())
	select Datepart(SECOND,GETDATE())
	select Datepart(MILLISECOND,GETDATE())
	select Datepart(MICROSECOND,GETDATE())
	select Datepart(NANOSECOND,GETDATE())

--datediff( DATEPART, lowerdate, higherdate )

	Select businessentityid,BirthDate, HireDate ,
	datediff(YEAR,BirthDate, HireDate) as Years ,
	datediff(Month,BirthDate, HireDate) as Months,
	datediff(day,BirthDate, HireDate) as dayss ,
	datediff(week,BirthDate, HireDate) as weeks ,
	datediff(hour,BirthDate, HireDate) as hourss,
	datediff(minute,BirthDate, HireDate) as minutess
	from HumanResources.Employee


--dateadd(datepart, number, date)
	Select businessentityid,BirthDate, HireDate ,
	dateadd(YEAR,10, HireDate) as Years ,
	dateadd(Month,100, HireDate) as Months,
	dateadd(day,1000, HireDate) as dayss ,
	dateadd(week,34, HireDate) as weeks
	from HumanResources.Employee


		Select businessentityid,BirthDate, HireDate ,
	dateadd(YEAR,-20, HireDate) as Years ,
	dateadd(Month,-300, HireDate) as Months,
	dateadd(day,-45000, HireDate) as dayss ,
	dateadd(week,-8934, HireDate) as weeks
	from HumanResources.Employee


































































































































































































































































































