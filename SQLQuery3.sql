
--10/12/22
create table test
(id int , doj date ,checkin time,dob datetime)

insert into test values(101,'2022-12-10','23:00:34','1999-05-07 05:30:56')

select * from test

create database SQLBatch

use SQLBatch

create table employee(id int , ename varchar(10))

insert into employee values 
(1,'Alpha')
go 10 

select * from employee


alter table employee
add unique (id)

alter table employee
drop constraint [UQ__employee__3213E83E80D1DDB4]

alter table employee
alter column id  int not null 

alter table employee
add primary key(id)

delete from employee

-----******************
-------Insert into
---------select into

create table employe
(
empid int primary key ,
ename varchar(20),
)

create table HR 
(
empid int primary key,hrname varchar(20)
foreign key (empid) references employe(empid)
)

create table dept
(
empid int primary key ,
deptname varchar(20),
foreign key (empid) references hr (empid)
)

select * from employe
select * from HR
select * from dept

Insert into employe  values 
(101, 'Alpha')
go 
Insert into HR  values 
(101, 'Alpha')
go 
Insert into dept  values 
(101, 'Alpha')

 

Select employe.empid,employe.ename, HR.empid,
HR.hrname,dept.deptname,dept.empid
from employe  inner join HR
on employe.empid=HR.empid
inner join dept
on dept.empid=HR.empid


--Save the output to the new table Temp

select employe.empid,employe.ename, 
HR.hrname,dept.deptname Into TEMP
from employe  inner join HR
on employe.empid=HR.empid
inner join dept
on dept.empid=HR.empid

select * from Temp


create table salary 
(id int , name varchar(10), sal int)

Insert into salary values 
(101,'alpha',10000)
go 5

select * from salary
--it will copy data, datatype & structure
select * into salarycopy 
from salary

select * from salarycopy

create table deptsalary 
(id int , name varchar(10), sal int)

insert into  deptsalary-- newtable with same structure
select * from salary 


select * from deptsalary

--union -- combine 
-- Dataype should be same of two table 
--Number of columns should be same 

select * from salary
select * from deptsalary
----union-it will remove all duplicates
select * from salary
union
select * from deptsalary
----unionall will give all rows from both tables
select * from salary
union all
select * from deptsalary


Select * from HR
union all
Select * from employe
union all
Select * from dept


--EXcept and intersect
select * from salary
select * from deptsalary

delete from salary
delete from deptsalary

Insert into salary values 
(101,'alpha',10000),
(102,'lpha',10000),
(104,'pha',10000),
(106,'pha',10000),
(108,'ha',10000),
(109,'a',10000)

Insert into deptsalary values 
(101,'alpha',10000),
(102,'lpha',10000),
(103,'pha',10000),
(105,'pha',10000),
(107,'ha',10000),
(109,'a',10000)


select * from salary
select * from deptsalary

select * from salary
except
select * from deptsalary

select * from salary
intersect
select * from deptsalary

select * from salary left join  deptsalary
on salary.id=deptsalary.id

--Temporary tables
--Local Temporary tables
--GLobal Temporary tables

--local
create table #temporary 
(id int , ename varchar(10), age int )

insert into #temporary values 
	(111,'Ram',33)
	go 50

select * from #temporary

--global
create table ##tested
	(id int , ename varchar(10), age int )


insert into ##tested values 
	(111,'Ram',33)
	go 50

select * from ##tested


create table companyy
(id  int , address varchar(10), phnum int)

Insert into companyy values 
(101,'alpha',10000),
(102,'lpha',10000),
(104,'pha',10000),
(106,'pha',10000),
(108,'ha',10000),
(109,'a',10000),
(110,'alpha',10000),
(112,'lpha',10000),
(114,'pha',10000),
(116,'pha',10000),
(118,'ha',10000),
(119,'a',10000)


select * from companyy 
order by id 

select * from companyy 
where id =101 or id=112 or id =104 or id =114

select * from companyy 
where id in(101,104,112,119,114)

select * from companyy 
where id  not in(101,104,112,119,120)

select * from companyy 
where id between 101 and 114

select * from companyy 
where address like 'a%'


select * from companyy 
where address like '%ph%'

select * from companyy 
where address like '%a__h%'

Create database Companie

use companie

CREATE TABLE employee
  (
      id INT PRIMARY KEY,
      name VARCHAR(50) NOT NULL,
      gender VARCHAR(50) NOT NULL,
      salary INT NOT NULL,
      department VARCHAR(50) NOT NULL
   )

INSERT INTO employee VALUES
  (1, 'David', 'Male', 5000, 'Sales'),
  (2, 'Jim', 'Female', 6000, 'HR'),
  (3, 'Kate', 'Female', 7500, 'IT'),
  (4, 'Will', 'Male', 6500, 'Marketing'),
  (5, 'Shane', 'Female', 5500, 'Finance'),
  (6, 'Shed', 'Male', 8000, 'Sales'),
  (7, 'Vik', 'Male', 7200, 'HR'),
  (8, 'Vince', 'Female', 6600, 'IT'),
  (9, 'Jane', 'Female', 5400, 'Marketing'),
  (10, 'Laura', 'Female', 6300, 'Finance'),
  (11, 'Mac', 'Male', 5700, 'Sales'),
  (12, 'Pat', 'Male', 7000, 'HR'),
  (13, 'Julie', 'Female', 7100, 'IT'),
  (14, 'Elice', 'Female', 6800,'Marketing'),
  (16, 'Wayne', 'Male', 6800, 'Finance')

  SELECT *  FROM employee
 
 
  select COUNT(*)   FROM employee
  select MAX(salary)  FROM employee
  select Min(salary)  FROM employee
  Select Avg(salary)  FROM employee
  Select sum(salary)  FROM employee
  --GROUP BY
  Select gender, SUM(salary) from employee group by gender

  Select department, SUM(salary ) from employee group by department

  select department, SUM(salary ) from employee group by department having department ='finance' or department = 'it'

 --ROLLUP operator is used to calculate sub-totals and grand totals 
