create database Handson

use Handson

CREATE TABLE EMP
(EMPNO NUMERIC(4) NOT NULL,
 ENAME VARCHAR(10),
        JOB VARCHAR(9),
        MGR NUMERIC(4),
        HIREDATE DATE,
        SAL NUMERIC(7, 2),
        COMM NUMERIC(7, 2),
        DEPTNO NUMERIC(2));

INSERT INTO EMP VALUES
        (7369, 'SMITH',  'CLERK',     7902,
        '17-DEC-1980',  800, NULL, 20);
INSERT INTO EMP VALUES
        (7499, 'ALLEN',  'SALESMAN',  7698,
        '20-FEB-1981', 1600,  300, 30);
INSERT INTO EMP VALUES
        (7521, 'WARD',   'SALESMAN',  7698,
        '22-FEB-1981', 1250,  500, 30);
INSERT INTO EMP VALUES
        (7566, 'JONES',  'MANAGER',   7839,
        '2-APR-1981',  2975, NULL, 20);
INSERT INTO EMP VALUES
        (7654, 'MARTIN', 'SALESMAN',  7698,
        '28-SEP-1981', 1250, 1400, 30);
INSERT INTO EMP VALUES
        (7698, 'BLAKE',  'MANAGER',   7839,
        '1-MAY-1981',  2850, NULL, 30);
INSERT INTO EMP VALUES
        (7782, 'CLARK',  'MANAGER',   7839,
        '9-JUN-1981',  2450, NULL, 10);
INSERT INTO EMP VALUES
        (7788, 'SCOTT',  'ANALYST',   7566,
        '09-DEC-1982', 3000, NULL, 20);
INSERT INTO EMP VALUES
        (7839, 'KING',   'PRESIDENT', NULL,
        '17-NOV-1981', 5000, NULL, 10);
INSERT INTO EMP VALUES
        (7844, 'TURNER', 'SALESMAN',  7698,
        '8-SEP-1981',  1500,    0, 30);
INSERT INTO EMP VALUES
        (7876, 'ADAMS',  'CLERK',     7788,
        '12-JAN-1983', 1100, NULL, 20);
INSERT INTO EMP VALUES
        (7900, 'JAMES',  'CLERK',     7698,
        '3-DEC-1981',   950, NULL, 30);
INSERT INTO EMP VALUES
        (7902, 'FORD',   'ANALYST',   7566,
        '3-DEC-1981',  3000, NULL, 20);
INSERT INTO EMP VALUES
        (7934, 'MILLER', 'CLERK',     7782,
        '23-JAN-1982', 1300, NULL, 10);

CREATE TABLE DEPT
(DEPTNO NUMERIC(2),
DNAME VARCHAR(14),
LOC VARCHAR(13) );

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

select DEPTNO,SUM(sal) from EMP group by DEPTNO

select job, count(*) as 'total records', sum(sal) as 'total_sal',
AVG(sal) as 'Avg_sal' from EMP group by JOB

--ROLLUP
select job, count(*) as 'total records', sum(sal) as 'total_sal',
AVG(sal) as 'Avg_sal' from EMP group by ROLLUP(Job)

--COALESCCE
select coalesce(job, 'Total') as job, count(*) as 'total records', sum(sal) as 'total_sal',
AVG(sal) as 'Avg_sal' from EMP group by ROLLUP(Job)

select * from EMP

--group by order by
select job,DEPTNO, count(*) as 'total records', 
sum(sal) as 'total sal' from EMP group by job, deptno order by job

--rollup
select coalesce(job,'Total')as job, count(*) as 'total records', 
sum(sal) as 'total sal' from EMP group by rollup(job)
--coalesce
select coalesce(job,'grand total') as job,deptno, count(*) as 'total records', 
sum(sal) as 'total sal' from EMP group by rollup(job, deptno)

select coalesce(job,'Grand total') as job,
coalesce(cast(DEPTNO as varchar(20)),'subtotal') as deptno,
count(*) as 'total records',
sum(sal) as 'total sal'
from EMP group by rollup(job, deptno)

--cube
select job, deptno, sum(sal) as 'total_Sal'
from emp group by cube(job, DEPTNO) order by JOB

--rank
select *, rank() over(order by sal desc) as rank from emp 

select *, rank() over(partition by deptno order by sal) as rank from emp
--dense_rank
select * , dense_rank() over(partition by deptno order by sal) as dense_rank from EMP
--row_number
select *, row_number() over(partition by deptno order by empno) as row_number from EMP

--ntile
select *, ntile(2) over(order by sal) from emp

--view
create view vw_test as 
select * from emp

select * from vw_test

--subquery
select * from emp where deptno in
(select deptno from emp where ename like 'scott')

select * from emp where job in
(select job from emp where ename like 'scott')

select * from emp where sal in
(select max(sal) from emp)

