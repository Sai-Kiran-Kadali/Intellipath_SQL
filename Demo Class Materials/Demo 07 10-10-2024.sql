
 --filter(where is null, not, like , between), order by , aggregate functions, group by having

--############################################################################

CREATE TABLE department
  (
      did INT,
      [name] VARCHAR(50) ,
      gender VARCHAR(50) ,
      salary INT ,
      dept VARCHAR(50) 
   )


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


  SELECT * FROM Department
use AdventureWorks2022


select BusinessEntityID, FirstName, LastName, ModifiedDate from Person.Person
where BusinessEntityID=1

--Comparison operators 
	Equal =
	Not equal !=   <>
	>
	<
	>=
	<=


	select BusinessEntityID, FirstName, LastName, ModifiedDate from Person.Person
	where BusinessEntityID=1

	
	select BusinessEntityID, FirstName, LastName, ModifiedDate from Person.Person
	where BusinessEntityID!=1
		
	select BusinessEntityID, FirstName, LastName, ModifiedDate from Person.Person
	where BusinessEntityID>20000

	select BusinessEntityID, FirstName, LastName, ModifiedDate from Person.Person
	where BusinessEntityID>=20000
	
	select BusinessEntityID, FirstName, LastName, ModifiedDate from Person.Person
	where BusinessEntityID<10

	select BusinessEntityID, FirstName, LastName, ModifiedDate from Person.Person
	where BusinessEntityID<=10


---#######################################################

--Where col1 =val  and col2 =val and .........


	select BusinessEntityID, FirstName, LastName, ModifiedDate from Person.Person
	where  FirstName='david'
	
	select BusinessEntityID, FirstName, LastName, ModifiedDate from Person.Person
	where ModifiedDate='2007-12-13'

	select BusinessEntityID, FirstName, LastName, ModifiedDate from Person.Person
	where  FirstName='david' and ModifiedDate='2007-12-13'

	
	select BusinessEntityID, FirstName, LastName, ModifiedDate from Person.Person
	where  FirstName='david' and ModifiedDate='2007-12-13' and BusinessEntityID=16

--################################################
--Where col1 =val  or col2 =val or .........
	select BusinessEntityID, FirstName, LastName, ModifiedDate from Person.Person
	where  FirstName='david'
	
	select BusinessEntityID, FirstName, LastName, ModifiedDate from Person.Person
	where ModifiedDate='2007-12-13'

	select BusinessEntityID, FirstName, LastName, ModifiedDate from Person.Person
	where  FirstName='david' or ModifiedDate='2007-12-13'

	
	select BusinessEntityID, FirstName, LastName, ModifiedDate from Person.Person
	where  FirstName='david' and ModifiedDate='2007-12-13' and BusinessEntityID=16


	select BusinessEntityID, FirstName, LastName, ModifiedDate from Person.Person
	where  LastName='Miller' or BusinessEntityID=16








	
	select BusinessEntityID, FirstName, LastName, ModifiedDate from Person.Person
	where  FirstName='david' and ModifiedDate='2007-12-13' or BusinessEntityID=17


	select BusinessEntityID, FirstName, LastName, ModifiedDate from Person.Person
	where  FirstName='david' or ModifiedDate='2007-12-13' and BusinessEntityID=17
--#######################################
Where column IN() , not in ()

	select BusinessEntityID, FirstName, LastName, 
	ModifiedDate from Person.Person	where 
	BusinessEntityID= 1 or
	BusinessEntityID= 11 or
	BusinessEntityID= 111	 or
	BusinessEntityID= 1111	 or
	BusinessEntityID= 11111

--where in( val1,val2,val3,....)
	select BusinessEntityID, FirstName, LastName, 
	ModifiedDate from Person.Person	where 
	BusinessEntityID in(1,11,111,1111,11111)

--where not in

	select BusinessEntityID, FirstName, LastName, 
	ModifiedDate from Person.Person	where 
	BusinessEntityID!= 1 and
	BusinessEntityID!= 2 and
	BusinessEntityID!= 3 and
	BusinessEntityID!= 4 and
	BusinessEntityID!= 5

--where not in( val1,val2,val3,....)
	select BusinessEntityID, FirstName, LastName, 
	ModifiedDate from Person.Person	where 
	BusinessEntityID not in(1,2,3,4,5)

--##############################################
--Where between range1 and range2 
	select BusinessEntityID, FirstName, LastName, 
	ModifiedDate from Person.Person	
	where  	BusinessEntityID between 1 and 50

	select BusinessEntityID, FirstName, LastName, 
	ModifiedDate from Person.Person	
	where  	ModifiedDate between '2008-12-01' and '2009-02-01'

	select BusinessEntityID, FirstName, LastName, 
	ModifiedDate from Person.Person	
	where  	FirstName between 'a' and 'c'


