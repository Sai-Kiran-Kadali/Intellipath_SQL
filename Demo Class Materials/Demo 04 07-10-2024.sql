--DATA Type(numerics , decimal, string ,datetime)
--#############################################
--DATA Type
https://learn.microsoft.com/en-us/sql/t-sql/data-types/data-types-transact-sql?view=sql-server-ver16

--Self learning 
--XML
	https://learn.microsoft.com/en-us/sql/relational-databases/xml/xml-data-type-and-columns-sql-server?view=sql-server-ver16
--Json
	https://learn.microsoft.com/en-us/sql/relational-databases/json/json-data-sql-server?view=sql-server-ver16

--#########################################################
--Data type categories
	--Exact numerics
	--Approximate numerics
	--Date and time
	--Character strings
	--Unicode character strings
	--Binary strings
	--Other data types
--################################
--Exact numerics
	@phnum =123456
	@name ='alpha'
@= temp

--DECLARE:	This is used to declare a variable.
--SET:		This is used to assign a value to a variable.
--SELECT:	This is used to read/ print data from a variable 
--############################################
--Tinyint Range(0 to 255), 1 Byte
	declare @value tinyint
	set @value=23
	select @value

--ALias = Temp name	
	declare @value tinyint
	set @value=255
	select @value As Val, datalength(@value) as Byte

	declare @value tinyint
	set @value=256
	select @value As Val, datalength(@value) as Byte

--##########################################################
--smallint	Range(-32768 to 32767),	2 Bytes
	declare @value smallint
	set @value=-32768
	select @value As Val, datalength(@value) as Byte
	
	declare @value smallint
	set @value=-32767
	select @value As Val, datalength(@value) as Byte
		
	declare @value smallint
	set @value=1
	select @value As Val, datalength(@value) as Byte

	declare @value smallint
	set @value=32768
	select @value As Val, datalength(@value) as Byte
	
--##########################################################		
--int	Range(-2,147,483,648 to 2,147,483,647),	4 Bytes

	declare @value int
	set @value=-2147483648
	select @value As Val, datalength(@value) as Byte

	declare @value int
	set @value=0
	select @value As Val, datalength(@value) as Byte

	declare @value int
	set @value=123
	select @value As Val, datalength(@value) as Byte

	declare @value int
	set @value=122134124134234
	select @value As Val, datalength(@value) as Byte
--##########################################################		
--bigint	Range(-9,223,372,036,854,775,808 to 9,223,372,036,854,775,807)	8 Bytes
	declare @value bigint
	set @value=-9223372036854775808
	select @value As Val, datalength(@value) as Byte

	declare @value bigint
	set @value=9223372036854775807
	select @value As Val, datalength(@value) as Byte
	
	declare @value bigint
	set @value=1
	select @value As Val, datalength(@value) as Byte
	
	declare @value bigint
	set @value=922337 
	select @value As Val, datalength(@value) as Byte
--##########################################################
--Approximate numerics
 	--precision = 14 =123456789.12345= all the values towards the left and right of my decical point
	--scale =	5 =.12345= all the values towards the right of my decical point

 123456789=9 = Precision 

 1234.34556789= 12 = Precision 
 .34556789= 8 = Scale
 
--float  , 15 precision , 8 byte
	--123456789.012345=15 or 123456789012345=15

	
	declare @value float
	set @value=123456789012345 
	select @value As Val, datalength(@value) as Byte
	
	declare @value float
	set @value=1 
	select @value As Val, datalength(@value) as Byte

	declare @value float
	set @value=87564543 
	select @value As Val, datalength(@value) as Byte


	
	declare @value float
	set @value=123456789.34567
	select @value As Val, datalength(@value) as Byte
	
	declare @value float
	set @value=1234567890.345678
	select @value As Val, datalength(@value) as Byte
	
	declare @value float
	set @value=1234567890.3456789
	select @value As Val, datalength(@value) as Byte
	
	
	declare @value float
	set @value=12345678901.3456789
	select @value As Val, datalength(@value) as Byte
		
	declare @value float
	set @value=123456789012345.6456789
	select @value As Val, datalength(@value) as Byte

	
	declare @value float
	set @value=1234567890123456.6456789
	select @value As Val, datalength(@value) as Byte

--1.23456789012346E+15= 1.23456789012346 * 10 raised power of 15

