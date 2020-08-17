-- create tables for Employees, dept_emp, department, salaries, titles, and Dept_manager
CREATE TABLE titles(
	title_id VARCHAR(225) NOT NULL,
	title VARCHAR(225) NOT NULL,
	PRIMARY KEY (title_id)
);

SELECT * FROM titles;

CREATE TABLE employees(
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(225) NOT NULL,
	birth_date VARCHAR(225) NOT NULL,
	first_name VARCHAR(225) NOT NULL,
	last_name VARCHAR(225) NOT NULL,
	sex VARCHAR(225) NOT NULL,
	hire_date VARCHAR(225) NOT NULL,
 	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

SELECT * FROM employees;
	
CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
 	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

SELECT * FROM salaries;

CREATE TABLE departments(
	dept_no VARCHAR(225) NOT NULL,
	dept_name VARCHAR(225) NOT NULL,
	PRIMARY KEY (dept_no)
);

SELECT * FROM departments;

CREATE TABLE dept_manager(
	dept_no VARCHAR(225) NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

SELECT * FROM dept_manager;

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR(225) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

SELECT * FROM dept_emp;
