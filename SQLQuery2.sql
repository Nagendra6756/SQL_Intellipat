--3/12/2022
use practice

create table batchs
(empid int, enmes varchar(10), age int)

--change the data type from int to varchar
alter table batchs
alter column empid varchar(10)
--change the column name
sp_rename 'dbo.batchs.enmes','enames','column'

sp_rename 'dbo.batchs', 'batches', 'object'

--add column to the table
alter table batches
add email varchar(10)

--constraints
create database company1

use company1

create table employee(
emp_id int not null unique check (emp_id>=100),
emp_name varchar(50) not null,
age int check (age>=18),
email varchar(50),
company varchar(50) default 'Google')

drop table employee

create table HR(
Hr_id int,
salary int,
department varchar(30),
designation varchar(30))

insert into employee(emp_id,emp_name,age,email)
values(103,'santo',45,'na123@lsg.com')

insert into employee(emp_id,emp_name,age,email)
values(101,'david',35,'hi123@lsg.com')
insert into employee values(102,'santo',23,'nag123@lsg.com','vendor')

select * from employee

create database bank

use bank

create table customer(
cid int not null unique,
cname varchar(10))

insert into customer values
(1,'Ram'),
(5,'Shyam'),
(2,'Dev'),
(4,'Raju'),
(3,'Tim')

select * from customer

create table employee 
(
empid varchar(10) not null,
adhar varchar(10) primary key,-- this column used  by HR table to create FK references 
ename varchar(10)
)

Insert into employee values 
(1,100,'Ram'),
(5,500,'Shyam'),
(2,200,'Dev'),
(4,400,'Raju'),
(3,300,'Tim')

select * from employee

create table HR(
hrid int,
adharid varchar(10),
salary int,
dept varchar(10)
foreign key (adharid) references employee(adhar)) 

insert into HR values 
(5,400,50000,'IT')




use railway



drop table passenger
drop table passnger
drop table platform
drop table rail

create table rail 
(
railid int primary key ,---fk relation with passenger table 
 railname varchar(10),
 station varchar(10)
 )


 create table passenger 
 (
 railid int   primary key ,--fk relation with passenger platform 
 ticket int 
 foreign key (railid) references rail(railid)
 )

 create table platorm 
 (
 pname varchar(10),
 railid int 
 foreign key (railid) references passenger(railid)
 )

sp_rename 'dbo.platorm', 'platform' ,'object' 


alter table platform
alter column railid int not null

alter table platform
add primary key(railid)



---4/12/2022 

create table temporari
(id int ,age varchar(10))

insert into temporari values 
(1,100)

go 10

select * from temporari

alter table temporari
add names varchar(10) default 'google'

insert into temporari (id, age) values (2,200)

update temporari
set names='vendor'
where id=1

Create database School

use school

CREATE TABLE Student (      
  id int PRIMARY KEY ,      
  first_name varchar(45) NOT NULL,      
  last_name varchar(45) NOT NULL,  
  age int,  
  city varchar(25) NOT NULL      
) 

CREATE TABLE Fee (   
  admission_no varchar(45) NOT NULL,  
  course varchar(45) NOT NULL,      
  amount_paid int,    
)

INSERT INTO Student VALUES
(3354,'Luisa', 'Evans', 13, 'Texas'),       
(2135, 'Paul', 'Ward', 15, 'Alaska'),       
(4321, 'Peter', 'Bennett', 14, 'California'),    
(4213,'Carlos', 'Patterson', 17, 'New York'),       
(5112, 'Rose', 'Huges', 16, 'Florida'),  
(6113, 'Marielia', 'Simmons', 15, 'Arizona'),    
(7555,'Antonio', 'Butler', 14, 'New York'),       
(8345, 'Diego', 'Cox', 13, 'California'); 

INSERT INTO Fee VALUES 
(3354,'Java', 20000),       
(7555, 'Android', 22000),       
(4321, 'Python', 18000),    
(8345,'SQL', 15000),       
(5112, 'Machine Learning', 30000),  
(9999,'Java', 20000),       
(6565, 'Android', 22000),       
(3456, 'Python', 18000)

select * from Student
select * from fee

