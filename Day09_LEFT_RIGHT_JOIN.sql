-- ================================================
-- Day 09: LEFT JOIN, RIGHT JOIN
-- Table 1 : Contributors
-- Table 2 : Departments
-- ================================================

-- -----------------------------------------------
-- LEFT JOIN: Saari rows LEFT table se +
-- matching rows RIGHT table se
-- (No match = NULL)
-- -----------------------------------------------

SELECT * FROM Departments;

SELECT * FROM Contributors;

-- Query 1: All Contributors, even if department not found
SELECT c.name, c.salary, d.dept_name
FROM Contributors c
LEFT JOIN Departments d
ON c.dept_id = d.dept_id ;

-- Query 2: Find Contributors whose department is NOT in Departments table
SELECT c.name, c.salary, d.dept_name
FROM Contributors c
LEFT JOIN Departments d
ON c.dept_id = d.dept_id
WHERE d.dept_name IS NULL;

-- -----------------------------------------------
-- RIGHT JOIN: Saari rows RIGHT table se +
-- matching rows LEFT table se
-- (No match = NULL)
-- -----------------------------------------------

-- Query 3: All departments, even if no Contributors assigned
SELECT c.name , c.salary, d.dept_name
FROM Contributors c
RIGHT JOIN Departments d
ON c.dept_id = d.dept_id;

-- Query 4: Find departments that have NO Contributors
SELECT d.dept_id, d.dept_name, c.name
FROM Contributors c
RIGHT JOIN Departments d
ON c.dept_id = d.dept_id
WHERE c.name IS NULL;

-- -----------------------------------------------
-- COMBINED: LEFT JOIN with COALESCE
-- -----------------------------------------------

-- Query 5: Show 'No Department' instead of NULL
SELECT c.name, c.salary, 
COALESCE(d.dept_name, 'No Department') AS dept_name
FROM Contributors c
LEFT JOIN Departments d
ON c.dept_id = d.dept_id;