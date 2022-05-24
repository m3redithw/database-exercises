-- q1. Write a query that returns all employees, their department number, their start date, their end date,
-- and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.

USE employees;
SELECT 
    e.first_name,
    e.last_name,
    emp.from_date,
    emp.to_date,
    CASE
        WHEN emp.to_date > NOW() THEN 1
        ELSE 0
    END AS 'is_current_employee'
FROM
    employees AS e
        JOIN
    dept_emp AS emp USING (emp_no);


-- q2. Write a query that returns all employee names (previous and current),
-- and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.

SELECT 
    first_name,
    last_name,
    CASE
        WHEN
            first_name LIKE 'A%'
                OR first_name LIKE 'B%'
                OR first_name LIKE 'C%'
                OR first_name LIKE 'D%'
                OR first_name LIKE 'E%'
                OR first_name LIKE 'F%'
                OR first_name LIKE 'G%'
                OR first_name LIKE 'H%'
        THEN
            'A-H'
        WHEN
            first_name LIKE 'I%'
                OR first_name LIKE 'J%'
                OR first_name LIKE 'K%'
                OR first_name LIKE 'L%'
                OR first_name LIKE 'M%'
                OR first_name LIKE 'N%'
                OR first_name LIKE 'O%'
                OR first_name LIKE 'P%'
                OR first_name LIKE 'Q%'
        THEN
            'I-Q'
        ELSE 'R-Z'
    END AS 'alpha-group'
FROM
    employees;
    

-- q3. How many employees (current or previous) were born in each decade?

SELECT 
    COUNT(CASE
        WHEN birth_date LIKE '195%' THEN birth_date
        ELSE NULL
    END) AS '50s',
    COUNT(CASE
        WHEN birth_date LIKE '196%' THEN birth_date
        ELSE NULL
    END) AS '60s'
FROM
    employees;
-- # 50s	60s
-- 182886	117138


-- q4. What is the current average salary for each of the following department groups:
-- R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

SELECT DISTINCT
    d.dept_name,
    AVG(CASE
        WHEN
            d.dept_name = 'Research'
                OR d.dept_name = 'Devlopment'
        THEN
            s.salary
    END) AS 'R&D',
    AVG(CASE
        WHEN
            d.dept_name = 'Sales'
                OR d.dept_name = 'Marketing'
        THEN
            s.salary
    END) AS 'Sales & Marketing',
    AVG(CASE
        WHEN
            d.dept_name = 'Finance'
                OR d.dept_name = 'Human Resources'
        THEN
            s.salary
    END) AS 'Finance & HR',
    AVG(CASE
        WHEN
            d.dept_name = 'Production'
                OR d.dept_name = 'Quality Management'
        THEN
            s.salary
    END) AS 'Prod & QM',
    AVG(CASE
        WHEN d.dept_name = 'Customer Service' THEN s.salary
    END) AS 'Customer Service'
FROM
    departments AS d
        JOIN
    dept_emp AS emp USING (dept_no)
        JOIN
    salaries AS s USING (emp_no)
WHERE
    emp.to_date > NOW()
        AND s.to_date > NOW()
GROUP BY d.dept_name;

-- 'Customer Service'
-- 'Development'
-- 'Finance'
-- 'Human Resources'
-- 'Marketing'
-- 'Production'
-- 'Quality Management'
-- 'Research'
-- 'Sales'

