--Module 1
--1.Install MS SQL Server
/*Go to this url https://www.microsoft.com/en-in/sql-server/sql-server-downloads for Microsoft sql server download
Then select the Developer edition
we will get sql server insallation set up as ‘SQLServer2017-SSEI-Dev.exe’.
open the exe file
Choose the version by clicking on custom
‘Microsoft Server License Terms’ screen will appear. Read the License Terms and then click ‘Accept.’
Choose the location*/

--Learn the basics of Structured Query Language
--DDL-create, alter,drop
--DML-insert, update,delete
--DCL-Grant, Revoke

--Module 2
create database Assignment_Intellipat

Use Assignment_Intellipat

create table customer(
id int,
firstname varchar(50),
lastname varchar(50),
email varchar(50),
address varchar(50),
city varchar(50),
state varchar(50),
zip int)

insert into customer values
(1,'hari','manchana','hjk123@gmail.com','2-947 nehru center','warangal','telangana',435854),
(2,'sam','jak','njk@gmail.com','8-394 stn road','hyderabad','telangana',848387),
(3,'mani','ratnam','mkl@gmail.com','3-049 ktr park','kmm','telangana',495984),
(4,'jack','ferri','spl@gmail.com','4-586 church road','karimnagar','telangana',495984),
(5,'Ganesh','adv','tkl@gmail.com','6-459','San_Jose','telangana',495984)

select * from customer

select firstname,lastname from customer

select * from customer where 
firstname like 'G%' and city='San_Jose'

--Module3
create table Orders(
order_id int,
order_date date,
amount int,
customer_id int)


insert into orders values
(101,'2022-08-10',456,1),
(102,'2022-09-02',956,2),
(103,'2022-04-18',650,3),
(104,'2022-05-07',1099,4),
(105,'2022-06-21',1200,6),
(106,'2022-07-20',660,7)
--inner join
select * from customer join orders on 
customer.id=Orders.customer_id

select firstname, lastname,amount from customer 
join Orders on customer.id=orders.customer_id

select * from customer 
left join Orders on customer.id=Orders.customer_id

select * from customer 
right join Orders on customer.id=Orders.customer_id

select * from customer 
full join Orders on customer.id=Orders.customer_id

update orders set amount=100 where customer_id=3

select * from Orders

--Module 4
--Aggregate fun
select min(amount) from orders
select max(amount) from orders
select avg(amount) from orders

--user defined
create function multiply
(@val int)
returns int
as
begin
return @val*10
end

select dbo.multiply
(15) as multiplied_by_10

select *,dbo.multiply(amount) from Orders

select
case 
when 100<200 then '100 is less than 200'
when 100=200 then '100 is equal to 200'
when 100>200 then '100 is gretaer than 200'
end
as result

---reference IIF
select iif(100>200,'100 is less than 200','False condition') as result



create function algebra(@ int, @b int)
returns int
as 
begin
return (@a+@b)*(@a-@b)
end

Select dbo.algebra (4,5)

--Module5
--1. Arrange the ‘Orders’ dataset in decreasing order of amount
select * from orders order by amount desc

--2. Create a table with name ‘Employee_details1’ and comprising of these columns – ‘Emp_id’,‘Emp_name’, ‘Emp_salary’. 
--Create another table with name ‘Employee_details2’, which
--comprises of same columns as first table.
create table Employee_details1(
Empid int,
emp_name varchar(20),
emp_Salary int)

create table Employee_details2(
Empid int,
emp_name varchar(20),
emp_Salary int)

insert into Employee_details1 values
(1,'nagendra',15000),
(2,'santosh',25000),
(3,'vickas',18000)

insert into Employee_details1 values
(4,'rajshekar',17000),
(5,'sam',50000),
(6,'aditya',60000)

insert into Employee_details2 values
(6,'shekar',17000),
(7,'sunil',50000),
(8,'jonny',60000)

select * from Employee_details1
select * from Employee_details2



--3. Apply the union operator on these two tables
select * from Employee_details1
union
select * from employee_details2

--4. Apply the intersect operator on these two tables
select * from Employee_details1
intersect
select * from employee_details2


--5. Apply the except operator on these two tables
select * from Employee_details1
except
select * from employee_details2


--SQL  NEW ASSIGNENTS
create table employee(
employee_id int primary key,
first_name varchar(20),
last_name varchar(20),
salary int,
joining_date datetime,
department varchar(20))

insert into employee values
(1,'Anika','Arora',100000,'2020-02-14 9:00:00','HR'),
(2,'Veena','Verma',80000,'2011-06-15 9:00:00','Admin'),
(3,'Vishal','Singhal',300000,'2020-02-16 9:00:00','HR'),
(4,'Sushanth','Singh',500000,'2020-02-17 9:00:00','Admin'),
(5,'Bhupal','Bhati',500000,'2011-06-18 9:00:00','Admin'),
(6,'Dheeraj','Diwan',200000,'2011-06-19 9:00:00','Account'),
(7,'Karan','Kumar',75000,'2020-01-14 9:00:00','Account'),
(8,'Chandrika','Chauhan',90000,'2011-04-15 9:00:00','Admin')

