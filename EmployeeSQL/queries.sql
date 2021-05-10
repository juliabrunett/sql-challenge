-- Query 1: Employee Details
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries as s ON
e.emp_no = s.emp_no;

-- Query 2: Employees Hired in 1986
SELECT e.first_name, e.last_name, e.hire_date
FROM employees AS e
WHERE EXTRACT(YEAR FROM hire_date) = '1986';

-- Query 3: Managers of Each Department
SELECT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM employees AS e
INNER JOIN dept_manager as m ON
e.emp_no = m.emp_no
INNER JOIN departments as d ON
m.dept_no = d.dept_no;

-- Query 4: Department of each Employee
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON
e.emp_no = de.emp_no
INNER JOIN departments AS d ON
de.dept_no = d.dept_no;

-- Query 5: Employees with name "Hercules B"
SELECT e.first_name, e.last_name, e.sex
FROM employees AS e
WHERE e.first_name = 'Hercules'
AND e.last_name LIKE 'B%';

-- Query 6: Sales Department Employees
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON
e.emp_no = de.emp_no
INNER JOIN departments AS d ON
de.dept_no = d.dept_no
WHERE dept_name = 'Sales';

-- Query 7: Sales and Development Department Employees
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON
e.emp_no = de.emp_no
INNER JOIN departments AS d ON
de.dept_no = d.dept_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

-- Query 8: Frequency of Employee Last Names
SELECT e.last_name, COUNT(e.last_name) AS Frequency
FROM employees as e
GROUP BY e.last_name
ORDER BY Frequency DESC;

-- Bonus: Look up my employee ID number -- Epilogue
SELECT e.last_name, e.first_name, s.salary
FROM employees as e
JOIN salaries as s ON
e.emp_no = s.emp_no
WHERE e.emp_no = 499942;