-- q1.
USE employees;
CREATE TEMPORARY TABLE kalpana_1821.employees_with_departments AS
SELECT e.first_name, e.last_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS emp USING (emp_no)
JOIN departments AS d USING (dept_no)
WHERE to_date>NOW();

-- a.
SELECT 
    *
FROM
    kalpana_1821.employees_with_departments;
ALTER TABLE kalpana_1821.employees_with_departments ADD full_name VARCHAR(100);

-- b.
UPDATE kalpana_1821.employees_with_departments SET full_name = CONCAT(first_name, ' ', last_name);

-- c.
ALTER TABLE kalpana_1821.employees_with_departments DROP COLUMN first_name;
AlTER TABLE kalpana_1821.employees_with_departments DROP COLUMN last_name;

-- q2.
USE sakila;
CREATE TEMPORARY TABLE kalpana_1821.payment AS
SELECT amount
FROM payment;

SELECT 
    *
FROM
    kalpana_1821.payment;
ALTER TABLE kalpana_1821.payment ADD adjusted INT;

UPDATE kalpana_1821.payment 
SET 
    adjusted = 100 * amount;
ALTER TABLE kalpana_1821.payment DROP COLUMN amount;

-- q3 & q4.
USE employees;

-- Overall current salary stats
SELECT 
    AVG(salary), STD(salary)
FROM
    salaries
WHERE
    to_date > NOW();

CREATE TEMPORARY TABLE overall_aggregates as(SELECT 
    AVG(salary), STD(salary)
FROM
    salaries
WHERE
    to_date > NOW()
);

SELECT 
    dept_name, AVG(salary) AS department_current_average
FROM
    employees.salaries
        JOIN
    employees.dept_emp USING (emp_no)
        JOIN
    employees.departments USING (dept_no)
WHERE
    employees.dept_emp.to_date > CURDATE()
        AND employees.salaries.to_date > CURDATE()
GROUP BY dept_name;

drop table if exists current_info;

-- create the temp table using the query above
create temporary table current_info as (
    select dept_name, avg(salary) as department_current_average
    from employees.salaries
    join employees.dept_emp using(emp_no)
    join employees.departments using(dept_no)
    where employees.dept_emp.to_date > curdate()
    and employees.salaries.to_date > curdate()
    group by dept_name
);

SELECT 
    *
FROM
    current_info;

-- add on all the columns we'll end up needing:
alter table current_info add overall_avg float(10,2);
alter table current_info add overall_std float(10,2);
alter table current_info add zscore float(10,2);

SELECT 
    *
FROM
    current_info;

-- set the avg and std
UPDATE current_info 
SET 
    overall_avg = (SELECT 
            avg_salary
        FROM
            overall_aggregates);
UPDATE current_info 
SET 
    overall_std = (SELECT 
            std_salary
        FROM
            overall_aggregates);