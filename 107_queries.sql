create database Assign_107

use Assign_107

CREATE TABLE Studies (PNAME varchar(20), INSTITUTE varchar(20), COURSE varchar(20), COURSE_FEE int )

INSERT INTO Studies
SELECT 'ANAND','SABHARI','PGDCA',4500 UNION ALL
SELECT 'ALTAF','COIT','DCA',7200 UNION ALL
SELECT 'JULIANA','BDPS','MCA',22000 UNION ALL
SELECT 'KAMALA','PRAGATHI','DCA',5000 UNION ALL
SELECT 'MARY','SABHARI','PGDCA ',4500 UNION ALL
SELECT 'NELSON','PRAGATHI','DAP',6200 UNION ALL
SELECT 'PATRICK','PRAGATHI','DCAP',5200 UNION ALL
SELECT 'QADIR','APPLE','HDCA',14000 UNION ALL
SELECT 'RAMESH','SABHARI','PGDCA',4500 UNION ALL
SELECT 'REBECCA','BRILLIANT','DCAP',11000 UNION ALL
SELECT 'REMITHA','BDPS','DCS',6000 UNION ALL
SELECT 'REVATHI','SABHARI','DAP',5000 UNION ALL
SELECT 'VIJAYA','BDPS','DCA',48000

select * from Studies

CREATE TABLE Software (PNAME varchar(20), TITLE varchar(20), DEVELOPIN varchar(20), SCOST decimal(10,2),  DCOST int, SOLD int)

