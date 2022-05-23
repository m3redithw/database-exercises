-- q1.
-- Find all the current employees with the same hire date as employee 101010 using a sub-query.

SELECT 
    e.first_name, e.last_name
FROM
    employees AS e
WHERE
    hire_date = (SELECT 
            hire_date
        FROM
            employees
        WHERE
            emp_no = 101010);


-- q2. Find all the titles ever held by all current employees with the first name Aamod.

SELECT 
    titles.title
FROM
    (SELECT 
        emp_no
    FROM
        employees
    WHERE
        first_name = 'Aamod') AS emp
        JOIN
    titles USING (emp_no)
WHERE
    titles.to_date > NOW();
    
    
-- q3. How many people in the employees table are no longer working for the company?
-- Give the answer in a comment in your code.

SELECT 
    COUNT(*)
FROM
    employees
WHERE
    emp_no NOT IN (SELECT 
            emp_no
        FROM
            dept_emp
        WHERE
            to_date > NOW());

-- 59900


-- q4. Find all the current department managers that are female.
-- List their names in a comment in your code.

SELECT e.first_name, e.last_name
FROM employees AS e
WHERE e.emp_no IN (SELECT emp_no FROM dept_manager WHERE to_date>NOW()) AND e.gender = 'F';
-- # first_name	last_name
-- Isamu	Legleitner
-- Karsten	Sigstam
-- Leon	DasSarma
-- Hilary	Kambil


-- q5. 
-- Find all the employees who currently have a higher salary than the companies overall, historical average salary.

SELECT 
    e.first_name, e.last_name
FROM
    employees AS e
        JOIN
    salaries AS s USING (emp_no)
WHERE
    s.salary > (SELECT 
            AVG(salary)
        FROM
            salaries)
        AND s.to_date > NOW();
        

-- q6.
-- How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.)
-- What percentage of all salaries is this?

SELECT 
    COUNT(salary)
FROM
    salaries
WHERE
    salary >= (SELECT 
            MAX(salary)
        FROM
            salaries) - (SELECT 
            STD(salary)
        FROM
            salaries)
        AND to_date > NOW();

-- 78 salaries are within 1 standard deviation of the current highest salary

SELECT COUNT(*) FROM salaries;
SELECT 78/2844047;

-- 0.002743%


-- BONUS1. Find all the department names that currently have female managers.

SELECT DISTINCT
    d.dept_name
FROM
    departments AS d
        JOIN
    dept_manager AS m USING (dept_no)
WHERE
    m.emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            gender = 'F');

-- # dept_name
-- Customer Service
-- Development
-- Finance
-- Human Resources
-- Production
-- Quality Management
-- Research


-- BONUS2. Find the first and last name of the employee with the highest salary.

SELECT 
    e.first_name, e.last_name
FROM
    employees AS e
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            salaries
        WHERE
            salary =(SELECT MAX(salary) FROM salaries));

-- # first_name	last_name
-- Tokuyasu	Pesch


-- BONUS3. Find the department name that the employee with the highest salary works in.

SELECT 
    d.dept_name
FROM
    departments AS d
        JOIN
    dept_emp USING (dept_no)
WHERE
    emp_no = (SELECT 
            emp_no
        FROM
            salaries
        WHERE
            salary = (SELECT 
                    MAX(salary)
                FROM
                    salaries));
                    
-- Sales
