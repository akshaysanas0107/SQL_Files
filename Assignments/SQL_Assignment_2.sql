--Create   Database Name as Order_Stores_Data 

CREATE DATABASE ORDER_STORES_DATA

USE ORDER_STORES_DATA
-----------------------------------------------
--Create two Table names as Orders_Table and Stores_Table

CREATE TABLE ORDERS_TABLE
(
	OrderDate DATE,
	Region VARCHAR(20),
	Rep VARCHAR(20),
	Order_Item VARCHAR(20),
	Units INT,
	Unit_Cost MONEY,
	Total_Price MONEY,
	Order_Id INT
)

CREATE TABLE STORES_TABLE
(
	Store_Id INT,
	StoreType VARCHAR(2),
	Assortment INT,
	CompetitionDistance BIGINT,
	Month INT,
	Year INT,
	PromoInterval VARCHAR(10)
)

-------------------------------------------------------
--Insert All records present here in the Orders_table and Stores_Table.

INSERT INTO ORDERS_TABLE VALUES
('2021-01-06','East','Aruna','Pencil',95, 1.99 , 189.05 ,1),
('2021-01-23','Central','Kivell','Eraser',50, 2.99 , 999.50 ,2),
('2021-02-09','Central','Ganesh','',36, 3.99 , 179.64 ,3),
('2021-02-26','Central','Payal','',27, 4.99 , 539.73 ,4),
('2021-03-15','West','Sorvino','',56, 5.99 , 167.44 ,5),
('2021-04-01','East','Hitesh','Pencil',60, 6.99 , 299.40 ,6),
('2021-04-18','Central','Akshita','',75, 7.99 , 149.25 ,7),
('2021-05-05','Central','Ruchika','Books',90, 8.99 , 449.10 ,8),
('2021-05-22','West','Surbhi','',32, 9.99 , 63.68 ,9),
('2021-06-08','East','Jones','Suitcase',60, 10.99 , 539.40 ,10)


INSERT INTO STORES_TABLE VALUES
(1,'c',49,1270,9,2008,'Jan'),
(2,'a',411,570,11,2007,'Feb'),
(3,'a',412,14130,12,2006,'Mar'),
(4,'c',49,620,9,2009,''),
(5,'a',44,29910,4,2015,'May'),
(6,'a',412,310,12,2013,'June'),
(7,'a',44,24000,4,2013,''),
(8,'a',410,7520,10,2014,'Aug'),
(9,'a',48,2030,8,2000,''),
(10,'a',49,3160,9,2009,'Oct')

SELECT * FROM ORDERS_TABLE;

SELECT * FROM STORES_TABLE;

-------------------------------------------------------------
--Make Order_Id  Column as Primary Key

ALTER TABLE ORDERS_TABLE
ALTER COLUMN ORDER_ID INT NOT NULL

ALTER TABLE ORDERS_TABLE
ADD CONSTRAINT PK_ORDER_ID PRIMARY KEY (ORDER_ID)

---------------------------------------------------------------
--Add one Column Name as Store_Names and insert the records given above in Stores table

ALTER TABLE STORES_TABLE
ADD STORE_NAMES VARCHAR(20)

UPDATE STORES_TABLE
SET STORE_NAMES = 'Car'
WHERE Store_Id = 1;

SELECT * FROM STORES_TABLE;
-----------------------------------------------------
--Make Stored_Id as a Foreign Key with reference too Orders_Table 

ALTER TABLE STORES_TABLE
ADD CONSTRAINT FK_STORE_ID FOREIGN KEY(STORE_ID) REFERENCES ORDERS_TABLE(ORDER_ID)

----------------------------------------------------------------
/*Update the missing  records in the Order_item Column in Order_table missing
records are given in this sheet */

UPDATE ORDERS_TABLE
SET Order_Item = 'Compass'
WHERE Order_Id = 3;

SELECT * FROM ORDERS_TABLE;
-------------------------------------------------------------------
--Update the missing records in the PromoInterval Column in Stores Table.

SELECT * FROM STORES_TABLE;

UPDATE STORES_TABLE
SET PromoInterval = 'April'
WHERE Store_Id = 4;

--------------------------------------------------------------------------
--Rename the column name  of Assortment to Store_Nos in Stores_Table

sp_rename 'STORES_TABLE.ASSORTMENT' , 'STORE_Nos' , 'COLUMN';

SELECT * FROM STORES_TABLE;
----------------------------------------------------------------
/*Rename the column name  of Order_Item to Item_name  and Rep Column as Customers_name 
in Orders_Table  */
SELECT * FROM ORDERS_TABLE;

sp_rename 'ORDERS_TABLE.ORDER_ITEM','ITEM_NAME','COLUMN';

sp_rename 'ORDERS_TABLE.REP','CUSTOMERS_NAME','COLUMN';

------------------------------------------------------------------------
--Sort the Unit Cost of Orders_table in Descding order and Total column in Ascending order.

SELECT *
FROM ORDERS_TABLE
ORDER BY Unit_Cost DESC , Total_Price ASC

----------------------------------------------------------------------
--Convert Customers_name to Cus_Name  and find how many  Cus_Name in each region.

SELECT Region,COUNT(*) AS Cus_Name
FROM ORDERS_TABLE
GROUP BY Region

-------------------------------------------------------------------
--Find the sum of Total_Price Column and Unit Cost  in Orders_Table 

SELECT SUM(Total_Price) AS SUM_TOTAL_PRICE,
		SUM(Unit_Cost) AS SUM_UNIT_COST
FROM ORDERS_TABLE

--------------------------------------------------------------
/*Show me OrderDate  , Unit Cost  , StoreType and Year in One table and names 
that table as Order_Stores_Table.  */

SELECT o.OrderDate,o.Unit_Cost,s.StoreType,s.Year,s.store_names
FROM ORDERS_TABLE o
JOIN STORES_TABLE s
ON o.Order_Id = s.Store_Id 

-----------------------------------------------------------------------
--Give me Order_Item  and Region whose Order_Id is 4 , 5, 6 ,9
--NOTE: ORDER_ITEM IS RENAMED TO ITEM_NAME

SELECT ITEM_NAME , Region
FROM ORDERS_TABLE
WHERE Order_Id IN (4,5,6,9)

------------------------------------------------------------------
--Show me year  whose ComptetitionDistance is 29910  , 310 , 3160
SELECT * FROM STORES_TABLE;

SELECT YEAR
FROM STORES_TABLE
WHERE CompetitionDistance IN (29910,310,3160)

-------------------------------------------------------------------
--Give me that Item_name whose  Total_Price is greater than 200 and less than 400

SELECT ITEM_NAME
FROM ORDERS_TABLE
WHERE Total_Price BETWEEN 200 AND 400

--------------------------------------------------------------
--Rename the CompetitionDistance as CD and find the total CD in Stores_Table.

sp_rename 'STORES_TABLE.CompetitionDistance','CD','COLUMN';

SELECT * FROM STORES_TABLE

SELECT SUM(CD) AS TOTAL_CD
FROM STORES_TABLE

------------------------------------------------------------------
--What is the Total Count of Stores_Type and CD columns

SELECT STORETYPE,CD,COUNT(*) AS TOTAL_COUNT
FROM STORES_TABLE
GROUP BY STORETYPE,CD

---------------------------------------------------------
--Apply the Cross Join in  Orders_Table and Stores_Table

SELECT *
FROM ORDERS_TABLE 
CROSS JOIN STORES_TABLE 

---------------------------------------------------------
--DROP both the databases/TABLES

DROP TABLE STORES_TABLE

DROP TABLE ORDERS_TABLE
