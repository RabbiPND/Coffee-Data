SELECT *
FROM Portfolio.dbo.orders


----Standardize the date
SELECT [Order Date]
FROM Portfolio.dbo.orders


ALTER TABLE Portfolio.dbo.orders
ADD "Order Date_Updated" DATE

UPDATE Portfolio.dbo.orders
SET "Order Date_Updated" = CAST([Order Date] AS DATE)

SELECT [Order Date], [Order Date_Updated]
FROM Portfolio.dbo.orders
------------------




-----Total number of orders
SELECT COUNT(*) AS "Total Orders"
FROM Portfolio.dbo.orders


-----Total Sales per country
SELECT Country, SUM(Sales) AS "Rotal Sales"
FROM Portfolio.dbo.orders
GROUP BY Country


-----Average orders Per country
SELECT Country, AVG(Sales) AS "Average orders"
FROM Portfolio.dbo.orders
GROUP BY Country



-----Orders per date/daily
SELECT [Order Date_Updated], COUNT(*) AS "Number of orders per day"
FROM Portfolio.dbo.orders
GROUP BY [Order Date_Updated]
ORDER BY [Order Date_Updated]



----Top 10 selling products
SELECT TOP 10
[Product ID], SUM(Quantity) AS "Total_quantity sold"
FROM Portfolio.dbo.orders
GROUP BY [Product ID]
ORDER BY "Total_quantity sold" DESC




-----Total numbers of orders per customer
SELECT *
FROM Portfolio.dbo.orders

SELECT TOP 10
[Customer ID], [Customer Name], COUNT(*) AS "Number of orders"
FROM Portfolio.dbo.orders
GROUP BY [Customer ID], [Customer Name]
ORDER BY "Number of orders" DESC



-----Average price per coffee type
SELECT [Coffee Type], ROUND(AVG([Unit Price]),2) AS "Average Price"
FROM Portfolio.dbo.orders
GROUP BY [Coffee Type]
ORDER BY "Average Price" DESC



----Top selling coffee type
SELECT [Coffee Type], ROUND(SUM(Sales),2) "Total Sales"
FROM Portfolio.dbo.orders
GROUP BY [Coffee Type]
ORDER BY "Total Sales" DESC


----
SELECT *
FROM Portfolio.dbo.orders


-----DELETE Column
ALTER TABLE Portfolio.dbo.orders
DROP COLUMN [Order Date]
