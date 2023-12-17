USE BRANDS

CREATE TABLE EMPLOYEE_DETAILS
(
	EMPID INT,
	FULLNAME VARCHAR(20),
	MANAGERID INT,
	DATE_OF_JOINING DATE,
	CITY VARCHAR(20)
)


CREATE TABLE EMPLOYEE_SALARY
(
	EMPID INT,
	PROJECT VARCHAR(5),
	SALARY MONEY,
	VARIABLE MONEY
)

SELECT * FROM EMPLOYEE_DETAILS;

SELECT * FROM EMPLOYEE_SALARY;

INSERT INTO EMPLOYEE_DETAILS VALUES
(121,'John Snow',321,'2019-01-31','Toronto'),
(321,'Walter White',986,'2020-01-30','California'),
(421,'Kuldeep Rana',876,'2021-11-27','New Delhi')

INSERT INTO EMPLOYEE_SALARY VALUES
(121,'P1',8000,500),
(321,'P2',10000,1000),
(421,'P1',12000,0)

--ASSIGNMENT-1
------------------------------------------------------------
--Q1)SQL Query to fetch records that are present in one table but not in another table.

SELECT EMPID FROM EMPLOYEE_DETAILS
EXCEPT
SELECT EMPID FROM EMPLOYEE_SALARY

--Q2)SQL query to fetch all the employees who are not working on any project

SELECT *
FROM EMPLOYEE_DETAILS
WHERE EMPID NOT IN (SELECT EMPID FROM EMPLOYEE_SALARY)

--Q3)SQL query to fetch all the Employees from Employee who joined in the Year 2020.

SELECT *
FROM EMPLOYEE_DETAILS
WHERE YEAR(DATE_OF_JOINING) = 2020

--Q4)Fetch all employees from Employee who have a salary record in EmployeeSalary.

SELECT e.*
FROM EMPLOYEE_DETAILS e
JOIN EMPLOYEE_SALARY s
ON e.EMPID =s.EMPID

--Q5)Write an SQL query to fetch a project-wise count of employees.

SELECT PROJECT,COUNT(*) AS EMPLOYEE_COUNT
FROM EMPLOYEE_SALARY
GROUP BY PROJECT

--Q6)Fetch employee names and salaries even if the salary value is not present for the employee.

SELECT e.FULLNAME,S.SALARY
FROM EMPLOYEE_DETAILS e
JOIN EMPLOYEE_SALARY s
ON e.EMPID =s.EMPID

--Q7)Write an SQL query to fetch all the Employees who are also managers.

SELECT * FROM EMPLOYEE_DETAILS
WHERE EMPID IN (SELECT MANAGERID FROM EMPLOYEE_DETAILS)

--Q8)Write an SQL query to fetch duplicate records from Employee.

SELECT FULLNAME,COUNT(*)
FROM EMPLOYEE_DETAILS
GROUP BY FULLNAME
HAVING COUNT(*) > 1

--Q9)Write an SQL query to fetch only odd rows from the table.

SELECT *
FROM (SELECT *,ROW_NUMBER() OVER(ORDER BY EMPID) AS ROW_NUM
FROM EMPLOYEE_DETAILS) t1
where ROW_NUM%2 != 0 

--Q10)Write a query to find the 3rd highest salary from a table without top or limit keyword.

SELECT MAX(SALARY) FROM EMPLOYEE_SALARY 
WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEE_SALARY 
				WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEE_SALARY))

--ASSIGNMENT-2
--Ques.1. Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id – ‘986’.

SELECT EMPID,FULLNAME
FROM EMPLOYEE_DETAILS
WHERE MANAGERID = 986

--Ques.2. Write an SQL query to fetch the different projects available from the EmployeeSalary table.

SELECT DISTINCT PROJECT
FROM EMPLOYEE_SALARY

--Ques.3. Write an SQL query to fetch the count of employees working in project ‘P1’.

SELECT PROJECT,COUNT(*) NO_OF_EMPLOYEES
FROM EMPLOYEE_SALARY
WHERE PROJECT = 'P1'
GROUP BY PROJECT

--Ques.4. Write an SQL query to find the maximum, minimum, and average salary of the employees.

SELECT MAX(SALARY) MAX_SAL,MIN(SALARY) MIN_SAL,AVG(SALARY) AVG_SAL
FROM EMPLOYEE_SALARY

--Ques.5. Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000.

SELECT EMPID,SALARY
FROM EMPLOYEE_SALARY
WHERE SALARY BETWEEN 9000 AND 15000

--Ques.6. Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321.

SELECT *
FROM EMPLOYEE_DETAILS
WHERE CITY = 'TORONTO' AND MANAGERID = 321

--Ques.7. Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321.

