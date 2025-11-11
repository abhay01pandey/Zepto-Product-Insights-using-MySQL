CREATE DATABASE Zepto_db;
USE Zepto_db;

CREATE TABLE zepto (
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp DECIMAL(8,2),
    discountPercent DECIMAL(5,2),
    availableQuantity INT,
    discountedSellingPrice DECIMAL(8,2),
    weightInGms INT,
    outOfStock BOOLEAN,
    quantity INT
);

-- DATA EXPLORATION

-- Count of rows

SELECT COUNT(*) AS total_rows FROM zepto;

-- Sample data

SELECT * FROM zepto LIMIT 10;

-- Null values

SELECT * FROM zepto 
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
   
SELECT DISTINCT category FROM zepto
ORDER BY category;

-- Products in stock vs out of stock
SELECT outOfStock, COUNT(*) AS total_products
FROM zepto
GROUP BY outOfStock;

-- Product names appearing multiple times
SELECT name, COUNT(*) AS total_skus
FROM zepto
GROUP BY name
HAVING COUNT(*) > 1
ORDER BY total_skus DESC;

-- DATA CLEANING

-- Products with price = 0

SELECT * FROM zepto 
WHERE mrp = 0 OR discountedSellingPrice = 0;

-- Remove rows where MRP =0 

DELETE FROM zepto
WHERE mrp = 0;

-- Convert paise to rupees

UPDATE zepto
SET mrp = mrp / 100.0,
discountedSellingPrice = discountedSellingPrice / 100.0;

-- DATA ANALYSIS

-- Q1. Top 10 best-value products based on discount %
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;

-- Q2. Products with High MRP but Out of Stock
SELECT DISTINCT name, mrp
FROM zepto
WHERE outOfStock = TRUE AND mrp > 300
ORDER BY mrp DESC;

-- Q3. Estimated Revenue for each category
SELECT category,
       SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue DESC;

-- Q4. Products with MRP > ₹500 and discount < 10%
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

-- Q5. Top 5 categories with highest avg discount %
SELECT category,
       ROUND(AVG(discountPercent), 2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q6. Price per gram for products above 100g
SELECT DISTINCT name, weightInGms, discountedSellingPrice,
       ROUND(discountedSellingPrice / weightInGms, 2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram ASC;

-- Q7. Group products by weight range
SELECT DISTINCT name, weightInGms,
       CASE
           WHEN weightInGms < 1000 THEN 'Low'
           WHEN weightInGms < 5000 THEN 'Medium'
           ELSE 'Bulk'
       END AS weight_category
FROM zepto;

-- Q8. Total Inventory Weight Per Category
SELECT category,
       SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight DESC

