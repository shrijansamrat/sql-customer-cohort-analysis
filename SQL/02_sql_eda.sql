-- =====================================================
-- STEP 2: SQL EDA (Exploratory Data Analysis)
-- SQL Cohort & Retention Analysis Project
-- =====================================================

USE sql_cohort_project;


-- =====================================================
-- PLATFORM OVERVIEW METRICS
-- =====================================================

-- Total Orders
SELECT 
COUNT(*) AS total_orders
FROM orders;


-- Total Unique Customers
SELECT 
COUNT(DISTINCT customer_unique_id) AS total_customers
FROM customers;


-- Total Revenue
SELECT 
ROUND(SUM(payment_value),2) AS total_revenue
FROM order_payments;


-- Average Order Value (AOV)
SELECT 
ROUND(AVG(payment_value),2) AS avg_order_value
FROM order_payments;


-- =====================================================
-- CUSTOMER PURCHASE BEHAVIOR
-- =====================================================

-- Average Orders per Customer
SELECT 
ROUND(COUNT(o.order_id) / COUNT(DISTINCT c.customer_unique_id),2) 
AS avg_orders_per_customer
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id;


-- Repeat Customers (customers with more than one order)
SELECT 
COUNT(*) AS repeat_customers
FROM (
SELECT 
c.customer_unique_id
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_unique_id
HAVING COUNT(o.order_id) > 1
) AS repeat_table;


-- =====================================================
-- PLATFORM GROWTH ANALYSIS
-- =====================================================

-- Monthly Order Trend
SELECT 
DATE_FORMAT(order_purchase_timestamp,'%Y-%m') AS order_month,
COUNT(order_id) AS total_orders
FROM orders
GROUP BY order_month
ORDER BY order_month;


-- =====================================================
-- DATA INSPECTION (OPTIONAL QUICK LOOK)
-- =====================================================

-- Preview orders table
SELECT * 
FROM orders
LIMIT 5;

-- Preview customers table
SELECT * 
FROM customers
LIMIT 5;

-- Preview order items table
SELECT * 
FROM order_items
LIMIT 5;

-- Preview payments table
SELECT * 
FROM order_payments
LIMIT 5;