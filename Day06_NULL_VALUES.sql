-- =============================================
-- Day 06: NULL Values
-- Table: Staff
-- =============================================

-- Create a new Table
/*CREATE TABLE Staff (
  emp_id INT,
  name VARCHAR(50),
  city VARCHAR(50),
  salary INT,
  department VARCHAR(50)
);

-- Insert data with some NULL values
INSERT INTO Staff  VALUES (1, 'Anu', 'Jaipur', 25000, 'HR');
INSERT INTO Staff  VALUES (2, 'Raj', 'Delhi', 35000, 'IT');
INSERT INTO Staff  VALUES (3, 'Priya', NULL, 28000, 'Finance');
INSERT INTO Staff  VALUES (4, 'Amit', 'Jaipur', NULL, 'IT');
INSERT INTO Staff  VALUES (5, 'Neha', 'Delhi', 22000, NULL);
INSERT INTO Staff  VALUES (6, 'Ravi', NULL, 30000, 'HR');
INSERT INTO Staff  VALUES (7, 'Sita', 'Mumbai', NULL, NULL); */


SELECT * FROM Staff ;

-- -----------------------------------------------
-- IS NULL: Find rows where value is missing
-- -----------------------------------------------

-- Query 1: Find Staff where city is NULL
SELECT * FROM Staff
WHERE city IS NULL;

-- Query 2: Find Staff where salary is NULL
SELECT * FROM Staff
WHERE salary IS NULL;

-- Query 3: Find Staff where department is NULL
SELECT * FROM Staff
WHERE department IS NULL;

-- -----------------------------------------------
-- IS NOT NULL: Find rows where value exists
-- -----------------------------------------------

-- Query 4: Find Staff where city is NOT NULL
SELECT * FROM Staff
WHERE city IS NOT NULL;

-- Query 5: Find staff where salary is NOT NULL
SELECT * FROM staff
WHERE salary IS NOT NULL;

-- -----------------------------------------------
-- COALESCE: Replace NULL with default value
-- -----------------------------------------------

-- Query 6: Replace NULL city with 'Unknown'
SELECT name, COALESCE(city, 'Unknown') AS city
FROM Staff;

-- Query 7: Replace NULL salary with 0
SELECT name , COALESCE(salary, 0) AS salary
FROM staff;

-- Query 8: Replace NULL department with 'Not Assigned'
SELECT name,  COALESCE(department,  'Not Assigned') AS department
FROM Staff;

-- -----------------------------------------------
-- NULL with aggregate functions
-- -----------------------------------------------

-- Query 9: COUNT(*) counts all rows including NULL
SELECT COUNT(*) AS total_rows FROM Staff;

-- Query 10: COUNT(salary) ignores NULL values
SELECT COUNT(salary) AS total_salary_count FROM Staff;

-- Query 11: AVG ignores NULL values automatically
SELECT AVG(salary) AS avg_salary FROM employees;


-- -----------------------------------------------
-- COMBINED: Multiple NULL checks together
-- -----------------------------------------------

-- Query 12: Find Staff where city OR salary is NULL
SELECT * FROM Staff
WHERE city IS NULL OR salary IS NULL;

-- Query 13: Find complete records only (no NULL anywhere)
SELECT * FROM Staff
WHERE city IS NOT NULL 
AND salary IS NOT NULL 
AND department IS NOT NULL;

