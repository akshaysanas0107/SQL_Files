CREATE DATABASE Customers_Orders_Products 

USE Customers_Orders_Products 

----------------------------------------------
--Create three tables called as Customers, Orders ,Products

CREATE TABLE Customers 
(
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(100)
);

INSERT INTO Customers (CustomerID, Name, Email) VALUES
  (1, 'John Doe', 'johndoe@example.com'),
  (2, 'Jane Smith', 'janesmith@example.com'),
  (3, 'Robert Johnson', 'robertjohnson@example.com'),
  (4, 'Emily Brown', 'emilybrown@example.com'),
  (5, 'Michael Davis', 'michaeldavis@example.com'),
  (6, 'Sarah Wilson', 'sarahwilson@example.com'),
  (7, 'David Thompson', 'davidthompson@example.com'),
  (8, 'Jessica Lee', 'jessicalee@example.com'),
  (9, 'William Turner', 'williamturner@example.com'),
  (10, 'Olivia Martinez', 'oliviamartinez@example.com');


CREATE TABLE Orders 
(
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  ProductName VARCHAR(50),
  OrderDate DATE,
  Quantity INT
);

INSERT INTO Orders (OrderID, CustomerID, ProductName, OrderDate, Quantity) VALUES
  (1, 1, 'Product A', '2023-07-01', 5),
  (2, 2, 'Product B', '2023-07-02', 3),
  (3, 3, 'Product C', '2023-07-03', 2),
  (4, 4, 'Product A', '2023-07-04', 1),
  (5, 5, 'Product B', '2023-07-05', 4),
  (6, 6, 'Product C', '2023-07-06', 2),
  (7, 7, 'Product A', '2023-07-07', 3),
  (8, 8, 'Product B', '2023-07-08', 2),
  (9, 9, 'Product C', '2023-07-09', 5),
  (10, 10, 'Product A', '2023-07-10', 1);


CREATE TABLE Products 
(
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(50),
  Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, Price) VALUES
  (1, 'Product A', 10.99),
  (2, 'Product B', 8.99),
  (3, 'Product C', 5.99),
  (4, 'Product D', 12.99),
  (5, 'Product E', 7.99),
  (6, 'Product F', 6.99),
  (7, 'Product G', 9.99),
  (8, 'Product H', 11.99),
  (9, 'Product I', 14.99),
  (10, 'Product J', 4.99);


----------------------------------------------------------------------
SELECT * FROM Customers

SELECT * FROM Orders

SELECT * FROM PRODUCTS

-----------------------------------------
--               TASK 1                --
-----------------------------------------

--1.Write a query to retrieve all records from the Customers table.

SELECT * FROM Customers

--2.Write a query to retrieve the names and email addresses of customers whose names start with 'J'

SELECT NAME,Email
FROM Customers
WHERE NAME LIKE 'J%'

--3.Write a query to retrieve the order details (OrderID, ProductName, Quantity) for all orders..

SELECT OrderID,ProductName,Quantity
FROM Orders

--4.Write a query to calculate the total quantity of products ordered.

SELECT SUM(Quantity) AS TOTAL_QUANTITY_ORDERED
FROM Orders

--5.Write a query to retrieve the names of customers who have placed an order.

SELECT c.Name,o.ProductName
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID

--6.Write a query to retrieve the products with a price greater than $10.00.

SELECT	*
FROM PRODUCTS
WHERE Price > 10

--7.Write a query to retrieve the customer name and order date for all orders placed on or after '2023-07-05'.

SELECT c.Name,o.OrderDate
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE o.OrderDate >= '2023-07-05'

--8.Write a query to calculate the average price of all products.

SELECT AVG(Price) AS AVG_PRICE
FROM PRODUCTS

--9.Write a query to retrieve the customer names along with the total quantity of products they have ordered.

SELECT c.Name,o.Quantity
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID

--10.Write a query to retrieve the products that have not been ordered.

SELECT ProductName
FROM PRODUCTS
WHERE ProductName NOT IN (SELECT ProductName FROM Orders)

-----------------------------------------
--               TASK 2                --
-----------------------------------------

--1.Write a query to retrieve the top 5 customers who have placed the highest total quantity of orders.

