-- =============================================
-- Day 4 — DISTINCT, COUNT, SUM, AVG, MIN, MAX
-- Table: employees
-- =============================================

SELECT * FROM employees;

-- -----------------------------------------------
-- DISTINCT: Remove duplicate values
-- -----------------------------------------------

-- Query 1: Fetch all unique cities
SELECT DISTINCT city FROM employees;

-- Query 2: Fetch all unique departments
SELECT DISTINCT department FROM employees;

-- -----------------------------------------------
-- COUNT: Count number of rows
-- -----------------------------------------------

-- Query 3: Count total number of employees
SELECT COUNT(*) FROM employees;

-- Query 4: Count employees in IT department
SELECT COUNT(*) FROM employees
Where department = 'IT';

-- Query 5: Count employees in each department
SELECT department , COUNT(*) AS total_employees
FROM employees
GROUP BY department;

-- Example
SELECT city, COUNT(*) AS department
from employees
GROUP BY city;

-- -----------------------------------------------
-- SUM: Add all values together
-- -----------------------------------------------

-- Query 6: Calculate total salary of all employees
SELECT SUM(salary) AS total_salary
FROM employees;

-- Query 7: Calculate total salary of IT department
SELECT SUM(salary) AS it_total_salary
FROM employees
WHERE department = 'IT';

-- -----------------------------------------------
-- AVG: Calculate average value
-- -----------------------------------------------

-- Query 8: Calculate average salary of all employees
SELECT AVG(salary) AS average_salary
FROM employees;

-- Query 9: Calculate average salary of HR department
SELECT AVG(salary) AS hr_avg_salary
FROM employees
WHERE department = 'HR';

-- -----------------------------------------------
-- MIN and MAX: Find lowest and highest value
-- -----------------------------------------------

-- Query 10: Find lowest salary
SELECT MIN(salary) AS lowest_salary 
FROM employees;

-- Query 10: Find largest salary
SELECT MAX(salary) as largest_salary FROM employees;

-- Query 12: Find min and max salary together
SELECT 
    MIN(salary) AS lowest_salary,
    MAX(salary) AS highest_salary,
    AVG(salary) AS average_salary,
    SUM(salary) AS total_salary,
    COUNT(*) AS total_employees
FROM employees; 

-- -----------------------------------------------
-- COMBINED: Real world example
-- -----------------------------------------------

-- Query 13: Department wise salary summary
SELECT 
    department,
    COUNT(*) AS total_employees,
    SUM(salary) AS total_salary,
    AVG(salary) AS avg_salary,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary
FROM employees
GROUP BY department;

