-- =============================================
-- Day 07: Mini Project — Employee Data Analysis
-- Table: Workers
-- =============================================
/*
--create a new table
CREATE TABLE Workers (
   wrk_id INT,
   name VARCHAR(50),
   city VARCHAR(50),
   salary INT,
   department VARCHAR(50),
   join_date VARCHAR(50)
);

INSERT INTO Workers VALUES (1, 'Anu', 'Jaipur', 25000, 'HR', '2021-01-15');
INSERT INTO Workers VALUES (2, 'Raj', 'Delhi', 35000, 'IT', '2020-03-10');
INSERT INTO Workers VALUES (3, 'Priya', 'Mumbai', 28000, 'Finance', '2022-06-01');
INSERT INTO Workers VALUES (4, 'Amit', 'Jaipur', 40000, 'IT', '2019-11-20');
INSERT INTO Workers VALUES (5, 'Neha', 'Delhi', 22000, 'HR', '2023-02-14');
INSERT INTO Workers VALUES (6, 'Ravi', 'Mumbai', 50000, 'IT', '2018-07-30');
INSERT INTO Workers VALUES (7, 'Sita', 'Jaipur', 32000, 'Finance', '2021-09-05');
INSERT INTO Workers VALUES (8, 'Mohan', 'Delhi', 45000, 'IT', '2020-12-01');
INSERT INTO Workers VALUES (9, 'Kavya', 'Mumbai', 27000, 'HR', '2022-04-18');
INSERT INTO Workers VALUES (10, 'Arjun', 'Jaipur', 38000, 'Finance', '2019-08-22');
INSERT INTO Workers VALUES (11, 'Pooja', 'Delhi', 29000, 'Finance', '2023-01-10');
INSERT INTO Workers VALUES (12, 'Vivek', 'Mumbai', 55000, 'IT', '2017-05-15');
INSERT INTO Workers VALUES (13, 'Ankita', 'Jaipur', 21000, 'HR', '2023-07-01');
INSERT INTO Workers VALUES (14, 'Deepak', 'Delhi', 42000, 'IT', '2020-10-25');
INSERT INTO Workers VALUES (15, 'Meena', 'Mumbai', 31000, 'Finance', '2021-03-08'); */

-- -----------------------------------------------
-- SECTION 1: Basic Analysis (Day 1-2 concepts)
-- -----------------------------------------------

-- Query 1: Fetch all employees
SELECT * FROM Workers;

-- Query 2: Fetch workers from IT department only
SELECT * FROM Workers
WHERE department='IT';

-- Query 3: Fetch Workers with salary greater than 35000
SELECT * FROM Workers
WHERE salary > 35000;

-- Query 4: Fetch Workers from Jaipur AND HR department
SELECT * FROM Workers
WHERE city= 'Jaipur' AND department = 'HR';

-- Query 5: Fetch Workers NOT from Mumbai
SELECT *  FROM Workers
WHERE NOT city = 'Mumbai';


-- -----------------------------------------------
-- SECTION 2: Sorting and Limiting (Day 3 concepts)
-- -----------------------------------------------

-- Query 6: Top 5 highest paid Workers
SELECT * FROM Workers
ORDER BY  salary DESC
LIMIT 5;

-- Query 7: Bottom 3 lowest paid employees
SELECT * FROM Workers
ORDER BY salary ASC
LIMIT 3;

-- Query 8: All workers sorted by name A to Z
SELECT * FROM Workers
ORDER BY name ASC;

-- -----------------------------------------------
-- SECTION 3: Aggregate Functions (Day 4 concepts)
-- -----------------------------------------------

-- Query 9: Total number of Workers
SELECT COUNT(*) AS total_number
FROM workers;

-- Query 10: Total salary of all Workers
SELECT SUM(salary) AS total_salary
FROM Workers;

-- Query 11: Average salary of all Workers
SELECT AVG(salary) AS avg_salary
FROM Workers;

-- Query 12: Highest and lowest salary
SELECT
      MAX(salary) AS highest_salary,
	  MIN(salary) AS lowest_salary
FROM Workers;


-- -----------------------------------------------
-- SECTION 4: Grouping (Day 5 concepts)
-- -----------------------------------------------

-- Query 13: Department wise Workers count
SELECT department, COUNT(*) AS total_workers
FROM Workers
GROUP BY department
ORDER BY total_workers DESC;

-- Query 14: City wise average salary
SELECT city, AVG(salary) AS avg_salary
FROM employees
GROUP BY city
ORDER BY avg_salary DESC;

-- Query 15: Department wise salary summary
SELECT 
   department,
	 COUNT(*) AS total_Workers,
	 SUM(salary) AS total_salary,
	 AVG(salary) AS avg_salary,
	 MAX(salary) AS max_salary,
	 MIN(salary) AS min_salaary
FROM Workers
GROUP BY department;

-- Query 16: Departments with more than 3 employees
SELECT department, COUNT(*) AS total_workers
FROM Workers
GROUP BY department
HAVING COUNT(*) > 4;

-- Query 17: Cities where average salary > 35000
SELECT city, AVG(salary) AS avg_salary
from workers
GROUP BY city
HAVING AVG(salary) > 35000;


-- -----------------------------------------------
-- SECTION 5: Final Business Insights
-- -----------------------------------------------

-- Query 18: Which department has highest total salary?
SELECT department, SUM(salary) AS total_salary
FROM Workers
GROUP BY department
ORDER BY total_salary DESC
LIMIT 1;

-- Query 19: Which city has most employees?
SELECT city, COUNT(*) AS total_workers
FROM Workers
GROUP BY city
ORDER BY total_workers DESC
limit 1;

-- Query 20: Top 3 highest paid employees 
--           with their department

SELECT department,name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;