--METHOD 1
SELECT c.Name,SUM(Quantity) AS TOTAL_QUANTITY
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.Name
ORDER BY TOTAL_QUANTITY DESC
OFFSET 0 ROWS 
FETCH NEXT 5 ROWS ONLY

--METHOD 2

SELECT TOP 5 c.Name,SUM(Quantity) AS TOTAL_QUANTITY
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.Name
ORDER BY TOTAL_QUANTITY DESC

--2.Write a query to calculate the average price of products for each product category.

SELECT ProductName,AVG(Price) AS AVG_PRICE
FROM PRODUCTS
GROUP BY ProductName

--3.Write a query to retrieve the customers who have not placed any orders.

SELECT CustomerID,Name
FROM Customers c
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders)

--4.Write a query to retrieve the order details (OrderID, ProductName, Quantity) for orders placed by customers whose names start with 'M'.

SELECT o.OrderID,o.ProductName,o.Quantity,c.Name
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE c.Name LIKE 'M%'


--5.Write a query to calculate the total revenue generated from all orders.

SELECT SUM(o.Quantity * p.Price) AS TOTAL_REVENUE
FROM Orders o
JOIN PRODUCTS p
ON o.ProductName = p.ProductName

--6.Write a query to retrieve the customer names along with the total revenue generated from their orders.

SELECT c.Name,(o.Quantity * p.Price) AS TOTAL_REVENUE
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
JOIN PRODUCTS p
ON p.ProductName = o.ProductName

--7.Write a query to retrieve the customers who have placed at least one order for each product category.

SELECT c.Name,COUNT(*) AS ORDERS_COUNT
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.Name
HAVING COUNT(*) >= 1


--8.Write a query to retrieve the customers who have placed orders on consecutive days.


SELECT CUSTOMERID,OrderDate		
FROM (	SELECT OrderID,OrderDate,CUSTOMERID,
		--LEAD(OrderDate) OVER(ORDER BY ORDERDATE) AS NEXT_ORDER_DATE,
		DATEDIFF(DAY,OrderDate,LEAD(OrderDate) OVER(ORDER BY ORDERDATE)) AS DATE_GAP
		FROM Orders
	)TABLE1
WHERE DATE_GAP = 1

--9.Write a query to retrieve the top 3 products with the highest average quantity ordered.

SELECT TOP 3 ProductName,AVG(Quantity) AVG_QTY
FROM Orders
GROUP BY ProductName
ORDER BY AVG_QTY DESC

--10.Write a query to calculate the percentage of orders that have a quantity greater than the average quantity.

WITH TABLE1 AS (SELECT OrderID,Quantity,COUNT(*) AS ORD_COUNT
				FROM Orders
				GROUP BY OrderID,Quantity
				HAVING QUANTITY > ( SELECT AVG(Quantity)
									FROM Orders )
				)

SELECT SUM(ORD_COUNT) * 100 /(SELECT COUNT(*) FROM ORDERS) AS ORDERS_PERCENT
FROM TABLE1


-----------------------------------------
--               TASK 3                --
-----------------------------------------

--1.Write a query to retrieve the customers who have placed orders for all products.

/*
SELECT c.CustomerID,c.NAME
FROM Customers c
	WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS AS p
						WHERE NOT EXISTS (SELECT 1 FROM Orders AS o
											WHERE O.CustomerID = c.CustomerID AND 
											o.ProductName = p.ProductName))
*/


INSERT INTO ORDERS VALUES
(12, 1, 'Product A', '2023-07-01', 5),
(13, 1, 'Product B', '2023-07-02', 3),
(14, 1, 'Product C', '2023-07-04', 2),
(15, 1, 'Product D', '2023-07-07', 1),
(16, 1, 'Product E', '2023-07-12', 4),
(17, 1, 'Product F', '2023-07-06', 2),
(18, 1, 'Product G', '2023-07-20', 3),
(19, 1, 'Product H', '2023-07-08', 2),
(20, 1, 'Product I', '2023-07-30', 5),
(21, 1, 'Product J', '2023-07-10', 1);


SELECT c.customerid, c.name, c.email
FROM Customers c
WHERE (SELECT COUNT(DISTINCT p.productid) FROM products p) = 
	  (SELECT COUNT(DISTINCT o.productname) FROM orders o WHERE o.customerid = c.customerid);


