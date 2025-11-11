# Zepto-Product-Insights-using-MySQL
This project focuses on analyzing Zepto’s e-commerce product data using MySQL to uncover insights about pricing, discounts, stock availability, and category-level performance.
The goal is to identify business trends such as revenue drivers, out-of-stock issues, and discount efficiency helping optimize inventory and pricing strategies.

# Dataset & Tools Used

Dataset: Zepto product dataset (zepto.csv)

Tool: MySQL Workbench

Techniques: Data cleaning, transformation, EDA, aggregation queries, KPI analysis

# Steps

Loaded dataset into MySQL and created the main table zepto.

Defined schema with correct data types and constraints.

Performed data validation (row count, NULL checks, duplicates).

Cleaned the dataset:

Removed zero-priced products.

Converted pricing units from paise to rupees.


Executed multiple SQL queries for data exploration and business insights.

# Key SQL Queries

Top 10 Best Value Products: Highest discounts based on discountPercent.

High-MRP Out-of-Stock Products: Identified high-demand premium products needing restock.

Estimated Revenue by Category: Summed discountedSellingPrice * availableQuantity.

Top 5 Categories by Average Discount: Found most competitive categories.

Weight-Based Segmentation: Grouped products as Low, Medium, or Bulk for inventory optimization.

# Results

High-discount and in-stock products show stronger sales potential.

Premium items (MRP > ₹300) frequently go out of stock.

Discounts above 20% significantly improve product movement.

Bulk weight items contribute heavily to total logistics load and cost.

# How to Run

1. Create a new database:

CREATE DATABASE zepto_analysis;
USE zepto_analysis;

2. Copy and run the SQL script zepto_analysis.sql (included in this repository).

3. Execute queries sequentially to recreate cleaning and analysis steps.