SELECT *
FROM EMPLOYEE_DETAILS
WHERE CITY = 'CALIFORNIA' OR MANAGERID = 321

--Ques.8. Write an SQL query to fetch all those employees who work on Projects other than P1.

SELECT *
FROM EMPLOYEE_SALARY
WHERE PROJECT != 'P1'

--Ques.9. Write an SQL query to display the total salary of each employee adding the Salary with Variable value.

SELECT EMPID,SALARY + VARIABLE AS TOTAL_SALARY
FROM EMPLOYEE_SALARY

--Ques.10. Write an SQL query to fetch the employees whose name begins with any two characters, followed by a text “hn” and ends with any sequence of characters.

SELECT *
FROM EMPLOYEE_DETAILS
WHERE FULLNAME LIKE '__HN%'

--------------------------------------------------------------------------------
--ASSIGNMENT -3

--Ques.1 Write an SQL query to fetch all the EmpIds which are present in either of the tables – ‘EmployeeDetails’ and ‘EmployeeSalary’.

SELECT EMPID FROM EMPLOYEE_DETAILS
UNION
SELECT EMPID FROM EMPLOYEE_SALARY

--Ques.2 Write an SQL query to fetch common records between two tables.(i.e empid)

SELECT EMPID FROM EMPLOYEE_DETAILS
INTERSECT
SELECT EMPID FROM EMPLOYEE_SALARY

--Ques.3. Write an SQL query to fetch records that are present in one table but not in another table.
SELECT EMPID FROM EMPLOYEE_DETAILS
EXCEPT
SELECT EMPID FROM EMPLOYEE_SALARY

--Ques.4. Write an SQL query to fetch the EmpIds that are present in both the tables –  ‘EmployeeDetails’ and ‘EmployeeSalary.

SELECT EMPID FROM EMPLOYEE_DETAILS
INTERSECT
SELECT EMPID FROM EMPLOYEE_SALARY

--Ques.5. Write an SQL query to fetch the EmpIds that are present in EmployeeDetails but not in EmployeeSalary.

SELECT EMPID FROM EMPLOYEE_DETAILS
EXCEPT
SELECT EMPID FROM EMPLOYEE_SALARY

--Ques.6. Write an SQL query to fetch the employee’s full names and replace the space

SELECT REPLACE(FULLNAME,' ','_') AS FULLNAME FROM EMPLOYEE_DETAILS

--Ques.7. Write an SQL query to fetch the position of a given character(s) in a field.

SELECT CHARINDEX(' ',FULLNAME,1) AS SPACE_INDEX 
FROM EMPLOYEE_DETAILS

--Ques.8. Write an SQL query to display both the EmpId and ManagerId together

SELECT EMPID,MANAGERID
FROM EMPLOYEE_DETAILS

--Ques.9. Write a query to fetch only the first name(string before space) from the FullName column of the EmployeeDetails table.
--METHOD 1
SELECT SUBSTRING(FULLNAME,1,CHARINDEX(' ',FULLNAME,1)) AS FIRSTNAME
FROM EMPLOYEE_DETAILS

--METHOD 2
SELECT LEFT(FULLNAME,CHARINDEX(' ',FULLNAME,1)) AS FIRSTNAME
FROM EMPLOYEE_DETAILS 

--Ques.10. Write an SQL query to uppercase the name of the employee and lowercase the city values.

SELECT UPPER(FULLNAME),LOWER(CITY)
FROM EMPLOYEE_DETAILS

-----------------------------------------------------------------------------
--ASSIGNMENT -4

--Ques.1. Write an SQL query to find the count of the total occurrences of a particular character – ‘n’ in the FullName field.

SELECT FULLNAME,(LEN(FULLNAME) - LEN(REPLACE(FULLNAME,'N',''))) 
FROM EMPLOYEE_DETAILS

--Ques.2. Write an SQL query to update the employee names by removing leading and trailing spaces.

SELECT TRIM(FULLNAME)
FROM EMPLOYEE_DETAILS

--Ques.3. Fetch all the employees who are not working on any project.

SELECT * 
FROM EMPLOYEE_DETAILS
WHERE EMPID NOT IN (SELECT EMPID FROM EMPLOYEE_SALARY)

--Ques.4. Write an SQL query to fetch employee names having a salary greater than or equal to 5000 and less than or equal to 10000.

SELECT * 
FROM EMPLOYEE_SALARY
WHERE SALARY >= 5000 AND SALARY <= 10000

--Ques.5. Write an SQL query to find the current date-time.

SELECT GETDATE()

--Ques.6. Write an SQL query to fetch all the Employee details from the EmployeeDetails table who joined in the Year 2020.

SELECT *
FROM EMPLOYEE_DETAILS
WHERE YEAR(DATE_OF_JOINING) = 2020

