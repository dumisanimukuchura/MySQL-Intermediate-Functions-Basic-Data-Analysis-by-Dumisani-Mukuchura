-- 1. Joins (INNER, OUTER, LEFT, RIGHT, FULL, SELF)

/*
Definitions:
INNER JOIN: Returns rows with matching values in both tables.
LEFT JOIN: Returns all rows from the left table and matching rows from the right table. Non-matches are filled with NULL.
RIGHT JOIN: Returns all rows from the right table and matching rows from the left table. Non-matches are filled with NULL.
FULL JOIN: Combines LEFT JOIN and RIGHT JOIN, returning all rows with NULL where no match exists.
SELF JOIN: A table is joined with itself.

Questions:
1.1. Find the names of employees and their corresponding department names.
1.2. Retrieve all employees, including those who do not belong to a department.
1.3. List departments that have no employees.
1.4. Compare employees' salaries with others in the same department using a SELF JOIN.
*/

-- 1.1. Find the names of employees and their corresponding department names.
SELECT sal.first_name, sal.last_name, pd.department_name
FROM employee_salary AS sal
JOIN parks_departments AS pd
	ON sal.dept_id = pd.department_id;
    
-- 1.2. Retrieve all employees, including those who do not belong to a department. (Hint use RIGHT, LEFT JOINS and UNION to simulate FULL OUTER JOIN)

SELECT sal.first_name, sal.last_name, pd.department_name
FROM employee_salary AS sal
LEFT JOIN parks_departments AS pd
	ON sal.dept_id = pd.department_id
UNION
SELECT sal.first_name, sal.last_name, pd.department_name
FROM employee_salary AS sal
RIGHT JOIN parks_departments AS pd
	ON sal.dept_id = pd.department_id;
    
-- 1.3. List departments that have no employees.

SELECT pd.department_name, sal.first_name, sal.last_name
FROM parks_departments AS pd 
LEFT JOIN employee_salary AS sal 
	ON sal.dept_id = pd.department_id 
WHERE sal.dept_id IS NULL;

-- 1.4. Compare employees' salaries with others in the same department using a SELF JOIN.

SELECT sal1.first_name, sal1.last_name, sal1.salary, sal2.first_name AS other_first_name, sal2.last_name AS other_last_name, sal2.salary AS other_salary, pd.department_name 
FROM employee_salary AS sal1 
JOIN employee_salary AS sal2 
	ON sal1.dept_id = sal2.dept_id AND sal1.employee_id != sal2.employee_id
JOIN parks_departments AS pd 
	ON sal1.dept_id = pd.department_id;
