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
SELECT COUNT([Order ID]) AS "Total Orders"
FROM Portfolio.dbo.orders


-----Total Sales per country
SELECT [Order Date_Updated], [Country], ROUND(SUM([Sales]),2) AS "Total Sales"
FROM Portfolio.dbo.orders
GROUP BY [Order Date_Updated],[Country]


-----Average orders Per country
SELECT Country, ROUND(AVG(Sales),2) AS "Average orders"
FROM Portfolio.dbo.orders
GROUP BY Country



-----Orders per date/daily
SELECT [Order Date_Updated],[Coffee Type], COUNT(*) AS "Number of orders per day"
FROM Portfolio.dbo.orders
GROUP BY [Order Date_Updated], [Coffee Type]
ORDER BY [Order Date_Updated]



----Top 10 selling products
SELECT TOP 10
[Product ID], SUM(Quantity) AS "Total_quantity sold"
FROM Portfolio.dbo.orders
GROUP BY [Product ID]
ORDER BY "Total_quantity sold" DESC




-----Top 10 customer orders
SELECT *
FROM Portfolio.dbo.orders

SELECT TOP 10
[Customer ID], [Customer Name], COUNT(*) AS "Number of orders"
FROM Portfolio.dbo.orders
GROUP BY [Customer ID], [Customer Name]
ORDER BY "Number of orders" DESC



-------Total Number of orders overtime per country
SELECT *
FROM Portfolio.dbo.orders

SELECT
[Order Date_Updated],[Country], COUNT([Customer ID]) AS "Number of orders"
FROM Portfolio.dbo.orders
GROUP BY [Order Date_Updated],[Country]
ORDER BY [Order Date_Updated] DESC,"Number of orders" DESC


-----Average price per coffee type
SELECT [Coffee Type], ROUND(AVG([Unit Price]),2) AS "Average Price"
FROM Portfolio.dbo.orders
GROUP BY [Coffee Type]
ORDER BY "Average Price" DESC


-----Total roast type sales overtime per country
SELECT *
FROM Portfolio.dbo.orders

SELECT [Order Date_Updated],[Country], [Roast Type], ROUND(SUM([Sales]),2) AS "Total roast type sales per country"
FROM Portfolio.dbo.orders
GROUP BY [Order Date_Updated],[Country], [Roast Type]
ORDER BY [Country]





----Top selling coffee type
SELECT [Order Date_Updated],[Coffee Type], ROUND(SUM([Sales]),2) "Total Sales"
FROM Portfolio.dbo.orders
GROUP BY [Order Date_Updated],[Coffee Type]
ORDER BY [Order Date_Updated],"Total Sales" DESC


----
SELECT *
FROM Portfolio.dbo.orders


-----DELETE Column
ALTER TABLE Portfolio.dbo.orders
DROP COLUMN [Order Date]
