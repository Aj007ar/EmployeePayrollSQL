------------------ UC1 Create Database --------------------------------
create database Employee_Payroll
use Employee_Payroll
----------------------- UC2 Create Table ----------------------
create table employee_payroll(
EmployeeId int identity(1,1) primary key,
EmployeeName varchar(255),
EmployeeSalary float,
StartDate Date
)
-----UC-3 Insert Values to table-----
Insert into employee_payroll
(EmployeeName,EmployeeSalary,StartDate)
values('Ajay Rahod','750000','2020-10-07'),('Vijay','650000','2019-05-08'),('Priya','450500','2021-01-17'),('Asif','950500','2017-12-12');

-----UC-4 Retrieve all data from the table-----
select * from employee_payroll;

-----UC-5 Retrieve Specific Data-----
select * from employee_payroll where EmployeeName = 'Vijay';
select EmployeeSalary from employee_payroll where StartDate Between Cast('2019-01-01' as Date) and GETDATE();

-----UC-6  Alter the table to add gender column and update the values for each rows-----
Alter table employee_payroll Add Gender char(1);
update employee_payroll set Gender = 'M' where EmployeeName ='Vijay' or EmployeeName = 'Ajay Rathod' or EmployeeName = 'Asif';
update employee_payroll set Gender = 'F' where EmployeeName = 'Priya';

-----UC-7.1 Use aggregate function Sum of salary-----
select sum(EmployeeSalary)as TotalSalary,Gender from employee_payroll group by Gender;
-----UC-7.2 Use aggregate function Min of salary-----
select min(EmployeeSalary)as MinimumSalary,Gender from employee_payroll group by Gender;
-----UC-7.3 Use aggregate function Max of salary-----
select max(EmployeeSalary)as MaximumSalary,Gender from employee_payroll group by Gender;
-----UC-7.4 Use aggregate function Count based on Gender-----
select count(EmployeeName)as EmployeeCount,Gender from employee_payroll group by Gender;

-----UC-8 Ability to add further more columns-----
alter table employee_payroll Add EmployeePhoneNumber bigint, EmployeeDepartment varchar(255) not null default 'HR',EmployeeAddress varchar(255) default 'Yavatmal'
update employee_payroll set EmployeePhoneNumber = '7812453698',EmployeeAddress = 'Yavatmal' where EmployeeName = 'Ajay Rathod';
update employee_payroll set EmployeePhoneNumber = '7214587875',EmployeeAddress = 'Nagpur',EmployeeDepartment = 'Sales' where EmployeeName = 'Vijay';
update employee_payroll set EmployeePhoneNumber = '9814753647',EmployeeAddress = 'Pune' where EmployeeName = 'Asif';
update employee_payroll set EmployeePhoneNumber = '7345787969',EmployeeAddress = 'Mumbai', EmployeeDepartment = 'Customer Service' where EmployeeName = 'Priya';

-----UC-9 Ability to add salary details-----
sp_rename 'employee_payroll.EmployeeSalary','BasicPay'
alter table employee_payroll Add Deductions float,TaxablePay float,IncomeTax float,NetPay float
Update employee_payroll set Deductions = '24000' where EmployeeDepartment = 'HR'
Update employee_payroll set Deductions = '23000' where EmployeeDepartment = 'Sales'
Update employee_payroll set Deductions = '20000' where EmployeeDepartment = 'Customer Service'
Update employee_payroll set NetPay = (BasicPay-Deductions)
Update employee_payroll set TaxablePay = '1000'
Update employee_payroll set IncomeTax = '200'