--for a set of columns passed to the “GROUP BY ROLLUP” clause.
--Coalesce  function is used to handle the null values 

SELECT department,sum(salary) as Salary_Sum FROM employee
GROUP BY ROLLUP (department)

SELECT coalesce (department, 'Departments sum') AS Department,sum(salary) as Salary_Sum
FROM employee
GROUP BY ROLLUP (department)
	 
 SELECT
 coalesce (department, 'All Departments') AS Department,
 coalesce (gender,'All Genders') AS Gender,
 sum(salary) as Salary_Sum
 FROM employee
 GROUP BY ROLLUP (department, gender)


--11/12/2022
---- CUBE operator is also used in combination with the GROUP BY clause.
--however the CUBE operator produces results by generating all
--combinations of columns specified in the GROUP BY CUBE clause.
 --Coalesce  function is used to handle the null values 
 
 SELECT
 coalesce (department, 'All Departments') AS Department,
 coalesce (gender,'All Genders') AS Gender,
 sum(salary) as Salary_Sum
 FROM employee
 GROUP BY CUBE (department, gender)

 --tcl
--commit Save
--rollback DOn't save 

begin tran
	delete from employee

select * from employee

rollback

begin tran
	delete from employee where id<=5
	
select * from employee

commit



--Loops in sql

go 

create table test(id int , age int)


insert into test values 
(11,26)
go 5

---if boolean_expression(true/ false)
--	statement_block --> True
--else 
--	statement_block -->False

declare @num int
set @num=4

if (@num=4)
	print 'True'
else
	print 'False'

select * from employee
where id=14



if (select salary  from employee where id =14)<6000
	
	Print 'Apraisal'
	else 
	Print 'No apraisal'

---*********************************************--------

if (select salary  from employee where id =14)<6000

	Print 'Apraisal person is haivn sal= 6000'
else
if (select salary  from employee where id =14)<7000
	Print 'Apraisal person is haivn sal= 7000'
else 
	Print 'No apraisal'


---********************************************************************
--while boolean_expression(true/ false)
	--statement_block --> True

 declare @count int 
 set @count=1
 while (@count<=5)
	begin 
		print @count 
		set @count=@count+1  
	End
--------***************-------------

declare @count int 
 set @count=1
 while (@count<=14)
	begin 
		select * from employee where id=@count
		set @count=@count+1  
	End
-----------------**********-----------
declare @count int 
 set @count=1

 while (@count<=14)
	begin 
		if(select * from employee where id=@count)<6000
		begin
			select * from employee where id=@count
		End
		set @count=@count+1  
	End

-------*************************************----------------
 declare @count int 
 set @count=1

 while (@count<=14)
	begin 
		if(select salary  from employee where id =@count )<6000
		begin
			select *  from employee where id =@count 	 
		End
		else 
		if(select salary  from employee where id =@count )>6000
		begin
			select *  from employee where id =@count 	 
		End
		set @count=@count+1  
	End

-------------------****************************---------------
select id, name, gender, salary, department,
case
when salary>6000 then 'No apraisal'
when salary<6000 then 'apraisal'
else 'unidentified'
end as appraisal
from employee

-----------***********************--------
--views

create view empdata
as
select id, name, department from employee

select * from empdata
--If we delete from table we can see the immediate changes in view data
delete from employee

---how to alter an existing view in sql server
alter view empdata
as
select id, department from employee

select * from empdata

---how to drop view
drop view empdata

--stored procedures
create procedure fetchrecords
as
begin
 declare @count int 
 set @count=1

 while (@count<=14)
	begin 
		if(select salary  from employee where id =@count )<6000
		begin
			select *  from employee where id =@count 	 
		End
		else 
		if(select salary  from employee where id =@count )>6000
		begin
			select *  from employee where id =@count 	 
		End
		set @count=@count+1  
	End
end

--how to read from sp
exec fetchrecords

create procedure sal
as 
SELECT
 coalesce (department, 'All Departments') AS Department,
 coalesce (gender,'All Genders') AS Gender,
 sum(salary) as Salary_Sum
 FROM employee
 GROUP BY CUBE (department, gender)

 exec sal

 --how to modify an existing sp
 alter procedure sal
 as 
 SELECT
 coalesce (gender,'All Genders') AS Gender,
 sum(salary) as Salary_Sum
 FROM employee
 GROUP BY CUBE (department, gender)

 exec sal


 --scaler values func
create function dbo.addi(
@val1 int)
returns int
as 
begin 
	return @val1*@val1
end

alter function dbo.addi(
@val1 int,
@val2 int)
returns int
as 
begin 
	return @val1*@val2
end

select dbo.addi(10,2)

--table values func
create function testdata
(@id int)
returns table
as 
return(select * from test where id=@id)

select * from testdata(11)

--rank, dense_rank, row_number
select id, name, salary, rank() 
over(order by salary desc) as rank
from employee

select id, name, salary, row_number() 
over(order by salary desc) as row_number
from employee

select id, name, salary, dense_rank() 
over(order by salary desc) as d_rank
from employee

