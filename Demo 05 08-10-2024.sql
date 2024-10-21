--schema, renaming objects, ddl(create, alter, drop, use)

--##################################################
declare @value smallint, @value1 int, @value2 char(5)
	set @value=101
	set @value1=11111111 
	set @value2='alpha'
	select @value, @value1, @value2

declare @num decimal(14,4)set @num=9234567899select @num as no , datalength(@num) as byte

--#############################################

--DDL(Data Definition Language --> Database Structure

--Create
	--Syntax: Create database Databasename

	Create database HELLOWORLD
		
	Create database HELLOWORLD
	
	Create database SQLDEMO
	
	Create database [SQL DEMO]

-->[] =Qoute idenitifier

	Create database [123DEMO]
	
--###############################
	--instance name =THELON\DEMO
	--login name =THELON\balje
	--Current database name =master
	--session id =53

--Task to create table employee (eid, ename , age , gender, salary)
--which database =HELLOWORLD

--Current database name =master
--USE
	--Syntax: Use DatabaseName

--create table   
	--Syntax:	Create table tablename	(columnname1 dataype , columnname2 dataype , columnname3 dataype , .....)

	use HELLOWORLD
	create table employee (eid int, ename varchar(10) , age smallint, gender char(10), salary decimal(10,2))
	   

--Task to create table department (eid, ename , age , gender, salary)
--which database =[123DEMO]
	use [123DEMO]
	create table department (eid int, ename varchar(10) , age smallint, gender char(10), salary decimal(10,2))
--#################################
--Alter table 
--Alter to add a column 
/*Syntax:
	alter table tablename 
	add columnname datatype,columnname datatype,.....
*/

--task to add column phnum int, email varchar(20)
	use [123DEMO]

	alter table department 
	add phnum char, email int

--Alter to drop a column 
/*Syntax:
	alter table tablename 
	Drop column columnname1  ,columnname2,.....
*/

--task to drop column ename,salary 
	use [123DEMO]

	alter table department 
	drop column ename,salary 


--Alter to modify the datatype of a column
/*Syntax:
	alter table tablename 
	alter columnname datype
*/ 

	alter table department 
	alter column email varchar(50)
	

	alter table department 
	alter column phnum bigint
	

---######################################
--Drop table
	--Syntax: drop table tablename

	use [123DEMO]
	drop table department


	use HELLOWORLD
	drop table  employee


--Drop database 
	--Syntax: Drop database databasename
	use master 
	drop database HELLOWORLD
	
	use master 
	drop database[SQLDEMO]

---Connection details 
sp_who2


kill 52
kill 54

--##################################################################
--organisation(HR, FIN, sales, mar)

	Create database organisation
	
	use organisation
	--hr
	create table t1 (c1 int, c2 int)
	create table t2 (c1 int, c2 int)
	create table t3 (c1 int, c2 int)
	--fin
	create table t4 (c1 int, c2 int)
	create table t5 (c1 int, c2 int)
	create table t6 (c1 int, c2 int)
	--sales
	create table t7 (c1 int, c2 int)
	create table t8 (c1 int, c2 int)
	create table t9 (c1 int, c2 int)
	--mark
	create table t10 (c1 int, c2 int)
	create table t11 (c1 int, c2 int)
	create table t12 (c1 int, c2 int)
	create table t13 (c1 int, c2 int)
	create table dbo.t14 (c1 int, c2 int)

--Schema(logical container)
--Default schema =dbo
	Create database neworganisation
	
	use neworganisation
	--hr
	Create schema hr
	create table hr.t1 (c1 int, c2 int)
	create table hr.t2 (c1 int, c2 int)
	create table hr.t3 (c1 int, c2 int)
	--fin
	Create schema fin
	create table fin.t4 (c1 int, c2 int)
	create table fin.t5 (c1 int, c2 int)
	create table fin.t6 (c1 int, c2 int)
	--sales
	Create schema  sales
	create table sales.t7 (c1 int, c2 int)
	create table sales.t8 (c1 int, c2 int)
	create table sales.t9 (c1 int, c2 int)
	--mark
	Create schema mark
	create table mark.t10 (c1 int, c2 int)
	create table mark.t11 (c1 int, c2 int)
	create table mark.t12 (c1 int, c2 int)
	create table mark.t13 (c1 int, c2 int)
	create table dbo.t13 (c1 int, c2 int)


databasename.schemaname.tablename 



select * from sys.schemas

--renaming objects

	create database SQLDEMO

	use SQLDEMO
	create table employee 
	(eid int, ename varchar(10) , age smallint, gender char(10), salary decimal(10,2))
	   
--Renaming database 
	--Syntax: Alter database OldDatabasename  modify name =newdatabasename
	 
	 Alter database SQLDEMO  modify name =DEMO


--Renaming Tables 
--Syntax: exec sp_rename 'schemaname.oldtablename','newtablname'

	use DEMO
	exec sp_rename '[dbo].[employee]','userinfo'


--Caution: Changing any part of an object name could break scripts and stored procedures.


--Renaming Column 
--Syntax: 	exec sp_rename 'oldtablename.Columnname','newColumnname', 'Column'

	exec sp_rename 'userinfo.eid','emp_id', 'Column'

	exec sp_rename 'userinfo.gender','emp_gender', 'Column'



--######################################################################################


--QUESTION TO PRACTICE 
--step 1
	Create database school 
--step 2
	use school
--step 3

--1. Teachers Table:
	--Columns: TeacherID int, Name varchar(20), Age int , Class varchar(20)
	create table Teachers (TeacherID int, Name varchar(20), Age int , Class varchar(20))

--2. Students Table:
	--Columns: StudentID, FirstName, LastName, Age, Class, TeacherID
	
--3. Courses Table:
	--Columns: CourseID, CourseName, Department, TeacherID
	
--4. Departments Table:
	--Columns: DepartmentID, DepartmentName
	
--5. Enrollments Table:
	--Columns: EnrollmentID, StudentID, CourseID, EnrollmentDate
	
--6. Teachers_Departments Table:
	--Columns: TeacherDepartmentID, TeacherID, DepartmentID
	
----*****************************************************************************************
--practice question
	Create database hospital

	Use hospital

-- 1. Doctors Table:
   -- Columns: DoctorID, FirstName, LastName, Specialization, Age
	create table Doctors ( DoctorID int , FirstName varchar(20), LastName varchar(20), Specialization  varchar(20), Age int)
-
-- 2. Patients Table:
   -- Columns: PatientID, FirstName, LastName, Age, AdmissionDate, DischargeDate, DoctorID
   
-- 3. Departments Table:
   -- Columns: DepartmentID, DepartmentName, HeadDoctorID
   
-- 4. Nurses Table:
   -- Columns: NurseID, FirstName, LastName, Age, DepartmentID
   
-- 5. Medications Table:
   -- Columns: MedicationID, MedicationName, Dosage
   
-- 6. Prescriptions Table:
   -- Columns: PrescriptionID, PatientID, DoctorID, MedicationID, PrescribedDate, DosageInstructions
   
   
















































































































































