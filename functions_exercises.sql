USE employees;



-- Modify your first query to order by first name. The first result should be Irena Reutenauer and the last result should be Vidya Simmen.
SELECT *
FROM employees
WHERE first_name IN('Irena','Vidya','Maya')
ORDER BY first_name;
-- Update the query to order by first name and then last name. The first result should now be Irena Acton and the last should be Vidya Zweizig.
SELECT *
FROM employees
WHERE first_name IN('Irena','Vidya','Maya')
ORDER BY first_name, last_name;
-- Change the order by clause so that you order by last name before first name. Your first result should still be Irena Acton but now the last result should be Maya Zyda.
SELECT *
FROM employees
WHERE first_name IN('Irena','Vidya','Maya')
ORDER BY last_name, first_name;


-- Find all employees hired in the 90s — 135,214 rows.
SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01'
          AND '1999-12-31';
-- Find all employees born on Christmas — 842 rows.
SELECT *
FROM employees
WHERE birth_date LIKE '%-12-25';
-- Find all employees with a 'q' in their last name — 1,873 rows.
SELECT *
FROM employees
WHERE last_name LIKE '%q%';
-- Update your query for 'Irena', 'Vidya', or 'Maya' to use OR instead of IN — 709 rows.
-- Add a condition to the previous query to find everybody with those names who is also male — 441 rows.
SELECT *
FROM employees
WHERE (first_name LIKE '%Irena%'
         OR first_name LIKE '%Vidya%'
         OR first_name LIKE '%Maya%')
  AND gender = 'M';

-- Find all employees whose last name starts or ends with 'E' — 30,723 rows.
-- Update your queries for employees with 'E' in their last name to sort the results by their employee number. Your results should not change!
SELECT CONCAT(first_name,' ', last_name)
FROM employees
WHERE last_name LIKE 'E%'
   OR last_name LIKE '%E'
ORDER BY emp_no;
-- Duplicate the previous query and update it to find all employees whose last name starts and ends with 'E' — 899 rows.
SELECT CONCAT(first_name,' ', last_name)
FROM employees
WHERE last_name LIKE 'E%'
  AND last_name LIKE '%E'
ORDER BY emp_no;
# Now reverse the sort order for both queries.
SELECT CONCAT(first_name,' ', last_name)
FROM employees
WHERE last_name LIKE 'E%'
   OR last_name LIKE '%E'
ORDER BY emp_no DESC;

SELECT CONCAT(first_name,' ', last_name)
FROM employees
WHERE last_name LIKE 'E%'
  AND last_name LIKE '%E'
ORDER BY emp_no DESC;

-- Find all employees hired in the 90s and born on Christmas — 362 rows.
SELECT CONCAT(first_name,' ', last_name), DATEDIFF(now(), hire_date)AS 'Days Working at the Company'
FROM employees
WHERE (hire_date BETWEEN '1990-01-01' AND '1999-12-31')
  AND birth_date LIKE '%-12-25'
ORDER BY birth_date,hire_date DESC;
-- Find all employees with a 'q' in their last name but not 'qu' — 547 rows.
SELECT *
FROM employees
WHERE last_name LIKE '%q%'
  AND last_name  NOT LIKE '%qu%';

