-- drop table if exists
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS titles CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;

-- create tables
CREATE TABLE departments (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no)
);

CREATE TABLE titles (
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	PRIMARY KEY (title_id)
);

CREATE TABLE employees (
	emp_no INTEGER NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE salaries (
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- import csv into all these tables
-- query the data to see if they are imported correctly
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM titles;
SELECT * FROM salaries;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
