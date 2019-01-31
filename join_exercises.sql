USE employees;


#Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.
SELECT dept_name AS 'Department Name', CONCAT(employees.first_name, employees.last_name) AS 'Department Manager'
FROM dept_manager
JOIN departments ON departments.dept_no = dept_manager.dept_no
JOIN employees ON employees.emp_no = dept_manager.emp_no
WHERE to_date > now()
ORDER BY dept_name;


# Find the name of all departments currently managed by women.
SELECT dept_name AS 'Department Name', CONCAT(employees.first_name, ' ', employees.last_name) AS 'Manager Name'
FROM dept_manager
JOIN departments on departments.dept_no = dept_manager.dept_no
JOIN employees on employees.emp_no = dept_manager.emp_no
WHERE to_date > now() AND employees.gender = 'F'
ORDER BY dept_name;

# Find the current titles of employees currently working in the Customer Service department.
SELECT title AS Title, COUNT(titles.emp_no) AS Count
FROM departments
JOIN dept_emp ON dept_emp.dept_no = departments.dept_no
JOIN employees ON employees.emp_no = dept_emp.emp_no
JOIN titles ON titles.emp_no = employees.emp_no
WHERE dept_name LIKE '%Customer Service%' AND titles.to_date>now()
GROUP BY title;


 #Find the current salary of all current managers.
SELECT dept_name AS 'Department Name', CONCAT(employees.first_name, ' ', employees.last_name) AS 'Name', salaries.salary
FROM dept_manager
JOIN departments ON departments.dept_no = dept_manager.dept_no
JOIN employees ON employees.emp_no = dept_manager.emp_no
JOIN salaries ON salaries.emp_no = dept_manager.emp_no
WHERE salaries.to_date > now() AND dept_manager.to_date>now()
ORDER BY dept_name;

# Bonus Find the names of all current employees, their department name, and their current manager's name.
SELECT CONCAT(first_name, ' ', last_name) AS 'Employee Name', dept_name AS 'Department Name', CONCAT(dept_manager.emp_no, ' ', dept_manager.dept_no) AS 'Manager Name'
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
JOIN dept_manager ON dept_manager.dept_no = departments.dept_no
WHERE dept_emp.to_date>now() AND dept_manager.to_date>now();
