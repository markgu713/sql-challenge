--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM employees e
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01'
ORDER BY hire_date ASC;

--3. List the manager of each department with the following information: 
--   department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no,d.dept_name, m.emp_no, e.first_name, e.last_name
FROM departments d
JOIN dept_manager m
ON d.dept_no = m.dept_no
JOIN employees e
ON m.emp_no = e.emp_no
ORDER BY dept_name ASC;

--4. List the department of each employee with the following information: 
--   employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp p
ON e.emp_no = p.emp_no
JOIN departments d
ON p.dept_no = d.dept_no
ORDER BY dept_name DESC;

--5. List first name, last name, and sex for employees 
--   whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name, e.last_name, e.sex
FROM employees e
WHERE e.first_name = 'Hercules'
AND e.last_name LIKE 'B%';

--6. List all employees in the Sales department, including 
--   their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp p
ON e.emp_no = p.emp_no
JOIN departments d
ON p.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including 
--   their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp p
ON e.emp_no = p.emp_no
JOIN departments d
ON p.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, 
--   i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Last Name Frequency"
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;