--Inner join 
select * from Student, Fee where id =admission_no

select * from Student inner join Fee 
on  id =admission_no

--left join
select * from Student
select * from fee
select * from Student left join Fee 
on  id =admission_no
--Q1-select records that are presenet in table 1 but not in table 2
select * from Student left join Fee 
on  id =admission_no
where admission_no is null

--Right join 
select * from Student Right join Fee 
on  id =admission_no
--select the records present in table 2 but not in table1
select * from Student Right join Fee 
on  id =admission_no
where first_name is null

--Full join 
select * from Student Full join Fee 
on  id =admission_no
--fetch non matching recors from both tables
select * from Student full join fee
on id=admission_no
where id is null or admission_no is null

--cross join
select * from Student
cross join  Fee

-----Update using joins in sql server 
--We can update only an exisiting column in SQL server

select * from student left join fee 
on id=admission_no
select * from student right  join fee 
on id=admission_no

where id=3354



update Fee
set course='c++', amount_paid=15000
from student left join fee
on id=admission_no
where admission_no=3354

update student
set first_name='leghiton',last_name='marry'
from student right join fee
on id=admission_no
where admission_no=4321

select * from Student inner join fee
on id=admission_no where id=8345

delete student 
from student left join fee
on id=admission_no
where id=8345

select * from Student left join Fee
on id=admission_no
where id=8345

delete student 
from student inner join fee
on id=admission_no
where id=3354
select * from Student right join Fee
on id=admission_no

delete fee
from student right join fee
on id=admission_no
where admission_no=3354

select * from student full join fee on id=admission_no

Delete fee 
from Student right join Fee 
on  id =admission_no
where  admission_no =7555


use School

CREATE TABLE SourceProducts(
    ProductID		INT,
    ProductName		VARCHAR(50),
    Price			DECIMAL(9,2)
)

INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(1,'Table',100)
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(2,'Desk',80)
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(3,'Chair',50)
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(4,'Computer',300)


CREATE TABLE TargetProducts(
    ProductID		INT,
    ProductName		VARCHAR(50),
    Price			DECIMAL(9,2)
)

INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(1,'Table',9)
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(2,'Desk',8)
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(5,'Bed',1)
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(6,'Cupboard',2)


SELECT * FROM SourceProducts
SELECT * FROM TargetProducts

select * from SourceProducts inner join TargetProducts
on SourceProducts.ProductID=TargetProducts.productID

Merge TargetProducts using Sourceproducts
on Sourceproducts.ProductID=TargetProducts.productID

when Not MATCHED by TargetProducts Then
	Insert (ProductID, ProductName, Price)
	values(SourceProducts.ProductID, Sourceproducts.ProductName, SourceProducts.Price);

MERGE TargetProducts USING SourceProducts
ON SourceProducts.ProductID = TargetProducts.ProductID

WHEN NOT MATCHED BY Target THEN
    INSERT (ProductID,ProductName, Price) 
    VALUES (SourceProducts.ProductID,SourceProducts.ProductName, SourceProducts.Price);

SELECT * FROM SourceProducts
SELECT * FROM TargetProducts



MERGE   SourceProducts USING TargetProducts
ON SourceProducts.ProductID = TargetProducts.ProductID

WHEN NOT MATCHED BY Target THEN
    INSERT (ProductID,ProductName, Price) 
    VALUES (TargetProducts.ProductID,TargetProducts.ProductName, TargetProducts.Price);
go

SELECT * FROM TargetProducts
SELECT * FROM SourceProducts


--update
MERGE TargetProducts USING SourceProducts	
ON SourceProducts.ProductID = TargetProducts.ProductID   
     
WHEN MATCHED THEN UPDATE 
	SET        
	TargetProducts.ProductName	= SourceProducts.ProductName,
	TargetProducts.Price		= SourceProducts.Price;
go

SELECT * FROM TargetProducts
SELECT * FROM SourceProducts

---delete
MERGE TargetProducts     USING SourceProducts	
    ON SourceProducts.ProductID = TargetProducts.ProductID   
  
WHEN  Not MATCHED  by Source THEN
    DELETE;

SELECT * FROM TargetProducts
SELECT * FROM SourceProducts