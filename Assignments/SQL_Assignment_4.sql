
USE DB1

--Create a Student table and ADD 20 records in them

CREATE TABLE STUDENT
(
	STUDENTID INT,
	NAME VARCHAR(20),
	SURNAME VARCHAR(20),
	BIRTHDATE DATE,
	GENDER CHAR(1),
	CLASS VARCHAR(10),
	POINT INT
)

DROP TABLE STUDENT

SELECT * FROM STUDENT

INSERT INTO STUDENT VALUES
(101,'akshay','sanas','1999-06-30','M','9Math',46),
(102,'rutik','sanas','1999-07-31','M','4Sci',67),
(103,'tushar','sanas','1999-08-31','M','8Eng',94),
(104,'sandip','engle','2000-08-31','M','10Math',94),
(105,'datta','badge','2001-08-31','M','10Sci',86),
(106,'rushi','mandal','2002-08-31','M','9Eng',86),
(107,'rohit','pawar','2003-08-31','M','5Hin',77),
(108,'prathmensh','nalawde','2000-01-31','M','4Mar',93),
(109,'vishal','kalshetty','2000-02-29','M','10Sci',88),
(110,'onkar','thakur','2000-03-31','M','7Eng',54),
(111,'shubham','bharti','2000-04-01','M','10Hin',81),
(112,'ganesh','shelar','2000-04-02','M','5Mar',95),
(113,'suraj','ravande','2000-04-03','M','6Eng',63),
(114,'yash','pandhare','2000-07-31','M','4Sci',46),
(115,'deepak','patil','2000-08-31','M','6Eng',87),
(116,'kunal','choudhari','2000-09-30','M','10Hin',54),
(117,'suyog','raskar','2000-10-31','M','6Mar',79),
(118,'prajakta','mankar','2000-11-30','F','5Eng',44),
(119,'bhagyashree','wagh','2000-12-31','F','5Sci',63),
(120,'sonali','kulkarni','2001-01-31','F','9Eng',87)

----------------------------------------------------------------
--List all the records in the student chart

SELECT * FROM STUDENT

--List the name surname and class of the student in the student table

SELECT NAME,SURNAME,CLASS
FROM STUDENT

--List the gender Female (F) records in the student table

SELECT *
FROM STUDENT
WHERE GENDER = 'F'

--List the names of each class in the way of being seen once in the student table

SELECT CLASS,COUNT(*) NO_OF_STUDENTS
FROM STUDENT
GROUP BY CLASS

--List the students with Female gender and the class 10Math in the student table

SELECT *
FROM STUDENT
WHERE GENDER = 'F' AND CLASS = '10Math';

--List the names, surnames and classes of the students in the class 10Math or 10Sci in the student table

SELECT NAME,SURNAME,CLASS
FROM STUDENT
WHERE CLASS = '10Math' OR CLASS = '10Sci'

--List the students name and surname by combining them as name surname in the student table

SELECT NAME +' '+ SURNAME AS FULLNAME
FROM STUDENT

--List the students with the names starting with “A” letter in the student table

SELECT *
FROM STUDENT
WHERE NAME LIKE 'A%'

--List the names and CLASS with POINTS between 50 and 95 

SELECT NAME,CLASS,POINT
FROM STUDENT
WHERE POINT BETWEEN 50 AND 95

--List the students with names TUSHAR AKSHAY and RUTIK in the student table

SELECT *
FROM STUDENT
WHERE NAME IN ('TUSHAR','AKSHAY', 'RUTIK');

--List the students with names starting with A D and K in the student table

SELECT *
FROM STUDENT
WHERE NAME LIKE 'A%' OR NAME LIKE 'D%' OR NAME LIKE 'K%'

--List the names surnames classes and genders of males in 9Math or females in 9His in the student table

SELECT NAME,SURNAME,CLASS,GENDER
FROM STUDENT
WHERE (GENDER = 'M' AND CLASS = '9Math') OR (GENDER = 'F' AND CLASS = '9His')

--List the males whose classes are 10Math or 10Bio

SELECT *
FROM STUDENT 
WHERE CLASS = '10Math' OR CLASS = '10Bio'

--List the students with birth year 1989 in the student table

SELECT *
FROM STUDENT
WHERE YEAR(BIRTHDATE) = 1989