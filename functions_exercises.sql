-- q2. 
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name
FROM
    employees
WHERE
    last_name LIKE 'E%'
        AND last_name LIKE '%E';
-- 899 rows returned

SELECT 
    CONCAT(UPPER(first_name), ' ', UPPER(last_name)) AS full_name
FROM
    employees
WHERE
    last_name LIKE 'E%'
        AND last_name LIKE '%E';
-- 899 rows returned
        
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
    salaries
WHERE
    to_date > NOW();
-- # MIN(salary): 158220, MAX(salary): 38623

-- q6.
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