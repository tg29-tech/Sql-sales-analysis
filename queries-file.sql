-- 🔍 1. Total Sales (Revenue)
SELECT SUM(total_amount) AS total_sales
FROM orders;

-- 🔍 2. Total Number of Orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- 🔍 3. Top 5 Products by Revenue
SELECT 
    p.product_name,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 5;

-- 🔍 4. Top 5 Customers by Spending
SELECT 
    c.name,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 5;

-- 🔍 5. Monthly Sales Trend


SELECT 
DATE_FORMAT(order_date, '%Y-%m') AS month,
SUM(total_amount) AS monthly_sales
FROM orders
GROUP BY month
ORDER BY month;

-- 🔍 6. Average Order Value (AOV)
SELECT AVG(total_amount) AS avg_order_value
FROM orders;

-- 🔍 7. New vs Repeat Customers
SELECT 
    CASE 
        WHEN order_count = 1 THEN 'New Customer'
        ELSE 'Repeat Customer'
    END AS customer_type,
    COUNT(*) AS customer_count
FROM (
    SELECT customer_id, COUNT(*) AS order_count
    FROM orders
    GROUP BY customer_id
) sub
GROUP BY customer_type;

