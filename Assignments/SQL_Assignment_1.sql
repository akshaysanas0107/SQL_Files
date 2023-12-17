--Create two Databases Name :- Brands , and  Products

CREATE DATABASE BRANDS

CREATE DATABASE PRODUCTS
-----------------------------------------

/*Create two tables in SQL Server  name  as ITEMS_Table in Brands database and 
PRODUCT_Table in Products database
*/
USE BRANDS

CREATE TABLE ITEMS_Table
(
	Item_Id int,
	Item_Description varchar(40),
	Vendor_nos int,
	Vendor_name varchar(40),
	Bottle_Size int,
	Bottle_Price money
)

USE PRODUCTS

CREATE TABLE PRODUCT_Table
(
	Product_Id int,
	Country varchar(20),
	Product varchar(20),
	Units_Sold decimal,
	Manufacturing_Price money, 
	Sale_Price money,
	Gross_Sales money,
	Sales money,
	COGS money,
	Profit money,
	Date_ date,
	Month_Number int,
	Month_Name varchar(20),
	Year_Number int
)


--------------------------------
USE BRANDS
SELECT * FROM ITEMS_Table;

USE PRODUCTS
SELECT * FROM PRODUCT_Table;

--------------------------------------
/*After Creating both the tables Add records in that tables (records are available above)
*/

USE	BRANDS

INSERT INTO [dbo].[ITEMS_Table] VALUES (1,'Travis Hasse Apple Pie',305,'Mhw Ltd',750,9.77),
(2,'D aristi Xtabentun',391,'Anchor Distilling (preiss Imports)',750,14.12),
(3,'Hiram Walker Peach Brandy',370,'Pernod Ricard Usa/austin Nichols',1000,6.50),
(4,'Oak Cross Whisky',305,'Mhw Ltd',750,25.33),
(5,'Uv Red(cherry) Vodka',380,'Phillips Beverage Company',200,1.97),
(6,'Heaven Hill Old Style White Label',259,'Heaven Hill Distilleries Inc.',750,6.37),
(7,'Hyde Herbal Liqueur',194,'Fire Tail Brands Llc',750,5.06),
(8,'Dupont Calvados Fine Reserve',403,'Robert Kacher Selections',750,23.61)

-----------------------------------------------------
USE PRODUCTS

INSERT INTO [dbo].[PRODUCT_Table] VALUES
(1,'Canada','Carretera',1618.5,3,20,32370,32370,16185,16185,'2014-01-01',1,'January',2014),
(2,'Germany','Carretera',1321,3,20,26420,26420,13210,13210,'2015-01-01',2,'January',2015),
(3,'France','Carretera',2178,3,15,32670,32670,21780,21780,'2016-01-06',3,'June',2016),
(4,'Germany','Carretera',888,3,15,13320,13320,8880,8880,'2017-01-06',4,'June',2017),
(5,'Mexico','Carretera',2470,3,15,37050,37050,24700,24700,'2018-01-06',5,'June',2018),
(6,'Germany','Carretera',1513,3,350,529550,529550,393380,393380,'2019-01-12',6,'December',2019),
(7,'Germany','Montana',921,5,15,13815,13815,9210,9210,'2020-01-03',7,'March',2020),
(8,'Canada','Montana',2518,5,12,30216,30216,7554,7554,'2021-01-06',8,'June',2021);

---------------------------------------------------------
/*Delete those product having the Units Sold 1618.5 , 888 and 2470  */

USE PRODUCTS

DELETE FROM [dbo].[PRODUCT_Table]
WHERE Units_Sold IN (1619 ,888,2470);
 
SELECT * FROM PRODUCT_Table;

----------------------------------------------
--DROP the table and Create it again.

USE BRANDS
DROP TABLE [dbo].[ITEMS_Table]

USE PRODUCTS
DROP TABLE [dbo].[PRODUCT_Table]

------------------------------------------
--CREATING BOTH TABLES IN THE SAME DATABASE BRANDS
USE BRANDS

CREATE TABLE ITEMS_Table
(
	Item_Id int,
	Item_Description varchar(40),
	Vendor_nos int,
	Vendor_name varchar(40),
	Bottle_Size int,
	Bottle_Price money
)


