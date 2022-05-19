-- q2. 
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name
FROM
    employees
WHERE
    last_name LIKE 'E%'
        AND last_name LIKE '%E';

-- q3.
SELECT 
    CONCAT(UPPER(first_name), ' ', UPPER(last_name)) AS full_name
FROM
    employees
WHERE
    last_name LIKE 'E%'
        AND last_name LIKE '%E';
        
-- q4.
SELECT 
    DATEDIFF(CURDATE(), hire_date)
FROM
    employees
WHERE
    hire_date LIKE '199%'
        AND birth_date LIKE '%12-25';
        
-- q5.
SELECT 
    MIN(salary), MAX(salary)
FROM
    salaries;
-- # MIN(salary), MAX(salary)
	SELECT 
    CONCAT(LOWER(SUBSTR(first_name, 1, 1)),
            LOWER(SUBSTR(last_name, 1, 4)),
            '_',
            SUBSTR(birth_date, 6, 2),
            SUBSTR(birth_date, 3, 2)) AS username,
    first_name,
    last_name,
    birth_date
FROM
    employees;