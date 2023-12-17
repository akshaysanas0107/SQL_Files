--Create University Database give any University name you want

CREATE DATABASE SPPU

USE SPPU
--2. Under this University Create four tables and each table should have following three Column named as:-
		
CREATE TABLE College_Table
(
	College_ID INT PRIMARY KEY,
	College_Name VARCHAR(30),
	College_Area VARCHAR(30)
)

CREATE TABLE Department_Table
(
	Dept_ID INT PRIMARY KEY,
	Dept_Name VARCHAR(30),
	Dept_Facility VARCHAR(30)
)

CREATE TABLE Professor_Table
(
	Professor_ID INT PRIMARY KEY,
	Professor_Name VARCHAR(30),
	Professor_Subject VARCHAR(30)
)


CREATE TABLE Student_Table
(
	Student_ID INT PRIMARY KEY,
	Student_Name VARCHAR(30),
	Student_Stream VARCHAR(30)
)


INSERT INTO College_Table VALUES
(1,'KSE','Handewadi'),
(2,'Sinhgad','Wadgoan'),
(3,'MMC','Kothrud'),
(4,'Garware','FC road'),
(5,'Sinhgad','Kondhwa');


