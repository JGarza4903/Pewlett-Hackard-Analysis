SELECT e.emp_no,
	e.last_name,
	e.first_name,
	e.gender,
	s.salary
FROM employees as e
LEFT JOIN salaries as s
ON e.emp_no = s.emp_no; 

--View 'to_date' in descending order
SELECT * FROM salaries
ORDER BY to_date DESC;

--Reuse code to add gender to new list and join with salaries
SELECT emp_no, first_name, last_name, gender
INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

DROP TABLE emp_info CASCADE;

--Current Employee Information
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	de.to_date
INTO emp_info   
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_employee as de
ON (e.emp_no = de.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');

SELECT * FROM emp_info;

SELECT e.emp_no,
	e.last_name,
	e.first_name,
	e.gender,
	s.salary
FROM employees as e
LEFT JOIN salaries as s
ON e.emp_no = s.emp_no; 

--View 'to_date' in descending order
SELECT * FROM salaries
ORDER BY to_date DESC;

--Reuse code to add gender to new list and join with salaries
SELECT emp_no, first_name, last_name, gender
INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

DROP TABLE emp_info CASCADE;

--Current Employee Information
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	de.to_date
INTO emp_info   
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_employee as de
ON (e.emp_no = de.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');

SELECT * FROM emp_info;


-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
INNER JOIN departments AS d
ON (dm.dept_no = d.dept_no)
INNER JOIN current_emp AS ce
ON (dm.emp_no = ce.emp_no);


--Add department info to the current employee list
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_employee as de
ON (ce.emp_no=de.emp_no)
INNER JOIN departments as d
ON (de.dept_no = d.dept_no);

SELECT * FROM retirement_info;

--Create query relevant to Sales team
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	d.dept_name
INTO sales_dept_retirement_info
FROM retirement_info as ri
INNER JOIN dept_employee as de
ON (ri.emp_no = de.emp_no)
INNER JOIN departments as d
ON (de.dept_no = d.dept_no)
WHERE (dept_name = 'Sales');

SELECT * FROM sales_dept_retirement_info;

--Create query relevant to Sales team AND Development departments
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	d.dept_name
--INTO sales_dept_retirement_info
FROM retirement_info as ri
INNER JOIN dept_employee as de
ON (ri.emp_no = de.emp_no)
INNER JOIN departments as d
ON (de.dept_no = d.dept_no)
WHERE dept_name IN ('Sales', 'Development')
;