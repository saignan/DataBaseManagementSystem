--creating the database
create database Employee_Management_System


--Used to switch Employee_Management_System
use Employee_Management_System

-- sytax to create a table
create table ProjectDetails
(
ProjectId int Not Null Primary key,
ProjectName varchar(30),
StartDate date,
EndDate date
)

create table Department
(
DepartmentId int Not Null primary key,
DepartmentName varchar(55) not null,
BlockNumber int,
NoOfEmployees int
)


create table Employee
(
EmpId int not null primary key,
EmpName varchar(60) not null,
Gender varchar(10),
Age int,
ContactNumber int,
DepartmentId int Foreign key references Department(DepartmentId),
ProjectId int Foreign key references ProjectDetails(ProjectId)
)

--changing the datatype 
alter table employee alter column ContactNumber bigint;

create table Dependent
(
DependentId int not null primary key,
Name varchar(60),
age int,gender varchar(10),ContactNumber int,
EmpId int not null foreign key references Employee(EmpId)
)

create table Salary
(
SalaryId int not null primary key,
DepartmentId int Foreign key references Department(DepartmentId),
Bonus date,
Amount money
)

alter table salary add TotalAmount int;
alter table salary alter column Amount int;
alter table salary add BonusAmount int;
alter table Dependent alter column ContactNumber bigint;

create table Payroll
(
PayrollId int not null primary key,
EmpId int not null foreign key references Employee(EmpId),
DepartmentId int Foreign key references Department(DepartmentId),
SalaryId int Foreign key references salary(SalaryId),
TaxAmount money,
TotalAmount money
)

alter table Payroll alter column TaxAmount int;
alter table Payroll alter column TotalAmount int;
alter table Dependent Add Relation varchar(30);

select * from ProjectDetails
--select * from Department
select * from Employee
select * from Dependent
select * from Payroll
select * from Salary



insert into Payroll values(5672,302,204,5004,1600,52200),(5673,303,204,5004,1600,52200),(5674,304,204,5004,2200,62200),
(5675,305,203,5003,1200,52200),(5676,306,203,5003,1200,52200),(5677,307,206,5006,2200,62200);


insert into Salary values(5001,201,'2023-12-31',15000,60000),(5002,202,'2023-12-31',10000,50000),(5004,204,'2023-12-31',25000,80000),
(5003,203,'2023-12-31',15000,50000),(5005,205,'2023-12-31',10000,50000),(5006,206,'2023-12-31',15000,60000),(5007,207,'2023-12-31',130000,65000);




insert into Dependent values(401,'Roshan',15,'Male',null,301,'Brother'),(402,'Mallesh',45,'Male',9876987651,301,'Father'),
(403,'Caden',20,'Male',89897654,302,'Brother'),(405,'Leo',55,'Male',9807678590,303,'Father'),(406,'Sophia',45,'Female',null,304,'Mother'),
(407,'Emma',48,'Female',7897896545,305,'Mother'),(408,'Emily',15,'Female',null,305,'Sister'),(409,'Mason',19,'Male',897896783,306,'Brother'),
(410,'Daniel',55,'Male',9086753453,306,'Father'),(411,'Colton',45,'Male',908767890,307,'Father'),(412,'Emily',45,'Female',8989786543,308,'Mother'),
(413,'Sarah',15,'Female',null,310,'Sister'),(414,'Mateo',15,'Male',9879876543,311,'Brother'),(416,'Luca',55,'Male',9632587412,312,'Father'),
(417,'Nova',15,'Female',8523697412,313,'Sister'),(418,'Aurora',35,'Female',6543219873,318,'Mother'),(419,'Aiden',65,'Male',8523697415,319,'Father'),
(420,'Scarlett',55,'Female',6549873215,319,'Mother'),(421,'Mason',65,'Male',8523697415,320,'Father');



INSERT INTO ProjectDetails
VALUES (101,'House Price prediction','2022-05-23','2024-06-03'),(102,'Anomoly prediction','2022-05-23','2024-06-03'),
(103,'Multiplayer Game','2022-05-23','2024-06-03'),(104,'Insta Automation Tool','2022-05-21','2024-06-10'),
(107,'SnapChat Automation Tool','2019-05-23','2024-06-03'),(105,'forecasting Tool','2020-05-23','2024-03-03'),
(106,'Weather Forecasting App','2023-05-23','2025-06-03');


