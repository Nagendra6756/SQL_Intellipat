---32767 concurrent connection
---1-50 are reserved for system processes
---current session-53
---Records can we store in a database (database will grow up to 100 % disk utilization)
---SQL server is not case sensititve

Declare @number int
set @number=1111
print @number

Declare @number float
set @number=111128.657
print @number

Declare @alpha char(5)
set @alpha='nag@1'
print @alpha

Declare @alpha varchar(10)
set @alpha='navin@123'
print @alpha

---Date yyyy-mm-dd
Declare @dob date
set @dob='2022-11-26'
print @dob

--time
Declare @login time
set @login='23:02:55'
print @login

--date and timeDeclare @dob date
Declare @login Datetime
set @login='2022-11-26 23:02:55'
print @login

---Date 27-11-2022
----tinyint 1 byte 255
----smallint 2 byte 32768
----int 4 
---bigint  8

--System Databases
--master database Records all the system-level information for an instance of sql server
--msdb database is used by sql server agent for scheduling alerts and jobs
--model database is used as the template for all databases created on the instance of sql server
--tempdb database is a workspace for holding temporary objects

--DDL
alter database Nagendra modify name = Nagendranath

create database tanya

alter database tanya modify name=tanvi

--DML (select,insert, update,delete)
create table employee
(emp_id int,
emp_name varchar(10),
emp_number int,
emp_age int)

alter table employee
add emp_address varchar(20)

alter table employee alter column emp_number int

insert into employee values (101,'nag',28,'2-19 srinagar colony')
insert into employee values (102,'dev',23,'2-187 station road')
insert into employee values (103,'satya',21,'2-187 highway road')

alter table employee drop column emp_number

select * from employee

update employee set emp_name='nagendra' where emp_id=101
update employee set emp_name='devika', emp_age=30 where emp_id=102

truncate table employee


sp_rename 'dbo.cars' 'dept_naem','column'