--2.Write a query to retrieve the products that have been ordered by all customers.
/*
SELECT p.ProductName
FROM PRODUCTS p
	WHERE NOT EXISTS (SELECT 1 FROM Customers AS c
						WHERE NOT EXISTS (SELECT 1 FROM Orders AS o
											WHERE O.CustomerID = c.CustomerID AND 
											o.ProductName = p.ProductName))
*/

SELECT p.ProductID,p.ProductName
FROM PRODUCTS p
WHERE (SELECT COUNT(DISTINCT c.CustomerID) FROM Customers c) = 
	  (SELECT COUNT(DISTINCT o.CustomerID) FROM Orders o WHERE o.ProductName = p.ProductName)


--3.Write a query to calculate the total revenue generated from orders placed in each month.

SELECT MONTH(OrderDate) AS MONTH,SUM(o.Quantity * p.Price) AS REVENUE
FROM Orders o
JOIN PRODUCTS p
ON o.ProductName = p.ProductName
GROUP BY MONTH(OrderDate)

--4.Write a query to retrieve the products that have been ordered by more than 50% of the customers.

SELECT p.ProductName
FROM Orders o
JOIN PRODUCTS p
ON o.ProductName = p.ProductName
GROUP BY p.ProductName
HAVING (COUNT(o.CustomerID) / (SELECT COUNT(CustomerID) FROM Customers)) > 0.5

--5.Write a query to retrieve the top 5 customers who have spent the highest amount of money on orders.

SELECT TOP 5 o.CustomerID,c.Name,SUM(o.Quantity * p.Price) AS AMOUNT
FROM Orders o
JOIN PRODUCTS p
ON o.ProductName = p.ProductName
JOIN Customers c
ON c.CustomerID = o.CustomerID
GROUP BY o.CustomerID,c.Name
ORDER BY AMOUNT DESC

--6.Write a query to calculate the running total of order quantities for each customer.

SELECT CustomerID,Quantity,
		SUM(Quantity) OVER(ORDER BY CustomerID) AS RUNNING_TOTAL
FROM Orders 

--7.Write a query to retrieve the top 3 most recent orders for each customer.

SELECT TOP 3 *
FROM Orders
ORDER BY OrderDate DESC

--8.Write a query to calculate the total revenue generated by each customer in the last 30 days.

SELECT o.CustomerID,SUM(o.Quantity * p.Price) AS TOTAL_REVENUE
FROM Orders o
JOIN PRODUCTS p
ON o.ProductName = p.ProductName
WHERE o.OrderDate >= DATEADD(day,-30,GETDATE())
GROUP BY o.CustomerID

--9.Write a query to retrieve the customers who have placed orders for at least two different product categories.

SELECT CustomerID,COUNT(*) AS PRODUCTS
FROM Orders
GROUP BY CustomerID
HAVING COUNT(*) > 1 

--10.Write a query to calculate the average revenue per order for each customer.

SELECT o.OrderID,o.CustomerID,AVG(o.Quantity * p.Price) AS AVG_REVENUE
FROM Orders o
JOIN PRODUCTS p
ON o.ProductName = p.ProductName
GROUP BY o.OrderID,o.CustomerID

--11.Write a query to retrieve the customers who have placed orders for every month of a specific year.

SELECT CustomerID
FROM Orders
WHERE YEAR(OrderDate) = 2023
GROUP BY CustomerID
HAVING COUNT(DISTINCT MONTH(OrderDate)) = 12

--12.Write a query to retrieve the customers who have placed orders for a specific product in consecutive months.

SELECT CUSTOMERID,OrderDate		
FROM (	SELECT OrderID,OrderDate,CUSTOMERID,
		DATEDIFF(MONTH,OrderDate,LEAD(OrderDate) OVER(ORDER BY ORDERDATE)) AS MONTH_GAP
		FROM Orders
	)TABLE1
WHERE MONTH_GAP = 1


--13.Write a query to retrieve the products that have been ordered by a specific customer at least twice.

SELECT ProductName,COUNT(ProductName) TIMES_ORDERED
FROM Orders
WHERE CustomerID = 3
GROUP BY ProductName
HAVING COUNT(ProductName) >= 2










