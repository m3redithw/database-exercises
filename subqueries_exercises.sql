-- q1.
-- Find all the current employees with the same hire date as employee 101010 using a sub-query.

SELECT e.first_name, e.last_name
FROM employees AS e
WHERE hire_date = (SELECT hire_date
FROM employees
WHERE emp_no = 101010);

-- q2.
