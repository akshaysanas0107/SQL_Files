CREATE DATABASE SQL_PROJECT

USE SQL_PROJECT

--------------------------------------
CREATE TABLE EMPLOYEE_DETAILS
(
	EMPLOYEEID INT,
	FIRSTNAME VARCHAR(20),
	LASTNAME VARCHAR(20),
	SALARY MONEY,
	JOINING_DATE DATE,
	DEPARTMENT VARCHAR(10),
	GENDER VARCHAR(10)
)

INSERT INTO EMPLOYEE_DETAILS VALUES
(1,'vikas','ahlawat',600000,'2013-02-12 11:16','IT','MALE'),
(2,'nikita','jain',530000,'2013-02-13 11:16','HR','FEMALE'),
(3,'ashish','kumar',1000000,'2013-02-14 11:16','IT','MALE'),
(4,'nikhil','sharma',480000,'2013-02-15 11:16','HR','MALE'),
(5,'anish','kadian',500000,'2013-02-16 11:16','PAYROLL','MALE')

select * from EMPLOYEE_DETAILS
------------------------------------------------------------------------------
--1) Write a query to get all employee detail from "EmployeeDetail" table

select * from EMPLOYEE_DETAILS

--2) Write a query to get only "FirstName" column from "EmployeeDetail" table

select FIRSTNAME from EMPLOYEE_DETAILS

--3) Write a query to get FirstName in upper case as "First Name".

select UPPER(FIRSTNAME) AS FIRSTNAME from EMPLOYEE_DETAILS

--4) Write a query to get FirstName in LOWER case as "First Name".

select LOWER(FIRSTNAME) AS FIRSTNAME from EMPLOYEE_DETAILS

--5) Write a query for combine FirstName and LastName and display it as "Name" (also include white space between first name & last name)

SELECT CONCAT(FIRSTNAME,' ',LASTNAME) AS NAME
FROM EMPLOYEE_DETAILS

--6) Select employee detail whose name is "Vikas

SELECT *
FROM EMPLOYEE_DETAILS
WHERE FIRSTNAME = 'VIKAS'

--7) Get all employee detail from EmployeeDetail table whose "FirstName" start with latter 'a'

SELECT *
FROM EMPLOYEE_DETAILS
WHERE FIRSTNAME LIKE 'A%'

--8) Get all employee detail from EmployeeDetail table whose "FirstName" end with latter 'a'.

SELECT *
FROM EMPLOYEE_DETAILS
WHERE FIRSTNAME LIKE '%a'

--9. Get all employee details from EmployeeDetail table whose "FirstName" end with 'h'

SELECT *
FROM EMPLOYEE_DETAILS
WHERE FIRSTNAME LIKE '%h'

--10. Get all employee detail from EmployeeDetail table whose "FirstName" start with any single character between 'a-p'

SELECT *
FROM EMPLOYEE_DETAILS
WHERE FIRSTNAME LIKE '[a-p]%'

--11)Get all employee detail from EmployeeDetail table whose "FirstName" not start with any single character between 'a-p'

SELECT *
FROM EMPLOYEE_DETAILS
WHERE FIRSTNAME NOT LIKE '[a-p]%'

--12)Get all employee detail from EmployeeDetail table whose "Gender" end with 'le' and contain 4 letters. The Underscore(_) Wildcard Character represents any single character

SELECT *
FROM EMPLOYEE_DETAILS
WHERE GENDER LIKE '__le'

--13)Get all employee detail from EmployeeDetail table whose "FirstName" start with 'A' and contain 5 letters

SELECT *
FROM EMPLOYEE_DETAILS
WHERE FIRSTNAME LIKE 'a____'

--14)Get all employee detail from EmployeeDetail table whose "FirstName" containing '%'. ex:-"Vik%as".

SELECT *
FROM EMPLOYEE_DETAILS
WHERE FIRSTNAME LIKE '%[%]%'

--15)Get all unique "Department" from EmployeeDetail table

SELECT DISTINCT DEPARTMENT
FROM EMPLOYEE_DETAILS

--16)Get the highest "Salary" from EmployeeDetail table.

