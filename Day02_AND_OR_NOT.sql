-- =============================================
-- Day 2: AND, OR, NOT Operators
-- Table: employees
-- =============================================

SELECT * FROM employees;

-- AND: Fetch employees from Jaipur AND IT department
SELECT * FROM employees
WHERE city = 'Jaipur' AND department = 'IT';   --Amit

-- OR: Fetch employees from Jaipur OR Delhi
SELECT * FROM employees
WHERE city ='Jaipur' OR city='Delhi';   --Anu , Raj , Amit, Neha

-- NOT: Fetch employees who are NOT from Jaipur
SELECT * FROM employees
WHERE NOT city= 'Jaipur';   -- Raj,Priya,Neha


-- Practice Query 1: IT department employees from Delhi
SELECT * FROM employees
WHERE department = 'IT' AND city = 'Delhi';   

-- Practice Query 2: Employees with salary greater than 25000
SELECT * FROM employees
WHERE salary > 25000  OR salary >= 35000;

-- Practice Query 3: Employees who are NOT in HR department
SELECT * FROM employees
WHERE NOT department = 'HR';


