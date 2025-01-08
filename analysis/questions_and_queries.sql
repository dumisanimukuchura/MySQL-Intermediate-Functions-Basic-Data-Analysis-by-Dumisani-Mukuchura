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
    
-- 2 Unions (UNION DISTINCT, UNION ALL)

/*
Definitions:
UNION DISTINCT: Combines rows from two queries, removing duplicates.
UNION ALL: Combines rows from two queries, keeping duplicates.

Questions
2.1 Combine the first names of employees from both employee_demographics and employee_salary tables.
2.2 Retrieve all unique department names from both parks_departments and employee_salary.
2.3 List all employee IDs from employee_demographics and employee_salary, including duplicates.
*/

-- 2.1 Combine the first names of employees from both employee_demographics and employee_salary tables.

SELECT first_name
FROM employee_demographics
UNION ALL
SELECT first_name
FROM employee_salary;

-- 2.2 Retrieve all unique department names from both parks_departments and employee_salary.

SELECT dept_id, NULL AS department_name
FROM employee_salary
UNION
SELECT department_id, department_name
FROM parks_departments;

-- 2.3 List all employee IDs from employee_demographics and employee_salary, including duplicates.

SELECT employee_id
FROM employee_demographics
UNION ALL
SELECT employee_id
FROM employee_salary;

-- 3 String Functions.

/*
Definitions:
LENGTH: Returns the number of characters in a string.
UPPER/LOWER: Converts a string to uppercase or lowercase.
TRIM, LTRIM, RTRIM: Removes spaces or specified characters from a string.
SUBSTRING: Extracts a portion of a string.
REPLACE: Replaces occurrences of a substring.
LOCATE: Finds the position of a substring in a string.
CONCAT: Combines two or more strings.

Questions:
3.1 Convert all employee names to uppercase.
3.2 Extract the first three characters of employee first names.
3.3 Replace the word "Manager" with "Supervisor" in the occupation column.
3.4 Find the position of the letter "e" in employee last names.
3.5 Combine the first and last names into a single full name column.
*/

-- 3.1 Convert all employee names to uppercase.

SELECT UPPER(first_name) AS upper_first_name, UPPER(last_name) AS upper_last_name
FROM employee_demographics;

-- 3.2 Extract the first three characters of employee first names.

SELECT LEFT(first_name, 3)
FROM employee_demographics;

-- ALTERNATIVE 

SELECT SUBSTRING(first_name, 1, 3)
FROM employee_demographics;

-- 3.3 Replace the word "Manager" with "Supervisor" in the occupation column.

SELECT REPLACE(occupation, "Office Manager", "Office Supervisor")
FROM employee_salary;

-- 3.4 Find the position of the letter "e" in employee last names.

SELECT last_name, LOCATE("e", last_name) AS e_position
FROM employee_demographics;

-- 3.5 Combine the first and last names into a single full name column.

SELECT CONCAT(first_name, " ",last_name) AS full_name
FROM employee_demographics; 

-- 4 Numerical Functions.

/*
Definition:
ROUNDS: Rounds a number to a specified number of decimal places. If no decimal places are specified, it rounds to the nearest whole number.
FLOOR: Returns the largest integer less than or equal to the given number (rounds down).
CEIL (or CEILING) Returns the smallest integer greater than or equal to the given number (rounds up).
ABS: Returns the absolute (positive) value of a number.
MOD: Returns the remainder of a division operation.

ROUND	Rounds to the nearest value.
FLOOR	Rounds down to the nearest integer
CEIL	Rounds up to the nearest integer
ABS	Returns the absolute value
MOD	Returns the remainder of division

Questions:
4.1 Round all salaries in employee_salary to the nearest thousand.
4.2 Find the absolute difference between the highest and lowest salaries.
4.3 Retrieve the modulus of salaries divided by 5,000.
*/

-- 4.1 Round all salaries in employee_salary to the nearest thousand.

