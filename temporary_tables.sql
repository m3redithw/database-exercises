-- q1.
USE employees;
CREATE TEMPORARY TABLE kalpana_1821.employees_with_departments AS
SELECT e.first_name, e.last_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS emp USING (emp_no)
JOIN departments AS d USING (dept_no);

-- a.
SELECT * FROM kalpana_1821.employees_with_departments;
ALTER TABLE kalpana_1821.employees_with_departments ADD full_name VARCHAR(100);

-- b.
UPDATE kalpana_1821.employees_with_departments SET full_name = CONCAT(first_name, ' ', last_name);

-- c.
ALTER TABLE kalpana_1821.employees_with_departments DROP COLUMN first_name;

-- q2.
USE sakila;
CREATE TEMPORARY TABLE kalpana_1821.payment AS
SELECT amount
FROM payment;

SELECT * FROM kalpana_1821.payment;
ALTER TABLE kalpana_1821.payment ADD adjusted INT;

UPDATE kalpana_1821.payment SET adjusted = 100 * amount;
ALTER TABLE kalpana_1821.payment DROP COLUMN amount;

-- q3 & q4.
USE employees;

CREATE TEMPORARY TABLE kalpana_1821.pay (SELECT 
    d.dept_name,
    AVG(salary),
    (AVG(salary) - (SELECT 
            AVG(salary)
        FROM
            salaries)) / (SELECT 
            STDDEV(salary)
        FROM
            salaries) AS zscore
FROM
    salaries
        JOIN
    dept_emp USING (emp_no)
        JOIN
    departments AS d USING (dept_no)
GROUP BY d.dept_name
ORDER BY AVG(salary) , zscore);


SELECT 
    *
FROM
    kalpana_1821.pay;


DROP TABLE IF EXISTS kalpana_1821.pay;