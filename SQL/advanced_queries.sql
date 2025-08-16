-- ==========================================================
-- Advanced SQL Queries for E-Commerce Sales Analytics
-- Author: Sonu Kumar
-- ==========================================================

-- 1. Top 10 Customers by Total Purchase Amount
-- This query identifies the highest-spending customers.
SELECT 
    customer_id, 
    SUM(sales) AS total_sales
FROM orders
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 10;


-- 2. Monthly Sales Trend
-- This query shows the total sales grouped by year and month.
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month, 
    SUM(sales) AS monthly_sales
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;


-- 3. Most Profitable Products
-- This query finds the top 10 products contributing the most profit.
SELECT 
    product_id, 
    SUM(profit) AS total_profit
FROM orders
GROUP BY product_id
ORDER BY total_profit DESC
LIMIT 10;


-- 4. Region-wise Sales Performance
-- This query gives a summary of sales per region to analyze geographical performance.
SELECT 
    region, 
    SUM(sales) AS total_sales, 
    SUM(profit) AS total_profit
FROM orders
GROUP BY region
ORDER BY total_sales DESC;


-- 5. Customer Segmentation by Frequency
-- This query classifies customers into groups based on number of orders placed.
SELECT 
    customer_id, 
    COUNT(order_id) AS total_orders,
    CASE
        WHEN COUNT(order_id) > 20 THEN 'Frequent Buyer'
        WHEN COUNT(order_id) BETWEEN 10 AND 20 THEN 'Regular Buyer'
        ELSE 'Occasional Buyer'
    END AS customer_segment
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC;
