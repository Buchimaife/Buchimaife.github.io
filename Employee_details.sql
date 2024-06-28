USE [Buchi database]
GO

SELECT [EmpId]
      ,[FullName]
      ,[ManagerId]
      ,[DateOfJoining]
      ,[City]
  FROM [dbo].[Employee_Details$]

GO

UPDATE [dbo].[Employee_Details$]
SET DateOfJoining = '2019-01-21'
WHERE EmpId = '121'

UPDATE [dbo].[Employee_Details$]
SET DateOfJoining = '2022-01-30'
WHERE EmpId = '321'

/* Write an SQL query to fetch the EmpId and FullName of all the employees working under 
the Manager with id – ‘986’*/

SELECT EmpId
      ,FullName
FROM  [dbo].[Employee_Details$]
WHERE ManagerId = '986'

/*Write an SQL query to fetch the different projects available from the EmployeeSalary table.*/

SELECT PROJECT
FROM [dbo].[Employee_Salary$]

/*Write an SQL query to fetch the count of employees working in project ‘P1’.*/

SELECT COUNT (*)
FROM [dbo].[Employee_Salary$]
WHERE PROJECT ='P1'

/*Write an SQL query to find the maximum, minimum, and average salary of the employees.*/

SELECT MAX (Salary)
FROM [dbo].[Employee_Salary$]

SELECT MIN (Salary)
FROM [dbo].[Employee_Salary$]

SELECT AVG (Salary)
FROM [dbo].[Employee_Salary$]

/*Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000.*/

SELECT (EmpID)
FROM [dbo].[Employee_Salary$]
WHERE Salary BETWEEN 9000 and 15000

/*Write an SQL query to fetch those employees who live in Toronto and work under the 
manager with ManagerId – 321.*/

SELECT*
FROM [dbo].[Employee_Details$]
WHERE City = 'Toronto' 
AND ManagerId = '321' 

/*Write an SQL query to fetch all the employees who either live in California or work 
under a manager with ManagerId – 321.*/

SELECT*
FROM [dbo].[Employee_Details$]
WHERE City ='California' 
OR ManagerId = '321'

/*Write an SQL query to fetch all those employees who work on Projects other than P1.*/

SELECT*
FROM [dbo].[Employee_Salary$]
WHERE Project != 'P1'

/*Write an SQL query to display the total salary of each employee adding the Salary with Variable value.*/

ALTER TABLE [dbo].[Employee_Salary$]
ADD [Total Salary] int
UPDATE  [dbo].[Employee_Salary$]
SET [Total Salary] = (Salary+Variable)

/*Write an SQL query to fetch the employees whose name begins with any two characters, 
followed by a text “hn” and ends with any sequence of characters.*/

SELECT*
FROM[dbo].[Employee_Details$]
WHERE FullName Like '__hn%'

/*Write an SQL query to fetch all the EmpIds which are present 
either of the tables – ‘EmployeeDetails’ and ‘EmployeeSalary’.*/

SELECT D.[EmpId]
FROM [dbo].[Employee_Details$] as D
FULL OUTER JOIN [dbo].[Employee_Salary$] as S
ON D.EmpId = S.EmpId
