-- ================================================
-- Day 08: INNER JOIN
-- Table 1 : Contributors
-- Table 2 : Departments
-- ================================================

-- Table 1: Employees with department_id
/*CREATE TABLE Contributors (
    emp_id INT,
    name VARCHAR(50),
    city VARCHAR(50),
    salary INT,
    dept_id INT
);

INSERT INTO Contributors VALUES (1, 'Anu', 'Jaipur', 25000, 101);
INSERT INTO Contributors VALUES (2, 'Raj', 'Delhi', 35000, 102);
INSERT INTO Contributors VALUES (3, 'Priya', 'Mumbai', 28000, 103);
INSERT INTO Contributors VALUES (4, 'Amit', 'Jaipur', 40000, 102);
INSERT INTO Contributors VALUES (5, 'Neha', 'Delhi', 22000, 101);
INSERT INTO Contributors VALUES (6, 'Ravi', 'Mumbai', 50000, 104);

SELECT * FROM Contributors;

-- Table 2: Department details
CREATE TABLE Departments (
    dept_id INT,
    dept_name VARCHAR(50)
);

INSERT INTO Departments VALUES (101, 'HR');
INSERT INTO Departments VALUES (102, 'IT');
INSERT INTO Departments VALUES (103, 'Finance');
INSERT INTO Departments VALUES (105, 'Marketing');*/

SELECT * FROM Departments;

-- -----------------------------------------------
-- INNER JOIN: Sirf wahi rows jo dono tables mein match karein
-- -----------------------------------------------

-- Query 1: Basic INNER JOIN - employee with department name
SELECT Contributors.name, Contributors.salary, Departments.dept_name
FROM Contributors
INNER JOIN Departments
ON Contributors.dept_id = Departments.dept_id;

-- Query 2: Same query using table aliases (shortcuts)
SELECT c.name, c.salary, d.dept_name
FROM Contributors c
INNER JOIN Departments d
ON c.dept_id = d.dept_id;

-- Query 3: INNER JOIN with WHERE condition
SELECT c.name, c.salary, d.dept_name
FROM Contributors c
INNER JOIN Departments d
ON c.dept_id = d.dept_id
WHERE c.salary > 25000;

-- Query 4: INNER JOIN with ORDER BY
SELECT c.name , c.salary , d.dept_name
FROM Contributors c
INNER JOIN Departments d
ON c.dept_id = d.dept_id
ORDER BY c.salary ASC;

-- Query 5: Count employees per department using JOIN
SELECT d.dept_name, COUNT(c.emp_id) AS total_Contributos
FROM Contributors c
INNER JOIN Departments d
ON c.dept_id = d.dept_id
GROUP BY d.dept_name;



