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