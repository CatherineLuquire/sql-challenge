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
--  	FOREIGN KEY (emp_no) REFERENCES salaries (emp_no),
--  	FOREIGN KEY (emp_no) REFERENCES dept_manager (emp_no),
-- 	FOREIGN KEY (emp_no) REFERENCES dept_emp (emp_no)
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
-- List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salary.salary
FROM employees
JOIN salaries AS salary
	ON employees.emp_no = salary.emp_no
;

-- List first name, last name, and hire date for employees 
-- who were hired in 1986.

SELECT (first_name), (last_name), (hire_date) FROM employees
WHERE hire_date LIKE '%1986%';

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name.
SELECT dept_manager.dept_no, department.dept_name, dept_manager.emp_no, employee.first_name, employee.last_name
FROM dept_manager
JOIN departments as department
	ON dept_manager.dept_no = department.dept_no
JOIN employees as employee
	ON dept_manager.emp_no = employee.emp_no;
-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT dept_emp.emp_no, employee.last_name, employee.first_name, department.dept_name
FROM dept_emp
JOIN departments as department
	ON dept_emp.dept_no = department.dept_no
JOIN employees as employee
	ON dept_emp.emp_no = employee.emp_no;

-- List first name, last name, and sex for employees whose first name is 
-- "Hercules" and last names begin with "B."
SELECT (first_name), (last_name), (sex)
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee 
-- number, last name, first name, and department name.

SELECT dept_emp.emp_no, employee.last_name, employee.first_name, department.dept_name
FROM dept_emp
JOIN departments as department
	ON dept_emp.dept_no = department.dept_no
JOIN employees as employee
	ON dept_emp.emp_no = employee.emp_no
WHERE dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including 
-- their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employee.last_name, employee.first_name, department.dept_name
FROM dept_emp
JOIN departments as department
	ON dept_emp.dept_no = department.dept_no
JOIN employees as employee
	ON dept_emp.emp_no = employee.emp_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT last_name,
 COUNT(last_name) 
FROM employees
GROUP BY  last_name
ORDER BY COUNT(last_name) DESC ;

