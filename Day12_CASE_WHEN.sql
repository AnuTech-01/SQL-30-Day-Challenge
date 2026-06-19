-- ================================================
-- Day 12: CASE WHEN
-- Table 1 : Contributors
-- ================================================

-- -----------------------------------------------
-- BASIC CASE WHEN: Simple condition check
-- -----------------------------------------------

-- Query 1: Categorize salary as High or Low
SELECT name, salary,
CASE
    WHEN salary >= 35000 THEN 'High Salary'
    ELSE 'Low Salary'
END AS salary_category
FROM Contributors;

-- Query 2: Multiple conditions - Low, Medium, High
SELECT name, salary,
CASE
    WHEN salary < 25000 THEN 'Low'
    WHEN salary BETWEEN 25000 AND 40000 THEN 'Medium'
    ELSE 'High'
END AS salary_band
FROM Contributors;

-- -----------------------------------------------
-- CASE WHEN with multiple columns
-- -----------------------------------------------

-- Query 3: Salary band + city combined logic
SELECT name, city, salary,
CASE
    WHEN city = 'Jaipur' AND salary > 30000 THEN 'Jaipur Senior'
    WHEN city = 'Jaipur' THEN 'Jaipur Junior'
    ELSE 'Other City'
END AS employee_type
FROM Contributors;

-- -----------------------------------------------
-- CASE WHEN with GROUP BY
-- -----------------------------------------------

-- Query 4: Count employees in each salary band
SELECT 
CASE
    WHEN salary < 25000 THEN 'Low'
    WHEN salary BETWEEN 25000 AND 40000 THEN 'Medium'
    ELSE 'High'
END AS salary_band,
COUNT(*) AS total_employees
FROM Contributors
GROUP BY salary_band;

-- -----------------------------------------------
-- CASE WHEN with ORDER BY
-- -----------------------------------------------

-- Query 5: Custom sort order using CASE
SELECT name, city
FROM Contributors
ORDER BY 
CASE 
    WHEN city = 'Jaipur' THEN 1
    WHEN city = 'Delhi' THEN 2
    WHEN city = 'Mumbai' THEN 3
    ELSE 4
END;

-- -----------------------------------------------
-- CASE WHEN with JOIN
-- -----------------------------------------------

-- Query 6: Department status with employee names
SELECT c.name, d.dept_name,
CASE
    WHEN d.dept_name IS NULL THEN 'No Department Assigned'
    ELSE d.dept_name
END AS department_status
FROM Contributors c
LEFT JOIN Departments d
ON c.dept_id = d.dept_id;

-- -----------------------------------------------
-- CASE WHEN for performance rating
-- -----------------------------------------------

-- Query 7: Performance rating based on salary
SELECT name, salary,
CASE
    WHEN salary >= 45000 THEN '⭐⭐⭐ Excellent'
    WHEN salary >= 30000 THEN '⭐⭐ Good'
    WHEN salary >= 20000 THEN '⭐ Average'
    ELSE 'Needs Review'
END AS performance_rating
FROM Contributors
ORDER BY salary DESC;