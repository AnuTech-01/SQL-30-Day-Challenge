-- ================================================
-- Day 11: Subqueries
-- Table 1 : Contributors
-- Table 2 : Departments
-- ================================================

-- -----------------------------------------------
-- SUBQUERY IN WHERE: Filter karne ke liye
-- -----------------------------------------------

-- Query 1: Find employees with salary greater than average salary
SELECT name, salary
FROM Contributors
WHERE salary > (SELECT AVG(salary) FROM Contributors);

-- Query 2: Find highest paid employee
SELECT name, salary
FROM Contributors
WHERE salary = (SELECT MAX(salary) FROM Contributors);

-- Query 3: Find employees from same dept as 'Anu'
SELECT name, dept_id
FROM Contributors
WHERE dept_id = (SELECT dept_id FROM Contributors WHERE name = 'Anu');

-- Query 4: Find employees with salary greater than 'Raj'
SELECT name, salary
FROM Contributors
WHERE salary > (SELECT salary FROM Contributors WHERE name = 'Raj');

-- -----------------------------------------------
-- SUBQUERY IN FROM: Table ki jagah use karna
-- -----------------------------------------------

-- Query 5: Average salary of top 3 earners
SELECT AVG(salary) AS avg_top3_salary
FROM (
    SELECT salary
    FROM Contributors
    ORDER BY salary DESC
    LIMIT 3
) AS top3;

-- Query 6: Department wise summary as subquery
SELECT dept_summary.dept_id, dept_summary.avg_sal
FROM (
    SELECT dept_id, ROUND(AVG(salary), 2) AS avg_sal
    FROM Contributors
    GROUP BY dept_id
) AS dept_summary
WHERE dept_summary.avg_sal > 30000;

-- -----------------------------------------------
-- SUBQUERY IN SELECT: Column ki jagah use karna
-- -----------------------------------------------

-- Query 7: Show each employee salary vs company average
SELECT name, salary,
(SELECT ROUND(AVG(salary), 2) FROM Contributors) AS company_avg
FROM Contributors;

-- Query 8: Show each employee salary difference from average
SELECT name, salary,
salary - (SELECT ROUND(AVG(salary)) FROM Contributors) AS diff_from_avg
FROM Contributors;

-- -----------------------------------------------
-- SUBQUERY WITH IN: Multiple values check karna
-- -----------------------------------------------

-- Query 9: Find employees in IT or HR departments
SELECT name, dept_id
FROM Contributors
WHERE dept_id IN (
    SELECT dept_id FROM Departments
    WHERE dept_name IN ('IT', 'HR')
);

-- Query 10: Find employees NOT in Finance department
SELECT name, dept_id
FROM Contributors
WHERE dept_id NOT IN (
    SELECT dept_id FROM Departments
    WHERE dept_name = 'Finance'
);