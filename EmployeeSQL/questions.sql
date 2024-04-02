-- Question 1
-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no
ORDER BY e.emp_no;


-- Question 2
-- List the first name, last name, and hire date for the employees who were hired in 1986.
-- Note that there are at least a couple rows that appear to be duplicates in that the first name,
-- last name, and hire_date are not unique, but the employees have 
-- different ID's (and different birth dates, though it doesn't show in the query), so we
-- don't want to use 'DISTINCT' to eliminate these since they aren't true duplicates.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY last_name, first_name;


-- Question 3
-- List the manager of each department along with their department number, department name, 
-- employee number, last name, and first name.
-- Note that any given department may have multiple managers.
SELECT dm.dept_no, dt.dept_name, dm.emp_no, em.last_name, em.first_name
FROM dept_manager AS dm
INNER JOIN employees AS em
ON em.emp_no = dm.emp_no
INNER JOIN departments AS dt
ON dt.dept_no = dm.dept_no
ORDER BY dm.dept_no;

-- Question 4
-- List the department number for each employee along with that employee’s employee number, 
-- last name, first name, and department name.
-- We should be able to do this without a junction table since
-- the dept_emp already functions as a junction table
SELECT dt.dept_name, em.emp_no, em.last_name, em.first_name, dt.dept_name
FROM employees AS em
JOIN dept_emp AS de
ON de.emp_no = em.emp_no
JOIN departments AS dt
ON dt.dept_no = de.dept_no
ORDER BY dt.dept_name, em.last_name, em.first_name;
-- Note that there are more records in the result than there are employees
-- in the employee table. This is not an error as many employees belong
-- to, or have belonged to, more than one department. The count of the 
-- returned result exactly matches the count of the dept_emp table just as
-- we would expect.


-- Question 5
-- List first name, last name, and sex of each employee whose first name is Hercules 
-- and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name like 'B%'
ORDER BY last_name;


-- Question 6
-- List each employee in the Sales department, including their employee number, 
-- last name, and first name.
SELECT em.emp_no, em.last_name, em.first_name
FROM employees AS em
JOIN dept_emp AS de
ON de.emp_no = em.emp_no
JOIN departments AS dt
ON dt.dept_no = de.dept_no
WHERE dt.dept_name = 'Sales'
ORDER BY em.last_name, em.first_name, em.emp_no;


-- Question 7
-- List each employee in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.
SELECT em.emp_no, em.last_name, em.first_name, dt.dept_name
FROM employees AS em
JOIN dept_emp AS de
ON de.emp_no = em.emp_no
JOIN departments AS dt
ON dt.dept_no = de.dept_no
WHERE dt.dept_name in ('Sales', 'Development')
ORDER BY em.last_name, em.first_name, em.emp_no;


-- Quetion 8
-- List the frequency counts, in descending order, of all the employee last names
-- (that is, how many employees share each last name).
SELECT 
	last_name,
	COUNT(*) as number_of_occurrences
FROM employees
GROUP BY last_name
ORDER BY number_of_occurrences DESC;