create table employee_bonus
(employee_ref_id int foreign key references employee(employee_id),
bonus_amout int,
bonus_date datetime
)


insert into employee_bonus values
(1,5000,'2020-02-16 0:00:00'),
(2,3000,'2011-06-16 0:00:00'),
(3,4000,'2020-02-16 0:00:00'),
(1,4500,'2020-02-16 0:00:00'),
(2,3600,'2011-06-16 0:00:00')

create table employee_title(
employee_ref_id int,
employee_title varchar(20),
affective_date datetime)

insert into employee_title values
(1,'Manager','2016-02-20 0:00:00'),
(2,'Executive','2016-06-11 0:00:00'),
(8,'Executive','2016-06-11 0:00:00'),
(5,'Manager','2016-06-11 0:00:00'),
(4,'Asst.Manager','2016-06-11 0:00:00'),
(7,'Executive','2016-06-11 0:00:00'),
(6,'Lead','2016-06-11 0:00:00'),
(3,'Lead','2016-06-11 0:00:00')

--1 Display the “FIRST_NAME” from Employee table using the alias name  as Employee_name.
select first_name as Employee_name from employee 

--2 Display “LAST_NAME” from Employee table in upper case.
select upper(last_name) from employee

--3 Display unique values of DEPARTMENT from EMPLOYEE table.
select distinct(department) from employee

--4 Display the first three characters of LAST_NAME from EMPLOYEE table.
select substring(last_name,1,3) from employee

--5 Display the unique values of DEPARTMENT from EMPLOYEE table and prints its length.
select distinct(department), len(department) as Length from employee 

--6 Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a
--single column AS FULL_NAME. a space char should separate them.
select first_name,last_name,concat(first_name,' ', last_name) as Full_name from employee

--7 DISPLAY all EMPLOYEE details from the employee table order by FIRST_NAME Ascending.
select * from employee order by first_name

--8. Display all EMPLOYEE details order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from employee order by first_name, department desc

--9 Display details for EMPLOYEE with the first name as “VEENA” and “KARAN” from EMPLOYEE table.
select * from employee where first_name in ('veena','karan')

--10 Display details of EMPLOYEE with DEPARTMENT name as “Admin”.
select * from employee where department='admin'

--11 DISPLAY details of the EMPLOYEES whose FIRST_NAME contains ‘V’.
select * from employee where first_name like '%v%'

--12 DISPLAY details of the EMPLOYEES whose SALARY lies between 100000 and 500000.
select * from employee where salary between 100000 and 500000

--13 Display details of the employees who have joined in Feb-2020.
select * from employee where year(joining_date)=2020 and Month(joining_date)=2

--14 Display employee names with salaries >= 50000 and <= 100000.
select first_name,last_name from employee where salary>=50000 and salary<=100000

--16 DISPLAY details of the EMPLOYEES who are also Managers.


--17 DISPLAY duplicate records having matching data in some fields of a table.
select department, count(department) as count, salary, count(salary) as sal_count
from employee group by department, salary 
having (count(department)>1) and (count(salary)>1)

---18 Display only odd rows from a table.
select * from employee where (employee_id % 2)=1

---19 Clone a new table from EMPLOYEE table.
select * into emp_dupl
from employee

select * from emp_dupl

---20 DISPLAY the TOP 2 highest salary from a table.
select max(salary) from employee where salary  <
(select max(salary) from employee)

---21. DISPLAY the list of employees with the same salary.
select e1.employee_id,e2.first_name,e2.salary from employee 
e1 inner join employee e2 
on e1.salary=e2.salary and e1.first_name <> e2.first_name


--22 Display the second highest salary from a table.
select max(salary) from employee where salary  <
(select max(salary) from employee)


---23 Display the first 50% records from a table.
select top 50 percent * from employee

--24. Display the departments that have less than 4 people in it.
select department, count(department) as count from employee group by department having count(department)<4

--25. Display all departments along with the number of people in there.
select department, count(department) as No_of_people from employee group by department

--26 Display the name of employees having the highest salary in each department.
select first_name, salary,department from employee where salary  in
(select max(salary)  from employee group by department)

--27 Display the names of employees who earn the highest salary.
select * from employee where salary in
(select max(salary) from employee)

--28 Diplay the average salaries for each department
select avg(salary) from employee group by department

--29 display the name of the employee who has got maximum bonus 
 select employee.first_name,employee_bonus.bonus_amout from employee join employee_bonus on 
 employee.employee_id=employee_bonus.employee_ref_id where bonus_amout in
(select max(bonus_amout) from employee_bonus)


--30 Display the first name and title of all the employees
select employee.first_name, employee_title.employee_title from employee join employee_title on
employee.employee_id=employee_title.employee_ref_id