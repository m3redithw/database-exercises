USE employees;
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Irena' , 'Vidya', 'Maya');
-- q2. 709 rows returned

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Irena'
        OR first_name = 'Vidya'
        OR first_name = 'Maya';
-- q3. 709 rows returned

SELECT 
    *
FROM
    employees
WHERE
    (first_name = 'Irena'
        OR first_name = 'Vidya'
        OR first_name = 'Maya')
        AND gender = 'M';
-- q4. 441 rows returned

SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE 'E%';
-- q5. 7330 rows returned

SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE '%E'
        OR last_name LIKE 'E%';
-- q6. 24292 employees have a last name that ends with E
	SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE '%E'
        AND last_name LIKE 'E%';
-- q7. 24292 employees have a last name that ends with E
	-- 899 employees have a last name starts and ends with E
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE '199%';
-- q8. 135214 employees are hired in the 90s

SELECT 
    COUNT(birth_date)
FROM
    employees
WHERE
    birth_date LIKE '%12-25';
-- q9. 842 employees are born on Christmas

SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE '199%'
        AND birth_date LIKE '%12-25';
-- q10. 362 employees are hired in the 90s and born on Christmas

SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE '%q%';
-- q11. 1873 employees have a 'q' in their last name

SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE '%q%'
        AND last_name NOT LIKE '%qu%';
-- q12. 547 employees have a 'q' but not 'qu' in their last name