--Ques.7. Write an SQL query to fetch all employee records from the EmployeeDetails table who have a salary record in the EmployeeSalary table.

SELECT * 
FROM EMPLOYEE_DETAILS
WHERE EMPID IN (SELECT EMPID FROM EMPLOYEE_SALARY)

--Ques.8. Write an SQL query to fetch the project-wise count of employees sorted by project’s count in descending order.

SELECT PROJECT,COUNT(*) 
FROM EMPLOYEE_SALARY
GROUP BY PROJECT
ORDER BY PROJECT DESC

--Ques.9. Write a query to fetch employee names and salary records. Display the employee details even if the salary record is not present for the employee.

INSERT INTO EMPLOYEE_DETAILS VALUES
(128,'AKSHAY SANAS',321,'2023-01-31','PUNE')


SELECT e.FULLNAME,s.SALARY
FROM EMPLOYEE_DETAILS e
LEFT JOIN EMPLOYEE_SALARY s
ON e.EMPID = s.EMPID

--Ques.10. Write an SQL query to join 3 tables.
--NOTE: say we have 3rd table as manager having manager_id ,name

SELECT e.FULLNAME,s.SALARY
FROM EMPLOYEE_DETAILS e
JOIN EMPLOYEE_SALARY s
ON e.EMPID = s.EMPID
JOIN MANAGER m
ON e.MANAGERID = m.MANAGERID


=======================ADVANCE ASSIGNMNET==============================================

CREATE TABLE EMPLOYEEINFO
(
	EmpID INT,
	EmpFname VARCHAR(20),
	EmpLname VARCHAR(20),
	Department VARCHAR(20),
	Project VARCHAR(20),
	Address VARCHAR(20),
	DOB DATE,
	Gender VARCHAR(20)
)


CREATE TABLE EMPLOYEEPOSITION
(
	EmplD INT,
	EmpPosition VARCHAR(10),
	Dateofjoining DATE,
	Salary MONEY
)

INSERT INTO EMPLOYEEINFO VALUES
(1,'Sanjay','Mehra','HR','P1','Hyderabad (HYD)','1976-12-01','M'),
(2,'Ananya','Mishra','Admin','P2','Delhi(DEL)','1968-05-02','F'),
(3,'Rohan','Diwan','Account','P3','Mumbai(B0M)','1980-01-01','M'),
(4,'Sonia','Kulkarni','HR','P1','Hyderabad (HYD)','1992-05-02','F'),
(5,'Ankit','Kapoor','Admin','P2','Delhi(DEL)','1994-07-03','M')


INSERT INTO EMPLOYEEPOSITION VALUES
(1,'Manager','01-05-2022',500000),
(2,'Executive','02-05-2022',75000),
(3,'Manager','01-05-2022',90000),
(2,'Lead','02-05-2022',85000),
(1,'Executive','01-05-2022',300000)

SELECT * FROM EMPLOYEEINFO

SELECT * FROM EMPLOYEEPOSITION
--------------------------------------------------------------------
--Q1)Write a query to fetch the EmpFname from the EmployeeInfo table in the upper case and use the ALIAS name as EmpName

SELECT UPPER(EmpFname) AS EmpName
FROM EMPLOYEEINFO

--Q2)Write a query to fetch the number of employees working in the department ‘HR’.

SELECT COUNT(EMPID)
FROM EMPLOYEEINFO
WHERE Department = 'HR'

--Q3)Write a query to get the current date.

SELECT GETDATE()

--Q4)Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.

SELECT LEFT(EmpLname,4)
FROM EMPLOYEEINFO

--Q5)Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table.

SELECT LEFT(Address,CHARINDEX('(',ADDRESS,1)-1) AS PLACE
FROM EMPLOYEEINFO

--Q6)Write a query to create a new table that consists of data and structure copied from the other table.

SELECT * INTO TEMP_TABLE
FROM EMPLOYEEINFO

SELECT * FROM TEMP_TABLE

--Q7)Write q query to find all the employees whose salary is between 50000 to 100000.

SELECT * 
FROM EMPLOYEEPOSITION
WHERE SALARY BETWEEN 50000 AND 100000

--Q8)Write a query to find the names of employees that begin with ‘S’

SELECT EmpFname
FROM EMPLOYEEINFO
WHERE EmpFname LIKE 'S%';

--Q9)Write a query to fetch top N records.

SELECT TOP 2 * FROM EMPLOYEEINFO

--Q10)Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. The first name and the last name must be separated with space.

SELECT CONCAT(EmpFname,' ',EmpLname) AS FULLNAME
FROM EMPLOYEEINFO

--Q11. Write a query find number of employees whose DOB is between 02/05/1960 to 31/12/1985 and are grouped according to gender

