SELECT*
FROM [dbo].['Employee Info$']

/*Write a query to fetch the EmpFname from the EmployeeInfo table in the upper case and use the ALIAS name as EmpName.*/

SELECT UPPER (EmpFname)
AS EmpName
FROM [dbo].['Employee Info$']

/*Write a query to fetch the number of employees working in the department ‘HR’.*/

SELECT COUNT(*)
FROM [dbo].['Employee Info$']
WHERE Department ='HR'

/*Write a query to get the current date.*/

SELECT GETDATE()

/*Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.*/

SELECT SUBSTRING(EmpLname,1,4) 
FROM [dbo].['Employee Info$']

/*Write a query to create a new table that consists of data and structure copied from the other table.*/

SELECT * INTO  [New Table]
FROM [dbo].['Employee Info$']

/*Write q query to find all the employees whose salary is between 50000 to 100000.*/

SELECT*
FROM [dbo].['Employee position$']
WHERE Salary BETWEEN '50000' AND '100000'

/*Write a query to find the names of employees that begin with ‘S’*/

SELECT*
FROM [dbo].['Employee Info$']
WHERE EmpFname Like 'S%'

/*Write a query to fetch top N records.*/

SELECT TOP (3)*
FROM [dbo].['Employee position$']
ORDER BY 'Salary' DESC

/*Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”.
The first name and the last name must be separated with space.*/

SELECT CONCAT (EmpFname, ' ', EmpLname) AS 'FullName'
FROM [dbo].['Employee Info$']

/*Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1975 
and are grouped according to gender*/

SELECT COUNT(*)
       ,Gender
FROM [dbo].['Employee Info$'] 
WHERE DOB BETWEEN '1970-05-02' AND '1975-12-31'
GROUP BY Gender

Write a query to fetch all the records from the EmployeeInfo table ordered by 
EmpLname in descending order and Department in the ascending order.*/

SELECT*
FROM [dbo].['Employee Info$']
ORDER BY 'EmpLname' DESC, 'Department' ASC

/*Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ 
and contains five alphabets.*/

SELECT*
FROM[dbo].['Employee Info$']
WHERE EmpLname LIKE '____A'

/* Write a query to fetch details of all employees excluding the employees 
with first names, “Sanjay” and “Sonia” from the EmployeeInfo table.*/

SELECT*
FROM [dbo].['Employee Info$']
WHERE EmpFname NOT IN ('Sanjay', 'Sonia')

/*Write a query to fetch details of employees with the address as “DELHI(DEL)”*/

SELECT*
FROM [dbo].['Employee Info$']
WHERE ADDRESS ='Delhi(DEL)'

/*Write a query to fetch all employees who also hold the managerial position.*/

SELECT*
FROM[dbo].['Employee position$']
WHERE EmpPosition = 'Manager'

/*****Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order*/
 
 SELECT Department,COUNT(EmpID) AS deptcountwise
 FROM[dbo].['Employee Info$']
 GROUP BY Department
 ORDER BY Department asc

/*Write a query to fetch Male employees in HR department*/

SELECT*
FROM [dbo].['Employee Info$']
WHERE Gender = 'M' AND  Department = 'HR'

/*****Write a SQL query to retrieve employee details from EmployeeInfo table 
who have a date of joining in the EmployeePosition table*/

SELECT*
FROM [dbo].['Employee Info$'] E
WHERE EXISTS
(SELECT* 
FROM [dbo].['Employee position$']P 
WHERE E.EmpId =p.EmpId)

/*****Write a query to retrieve two minimum and maximum salaries from the EmployeePosition table*/

/*To retrieve two minimum salaries*/

SELECT DISTINCT Salary 
FROM [dbo].['Employee position$'] E1 
WHERE 2 >= (SELECT COUNT(DISTINCT Salary)
FROM [dbo].['Employee position$'] E2 
WHERE E1.Salary >= E2.Salary) 
ORDER BY E1.Salary DESC;

/*To retrieve two maximum salaries:*/

SELECT DISTINCT Salary 
FROM[dbo].['Employee position$'] E1 
WHERE 2 >= (SELECT COUNT(DISTINCT Salary) 
FROM [dbo].['Employee position$'] E2 
WHERE E1.Salary <= E2.Salary) 
ORDER BY E1.Salary DESC;