CREATE TABLE PRODUCT_Table
(
	Product_Id int,
	Country varchar(20),
	Product varchar(20),
	Units_Sold decimal,
	Manufacturing_Price money, 
	Sale_Price money,
	Gross_Sales money,
	Sales money,
	COGS money,
	Profit money,
	Date_ date,
	Month_Number int,
	Month_Name varchar(20),
	Year_Number int
)

----------------------------------------

SELECT * FROM ITEMS_Table;

SELECT * FROM PRODUCT_Table;

-----------------------------------------------
--Find the Total Sale Price  and  Gross Sales 

SELECT SUM(Sale_Price) AS TOTAL_SALE_PRICE,
		SUM(Gross_Sales) AS TOTAL_GROSS_SALES
FROM PRODUCT_Table

--------------------------------------------------
--In which year we have got the highest sales

SELECT YEAR_NUMBER,SALES
FROM PRODUCT_Table
WHERE SALES =(SELECT MAX(Sales) FROM PRODUCT_Table)

-------------------------------------------------------
--Which Product having the sales of $ 37,050.00

SELECT *
FROM PRODUCT_Table
WHERE SALES = 37050;

--------------------------------------------------------
--Which Countries lies between profit of $ 4,605 to $  22 , 662.00

SELECT Country,Profit
FROM PRODUCT_Table
WHERE Profit BETWEEN 4605 AND 22662;

------------------------------------------------------------
--Which Product Id having the sales of $ 24 , 700.00

SELECT Product_Id,Sales
FROM PRODUCT_Table
WHERE Sales = 24700;

------------------------------------------------------
--Find the item_description having the bottle size of 750

SELECT Item_Description,Bottle_Size
FROM ITEMS_Table
WHERE Bottle_Size = 750;

---------------------------------------------------------
--Find the vendor Name having the vendor_nos 305 , 380 , 391

SELECT Vendor_name,Vendor_nos
FROM ITEMS_Table
WHERE Vendor_nos IN (305,380,391);

--------------------------------------------------------------
--What is total Bottle_price 

SELECT SUM(Bottle_Price) AS TOTAL_BOTTLE_PRICE
FROM ITEMS_Table;

--------------------------------------------------------------
--Make Primary Key to Item_id

ALTER TABLE ITEMS_Table
ALTER COLUMN ITEM_ID INT NOT NULL;

ALTER TABLE ITEMS_Table
ADD CONSTRAINT PK_ITEM_ID PRIMARY KEY (ITEM_ID);

-----------------------------------------------------------------
--Which item id having the bottle_price of $ 5.06

SELECT Item_Id,Bottle_Price
FROM ITEMS_Table
WHERE Bottle_Price = 5.06;
------------------------------------------------------------------
--Apply INNER  , FULL OUTER , LEFT JOIN types on both the table 

SELECT * FROM ITEMS_Table;

SELECT * FROM PRODUCT_Table;

--INNER JOIN
SELECT i.*,p.*
FROM ITEMS_Table i
INNER JOIN PRODUCT_Table p
ON i.Item_Id = p.Product_Id;


--FULL JOIN
SELECT i.*,p.*
FROM ITEMS_Table i
FULL JOIN PRODUCT_Table p
ON i.Item_Id = p.Product_Id;

--LEFT JOIN
SELECT i.*,p.*
FROM ITEMS_Table i
LEFT JOIN PRODUCT_Table p
ON i.Item_Id = p.Product_Id;

----------------------------------------------------------------
--Apply  RIGHT JOIN , CROSS JOIN types  on both the table 

--RIGHT JOIN
SELECT i.*,p.*
FROM ITEMS_Table i
RIGHT JOIN PRODUCT_Table p
ON i.Item_Id = p.Product_Id;

--CROSS JOIN
SELECT i.*,p.*
FROM ITEMS_Table i
CROSS JOIN PRODUCT_Table p

-----------------------------------------------------------------
--Find the item_description and Product having the gross sales of 13,320.00

SELECT i.Item_Description,p.Product,p.Gross_Sales
FROM ITEMS_Table i
JOIN PRODUCT_Table p
ON i.Item_Id = p.Product_Id
WHERE p.Gross_Sales = 13320;


----------------------------------------------------------------
--Split the Item_description Column into Columns Item_desc1 and Item_desc2

select 
SUBSTRING(Item_description,1 , CHARINDEX(' ',Item_description)-1) AS Item_desc1,
SUBSTRING(Item_description , CHARINDEX(' ' ,Item_description)+1, LEN(Item_description))AS Item_Desc2
FROM ITEMS_Table