SELECT MAX(SALARY) AS HIGHEST_SALARY
FROM EMPLOYEE_DETAILS

--17)Get the lowest "Salary" from EmployeeDetail table

SELECT MIN(SALARY) AS LOWEST_SALARY
FROM EMPLOYEE_DETAILS

--18)Show "JoiningDate" in "dd mmm yyyy" format, ex- "15 Feb 2013

SELECT FORMAT(JOINING_DATE,'dd MMM yyyy') AS JOINING_DATE
FROM EMPLOYEE_DETAILS

--19)Show "JoiningDate" in "yyyy/mm/dd" format, ex- "2013/02/15"

SELECT FORMAT(JOINING_DATE,'yyyy/MM/dd') AS JOINING_DATE
FROM EMPLOYEE_DETAILS

--20)Show only time part of the "JoiningDate"

SELECT CONVERT(TIME,JOINING_DATE) AS TIME
FROM EMPLOYEE_DETAILS

--21)Get only Year part of "JoiningDate"

SELECT DATEPART(YEAR,JOINING_DATE) AS YEAR_JOINING_DATE
FROM EMPLOYEE_DETAILS

--22)Get only Month part of "JoiningDate”

SELECT DATEPART(MONTH,JOINING_DATE) AS MONTH_JOINING_DATE
FROM EMPLOYEE_DETAILS

--23)Get system date

SELECT GETDATE() AS SYS_DATE

--24)Get UTC date

SELECT GETUTCDATE() AS UTC_DATE

--a)Get the first name, current date, joiningdate and diff between current date and joining date in months.

SELECT FIRSTNAME,GETDATE() AS TODAY,JOINING_DATE,DATEDIFF(MONTH,JOINING_DATE,GETDATE()) AS DATE_DIFF
FROM EMPLOYEE_DETAILS

--25)Get the first name, current date, joiningdate and diff between current date and joining date in days.

SELECT FIRSTNAME,GETDATE() AS TODAY,JOINING_DATE,DATEDIFF(DAY,JOINING_DATE,GETDATE()) AS DATE_DIFF
FROM EMPLOYEE_DETAILS

--26)Get all employee details from EmployeeDetail table whose joining year is 2013

SELECT *
FROM EMPLOYEE_DETAILS
WHERE YEAR(JOINING_DATE) = 2013

--27)Get all employee details from EmployeeDetail table whose joining month is Jan(1)

SELECT *
FROM EMPLOYEE_DETAILS
WHERE MONTH(JOINING_DATE) = 1

--28)Get all employee details from EmployeeDetail table whose joining month is FEB(2)

SELECT *
FROM EMPLOYEE_DETAILS
WHERE MONTH(JOINING_DATE) = 2

--29)Get how many employee exist in "EmployeeDetail" table

SELECT COUNT(DISTINCT EMPLOYEEID) AS EMPLOYEES_COUNT
FROM EMPLOYEE_DETAILS

--30. Select only one/top 1 record from "EmployeeDetail" table

SELECT TOP 1 *
FROM EMPLOYEE_DETAILS

--31. Select all employee detail with First name "Vikas","Ashish", and "Nikhil".

SELECT *
FROM EMPLOYEE_DETAILS
WHERE FIRSTNAME IN ('VIKAS','ASHISH','NIKHIL')

--32. Select all employee detail with First name not in "Vikas","Ashish", and "Nikhil"

SELECT *
FROM EMPLOYEE_DETAILS
WHERE FIRSTNAME NOT IN ('VIKAS','ASHISH','NIKHIL')

--33. Select first name from "EmployeeDetail" table after removing white spaces from right side

SELECT RTRIM(FIRSTNAME)
FROM EMPLOYEE_DETAILS

--34. Select first name from "EmployeeDetail" table after removing white spaces from left side

SELECT LTRIM(FIRSTNAME)
FROM EMPLOYEE_DETAILS

--36. Display first name and Gender as M/F.(if male then M, if Female then F)

SELECT FIRSTNAME,
	CASE 
		WHEN GENDER = 'MALE' THEN 'M' 
	    WHEN GENDER = 'FEMALE' THEN 'F' 
	END	AS GENDER