--##############################################
--Where  col is null

	select BusinessEntityID, FirstName, middlename,LastName, 
	ModifiedDate from Person.Person	
	where MiddleName is null


--Where  col is  not null
	select BusinessEntityID, FirstName, middlename,LastName, 
	ModifiedDate from Person.Person	
	where MiddleName is not null
--###########################
 --where column like '%%'

	
	select BusinessEntityID, FirstName,LastName, 
	ModifiedDate from Person.Person	
	where FirstName like 'A%' 
		
	select BusinessEntityID, FirstName,LastName, 
	ModifiedDate from Person.Person	
	where FirstName like 'An%' 

	select BusinessEntityID, FirstName,LastName, 
	ModifiedDate from Person.Person	
	where FirstName like 'Ang%' 

	select BusinessEntityID, FirstName,LastName, 
	ModifiedDate from Person.Person	
	where FirstName like '%la' 

	select BusinessEntityID, FirstName,LastName, 
	ModifiedDate from Person.Person	
	where FirstName like '%ed' 
	
	select BusinessEntityID, FirstName,LastName, 
	ModifiedDate from Person.Person	
	where FirstName like '%tom%' 
	
	select BusinessEntityID, FirstName,LastName, 
	ModifiedDate from Person.Person	
	where BusinessEntityID like '%123%' 

--Where like _

	select BusinessEntityID, FirstName,LastName, 
	ModifiedDate from Person.Person	
	where FirstName like '___'
	
	select BusinessEntityID, FirstName,LastName, 
	ModifiedDate from Person.Person	
	where FirstName like 'A_l_%'
	   	
	select BusinessEntityID, FirstName,LastName, 
	ModifiedDate from Person.Person	
	where FirstName like '%a_i%'

--###########################
--Order by column asc/ desc

	select did,name,gender,salary,dept  from department
	order by did asc

	select did,name,gender,salary,dept  from department
	order by did desc	
	
	select BusinessEntityID, FirstName,LastName, 
	ModifiedDate from Person.Person	
	order by BusinessEntityID desc
		
	select BusinessEntityID, FirstName,LastName, 
	ModifiedDate from Person.Person	
	order by FirstName asc

	select BusinessEntityID, FirstName,LastName, 
	ModifiedDate from Person.Person	
	order by FirstName desc

	
	select BusinessEntityID, FirstName,LastName, 
	ModifiedDate from Person.Person	
	order by BusinessEntityID asc, FirstName asc



	
	select  FirstName,LastName, 
	ModifiedDate from Person.Person	
	order by  FirstName asc, LastName asc

	
	select  FirstName,LastName, 
	ModifiedDate from Person.Person	
	order by  FirstName asc, LastName desc

--###########################
--Aggregate function (Count, max,min, avg, sum)

--Count(*) used to find all rows , include the null
	select  Count (*) from Person.Person	

--Count(columnname) not include the null

	select  Count (BusinessEntityID) from Person.Person	
	select  Count (MiddleName) As counts from Person.Person	

--max(columnname)  not include the null

	select  MAx(BusinessEntityID) As Maxval, 
	MAx(FirstName) As Maxval, 
	MAx(ModifiedDate) As Maxval
	from Person.Person	
--min(columnname)  not include the null

	select  min(BusinessEntityID) As Minval, 
	min(FirstName) As Minval, 
	min(ModifiedDate) As Minval
	from Person.Person	

--(AVG , Sum only works with numeric data)
--avg(columnname) not include the null

	select  AVG(BusinessEntityID) As AVGval 
	from Person.Person	

			
--sum(columnname) not include the null

	select  sum(BusinessEntityID) As AVGval 
	from Person.Person	

	select 
	Count(*) as Counts,MAX(did) as Maxval ,
	Min(did) as Minval ,avg(did) as Avgal ,sum(salary) as total  
	FROM Department

--############################
--Group by 
--Break the resultset into subset

	select did
	FROM Department
	group by did

	select name
	FROM Department
	group by name
---#############################
	select dept
	FROM Department
	group by dept
	
	select gender
	FROM Department
	group by gender


	select gender, COUNT(*) as Counts, SUM (salary) as Total
	FROM Department
	group by gender

	select dept,gender, COUNT(*) as Counts, SUM (salary) as Total
	FROM Department
	where dept='finance'
	group by  dept,gender
	order by dept asc

	select dept,gender, COUNT(*) as Counts, SUM (salary) as Total
	FROM Department
	group by  dept,gender
	having SUM (salary)>6800

--#############################################
select   dept,gender , COUNT(*) as counts
FROM Department
group by  gender,dept 























































































































