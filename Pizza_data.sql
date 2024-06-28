USE [Buchi database]
GO

SELECT [pizza_id]
      ,[order_id]
      ,[pizza_name_id]
      ,[quantity]
      ,[order_date]
      ,[order_time]
      ,[unit_price]
      ,[total_price]
      ,[pizza_size]
      ,[pizza_category]
      ,[pizza_ingredients]
      ,[pizza_name]
  FROM [dbo].[pizza_sales$]

GO

/*EXTRACT THE FOLLOWING DATA ON SQL:*/

/*1. Total Revenue*/

SELECT SUM (quantity*unit_price) AS 'Total Revenue'
FROM [dbo].[pizza_sales$]

/*2. Total Pizzas Sold*/

SELECT SUM(quantity)
AS 'Total Pizzas Sold'
FROM [dbo].[pizza_sales$]

/*3. Total number of Orders*/

SELECT COUNT(Distinct order_id)
AS Tota_number_of_Orders
FROM [dbo].[pizza_sales$]

/*4. How many order Veggie pizza category was sold*/

SELECT SUM(quantity)
FROM [dbo].[pizza_sales$]
WHERE pizza_category = 'Veggie'

/*5. How many  The Hawaiian Pizza and  The Greek Pizza  was sold*/

SELECT COUNT (*) 
FROM [dbo].[pizza_sales$]
WHERE Pizza_name  IN  ('The Hawaiian Pizza',  'The Greek Pizza')

/*List of pizza ordered in January 2015*/

SELECT*
FROM[dbo].[pizza_sales$]
WHERE order_date BETWEEN  '2015-01-01' AND  '2015-01-31'

/*List of pizza ordered between 1st of November till 31st December 2015*/


SELECT*
FROM[dbo].[pizza_sales$]
WHERE order_date BETWEEN  '2015-11-01' AND  '2015-12-31'

/***What is the quantity of The Spinach Supreme Pizza sold in March 2015*/

SELECT SUM (quantity) 
FROM [dbo].[pizza_sales$]
WHERE Pizza_name = 'The Spinach Supreme Pizza' 
AND order_date BETWEEN  '2015-03-01' And   '2015-03-31'

/*List of Medium pizza sold*/

SELECT*
FROM [dbo].[pizza_sales$]
WHERE pizza_size = 'M'

/*List of pizza that sold for more than 12.5*/
 
SELECT*
FROM [dbo].[pizza_sales$]
WHERE total_price > '12.5'
