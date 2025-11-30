-- Create database if not exists
IF DB_ID('ZeptoDB') IS NULL
    CREATE DATABASE ZeptoDB;
GO

-- Use the database
USE ZeptoDB;
GO


-- Drop table if exists
IF OBJECT_ID('dbo.zepto', 'U') IS NOT NULL
DROP TABLE dbo.zepto;
GO

-- Create table
CREATE TABLE zepto (
sku_id INT IDENTITY(1,1) PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp DECIMAL(8,2),
discountPercent DECIMAL(5,2),
availableQuantity INT,
discountedSellingPrice DECIMAL(8,2),
weightInGms INT,
outOfStock BIT,
quantity INT
);
GO

--Imported data from flat file--

-- Data exploration

-- Count of rows
SELECT COUNT(*) AS total_rows FROM zepto;

-- Sample data
SELECT  * FROM zepto;

-- Null values
SELECT *
FROM zepto
WHERE name IS NULL
OR category IS NULL
OR mrp IS NULL
OR discountPercent IS NULL
OR discountedSellingPrice IS NULL
OR weightInGms IS NULL
OR availableQuantity IS NULL
OR outOfStock IS NULL
OR quantity IS NULL;

-- Different product categories
SELECT DISTINCT category
FROM zepto
ORDER BY category;

-- Products in stock vs out of stock
SELECT outOfStock, COUNT(sku_id) AS product_count
FROM zepto
GROUP BY outOfStock;

-- Product names present multiple times
SELECT name, COUNT(sku_id) AS NumberOfSKUs
FROM zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY COUNT(sku_id) DESC;

-- Data cleaning

-- Products with price = 0
SELECT *
FROM zepto
WHERE mrp = 0 OR discountedSellingPrice = 0;

DELETE FROM zepto
WHERE mrp = 0;

-- Convert paise to rupees
UPDATE zepto
SET mrp = CAST(mrp AS DECIMAL(8,2)) / 100.0,
discountedSellingPrice = CAST(discountedSellingPrice AS DECIMAL(8,2)) / 100.0;

SELECT mrp, discountedSellingPrice FROM zepto;

-- Data analysis

-- Q1. Top 10 best-value products based on discount percentage
SELECT TOP 10 name, mrp, discountPercent
FROM zepto
ORDER BY discountPercent DESC;

-- Q2. Products with High MRP but Out of Stock
SELECT name, mrp
FROM zepto
WHERE outOfStock = 1 AND mrp > 300
ORDER BY mrp DESC;

-- Q3. Estimated Revenue for each category
SELECT category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue;

-- Q4. Products with MRP > 500 and discount < 10%
SELECT name, mrp, discountPercent
FROM zepto
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

-- Q5. Top 5 categories offering highest average discount
SELECT TOP 5 category,
ROUND(AVG(discountPercent),2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC;

-- Q6. Price per gram for products above 100g
SELECT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice * 1.0 / weightInGms,2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram;

-- Q7. Group products by weight
SELECT name, weightInGms,
CASE
WHEN weightInGms < 1000 THEN 'Low'
WHEN weightInGms < 5000 THEN 'Medium'
ELSE 'Bulk'
END AS weight_category
FROM zepto;

-- Q8. Total Inventory Weight per Category
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;
