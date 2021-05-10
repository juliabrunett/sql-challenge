-- Reset Tables
DROP TABLE salaries;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE departments;
DROP TABLE employees;
DROP TABLE titles;

-- CREATING TABLES TO IMPORT CSV FILES INTO
-- Create titles table
CREATE TABLE titles (
	title_id VARCHAR(10) NOT NULL,
	title VARCHAR(30) NOT NULL,
	PRIMARY KEY (title_id)
);

-- Create employees table
CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- Create departments table
CREATE TABLE departments (
	dept_no VARCHAR(5) NOT NULL,
	dept_name VARCHAR(20) NOT NULL,
	PRIMARY KEY (dept_no)
);


-- Create department employees table (similar to junction)
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(5) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

-- Create department managers table (similar to junction)
CREATE TABLE dept_manager (
	dept_no VARCHAR(5) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no)
);

-- Create salaries table
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Output to check proper import of CSV files
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;