select * from emp where DEPTNO in
(select DEPTNO from emp where ename in ('scott','Miller'))

--get all people whose salary is same as ford , turner
select * from emp where sal in
(select sal from emp where ename in('ford','turner'))

--get all poeple who are reporting to same manager of scott
select * from emp where mgr in
(select mgr from emp where ename in ('scott'))

select * from emp where sal in(
(select max(sal) from emp),
(select min(sal) from emp))


---cte
with cte as
(select *, sal*12 as 'annual_Sal' from emp)
select * from cte where annual_sal>=19000

with cte1 as
(select deptno, sum(sal) as sumsal, avg(sal) as avgsal from emp group by deptno)
select * from cte1

with cte2 as
(select *, dense_rank() over(order by sal desc) as rank from emp)
select * from cte2 where rank=3

select * from
(select top 4 sal from emp order by sal desc) as t1
except
select * from
(select top 3 sal from emp order by sal desc) as t2

---25-12-22
Begin transaction
insert into emp(empno,ename) values(9999,'ABCD'),(8888,'EFGH')
select * from emp
rollback 
select * from EMP

--ex-2
begin transaction
save transaction pointA
insert into emp(Empno,Ename) values(9999,'ABCD'),(8888,'EFGH')
save transaction pointB
update emp set sal=4500 where empno in (9999,8888)
save transaction pointC
select * from emp
rollback transaction pointB
select * from emp
commit transaction

--grouping sets
--similarily like cube

select deptno,job,sum(sal) as 'total salary'
from emp group by 
grouping sets((deptno,job),(deptno),(job))
order by deptno,job

--index
create index idx_emp_deptno on emp(deptno)

select * from emp where deptno=10

sp_help emp

--stored procedure
create or alter procedure sp_01
as
select * from emp

create or alter procedure sp_02
as
begin
select * from emp where deptno=10
end

create or alter procedure sp_03(@x1 int)
as
begin
select * from emp where deptno=@x1
end

exec sp_03 20

create or alter procedure sp_04(@x1 int,@x2 varchar(20))
as
begin
select * from emp where deptno=@x1 or job=@x2
end

exec sp_04 10,'Analyst'

create or alter procedure sp_05(@x1 int)
as
begin
	if exists(select * from emp where deptno=@X1)
		print 'records found'
	else
		print 'no records'
end

exec sp_05 50

create procedure sp_06(@x1 int)
as
begin
	if exists(select * from emp where deptno=@x1)
	begin
		print 'records found'
		select * from emp where deptno=@x1
	end
	else
		print 'no records found'
end

exec sp_06 30
------------*****************-------------------
create procedure sp_07(@a1 int,@x1 int output)
as
begin
select @x1=count(*) from emp where deptno=@a1
end

declare @b1 int
exec sp_07 30,@b1 output
print @b1

-------------*************************--------------
create procedure sp_08(@empno int,@sal int output)
as
begin
select @sal=sal from emp where empno=@empno
end

declare @s1 int
exec sp_08 7499,@s1 output
print @s1


--exception handling(is handled by try and catch block)
--ex 01
create procedure ex01(@x1 int,@y1 int)
as
begin
	declare @z1 int
	begin try
	set @z1=@x1/@y1
	end try
	begin catch
		select Error_message()
	end catch
	print @z1
end

exec ex01 50,30

------------***********************-----------------
create procedure ex02(@empno int, @ename varchar(20))
as
begin
	begin try
		insert into emp(EMPNO,ename) values(@empno,@ename)
	end try
	begin catch
		select Error_message()
	end catch
end

exec ex02 9999,'BCDEFPQRST'

select * from emp

---trigger
--like a stored procedure executed when event(insert,update,delete) happens
--cannot be executed manually by the user
--no triggers receive parameters


create trigger TRG_EMP_INSERT on emp for insert
as
begin
	print 'No data to be inserted in this table'
	rollback transaction
end

insert into emp(empno, ename) values(9988,'PQRS')

select * from emp

------------*************------------------
create table Empaudit_01(Empno int, Ename varchar(30))


create trigger Trg_insert_emp on emp for insert
as
begin
	Declare @id int, @En varchar(20)
	select @id=Empno,@En=Ename from inserted
	insert into Empaudit_01 values(@id,@En)
end

insert into emp(empno,ename,sal) values(9987,'ABCD',10000)

drop trigger Trg_insert_emp
drop table Empaudit_01

create table Empaudit_01(Empno int, Ename varchar(30))

create trigger Trg_INSERT_EMP on emp for insert
as
begin
	Declare @id int, @En varchar(20)
	select @id=Empno,@En=Ename from inserted
	insert into Empaudit_01 values(@id,@En)
end

insert into emp(empno,ename,sal) values(9977,'ABCDE',8000)


SELECT * FROM Empaudit_01
