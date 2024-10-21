
--Sql server adeventure works restore, System databases
---#######################################################
--This is our 3rd demo class 
--i am making changes using the notepad.

--  Instance name		=THELON\DEMO
--  loggin name		=THELON\BALJE
--  database name		= MASTER
--  session id		= 60 

--SQL  SERVER IT IS NOT A CASE SENSITIVE LANAGUAGE 


--Comment = Informational message

--SQl server file extension = .sql


--##################################################
--Step 1 
	--Open --> sql server management studio--> New Query -->run a command 
	
		Select @@version
		
--Step 2
https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms
	--download the -->OLTP  -->AdventureWorks2022.bak

--step 3 
--create the folder in C drive with your name and copy the backup file


--step 4
	--Restore

--##################################################

--##################################################
--System Databases
https://learn.microsoft.com/en-us/sql/relational-databases/databases/system-databases?view=sql-server-ver16

--master Database(Critical)
	--Records all the system-level information for an instance of SQL Server.

--model Database	
	--Is used as the template for all databases created on the instance of SQL Server.

	--Syntax:	create database databasename 
	create database sqldemo
		--how many  files 
		--size of files
		--path of files 
		--name of files

--msdb Database	
	--Is used by SQL Server Agent for scheduling alerts and jobs.

--tempdb Database(Critical)	
	--Is a workspace for holding temporary objects or intermediate result sets.
	--temporary data,  It resets every time the SQL Server restarts.


--Resource Database	
	--Is a read-only database that contains system objects that are included with SQL Server. 

	https://learn.microsoft.com/en-us/sql/relational-databases/databases/resource-database?view=sql-server-ver16
	--Installation drive>:\Program Files\Microsoft SQL Server\MSSQL<version>.<instance_name>\MSSQL\Binn\ 
	--Name  =  mssqlsystemresource


--##########################################################
























