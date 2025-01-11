# MySQL for Data Analysis Project 2: Intermediate Functions

## Contact Details
- Email: dumisanimukuchura@gmail.com
- LinkedIn: https://www.linkedin.com/in/dumisani-maxwell-mukuchura-4859b7170/

## Project Overview
This project focuses on practicing and mastering intermediate SQL functions using the `Parks_and_Wildlife` database. These functions include Joins, Unions, String Functions, Numerical Functions, Case Statements, Subqueries, and Window Functions. By exploring these topics, we aim to answer more complex business questions and gain deeper insights into the data.

## Objectives
- Learn and practice intermediate SQL functions and concepts.
- Perform queries to extract, analyze, and manipulate data effectively.
- Solve practical business questions using SQL.

---

## Dataset Description
The project is built on the fictional `Parks_and_Wildlife` database, which includes the following tables:

### 1. `employee_demographics`
| Column       | Type        | Description                          |
|--------------|-------------|--------------------------------------|
| `employee_id`| INT         | Unique ID for each employee          |
| `first_name` | VARCHAR(50) | Employee's first name                |
| `last_name`  | VARCHAR(50) | Employee's last name                 |
| `age`        | INT         | Employee's age                      |
| `gender`     | VARCHAR(10) | Employee's gender                   |
| `birth_date` | DATE        | Employee's date of birth            |

### 2. `employee_salary`
| Column       | Type        | Description                          |
|--------------|-------------|--------------------------------------|
| `employee_id`| INT         | Unique ID linking to demographics    |
| `first_name` | VARCHAR(50) | Employee's first name                |
| `last_name`  | VARCHAR(50) | Employee's last name                 |
| `occupation` | VARCHAR(50) | Job title                            |
| `salary`     | INT         | Annual salary                        |
| `dept_id`    | INT         | Department ID (foreign key)          |

### 3. `parks_departments`
| Column           | Type        | Description                          |
|------------------|-------------|--------------------------------------|
| `department_id`  | INT         | Unique department ID                 |
| `department_name`| VARCHAR(50) | Name of the department               |

---

## Functions Explored and Questions

### 1. **Joins (INNER, OUTER, LEFT, RIGHT, FULL, SELF)**
#### **Definition**
- **INNER JOIN**: Returns rows with matching values in both tables.
- **LEFT JOIN**: Returns all rows from the left table and matching rows from the right table. Non-matches are filled with `NULL`.
- **RIGHT JOIN**: Returns all rows from the right table and matching rows from the left table. Non-matches are filled with `NULL`.
- **FULL JOIN**: Combines `LEFT JOIN` and `RIGHT JOIN`, returning all rows with `NULL` where no match exists.
- **SELF JOIN**: A table is joined with itself.

#### **Questions**
1. Find the names of employees and their corresponding department names.
2. Retrieve all employees, including those who do not belong to a department.
3. List departments that have no employees.
4. Compare employees' salaries with others in the same department using a `SELF JOIN`.

---

### 2. **Unions (UNION DISTINCT, UNION ALL)**
#### **Definition**
- **UNION DISTINCT**: Combines rows from two queries, removing duplicates.
- **UNION ALL**: Combines rows from two queries, keeping duplicates.

#### **Questions**
1. Combine the first names of employees from both `employee_demographics` and `employee_salary` tables.
2. Retrieve all unique department names from both `parks_departments` and `employee_salary`.
3. List all employee IDs from `employee_demographics` and `employee_salary`, including duplicates.

---

### 3. **String Functions**
#### **Definition**
- **LENGTH**: Returns the number of characters in a string.
- **UPPER/LOWER**: Converts a string to uppercase or lowercase.
- **TRIM, LTRIM, RTRIM**: Removes spaces or specified characters from a string.
- **SUBSTRING**: Extracts a portion of a string.
- **REPLACE**: Replaces occurrences of a substring.
- **LOCATE**: Finds the position of a substring in a string.
- **CONCAT**: Combines two or more strings.

#### **Questions**
1. Convert all employee names to uppercase.
2. Extract the first three characters of employee first names.
3. Replace the word "Manager" with "Supervisor" in the `occupation` column.
4. Find the position of the letter "e" in employee last names.
5. Combine the first and last names into a single full name column.

---

### 4. **Numerical Functions**
#### **Definition**
- **ROUND**: Rounds a number to a specified number of decimal places.
- **FLOOR**: Rounds down to the nearest integer.
- **CEIL**: Rounds up to the nearest integer.
- **ABS**: Returns the absolute value of a number.
- **MOD**: Returns the remainder of a division operation.

#### **Questions**
1. Round all salaries in `employee_salary` to the nearest thousand.
2. Find the absolute difference between the highest and lowest salaries.
3. Retrieve the modulus of salaries divided by 5,000.

---

### 5. **CASE Statements**
#### **Definition**
- `CASE` allows conditional logic in queries, similar to `IF-ELSE` statements.

#### **Questions**
1. Categorize employees into salary brackets: `<50k`, `50k-75k`, and `>75k`.
2. Create a column indicating "Senior" for employees aged 40+ and "Junior" otherwise.

---

### 6. **Subqueries (in WHERE, FROM, SELECT)**
#### **Definition**
- **Subquery in WHERE**: Filters rows based on another query.
- **Subquery in FROM**: Treats the result of a subquery as a table.
- **Subquery in SELECT**: Calculates values dynamically for each row.

#### **Questions**
1. List employees whose salaries are above the average salary of all employees.
2. Retrieve the total number of employees in each department using a subquery.
3. Display each employee's salary as a percentage of the highest salary.

---

### 7. **Window Functions**
#### **Definition**
- Perform calculations across rows related to the current row, such as `ROW_NUMBER`, `RANK`, `DENSE_RANK`, and rolling totals.

#### **Questions**
1. Assign a rank to employees based on their salaries, with ties receiving the same rank.
2. Compute a rolling total of salaries ordered by `employee_id`.
3. List employees with their rank and dense rank based on salary within their department.

---

## How to Run the Project
1. **Set Up the Database**:
   - Ensure the `Parks_and_Wildlife` database is available and populated with the required tables.
2. **Run Queries**:
   - Use MySQL Workbench or any SQL client to execute the provided queries.
3. **Explore Further**:
   - Modify queries or create new ones to practice additional functions.

---

## Folder Structure

MySQL-Intermediate-Functions/ 
├── sql_scripts/ │ 
└── parks_and_recreation_intermediate.sql # SQL script for intermediate queries 
├── analysis/ │ 
└── queries_and_answers.sql # SQL queries and practice answers 
├── README.md # Project documentation

## Project Outcome
- Gained hands-on experience with intermediate SQL functions.
- Solved practical business questions using Joins, Unions, String Functions, and more.
- Enhanced understanding of advanced query techniques.

---

## Future Work
- Extend the project with more advanced SQL concepts like recursive queries or Common Table Expressions (CTEs).
- Integrate visualization tools to present query results more effectively.
"""