FROM EMPLOYEE_DETAILS

--37. Select first name from "EmployeeDetail" table prifixed with "Hello

SELECT 'Hello ' + FIRSTNAME
FROM EMPLOYEE_DETAILS

--38.Get employee details from "EmployeeDetail" table whose Salary greater than 600000

SELECT *
FROM EMPLOYEE_DETAILS
WHERE SALARY > 600000

--39.Get employee details from "EmployeeDetail" table whose Salary less than 700000

SELECT *
FROM EMPLOYEE_DETAILS
WHERE SALARY < 700000

--40.Get employee details from "EmployeeDetail" table whose Salary between 500000 than 600000

SELECT *
FROM EMPLOYEE_DETAILS
WHERE SALARY BETWEEN 500000 AND 600000

--CREATE TABLE PROJECT_DETAILS

CREATE TABLE PROJECT_DETAILS
(
	ProjectDetailID INT,
	EmployeeDetailID INT,
	ProjectName VARCHAR(20)
)

INSERT INTO PROJECT_DETAILS VALUES
(1,1,'Task Track'),
(2,1,'CLP'),
(3,1,'Survey Managment'),
(4,2,'H R Managment'),
(5,3,'Task Track'),
(6,3,'GRS'),
(7,3,'DDS'),
(8,4,'HR Managrnent'),
(9,6,'GL Managment')


--41. Give records of ProjectDetail table

SELECT * FROM PROJECT_DETAILS

--42.Write the query to get the department and department wise total(sum) salary from "EmployeeDetail" table.

SELECT DEPARTMENT,SUM(SALARY) TOTAL_SALARY
FROM EMPLOYEE_DETAILS
GROUP BY DEPARTMENT

--43.Write the query to get the department and department wise total(sum) salary, display it in ascending order according to salary.

SELECT DEPARTMENT,SUM(SALARY) TOTAL_SALARY
FROM EMPLOYEE_DETAILS
GROUP BY DEPARTMENT
ORDER BY TOTAL_SALARY

--44. Write the query to get the department and department wise total(sum) salary, display it in descending order according to salary 

SELECT DEPARTMENT,SUM(SALARY) TOTAL_SALARY
FROM EMPLOYEE_DETAILS
GROUP BY DEPARTMENT
ORDER BY TOTAL_SALARY DESC

--45. Write the query to get the department, total no. of departments, total(sum) salary with respect to department from "EmployeeDetail" table.

SELECT DEPARTMENT,COUNT(DEPARTMENT) NO_OF_DEPARTMENTS,SUM(SALARY) TOTAL_SALARY
FROM EMPLOYEE_DETAILS
GROUP BY DEPARTMENT
ORDER BY TOTAL_SALARY DESC

--46.Get department wise average salary from "EmployeeDetail" table order by salary ascending

SELECT DEPARTMENT,AVG(SALARY) AVG_SALARY
FROM EMPLOYEE_DETAILS
GROUP BY DEPARTMENT
ORDER BY AVG_SALARY 

--47 .Get department wise maximum salary from "EmployeeDetail" table order by salary ascending

SELECT DEPARTMENT,MAX(SALARY) MAX_SALARY
FROM EMPLOYEE_DETAILS
GROUP BY DEPARTMENT
ORDER BY MAX_SALARY

--48.Get department wise minimum salary from "EmployeeDetail" table order by salary ascending.

SELECT DEPARTMENT,MIN(SALARY) MIN_SALARY
FROM EMPLOYEE_DETAILS
GROUP BY DEPARTMENT
ORDER BY MIN_SALARY

--49. Get department wise minimum salary from "EmployeeDetail" table order by salary descending

SELECT DEPARTMENT,MIN(SALARY) MIN_SALARY
FROM EMPLOYEE_DETAILS
GROUP BY DEPARTMENT
ORDER BY MIN_SALARY DESC

--50. Join both the table that is Employee and ProjectDetail based on some common paramter

SELECT *
FROM EMPLOYEE_DETAILS e
JOIN PROJECT_DETAILS p
ON e.EMPLOYEEID = p.EmployeeDetailID

