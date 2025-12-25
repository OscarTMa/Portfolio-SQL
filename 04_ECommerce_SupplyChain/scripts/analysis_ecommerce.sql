/*
PROJECT: Olist E-Commerce Logistics Analysis
INFRASTRUCTURE: Google BigQuery
CONCEPTS: Joins, Date Calculations, Subqueries
*/

-- 1. DATA CHECK
-- Verify we have data in the main tables
SELECT * FROM `ecommerce_data.orders` LIMIT 5;

-- 2. SALES BY PRODUCT CATEGORY (Joining 3 tables)
-- Goal: See which categories generate the most revenue.
-- Flow: Orders -> Items (to get price) -> Products (to get category name)
SELECT 
    p.product_category_name,
    COUNT(i.order_id) AS Total_Orders,
    ROUND(SUM(i.price), 2) AS Total_Revenue
FROM `ecommerce_data.orders` o
JOIN `ecommerce_data.items` i ON o.order_id = i.order_id
JOIN `ecommerce_data.products` p ON i.product_id = p.product_id
WHERE o.order_status = 'delivered'
GROUP BY p.product_category_name
ORDER BY Total_Revenue DESC
LIMIT 10;

-- 3. DELIVERY PERFORMANCE (Time Analysis)
-- Goal: Calculate average days to deliver vs. estimated delivery date.
-- BigQuery Function: TIMESTAMP_DIFF(end_date, start_date, UNIT)
SELECT 
    o.order_status,
    COUNT(*) AS Total_Orders,
    -- Real Time: Delivered - Purchased
    ROUND(AVG(TIMESTAMP_DIFF(o.order_delivered_customer_date, o.order_purchase_timestamp, DAY)), 1) AS Avg_Days_To_Deliver,
    -- Delay: Delivered - Estimated (Negative means arrived early)
    ROUND(AVG(TIMESTAMP_DIFF(o.order_delivered_customer_date, o.order_estimated_delivery_date, DAY)), 1) AS Avg_Days_Delay
FROM `ecommerce_data.orders` o
WHERE o.order_status = 'delivered' 
  AND o.order_delivered_customer_date IS NOT NULL
GROUP BY o.order_status;

-- 4. MASTER TABLE FOR TABLEAU (The "Flat" Table)
-- We create a comprehensive view joining everything so Tableau works faster.
-- NOTE: In BigQuery, you can just run this query and "Save to Sheets/Tableau"
SELECT 
    o.order_id,
    o.order_purchase_timestamp,
    p.product_category_name,
    i.price,
    i.freight_value,
    -- Delivery Speed KPI
    TIMESTAMP_DIFF(o.order_delivered_customer_date, o.order_purchase_timestamp, DAY) AS Days_To_Deliver
FROM `ecommerce_data.orders` o
JOIN `ecommerce_data.items` i ON o.order_id = i.order_id
JOIN `ecommerce_data.products` p ON i.product_id = p.product_id
WHERE o.order_status = 'delivered'
LIMIT 20000; -- Limiting rows for Tableau Public performance
