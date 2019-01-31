USE employees;

--Find all the employees with the same hire date as employee 101010 using a sub-query.
--69 Rows
SELECT first_name, last_name
FROM employees
WHERE hire_date IN(
SELECT hire_date
FROM employees
WHERE emp_no = 101010
);

--Find all the titles held by all employees with the first name Aamod. 314 total titles, 6 unique titles
SELECT title
FROM titles
WHERE emp_no IN(
SELECT emp_no
FROM employees
WHERE first_name = 'Aamod'
);

-- Find all the current department managers that are female.
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
    WHERE gender = 'F' AND to_date > now()
);


--Bonus
--Find all the department names that currently have female managers.
SELECT dept_name
FROM departments
WHERE dept_no IN (
    SELECT dept_no
    FROM dept_manager
    WHERE emp_no IN(
      SELECT emp_no
      FROM employees
        WHERE  to_date > now() AND gender = 'F')
    );


--Find the first and last name of the employee with the highest salary.
SELECT first_name, last_name
FROM employees
WHERE emp_no IN(
SELECT emp_no
FROM salaries
WHERE salary IN (SELECT MAX(salary)
FROM salaries)
);

--use with join
--Find the first and last name of the employee with the highest salary.
SELECT first_name, last_name
FROM employees
JOIN salaries ON salaries.emp_no = employees.emp_no
ORDER BY salary DESC
LIMIT 1;