--###############################################################################
--decimal(precision, scale), Total 38  precision 
--Precision			Storage bytes
	--1 - 10			5
	--11-19				9
	--20-28				13
	--29-38				17

	declare @value decimal
	set @value=123456789987654321
	select @value As Val, datalength(@value) as Byte
	
	declare @value decimal
	set @value=1234567890 
	select @value As Val, datalength(@value) as Byte

	

	declare @value decimal(38,0)
	set @value=123456789
	select @value As Val, datalength(@value) as Byte
	
	declare @value decimal(38,0)
	set @value=123456789123456789
	select @value As Val, datalength(@value) as Byte
	
	declare @value decimal(38,0)
	set @value=123456789123456789123456789
	select @value As Val, datalength(@value) as Byte
	

	declare @value decimal(38,0)
	set @value=123456789123456789123456789123456789
	select @value As Val, datalength(@value) as Byte

	declare @value decimal(38,2)
	set @value=123456789123456789123456789123456789
	select @value As Val, datalength(@value) as Byte

	

	declare @value decimal(38,2)
	set @value=123456789
	select @value As Val, datalength(@value) as Byte

	

	declare @value decimal(38,3)
	set @value=12345678912345678912345678912345678912
	select @value As Val, datalength(@value) as Byte
	
--############################################################
--Color coding 
	blue --> keyword 
	black --> user defined variable 
	green --> comment
	red --> string 
	pink --> function


'string information 1241$%^&*(GHJKL'


--############################################################
--String 

' asdfghjk ASDFGHJK    !@#$%^&*( 123456789'

--Char(n), range 1 -8000
--fixed length data type
--static memory allocation

	declare @value char 
	set @value='alpha'
	select @value As Val, datalength(@value) as Byte
	
	
	declare @value char (5)
	set @value='alpha'
	select @value As Val, datalength(@value) as Byte
	
	
	declare @value char (10)
	set @value='alpha'
	select @value As Val, datalength(@value) as Byte
	
	declare @value char (8001)
	set @value='alpha'
	select @value As Val, datalength(@value) as Byte

--VarChar(n), range 1 -8000
--variable length data type
--dynamic memory allocation


	declare @value VarChar 
	set @value='alpha'
	select @value As Val, datalength(@value) as Byte
	
	
	declare @value VarChar (5)
	set @value='alpha'
	select @value As Val, datalength(@value) as Byte
	
	
	declare @value VarChar (10)
	set @value='alpha'
	select @value As Val, datalength(@value) as Byte
	
	declare @value VarChar (8001)
	set @value='alpha1234324@#$%^&*()'
	select @value As Val, datalength(@value) as Byte

	declare @value VarChar (max)
	set @value='alpha1234324'
	select @value As Val, datalength(@value) as Byte

--#########################################################
--Unicode
	--nChar() , 1 to 4000, 2 byte
	--static memory allocation 
	--It is a fixed length data type
	
	declare @value nChar (20)-- 20 *2
	set @value=N'hello world'
	select @value As Val, datalength(@value) as Byte
		
	declare @value nChar (30)
	set @value=N'नमस्ते दुनिया'
	select @value As Val, datalength(@value) as Byte
	

	declare @value nChar (40)
	set @value=N'你好，世界'
	select @value As Val, datalength(@value) as Byte
	   
	declare @value nChar (50)
	set @value=N'नमस्ते 世界'
	select @value As Val, datalength(@value) as Byte

--nVarChar(n), range 1 -4000, 2 byte
--variable length data type
--dynamic memory allocation

	declare @value nVarChar (20)-- 11 *2
	set @value=N'hello world'
	select @value As Val, datalength(@value) as Byte
		
	declare @value nVarChar (20)
	set @value=N'नमस्ते दुनिया'
	select @value As Val, datalength(@value) as Byte
	

	declare @value nVarChar (20)
	set @value=N'你好，世界'
	select @value As Val, datalength(@value) as Byte


	declare @value nVarChar (20)
	set @value=N'नमस्ते 世界'
	select @value As Val, datalength(@value) as Byte

--##################################################
--Date , 3 byte
	--input='YYYY-MM-DD' or 'MM-DD-YYYY'
	--output='YYYY-MM-DD'

	declare @value date
	set @value='2024-07-11'
	select @value As Val, datalength(@value) as Byte
	
	declare @value date
	set @value='07-15-2024'
	select @value As Val, datalength(@value) as Byte
	
--time , 5 byte
	--input='HH:MM:SS'
	--output 'HH:MM:SS:MMMMMMM'

	declare @value time
	set @value='23:28:59'
	select @value As Val, datalength(@value) as Byte
		
	declare @value time
	set @value='11:28:59'
	select @value As Val, datalength(@value) as Byte
	
--##################################################
--TimeStamp 'YYYY-MM-DD HH:MM:SS'

--smalldatetime(4 byte) 'YYYY-MM-DD HH:MM:SS'

	declare @value smalldatetime
	set @value='2024-07-11 11:28:59'
	select @value As Val, datalength(@value) as Byte
	
-- datetime(8 byte) 'YYYY-MM-DD HH:MM:SS:MMM'	

	declare @value datetime
	set @value='2024-07-11 11:28:59'
	select @value As Val, datalength(@value) as Byte

-- datetime2(8 byte) 'YYYY-MM-DD HH:MM:SS:MMMmmmm'	

	declare @value datetime2
	set @value='2024-07-11 11:28:59'
	select @value As Val, datalength(@value) as Byte
--##############################################################################

select getdate(), sysdatetime()

















































































































































































































































































































































































































