SELECT ROUND(salary, 3)
FROM employee_salary;

-- 4.2 Find the absolute difference between the highest and lowest salaries.

SELECT ABS(MAX(salary) - MIN(salary)) AS max_min_salary_difference
FROM employee_salary;

-- 4.3 Retrieve the modulus of salaries divided by 5,000.

SELECT MOD(salary, 5000) 
FROM employee_salary;

-- 5. CASE Statements

/*
Definitions:
CASE allows conditional logic in queries, similar to IF-ELSE statements.

Questions:
5.1 Categorize employees into salary brackets: <50k, 50k-75k, and >75k.
5.2 Create a column indicating "Senior" for employees aged 40+ and "Junior" otherwise.
*/

-- 5.1 Categorize employees into salary brackets: <50k, 50k-60k, and >60k.

SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN "less than 50k"
    WHEN salary BETWEEN 50000 AND 60000 THEN "between 50k & 60k"
    WHEN salary > 60000 THEN "greater than 60k"
END AS salary_bracket
FROM employee_salary;

-- 5.2 Create a column indicating "Senior" for employees aged 40+ and "Junior" otherwise.

SELECT *,
CASE 
	WHEN age > 40 THEN "Senior"
    WHEN age <= 40 THEN "Junior"
END AS age_level
FROM employee_demographics;

-- ALTERNATIVE

SELECT *,
CASE 
	WHEN age > 40 THEN "Senior"
    ELSE "Junior"
END AS age_level
FROM employee_demographics;

-- 6. Subqueries (in WHERE, FROM, SELECT)

/* 
Definitions:
Subquery in WHERE: Used to filter rows based on another query.
Subquery in FROM: Treats the result of a subquery as a table.
Subquery in SELECT: Calculates values dynamically for each row.

Questions:
6.1 List employees whose salaries are above the average salary of all employees.
6.2 Retrieve the total number of employees in each department using a subquery.
6.3 Display each employee's salary as a percentage of the highest salary.
*/


-- 6.1 List employees whose salaries are above the average salary of all employees.

SELECT *
FROM employee_salary
WHERE salary > (
	SELECT AVG(salary)
    FROM employee_salary
);

-- 6.2 Retrieve the total number of employees in each department using a subquery.

SELECT dept_id, employee_total
FROM (
  SELECT COUNT(first_name) AS employee_total, dept_id
  FROM employee_salary
  GROUP BY dept_id
) AS agg_table;

-- 6.3 Display each employee's salary as a percentage of the highest salary.

SELECT first_name, last_name, salary, ((salary/
(
	SELECT MAX(salary) 
    FROM employee_salary
))*100 ) AS salary_percentage
FROM employee_salary;

-- 7. Window Functions

/*
Definitions:
Window functions perform calculations across rows related to the current row.
Common examples: ROW_NUMBER, RANK, DENSE_RANK, SUM (Rolling Total), AVG, etc.

Questions:
7.1 Assign a rank to employees based on their salaries, with ties receiving the same rank.
7.2 Compute a rolling total of salaries ordered by employee_id.
7.3 List employees with their rank and dense rank based on salary within their department.
*/

-- 7.1 Assign a rank to employees based on their salaries, with ties receiving the same rank.

SELECT employee_id, last_name, salary,
RANK() OVER(ORDER BY salary) AS rank_num
FROM employee_salary;

-- 7.2 Compute a rolling total of salaries ordered by employee_id.

SELECT first_name, last_name, salary, SUM(salary)
OVER(ORDER BY employee_id) AS rolling_salary_total
FROM employee_salary;

-- 7.3 List employees with their rank and dense rank based on salary within their department.

SELECT first_name, last_name, dept_id, salary,
RANK() OVER(PARTITION BY dept_id ORDER BY salary) AS rank_num,
DENSE_RANK() OVER(PARTITION BY dept_id ORDER BY salary) AS dense_rank_num
FROM employee_salary;