--51. Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for those employee which have assigned project already.

SELECT e.FIRSTNAME,e.LASTNAME,p.ProjectName
FROM EMPLOYEE_DETAILS e
JOIN PROJECT_DETAILS p
ON e.EMPLOYEEID = p.EmployeeDetailID
ORDER BY e.FIRSTNAME

--52.Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee even they have not assigned project.

SELECT e.FIRSTNAME,e.LASTNAME,p.ProjectName
FROM EMPLOYEE_DETAILS e
LEFT JOIN PROJECT_DETAILS p
ON e.EMPLOYEEID = p.EmployeeDetailID
ORDER BY e.FIRSTNAME

--53) Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee if project is not assigned then display "-No Project Assigned"

SELECT e.FIRSTNAME,e.LASTNAME,
	CASE WHEN p.ProjectName IS NULL THEN 'NO PROJECT ASSIGNED'
		ELSE p.ProjectName
	END AS PROJECTNAME
FROM EMPLOYEE_DETAILS e
LEFT JOIN PROJECT_DETAILS p
ON e.EMPLOYEEID = p.EmployeeDetailID
ORDER BY e.FIRSTNAME

--54.Get all project name even they have not matching any employeeid, in left table, order by firstname from "EmployeeDetail" and "ProjectDetail

SELECT e.FIRSTNAME,e.LASTNAME,p.ProjectName
FROM EMPLOYEE_DETAILS e
RIGHT JOIN PROJECT_DETAILS p
ON e.EMPLOYEEID = p.EmployeeDetailID
ORDER BY e.FIRSTNAME

--55. Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL

SELECT e.FIRSTNAME,e.LASTNAME,p.ProjectName
FROM EMPLOYEE_DETAILS e
FULL JOIN PROJECT_DETAILS p
ON e.EMPLOYEEID = p.EmployeeDetailID
ORDER BY e.FIRSTNAME

--56. Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL

SELECT e.FIRSTNAME,e.LASTNAME,p.ProjectName
FROM EMPLOYEE_DETAILS e
FULL JOIN PROJECT_DETAILS p
ON e.EMPLOYEEID = p.EmployeeDetailID
ORDER BY e.FIRSTNAME

--57.Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL

SELECT e.FIRSTNAME,e.LASTNAME,p.ProjectName
FROM EMPLOYEE_DETAILS e
FULL JOIN PROJECT_DETAILS p
ON e.EMPLOYEEID = p.EmployeeDetailID
ORDER BY e.FIRSTNAME

--58.Write down the query to fetch EmployeeName & Project who has assign more than one project

WITH TABLE1 AS (SELECT e.EMPLOYEEID,e.FIRSTNAME,e.LASTNAME,COUNT(p.ProjectName) No_Of_Projects
				FROM EMPLOYEE_DETAILS e
				JOIN PROJECT_DETAILS p
				ON e.EMPLOYEEID = p.EmployeeDetailID
				GROUP BY e.EMPLOYEEID,e.EMPLOYEEID,e.FIRSTNAME,e.LASTNAME
				HAVING COUNT(p.ProjectName) > 1
				)

SELECT t.FIRSTNAME,t.LASTNAME,p.ProjectName
FROM TABLE1 t
JOIN PROJECT_DETAILS p
ON t.EMPLOYEEID = p.EmployeeDetailID

--59. Write down the query to fetch ProjectName on which more than one employee are working along with EmployeeName

SELECT e.FIRSTNAME,e.LASTNAME,p.ProjectName
FROM EMPLOYEE_DETAILS e
JOIN PROJECT_DETAILS p
ON e.EMPLOYEEID = p.EmployeeDetailID
WHERE p.ProjectName IN (
						SELECT ProjectName
						FROM PROJECT_DETAILS
						GROUP BY ProjectName
						HAVING COUNT(DISTINCT EmployeeDetailID) > 1
						)

--60. Apply Cross Join in Both the tables

SELECT *
FROM EMPLOYEE_DETAILS e
CROSS JOIN PROJECT_DETAILS p
