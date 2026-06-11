-- =============================================
-- Day 05: GROUP BY, HAVING
-- Table: employees
-- =============================================


SELECT * FROM employees;

-- -----------------------------------------------
-- GROUP BY: Same values ko group karna
-- -----------------------------------------------

-- Query 1: Count employees in each department
SELECT department, count(*) AS total_employees
FROM employees
GROUP BY department;

-- Query 2: Total salary of each department
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- Query 3: Average salary of each city
SELECT city, AVG(salary) AS avg_salary
FROM employees
GROUP BY city;

-- Query 4: Highest salary in each department
SELECT department, MAX(salary) AS highest_salary
FROM employees
GROUP BY department;

-- Query 5: Count employees in each city
SELECT city, COUNT(*) AS total_employees
FROM employees
GROUP BY city;


-- -----------------------------------------------
-- HAVING: GROUP BY ke baad filter lagana
-- (WHERE = rows filter karta hai)
-- (HAVING = groups filter karta hai)
-- -----------------------------------------------

-- Query 6: Departments with more than 1 employee
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 1;

-- Query 7: Cities where average salary is more than 25000
SELECT city, AVG(salary) AS avg_salary
FROM employees
GROUP BY city
HAVING AVG(salary) > 25000;

-- Query 8: Departments where total salary is more than 50000
SELECT department, SUM(salary) AS tital_salary
From employees
GROUP BY department
HAVING SUM(salary) > 50000;

-- -----------------------------------------------
-- WHERE vs HAVING difference
-- -----------------------------------------------

-- WHERE: Pehle rows filter karo phir group karo
-- Fetch departments where salary > 22000, then group
SELECT department, COUNT(*) AS total_employees
FROM employees
WHERE salary > 22000
GROUP BY department;

-- HAVING: Pehle group karo phir filter karo
-- Fetch departments where employee count > 1
SELECT department, COUNT(*) Total_employees
from employees
group by department
HAving COUNT(*) > 1;
