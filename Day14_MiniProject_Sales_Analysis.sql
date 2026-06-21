-- ================================================
-- Day 14: Mini Project — Sales Data Analysis
-- Table 1: Products
-- Table 2: Sales
-- ================================================
/*
-- Table 1: Products
CREATE TABLE Products (
    product_id INT,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price INT
);

INSERT INTO Products VALUES (1, 'iPhone 13', 'Mobile', 60000);
INSERT INTO Products VALUES (2, 'Samsung S21', 'Mobile', 45000);
INSERT INTO Products VALUES (3, 'Dell Laptop', 'Laptop', 55000);
INSERT INTO Products VALUES (4, 'HP Laptop', 'Laptop', 48000);
INSERT INTO Products VALUES (5, 'boAt Earbuds', 'Accessories', 2000);
INSERT INTO Products VALUES (6, 'Mi Power Bank', 'Accessories', 1500);

SELECT * FROM Products;

-- Table 2: Sales
CREATE TABLE Sales (
    sale_id INT,
    product_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    quantity INT,
    sale_date VARCHAR(20)
);

INSERT INTO Sales VALUES (1, 1, 'Rahul', 'Jaipur', 2, '2024-01-10');
INSERT INTO Sales VALUES (2, 2, 'Sneha', 'Delhi', 1, '2024-01-12');
INSERT INTO Sales VALUES (3, 3, 'Aman', 'Mumbai', 1, '2024-01-15');
INSERT INTO Sales VALUES (4, 1, 'Pooja', 'Jaipur', 1, '2024-01-20');
INSERT INTO Sales VALUES (5, 5, 'Karan', 'Delhi', 3, '2024-01-22');
INSERT INTO Sales VALUES (6, 4, 'Riya', 'Mumbai', 2, '2024-02-01');
INSERT INTO Sales VALUES (7, 6, 'Vikas', 'Jaipur', 5, '2024-02-05');
INSERT INTO Sales VALUES (8, 2, 'Anita', 'Delhi', 2, '2024-02-10');
INSERT INTO Sales VALUES (9, 3, 'Suresh', 'Jaipur', 1, '2024-02-15');
INSERT INTO Sales VALUES (10, 1, 'Meera', 'Mumbai', 1, '2024-02-20');

SELECT * FROM Sales;
*/

-- ================================================
-- Day 14: Mini Project — Sales Data Analysis
-- Author: Anu Jangid
-- Date: 17-06-2026
-- Tool: PostgreSQL 18 | pgAdmin 4
-- ================================================

-- -----------------------------------------------
-- SECTION 1: Basic JOIN Analysis
-- -----------------------------------------------

-- Query 1: Show all sales with product details
SELECT s.sale_id, p.product_name, s.customer_name, s.city, s.quantity
FROM Sales s
INNER JOIN Products p
ON s.product_id = p.product_id;

-- Query 2: Total revenue per sale (price * quantity)
SELECT s.customer_name, p.product_name, 
p.price, s.quantity, 
(p.price * s.quantity) AS total_amount
FROM Sales s
INNER JOIN Products p
ON s.product_id = p.product_id;

-- -----------------------------------------------
-- SECTION 2: Aggregate Analysis
-- -----------------------------------------------

-- Query 3: Total revenue by product
SELECT p.product_name, 
SUM(p.price * s.quantity) AS total_revenue
FROM Sales s
INNER JOIN Products p
ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;

-- Query 4: Total revenue by category
SELECT p.category, 
SUM(p.price * s.quantity) AS total_revenue
FROM Sales s
INNER JOIN Products p
ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

-- Query 5: Total revenue by city
SELECT s.city, 
SUM(p.price * s.quantity) AS total_revenue
FROM Sales s
INNER JOIN Products p
ON s.product_id = p.product_id
GROUP BY s.city
ORDER BY total_revenue DESC;

-- -----------------------------------------------
-- SECTION 3: CASE WHEN Business Logic
-- -----------------------------------------------

-- Query 6: Categorize sales as High/Medium/Low value
SELECT s.customer_name, p.product_name,
(p.price * s.quantity) AS total_amount,
CASE
    WHEN (p.price * s.quantity) >= 50000 THEN 'High Value'
    WHEN (p.price * s.quantity) >= 20000 THEN 'Medium Value'
    ELSE 'Low Value'
END AS sale_category
FROM Sales s
INNER JOIN Products p
ON s.product_id = p.product_id
ORDER BY total_amount DESC;

-- -----------------------------------------------
-- SECTION 4: Subquery Analysis
-- -----------------------------------------------

-- Query 7: Products with revenue above average
SELECT product_name, total_revenue
FROM (
    SELECT p.product_name, 
    SUM(p.price * s.quantity) AS total_revenue
    FROM Sales s
    INNER JOIN Products p
    ON s.product_id = p.product_id
    GROUP BY p.product_name
) AS product_sales
WHERE total_revenue > (
    SELECT AVG(p.price * s.quantity)
    FROM Sales s
    INNER JOIN Products p
    ON s.product_id = p.product_id
);

-- Query 8: Best selling product (highest quantity sold)
SELECT p.product_name, SUM(s.quantity) AS total_units_sold
FROM Sales s
INNER JOIN Products p
ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_units_sold DESC
LIMIT 1;

-- -----------------------------------------------
-- SECTION 5: String Functions
-- -----------------------------------------------

-- Query 9: Customer name in uppercase with city
SELECT CONCAT(UPPER(customer_name), ' - ', city) AS customer_info
FROM Sales;

-- -----------------------------------------------
-- SECTION 6: Final Business Insights
-- -----------------------------------------------

-- Query 10: City wise customer count and revenue
SELECT s.city,
COUNT(DISTINCT s.customer_name) AS total_customers,
SUM(p.price * s.quantity) AS total_revenue
FROM Sales s
INNER JOIN Products p
ON s.product_id = p.product_id
GROUP BY s.city
ORDER BY total_revenue DESC;

-- Query 11: Which category sells the most units?
SELECT p.category, SUM(s.quantity) AS total_units
FROM Sales s
INNER JOIN Products p
ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY total_units DESC;

-- Query 12: Top 3 customers by total spending
SELECT s.customer_name, 
SUM(p.price * s.quantity) AS total_spent
FROM Sales s
INNER JOIN Products p
ON s.product_id = p.product_id
GROUP BY s.customer_name
ORDER BY total_spent DESC
LIMIT 3;