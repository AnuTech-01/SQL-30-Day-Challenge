-- ================================================
-- Day 13: String Functions
-- Table : Contributors
-- ================================================

-- -----------------------------------------------
-- UPPER / LOWER: Case change karna
-- -----------------------------------------------

-- Query 1: Convert names to UPPERCASE
SELECT name, UPPER(name) AS name_upper
FROM Contributors;

-- Query 2: Convert city names to lowercase
SELECT city, LOWER(city) AS city_lower
FROM Contributors;

-- -----------------------------------------------
-- CONCAT: Strings ko jodna
-- -----------------------------------------------

-- Query 3: Combine name and city together
SELECT CONCAT(name, ' - ', city) AS employee_info
FROM Contributors;

-- Query 4: Create email-style ID using name
SELECT name, 
CONCAT(LOWER(name), '@company.com') AS email
FROM Contributors;

-- -----------------------------------------------
-- LENGTH: String ki length nikalna
-- -----------------------------------------------

-- Query 5: Find length of each name
SELECT name, LENGTH(name) AS name_length
FROM Contributors;

-- Query 6: Find employees with name longer than 4 characters
SELECT name, LENGTH(name) AS name_length
FROM Contributors
WHERE LENGTH(name) > 4;

-- -----------------------------------------------
-- SUBSTRING: Text ka part nikalna
-- -----------------------------------------------

-- Query 7: First 3 letters of each name
SELECT name, SUBSTRING(name, 1, 3) AS short_name
FROM Contributors;

-- Query 8: Create employee code (first 2 letters + emp_id)
SELECT name, 
CONCAT(UPPER(SUBSTRING(name, 1, 2)), emp_id) AS emp_code
FROM Contributors;

-- -----------------------------------------------
-- TRIM: Extra spaces hatana
-- -----------------------------------------------

-- Query 9: Remove extra spaces from text
SELECT TRIM('   Anu Jangid   ') AS trimmed_name;

-- -----------------------------------------------
-- REPLACE: Text replace karna
-- -----------------------------------------------

-- Query 10: Replace 'Jaipur' with 'JPR' in city
SELECT city, REPLACE(city, 'Jaipur', 'JPR') AS city_short
FROM Contributors;

-- -----------------------------------------------
-- COMBINED: Real world example
-- -----------------------------------------------

-- Query 11: Create full employee ID card info
SELECT 
CONCAT(UPPER(SUBSTRING(name, 1, 1)), LOWER(SUBSTRING(name, 2))) AS proper_name,
UPPER(city) AS city,
CONCAT('EMP-', emp_id, '-', UPPER(SUBSTRING(city, 1, 3))) AS employee_id
FROM Contributors;