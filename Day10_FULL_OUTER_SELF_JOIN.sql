-- ================================================
-- Day 10: FULL OUTER JOIN, SELF JOIN
-- Table 1 : Contributors
-- Table 2 : Departments
-- ================================================

-- -----------------------------------------------
-- FULL OUTER JOIN: Saari rows DONO tables se
-- (No match = NULL on either side)
-- -----------------------------------------------

-- Query 1: All  Contributors AND all departments together
SELECT c.name, c.dept_id, d.dept_name
FROM  Contributors c
FULL OUTER JOIN Departments d
ON c.dept_id = d.dept_id;

-- Query 2: Find unmatched records from both sides
SELECT c.name, c.dept_id, d.dept_id AS dept_table_id, d.dept_name
FROM  Contributors c
FULL OUTER JOIN Departments d
ON c.dept_id = d.dept_id
WHERE c.dept_id IS NULL OR d.dept_id IS NULL;

-- Query 3: Replace NULL with readable text
SELECT 
COALESCE(c.name, 'No Employee') AS employee_name,
COALESCE(d.dept_name, 'No Department') AS department_name
FROM  Contributors c
FULL OUTER JOIN Departments d
ON c.dept_id = d.dept_id;

-- -----------------------------------------------
-- SELF JOIN: Table ko khud se JOIN karna
-- Useful for: comparing rows within same table
-- -----------------------------------------------

-- Add some data first - employees in same city
-- (Workers table already has city column)

-- Query 4: Find pairs of employees from same city
SELECT a.name AS employee1, b.name AS employee2, a.city
FROM  Contributors a
INNER JOIN  Contributors b
ON a.city = b.city AND a.emp_id < b.emp_id;

-- Query 5: Find employees with same dept_id (colleagues)
SELECT a.name AS employee1, b.name AS employee2, a.dept_id
FROM  Contributors a
INNER JOIN  Contributors b
ON a.dept_id = b.dept_id AND a.emp_id < b.emp_id;

-- Query 6: Compare each employee's salary with others in same city
SELECT a.name AS employee1, a.salary AS salary1, 
       b.name AS employee2, b.salary AS salary2, a.city
FROM  Contributors a
INNER JOIN  Contributors b
ON a.city = b.city AND a.emp_id <> b.emp_id
ORDER BY a.city;