use sales;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100),
    age INT
);

INSERT INTO customers VALUES
(1, 'Alice', 'New York', 28),
(2, 'Bob', 'San Francisco', 35),
(3, 'Charlie', 'Chicago', 22),
(4, 'Diana', 'Austin', 30),
(5, 'Ethan', 'Seattle', 40),
(6, 'Fiona', 'Denver', 27),
(7, 'George', 'Boston', 33),
(8, 'Hannah', 'Los Angeles', 29),
(9, 'Ian', 'Miami', 45),
(10, 'Jenny', 'Portland', 31);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO products VALUES
(101, 'Wireless Mouse', 'Electronics', 25.99),
(102, 'Keyboard', 'Electronics', 45.50),
(103, 'Notebook', 'Stationery', 5.99),
(104, 'Pen Pack', 'Stationery', 3.49),
(105, 'Desk Lamp', 'Furniture', 29.99),
(106, 'Monitor 24"', 'Electronics', 150.00),
(107, 'USB Cable', 'Electronics', 9.99),
(108, 'Chair', 'Furniture', 89.99),
(109, 'Backpack', 'Accessories', 49.99),
(110, 'Water Bottle', 'Accessories', 15.99);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders VALUES
(1001, 1, '2024-01-10', 51.49),
(1002, 2, '2024-01-12', 25.99),
(1003, 3, '2024-02-01', 74.98),
(1004, 1, '2024-02-15', 34.99),
(1005, 4, '2024-03-03', 29.99),
(1006, 5, '2024-03-08', 150.00),
(1007, 6, '2024-03-10', 60.00),
(1008, 7, '2024-03-14', 105.99),
(1009, 8, '2024-03-18', 45.50),
(1010, 9, '2024-03-20', 89.99),
(1011, 10, '2024-03-22', 99.99),
(1012, 1, '2024-03-25', 49.99),
(1013, 2, '2024-03-27', 25.00),
(1014, 3, '2024-03-29', 109.99),
(1015, 4, '2024-04-01', 89.99),
(1016, 5, '2024-04-03', 65.00),
(1017, 6, '2024-04-05', 75.99),
(1018, 7, '2024-04-06', 49.99),
(1019, 8, '2024-04-07', 29.99),
(1020, 9, '2024-04-08', 55.00);

CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items VALUES
(1, 1001, 101, 1, 25.99),
(2, 1001, 103, 3, 5.50),
(3, 1002, 101, 1, 25.99),
(4, 1003, 102, 1, 45.50),
(5, 1003, 103, 2, 5.99),
(6, 1004, 105, 1, 29.99),
(7, 1004, 104, 2, 2.50),
(8, 1005, 105, 1, 29.99),
(9, 1006, 106, 1, 150.00),
(10, 1007, 109, 1, 49.99),
(11, 1007, 110, 1, 10.01),
(12, 1008, 108, 1, 89.99),
(13, 1008, 107, 2, 8.00),
(14, 1009, 102, 1, 45.50),
(15, 1010, 108, 1, 89.99),
(16, 1011, 106, 1, 99.99),
(17, 1012, 109, 1, 49.99),
(18, 1013, 104, 10, 2.50),
(19, 1014, 106, 1, 99.99),
(20, 1014, 110, 1, 10.00),
(21, 1015, 108, 1, 89.99),
(22, 1016, 101, 2, 25.00),
(23, 1017, 105, 2, 29.99),
(24, 1018, 109, 1, 49.99),
(25, 1019, 110, 2, 15.00);

-- analysis queries
-- total sales by revenue
-- total number of orders 
-- top 5 profducts by revenue 
-- top 5 customers by spending 
-- monthly sales trend 
-- average order value 
-- repeat vs new customers 

select * from orders;
SELECT AVG(total_amount) AS avg_order_value
FROM orders;


