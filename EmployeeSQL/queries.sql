-- Query 1
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries as s ON
e.emp_no = s.emp_no

-- Query 2
SELECT e.first_name, e.last_name, e.hire_date
FROM employees AS e
WHERE EXTRACT(YEAR FROM hire_date) = '1986';

-- Query 3
SELECT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM employees AS e
INNER JOIN dept_manager as m ON
e.emp_no = m.emp_no
INNER JOIN departments as d ON
m.dept_no = d.dept_no;


