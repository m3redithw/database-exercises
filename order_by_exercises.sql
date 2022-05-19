USE employees;
-- q2. the first person: Irena Reutenauer; the last person: Vidya Simmen
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Irena' , 'Vidya', 'Maya')
ORDER BY first_name;

-- q3. the first person: Irena Acton; the last person: Vidya Zweizig
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Irena' , 'Vidya', 'Maya')
ORDER BY first_name , last_name;

-- q4. the first person: Irena Acton; the last person: Maya Zyda
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Irena' , 'Vidya', 'Maya')
ORDER BY last_name , first_name;

-- q5. 899 employees returned; the first person: Ramzi Erde; the last person: Tadahiro Erde
SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE 'E%'
        AND last_name LIKE '%E'
ORDER BY emp_no;

-- q6. 899 employees returned; the newest person: Teiji Eldridge; the last person: Sergi Erde
SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE 'E%'
        AND last_name LIKE '%E'
ORDER BY hire_date DESC;

-- q7. 362 employees returned; the oldest person hired: Pettis Douadi; the youngest person hired: Khun Bernini
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE '199%'
        AND birth_date LIKE '%12-25'
ORDER BY birth_date, hire_date DESC;

SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE '199%'
        AND birth_date LIKE '%12-25'
ORDER BY birth_date DESC, hire_date;
