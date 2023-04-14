select * from customers

select concat(firstname,lastname) from customers

select firstname + ' ' +lastname from customers

select substring(firstname,2,4) from customers

select trim(    'nagendra'    )

select getdate()

--Advanced function
select iif(100>200,'True','False')

select convert(int,25.67)

exec sp_rename 'customers.firstname','first_name'



--25/01/2023
--scaler
create function test(@a int, @b int) 
returns int as 
begin return @a * @b
end
select dbo.test(1,3)

--check the below function
create function MyFunc(@A as int,@B as int) 
Returns int AS 
Begin
Declare @Result as int Set 
@Result=@A/@B Return @Result End
select DBO.MyFunc(30,6)

--which query will show the result of given query
CREATE PROCEDURE Stud @Class int as 
Select Student_name,Student_Class from [dbo].[Students] 
where Student_Class =@Class
GO

Exec dbo.stud @class=10

--Table valued func
select * from orders

create function tbl_orders(@orderid int)
returns table
return
select orderid, orderdate,amount from orders where orderid=@orderid

--------Triggers--------
---It helps us to automate the tasks such as insertion, updation, deletio
--3 types of triggers(DDL,DML,Logon)

create trigger trg_ddl
on database
for create_table
as begin
print('New table created on database Jan22')
end

create table a(id int)

--alter table
create trigger trg_alter
on database
for alter_table
as begin
print('Table has been altered in database tanvi')
end

alter table a add name varchar(20)



create table DML(id int)
create table DML_insert(id int)

---DML
create trigger trg_Dml on dml
for insert
as beginn
declare @id int
select @id=id from inserted
print cast(@id as varchar(5)) + 'inserted in DML table'
end

insert into dml values(20)

--Logon triggers
select * from sys.dm_exec_Sessions

select is_user_process,original_login_name from sys.dm_exec_sessions
order by is_user_process desc







