-- q2. How many unique titles have there ever been?
SELECT 
    COUNT(DISTINCT title)
FROM
    titles;
-- there are 7 unique titles

SELECT DISTINCT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%E'
        AND last_name LIKE 'E%'
GROUP BY last_name;
-- 'Erde'
-- 'Eldridge'
-- 'Etalle'
-- 'Erie'
-- 'Erbe'

SELECT DISTINCT
    CONCAT(first_name, '_', last_name)
FROM
    employees
WHERE
    last_name LIKE '%E'
        AND last_name LIKE 'E%';
-- unique combination of first name and last name: 846 results

SELECT DISTINCT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%q%'
        AND last_name NOT LIKE '%qu%';
-- 'Chleq'
-- 'Lindqvist'
-- 'Qiwen'

SELECT 
    last_name, COUNT(last_name) AS count
FROM
    employees
WHERE
    last_name LIKE '%q%'
        AND last_name NOT LIKE '%qu%'
GROUP BY last_name;
-- Chleq	189
-- Lindqvist	190
-- Qiwen	168

SELECT 
    first_name, gender, COUNT(gender)
FROM
    employees
WHERE
    first_name IN ('Irena' , 'Vidya', 'Maya')
GROUP BY first_name , gender;
-- # first_name	gender	count(first_name)
-- Vidya	M	151
-- Irena	M	144
-- Irena	F	97
-- Maya		F	90
-- Vidya	F	81
-- Maya		M	146

SELECT 
    SUBSTR(first_name, 1, 1) AS first,
    SUBSTR(last_name, 1, 4) AS second,
    SUBSTR(birth_date, 6, 2) AS third,
    SUBSTR(birth_date, 3, 2) AS fourth,
    CONCAT(LOWER(SUBSTR(first_name, 1, 1)),
            LOWER(SUBSTR(last_name, 1, 4)),
            '_',
            SUBSTR(birth_date, 6, 2),
            SUBSTR(birth_date, 3, 2)) AS username,
    COUNT(CONCAT(LOWER(SUBSTR(first_name, 1, 1)),
            LOWER(SUBSTR(last_name, 1, 4)),
            '_',
            SUBSTR(birth_date, 6, 2),
            SUBSTR(birth_date, 3, 2))) AS count
FROM
    employees
GROUP BY first , second , third , fourth , username
ORDER BY first , second , third , fourth , username;

-- q9.
-- Determine the historic average salary for each employee.
SELECT 
    emp_no, AVG(salary)
FROM
    salaries
GROUP BY emp_no;

-- Using the dept_emp table, count how many current employees work in each department.
SELECT 
    dept_no, COUNT(dept_no)
FROM
    dept_emp
GROUP BY dept_no;
-- # dept_no	COUNT(dept_no)
-- d001	20211
-- d002	17346
-- d003	17786
-- d004	73485
-- d005	85707
-- d006	20117
-- d007	52245
-- d008	21126
-- d009	23580

SELECT 
    emp_no, COUNT(emp_no)
FROM
    salaries
GROUP BY emp_no;

-- Find the maximum salary for each employee.
SELECT 
    emp_no, MAX(salary)
FROM
    salaries
GROUP BY emp_no;

-- Find the minimum salary for each employee.
SELECT 
    emp_no, MIN(salary)
FROM
    salaries
GROUP BY emp_no;

-- Find the standard deviation of salaries for each employee.
SELECT 
    emp_no, STD(salary)
FROM
    salaries
GROUP BY emp_no;

-- Now find the max salary for each employee where that max salary is greater than $150,000.
SELECT 
    emp_no, MAX(salary) AS max
FROM
    salaries
GROUP BY emp_no
HAVING max > 150000;

-- Find the average salary for each employee where that average salary is between $80k and $90k.
SELECT 
    emp_no, AVG(salary) AS average
FROM
    salaries
GROUP BY emp_no
HAVING average >= 80000 AND average <= 90000;
