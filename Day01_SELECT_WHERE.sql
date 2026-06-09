-- CREATE A TABLE 
/* CREATE TABLE employees (
  emp_id INT,
  name VARCHAR(50),
  city VARCHAR(50),
  salary INT,
  department VARCHAR(50)
); */

-- INSERT THE DATA
/*INSERT INTO employees VALUES (1, 'Anu', 'Jaipur', 25000, 'HR');
INSERT INTO employees VALUES (2, 'Raj', 'Delhi', 35000, 'IT');
INSERT INTO employees VALUES (3, 'Priya', 'Mumbai', 28000, 'Finance');
INSERT INTO employees VALUES (4, 'Amit', 'Jaipur', 40000, 'IT');
INSERT INTO employees VALUES (5, 'Neha', 'Delhi', 22000, 'HR');*/

-- Fetch all records from employees table
SELECT * FROM employees;

-- Fetch only Jaipur employees
SELECT * FROM employees
WHERE city = 'Jaipur';

-- Fetch only IT department employees
SELECT * FROM employees
WHERE department = 'IT';