insert into Department
values(201,'Finance',10,56),(202,'Marketing',8,80),
(203,'Security',9,68),(204,'Product Development',5,50),
(205,'Quality Assurance',6,100),(206,'Admin Department',7,30),
(207,'Business Development',3,48);

insert into Employee
values(315,'Shashi','Male',25,9876501111,204,106),(316,'Varun','Male',28,9659808897,205,101),(317,'Teja','Male',27,7809808461,203,106),
(318,'Vaishali','Female',27,6789108466,206,101),(319,'Dinesh','Male',29,6789408406,205,102),(320,'Priya','Female',25,6798708461,205,104),(301,'Raj','Male',25,9876543210,205,102);

---BuiltIn Functions
--Aggregate Functions--

select AVG(TotalAmount) AvgSalary from Salary;
select count(ProjectName) NumberOfProjectsAvailable from ProjectDetails;
select MAX(TotalAmount) MaxSalary from Payroll;
select MIN(Age) MinimumAge from Employee;
select SUM(NoOfEmployees) SumOfEmployees from Department;


select * from Employee;
select * from Payroll;
--String Functions--

SELECT EmpName,ASCII(EmpName) AS NumCodeOfFirstChar
FROM Employee order by NumCodeOfFirstChar;

SELECT CHAR(98) AS CodeToCharacter;
--The CHARINDEX() function searches for a substring in a string, and returns the position
SELECT CHARINDEX('o', 'employee') AS MatchPosition;

select concat(EmpName,' ',Age) as NameAge from Employee;

select EmpName+' '+Gender as NameGender from Employee;

--CONCAT_WS(separator, string1,.., string_n) function adds two or more strings together with a separator.
select concat_ws('-',EmpName,Age) as NameAge from Employee;

select max(DATALENGTH(EmpName)) as MaxLength from Employee;

SELECT DATALENGTH('Saignan     '); --o/p:12
SELECT LEN('Saignan    '); --o/p:7

select DIFFERENCE(TaxAmount,TotalAmount) from Payroll;

select FORMAT(ContactNumber,'+91 ###-###-####') as Numbers from Dependent;

DECLARE @d DATETIME = '05/24/2023';
SELECT FORMAT (@d, 'd', 'en-US') AS 'US English Result',
               FORMAT (@d, 'd', 'no') AS 'Norwegian Result',
               FORMAT (@d, 'd', 'zu') AS 'Zulu Result';

SELECT EmpName,LEFT(EmpName, 3) AS ExtractString from Employee;

select LOWER(Empname) as Name from Employee;

SELECT LTRIM('     Sai gnan      ') AS LeftTrimmedString; 





--1.Scalar Functions: 
SELECT dbo.mul(5,7); -- Output: 25

CREATE FUNCTION dbo.MUL(@number1 INT,@number2 Int)
RETURNS INT
AS
BEGIN
    DECLARE @result INT;
    SET @result = @number1 * @number2;
    RETURN @result;
END;

---2.Table Valued Function
CREATE FUNCTION dbo.GetEmployeesByProjectId(@ProjectId INT)
RETURNS TABLE
AS
RETURN (
    SELECT EmpID, EmpName
    FROM Employee
    WHERE ProjectId = @ProjectId
)

select * from dbo.GetEmployeesByProjectId(101);




select * from Employee;
select * from ProjectDetails;
---JOINS---
--INNER JOIN
---Write a query to print Employee names,who are assigned for 'House Price Prediction'project 
select e.EmpName from Employee as e Inner join ProjectDetails as p on 
p.ProjectId=e.ProjectId where p.ProjectName='House Price prediction';

--LEFT JOIN
select * from Employee as e Left join ProjectDetails as p on 
p.ProjectId=e.ProjectId;

--RIGHT JOIN
select * from Employee as e Right join ProjectDetails as p on 
p.ProjectId=e.ProjectId;

--FULL OUTER JOIN
select * from Employee as e full outer join Payroll as p on 
p.EmpId=e.EmpId;

--Self join
---write a query to retrive employeeId with is Dependent's Name
select distinct e1.EmpId as EmployeeId,e2.Name as DependentName from Dependent e1,Dependent e2
where e1.EmpId=e2.EmpId order by e1.EmpId;


---Indexing---
--Creating Index for Employee table
create index IndexColumn on employee(EmpName);

--Remove index
drop index IndexColumn on employee;
