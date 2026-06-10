-- =============================================
-- Day 03: ORDER BY, LIMIT, OFFSET
-- Table: employees
-- =============================================

SELECT * FROM employees;

-- -----------------------------------------------
-- ORDER BY — 
-- -----------------------------------------------

-- Query 1: Fetch all employees sorted by salary low to high
SELECT * FROM employees
ORDER BY salary ASC;

-- Query 1: Fetch all employees sorted by salary high to low
SELECT * FROM employees
ORDER BY salary DESC;

-- Query 3: Fetch all employees sorted by name alphabetically
SELECT * FROM employees
ORDER BY name ASC;

-- -----------------------------------------------
-- LIMIT: Fetch only specific number of rows
-- -----------------------------------------------

-- Query 4: Fetch only first 3 employees
SELECT * FROM employees
LIMIT 3;

-- Query 5: Fetch top 3 highest paid employees
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 3;

-- -----------------------------------------------
-- OFFSET: Skip specific number of rows
-- -----------------------------------------------

-- Query 6: Skip first 2 rows and fetch next 3
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 3 OFFSET 2;

--Query 6: Skip first 2 rows and fetch next 3
SELECT * FROM employees
ORDER BY salary ASC
LIMIT 3 OFFSET 2;

-- -----------------------------------------------
-- COMBINED: ORDER BY + LIMIT + WHERE together
-- -----------------------------------------------

-- Query 7: Fetch highest paid employee from IT department
SELECT * FROM employees
WHERE department = 'IT'
ORDER BY salary DESC
LIMIT 1;

-- Query 8: Fetch 2 lowest paid employees
SELECT * FROM employees
ORDER BY salary ASC
LIMIT 2;