SELECT DOB,GENDER,COUNT(*)
FROM EMPLOYEEINFO
WHERE DOB BETWEEN '1960-05-02' AND '1985-12-31'
GROUP BY DOB,Gender

--Q12. Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in descending order and Department in the ascending order

SELECT *
FROM EMPLOYEEINFO
ORDER BY EmpLname DESC,Department ASC

--Q13. Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ and contains five alphabets.

SELECT *
FROM EMPLOYEEINFO
WHERE EmpLname LIKE '____A';

--Q14. Write a query to fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia” from the EmployeeInfo table.

SELECT *
FROM EMPLOYEEINFO
WHERE EmpFname NOT IN ('SANJAY','SONIA');

--Q15. Write a query to fetch details of employees with the address as “DELHI(DEL)”.

SELECT *
FROM EMPLOYEEINFO
WHERE Address = 'DELHI(DEL)' 

--Q16. Write a query to fetch all employees who also hold the managerial position.

SELECT *
FROM EMPLOYEEPOSITION
WHERE EmpPosition = 'MANAGER'

--Q17. Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order.

SELECT Department,COUNT(*) COUNT_OF_EMP
FROM EMPLOYEEINFO
GROUP BY Department

--Q18. Write a query to calculate the even and odd records from a table.

SELECT COUNT(*) AS EVEN_RECORDS
FROM EMPLOYEEINFO
WHERE EmpID%2 = 0

SELECT COUNT(*) AS ODD_RECORDS
FROM EMPLOYEEINFO
WHERE EmpID%2 != 0

--Q19. Write a SQL query to retrieve employee details from EmployeeInfo table who have a date of joining in the EmployeePosition table.

SELECT DISTINCT i.*,p.Dateofjoining
FROM EMPLOYEEINFO i
JOIN EMPLOYEEPOSITION p
ON i.EmpID = p.EmplD

--Q20. Write a query to retrieve two minimum and maximum salaries from the EmployeePosition table.

SELECT MIN(Salary) MIN_SALARY,MAX(Salary) MAX_SALARY
FROM EMPLOYEEPOSITION

--Q21. Write a query to find the Nth highest salary from the table without using TOP/limit keyword.
--SAY 2ND HIGHEST

SELECT MAX(Salary) 
FROM EMPLOYEEPOSITION
WHERE Salary < (SELECT MAX(Salary) FROM EMPLOYEEPOSITION)

--Write a query to retrieve duplicate records from a table.

SELECT EmplD,COUNT(*)
FROM EMPLOYEEPOSITION
GROUP BY EmplD
HAVING COUNT(*) > 1

--Q23. Write a query to retrieve the list of employees working in the same department.

SELECT Department,COUNT(*) AS EMPLOYEES
FROM EMPLOYEEINFO
GROUP BY Department

--Q24. Write a query to retrieve the last 3 records from the EmployeeInfo table.

SELECT TOP 3 * 
FROM EMPLOYEEINFO
ORDER BY EmpID DESC

--Q25. Write a query to find the third-highest salary from the EmpPosition table.

SELECT MAX(Salary) 
FROM EMPLOYEEPOSITION
WHERE Salary <(SELECT MAX(Salary) FROM EMPLOYEEPOSITION
				WHERE Salary < (SELECT MAX(Salary) FROM EMPLOYEEPOSITION))

--Q26. Write a query to display the first and the last record from the EmployeeInfo table.

SELECT * FROM EMPLOYEEINFO WHERE EmpID = (select min(EmpID) from EMPLOYEEINFO)
union
SELECT * FROM EMPLOYEEINFO WHERE EmpID = (select max(EmpID) from EMPLOYEEINFO)

--Q27. Write a query to add email validation to your database
--i.e get invalid email address rows

ALTER TABLE EMPLOYEEINFO
ALTER COLUMN EMAIL VARCHAR(50);

SELECT * FROM EMPLOYEEINFO
SELECT * FROM EMPLOYEEPOSITION

UPDATE EMPLOYEEINFO
SET EMAIL = 'Ananya.Mishra@gmail.com'
where EmpID = 2;

SELECT * FROM EMPLOYEEINFO
WHERE EMAIL NOT LIKE '%.%@gmail.com'

--Q28. Write a query to retrieve Departments who have less than 2 employees working in it.

SELECT Department,COUNT(*) EMPLOYEE_COUNT
FROM EMPLOYEEINFO
GROUP BY Department
HAVING COUNT(*) < 2

--Q29. Write a query to retrieve EmpPostion along with total salaries paid for each of them

SELECT EmpPosition,SUM(Salary) TOTAL_SALARY
FROM EMPLOYEEPOSITION
GROUP BY EmpPosition

--Q30. Write a query to fetch 50% records from the EmployeeInfo table.

SELECT TOP 50 PERCENT *
FROM EMPLOYEEINFO

