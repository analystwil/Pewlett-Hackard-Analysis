--Deliverable 1: The Number of Retiring Employees by Title
SELECT e.emp_no,
    e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM "Employees" as e
LEFT JOIN "Titles" AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

-- retrieve the number of employees by their most recent job title who are about to retire.
SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

--Deliverable 2: The Employees Eligible for the Mentorship Program

SELECT DISTINCT ON (e.emp_no) de.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
INTO mentorship_eligibilty
FROM "Employees" AS e
INNER JOIN "Dept_Emp" AS de
ON (e.emp_no = de.emp_no)
INNER JOIN "Titles" AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no ASC;

SELECT * FROM "Titles"
WHERE e.emp_no = ;

SELECT DISTINCT ON (e.emp_no) de.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
--INTO mentorship_eligibilty
FROM "Employees" AS e
INNER JOIN "Dept_Emp" AS de
ON (e.emp_no = de.emp_no)
INNER JOIN "Titles" AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-01-31')
ORDER BY e.emp_no ASC;

SELECT SUM FROM "Employees"