INSERT INTO Software (PNAME, TITLE, DEVELOPIN, SCOST, DCOST, SOLD) Values
 ('MARY','README','CPP',300, 1200, 84),
 ('ANAND','PARACHUTES','BASIC',399.95, 6000, 43),
 ('ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9),
 ('JULIANA','INVENTORY','COBOL',3000, 3500, 0),
 ('KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7),
 ( 'MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4),
 ('MARY','CODE GENERATOR','C',4500, 20000, 23 ),
 ('PATTRICK','README','CPP',300, 1200, 84),
 ('QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11),
 ('QADIR','VACCINES','C',1900, 3100, 21 ),
 ('RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4 ),
 ('RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73 ),
 ('REMITHA','PC UTILITIES','C',725, 5000, 51),
 ('REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7 ),
 ('REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2 ),
 ('VIJAYA','TSR EDITOR','C',900, 700, 6);

 select * from Software

 CREATE TABLE Programmer (PNAME varchar(20), DOB date, DOJ date, GENDER varchar(2), PROF1 varchar(20), PROF2 varchar(20), SALARY int)
 
 INSERT INTO Programmer
SELECT 'ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200 UNION ALL
SELECT 'ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800 UNION ALL
SELECT 'JULIANA','31-Jan-60','21-Apr-90','F','COBOL','DBASE',3000 UNION ALL
SELECT 'KAMALA','30-Oct-68','02-Jan-92','F','C','DBASE',2900 UNION ALL
SELECT 'MARY','24-Jun-70','01-Feb-91','F','CPP','ORACLE',4500 UNION ALL
SELECT 'NELSON','11-Sep-85','11-Oct-89','M','COBOL','DBASE',2500 UNION ALL
SELECT 'PATTRICK','10-Nov-65','21-Apr-90','M','PASCAL','CLIPPER',2800 UNION ALL
SELECT 'QADIR','31-Aug-65','21-Apr-91','M','ASSEMBLY','C',3000 UNION ALL
SELECT 'RAMESH','03-May-67','28-Feb-91','M','PASCAL','DBASE',3200 UNION ALL
SELECT 'REBECCA','01-Jan-67','01-Dec-90','F','BASIC','COBOL',2500 UNION ALL
SELECT 'REMITHA','19-Apr-70','20-Apr-93','F','C','ASSEMBLY',3600 UNION ALL
SELECT 'REVATHI','02-Dec-69','02-Jan-92','F','PASCAL','BASIC',3700 UNION ALL
SELECT 'VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500

select * from Programmer


--1. Find out the selling cost AVG for packages developed in Pascal.
select avg(scost) as average_Cost from software where DEVELOPIN='PASCAL'

--2. Display Names, Ages of all Programmers.
select PName as Names,
YEAR(GETDATE())-YEAR(DOB) AS ages
from programmer

---3. Display the Names of those who have done the DAP Course.
select PNAME from Studies where COURSE='DAP'

--4. Display the Names and Date of Births of all Programmers Born in January
select PNAME,DOB from Programmer where MONTH(DOB)=01

--5. What is the Highest Number of copies sold by a Package?
select  MAX(Sold) as max_sold from Software
--practice
select PNAME,sold from software where sold in
(select max(sold) from software)

--6. Display lowest course Fee.
select COURSE_FEE,course  from studies where COURSE_FEE in
(select min(course_fee) from studies)

--7. How many programmers done the PGDCA Course?
select COUNT(PNAME) from Studies where COURSE='PGDCA'
select * from studies

--8. How much revenue has been earned thru sales of Packages Developed in C.
select * , (scost*sold) as Revenue from software where DEVELOPIN='c'

--9. Display the Details of the Software Developed by Ramesh.
select * from software where PNAME='RAMESH'

--10. How many Programmers Studied at Sabhari?
select count(PNAME) from studies where Institute='SABHARI'

--11. Display details of Packages whose sales crossed the 2000 Mark.
select *, (scost*sold) as Revenue from Software where (scost*sold)>2000 order by Revenue

--12. Display the Details of Packages for which Development Cost have been recovered.
select *, (scost*sold) as Revenue from software where (scost*sold)>DCOST

Select *, iif(scost*sold>dcost, 'recovered','not-recovered') as software_Status from Software

--13. What is the cost of the costliest software development in Basic?
select  max(DCOST) from software where DEVELOPIN='Basic'
--reference
select * from software where developin='basic' and dcost in
(select max(DCOST) from Software where DEVELOPIN='Basic')

--14. How many Packages Developed in DBASE?
select count(*) from software where DEVELOPIN='DBASE'

select * from Software


--15. How many programmers studied in Pragathi?
select count(*)  from Studies where institute='Pragathi'

--16. How many Programmers Paid 5000 to 10000 for their course?
select count(*) from Studies where COURSE_FEE between 5000 and 10000

--17. What is AVG Course Fee
select avg(COURSE_FEE) as avg_fee from Studies

--18. Display the details of the Programmers Knowing C.
select * from Programmer where PROF1='c' OR PROF2='C'

--19. How many Programmers know either COBOL or PASCAL.
SELECT count(*) FROM PROGRAMMER WHERE PROF1='COBOL' OR PROF1='PASCAL' OR PROF2='COBOL' OR PROF2='PASCAL';


--20 How many Programmers don't know PASCAL and C
SELECT * FROM programmer WHERE PROF1!='PASCAL' AND PROF2!='C' OR PROF2!='PASCAL'AND PROF2!='C'
SELECT * FROM Programmer
SELECT * FROM programmer WHERE PROF1!='PASCAL'OR PROF2!='C' OR PROF2!='PASCAL'OR PROF1!='C'

--21. How old is the Oldest Male Programmer.
select MAX(datediff(YEAR, dob, getdate()))
  from programmer

--22. What is the AVG age of Female Programmers? 
select avg(datediff(year,dob,getdate()))
from Programmer where Gender='F'


--23. Calculate the Experience in Years for each Programmer and Display with their names in Descending order.
SELECT pname,(datediff(year,doJ,getdate())) AS Exp_in_years
FROM PROGRAMMER order by Exp_in_years desc

--24. Who are the Programmers who celebrate their Birthday’s During the Current Month?
select *
from Programmer WHERE MONTH(dob)=12

--25. How many Female Programmers are there?
select count(*) from programmer where Gender='F'

---26. What are the Languages studied by Male Programmers.
select prof1,prof2 from Programmer where gender='M'

--27. What is the AVG Salary?
select avg(salary) as avg_sal from Programmer

--28. How many people draw salary 2000 to 4000?
select count(*) from Programmer where salary between 2000 and 4000

--29. Display the details of those who don’t know Clipper, COBOL or PASCAL.
select * from Programmer where PROF1 not in ('clipper','cobol','pascal') and
prof2 not in ('clipper','cobol','pascal')

--30. Display the Cost of Package Developed By each Programmer.
select  Pname, sum(SCOST) as cost_package from software group by Pname

--31. Display the sales values of the Packages Developed by the each Programmer.
select pname,sum(scost*sold) as sales_values from software group by pname

--32. Display the Number of Packages sold by Each Programmer.
select pname,sum(sold) as sold from Software group by pname

--33. Display the sales cost of the packages Developed by each Programmer Language wise.
select sum(scost*sold) as sales, DEVELOPIN from software group by DEVELOPIN

--34. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy.
select DEVELOPIN,avg(dcost)as avg_developcost,avg(scost)as avg_scost,avg(scost) as avg_pricepercopy from software group by DEVELOPIN

--35. Display each programmer’s name, costliest and cheapest Packages Developed by him or her.
select pname, min(dcost) as cheapest_package,max(dcost) as costliest_package from software group by pname

--36. Display each institute name with number of Courses, Average Cost per Course.
SELECT INSTITUTE, COUNT(COURSE) AS NO_OF_COURSES,AVG(COURSE_FEE) AS AVG_FEE FROM STUDIES GROUP BY INSTITUTE
SELECT * FROM STUDIES

----37. Display each institute Name with Number of Students. 
SELECT INSTITUTE,COUNT(*) AS NO_OF_STUDENTS FROM STUDIES GROUP BY INSTITUTE

--38. Display Names of Male and Female Programmers. Gender also.
select Gender,pname from programmer 

--39. Display the Name of Programmers and Their Packages.
select Pname,SALARY from Programmer

--40. Display the Number of Packages in Each Language Excep
select DEVELOPIN,count(title) as no_of_packages from software group by DEVELOPIN 
having developin not in('c','c++')

----41. Display the Number of Packages in Each Language for which Development Cost is less than 1000.
select count(title) as no_of_packages, DEVELOPIN from Software where dcost<1000 group by developin
select * from Software

--42. Display AVG Difference between SCOST, DCOST for Each Package.
select count(title) as package, avg(scost-dcost) as avg_Diff from software group by TITLE

--43. Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for Those Whose Cost has not yet been Recovered. 
select pname,sum(scost) as scost,sum(dcost) as dcost,sum(dcost-(scost*sold)) as Recovered from Software group by PNAME

--44.Display Highest, Lowest and Average Salaries for those earning more than 2000. 
select min(salary) as Lowest,max(salary) as Highest,avg(salary) as Average from Programmer where salary>2000

--45. Who is the Highest Paid C Programmers? 
select * FROM Programmer where salary in
(select max(salary) from programmer where prof1='c' or prof2='c')

--46. Who is the Highest Paid Female COBOL Programmer?
select * from programmer where salary IN
(select max(salary) from Programmer where (Prof1='cobol' or prof2='cobol')) and gender='Female';

SELECT * FROM PROGRAMMER WHERE SALARY=
(SELECT MAX(SALARY) FROM PROGRAMMER WHERE (PROF1 LIKE 'COBOL' OR PROF2 LIKE 'COBOL')) AND GENDER LIKE 'F';

--47. Display the names of the highest paid programmers for each Language. 
select P.PNAME,P.PROF1,P.SALARY from 
(SELECT MAX(SALARY) AS TOTAL_SALARY,PROF1 FROM Programmer GROUP BY PROF1) AS TEMP
INNER JOIN Programmer P on temp.PROF1 =p.prof1 and  temp.total_salary=p.salary


--48. Who is the least experienced Programmer. 
select MAX(DOJ) from Programmer


--49. Who is the most experienced male programmer knowing PASCAL. 
select top 1 PNAME from programmer where prof1='pascal' AND GENDER='M' order by DOJ

--50. Which Language is known by only one Programmer? 
select prof1 from programmer group by prof1 
having prof1 not in (select prof2 from Programmer) and count(prof1)=1
union
select prof2 from programmer group by PROF2
having prof2 not in (select prof1 from Programmer) and count(prof2)=1


--51. Who is the Above Programmer Referred in 50?
create table #temp(prof varchar(20))
insert into #temp
select prof1 from programmer group by prof1 
having prof1 not in (select prof2 from Programmer) and count(prof1)=1
union
select prof2 from programmer group by PROF2
having prof2 not in (select prof1 from Programmer) and count(prof2)=1
select pname,prof from programmer join #temp on prof=prof1 or prof=prof2


--52. Who is the Youngest Programmer knowing DBASE?
SELECT  top 1 * FROM PROGRAMMER WHERE PROF2='DBASE'  order by DOB DESC

--53. Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE?
SELECT * FROM PROGRAMMER WHERE gender='F' and  PROF1 NOT IN ('C','CPP') and prof2 not in ('c','ORACLE','DBASE')
and salary>3000 

--54. Which Institute has most number of Students?
select INSTITUTE,count(*) as count  from Studies group by INSTITUTE


--55. What is the Costliest course? 
select course, course_fee from studies where course_fee in
(select max(course_fee) from studies)

--56. Which course has been done by the most of the Students?
select course,count(PNAME) as cnt  from studies group by count(PNAME)
select * from Studies

--57. Which Institute conducts costliest course.
select  institute,course_fee from studies where course_fee in
(select max(course_fee) from studies)

--58. Display the name of the Institute and Course, which has below AVG course fee.
select institute,course from studies where course_fee <
(select avg(course_fee) from studies)


--59. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee,

SELECT course, course_fee FROM Studies where course_fee <
(select avg(course_fee)+1000 from Studies) and course_fee>
(select avg(course_fee)-1000 from studies)

select avg(course_fee)+1000 from Studies
select avg(course_fee)-1000 from Studies


--60. Which package has the Highest Development cost?
select title,dcost from Software where dcost in
(select max(dcost) from Software)


--61. Which course has below AVG number of Students?
select course,count(PNAME) as count from studies  group by course  having count(PNAME) <
(select avg(count(pname)) from studies)

--62. Which Package has the lowest selling cost?
select title,scost from Software where scost in
(select min(scost) from Software) 

--63. Who Developed the Package that has sold the least number of copies?
select pname from software where sold in
(select min(sold) from software)

--64. Which language has used to develop the package, which has the highest sales amount?
select developin,scost*sold from software where scost*sold in
(select max(scost*sold) from software)


--65. How many copies of package that has the least difference between development and selling cost where sold.
select title,sold from software where title in
(select title from software where (SCOST-DCOST) in
(select min(SCOST-DCOST) from Software))


--66. Which is the costliest package developed in PASCAL.
select title from Software where DCOST in
(select max(dcost) from software where DEVELOPIN='pascal')

--67. Which language was used to develop the most number of Packages.
select developin,count(title) from software group by developin


--68. Which programmer has developed the highest number of Packages? 
select pname,count(title) as total_packages from software group by pname

--69. Who is the Author of the Costliest Package?
select pname,DCOST from software where dcost in
(select max(dcost) from Software)

--70. Display the names of the packages, which have sold less than the AVG number of copies.
select title from software where sold <
(select avg(sold) from software)

---71. Who are the authors of the Packages, which have recovered more than double the Development cost? 
select distinct(pname) from software where sold*scost> DCOST*2

---72. Display the programmer Name and the cheapest packages developed by them in each language.
select pname,title,DEVELOPIN, DCOST from Software where dcost in
(select min(dcost) from software group by DEVELOPIN)

--73. Display the language used by each programmer to develop the Highest Selling and Lowest-selling package.
SELECT PNAME, DEVELOPIN FROM SOFTWARE WHERE SOLD IN (SELECT MAX(SOLD) FROM SOFTWARE GROUP BY PNAME)
UNION
SELECT PNAME, DEVELOPIN FROM SOFTWARE WHERE SOLD IN (SELECT MIN(SOLD) FROM SOFTWARE GROUP BY PNAME);



--74. Who is the youngest male Programmer born in 1965?
select Pname, DOB from Programmer where DATEDIFF(DD,DOB,GETDATE()) in
(select min(DATEDIFF(DD,DOB,GETDATE())) FROM Programmer where YEAR(DOB)=1965 and Gender='M')

---75. Who is the oldest Female Programmer who joined in 1992?
select pname from programmer where datediff(DD,DOJ,GETDATE()) in
(select max(datediff(dd,doj,getdate())) from Programmer where gender='F' and year(doj)=1992)

--76. In which year was the most number of Programmers born.
select year(dob) as year,count(PNAME)  from programmer group by year(dob) 

--77. In which month did most number of programmers join?
select month(doj) as Month,count(pname) as cnt from programmer group by month(Doj)

--78. In which language are most of the programmer’s proficient.
(select prof1,count(pname) as cnt from Programmer group by prof1)
union all
(select prof2, count(pname) as cnt from Programmer group by prof2) 

--79. Who are the male programmers earning below the AVG salary of Female Programmers? 
select pname, SALARY from programmer where gender='M' and salary <
(select avg(SALARY) from Programmer where gender='F')

--80. Who are the Female Programmers earning more than the Highest Paid?
select * from Programmer where GENDER='F' and SALARY >
(select max(Salary) from Programmer where gender='m')

--81. Which language has been stated as the proficiency by most of the Programmers?
select prof1 from Programmer group by PROF1 having prof1 in 
(select max(prof1) from programmer)
union
select prof2 from Programmer group by prof2 having prof2 in
(select max(prof2) from Programmer)

--82. Display the details of those who are drawing the same salary.
select * from programmer where salary in
(select salary from Programmer group by salary having count(salary)>1) 

--83. Display the details of the Software Developed by the Male Programmers Earning More than 3000/-.  
select * from Software s join Programmer p on 
s.PNAME=p.PNAME where gender='M' and Salary>3000

--84. Display the details of the packages developed in Pascal by the Female Programmers.
select title from software s join Programmer p
on s.pname=p.pname
where developin='pascal' and gender='F'


--85. Display the details of the Programmers who joined before 1990. 
select * from Programmer where year(doj)<1990

--86. Display the details of the Software Developed in C By female programmers of Pragathi.
select s.* from software s,studies st,programmer p 
where s.pname=p.pname and p.pname=s.pname and developin='C'  and gender='f' and institute='pragathi';

--87. Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise.
Select studies.institute, count(software.title) AS title, count(software.sold) As Sold, sum(software.sold*software.scost) AS sales 
from software,studies
where software.pname =studies.pname group by studies.institute;

--88. Display the details of the software developed in DBASE by Male Programmers, 
--who belong to the institute in which most number of Programmers studied.

select s.* from Software s, Programmer p
where s.PNAME=p.PNAME and gender='M' and DEVELOPIN='DBASE'

select institute, count(institute) as cnt from studies  group by institute

--89. Display the details of the software Developed by the male programmers Born before 1965 
--and female programmers born after 1975.
Select * from programmer where gender='M'
and year(Dob)<1965 or
gender='f' and year(dob)>1975 


--90. Display the details of the software that has developed in the language which is neither the
--first nor the second proficiency of the programmers.
select * from software
where DEVELOPIN in
(select distinct(prof2) from programmer
where prof2 not in(select prof1
from programmer));

--91. Display the details of the software developed by the male students of Sabhari.

select s.* from software s,studies st,programmer p 
where s.pname=st.pname and p.pname=s.pname and gender='m' and institute='sabhari';


--92. Display the names of the programmers who have not developed any packages.
select pname from Programmer where pname not in
(select pname from software)

--93. What is the total cost of the Software developed by the programmers of Apple?
select sum(DCOST) from Software s join studies st on s.PNAME=st.PNAME
where INSTITUTE='apple'

--94. Who are the programmers who joined on the same day?
select a.PNAME,a.DOJ from Programmer a ,Programmer b where a.DOJ=b.DOJ and
a.PNAME<>b.PNAME

--95. Who are the programmers who have the same Prof2? 
select distinct(p1.PNAME),p1.PROF2 from programmer p1,programmer p2 
where p1.prof2=p2.PROF2 and p1.pname<>p2.PNAME

--96. Display the total sales value of the software, institute wise.
select institute,sum(scost*sold) as sales from Software,Studies group by INSTITUTE

--97. In which institute does the person who developed the costliest package studied.
select institute,DCOST from Software s,Studies st where s.PNAME=st.PNAME group by institute,dcost having dcost in
(select max(dcost) from Software)


--98. Which language listed in prof1, prof2 has not been used to develop any package.
select prof1 from programmer where prof1 not in(select developin from software) union
select prof2 from Programmer where prof2 not in (select developin from Software)


--99. How much does the person who developed the highest selling package earn and what course did HE/SHE undergo
select s.SOLD,p.salary,st.course,s.SCOST from Software s,Programmer p,Studies st where s.pname=p.pname and p.PNAME=st.PNAME and Scost in
(select max(scost) from Software)

--100 What is the AVG salary for those whose software sales is more than 50,000/-.
select avg(salary) from programmer p,software s where p .PNAME=s.PNAME and sold*scost>50000;


--101. How many packages were developed by students, who studied in institute that charge the lowest course fee? 
select s.title,st.COURSE_FEE,st.INSTITUTE from software s,studies st where s.PNAME=st.PNAME and COURSE_FEE in
(select MIN(course_fee) from Studies)

--102. How many packages were developed by the person who developed the cheapest package, where did HE/SHE study?
select TITLE ,institute from Programmer p,Software s,Studies st where  p.pname=s.PNAME and s.pname=st.pname and DCOST in
(select min(dcost) from Software)


---103. How many packages were developed by the female programmers earning more than the highest paid male programmer? 
select title, s.PNAME from Programmer p,Software s where p.pname=s.PNAME and gender='f' and salary >
(select max(salary) from programmer where gender='m') 



--104. How many packages are developed by the most experienced programmer form BDPS
select count(*) from software s,programmer p
where p.pname=s.pname group by doj having min(doj)=(select min(doj)
from studies st,programmer p, software s
where p.pname=s.pname and st.pname=p.pname and (institute='bdps'));



--105. List the programmers (form the software table) and the institutes they studied.
select distinct(s.PNAME),st.INSTITUTE from software s, studies st where s.pname=st.PNAME 

--106. List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF.

create table #temp2
(prof varchar(20),Pname Varchar(20))

insert into #temp2
select distinct prof,Pname from #temp1


insert into #temp1
select distinct(prof2),Pname from Programmer



select prof,count(distinct p.pname) as no_of_programmer,count(s.title) from #temp2 t
inner join
Programmer p
on prof=PROF1 or prof=prof2
inner join Software S
on t.pname=s.PNAME
group by prof


select * from #temp2


--107. List the programmer names (from the programmer table) and No. Of Packages each has developed. 
select p.PNAME,count(title) as cnt from programmer p,software s where s.pname=p.pname group by p.pname