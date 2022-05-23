USE join_example_db;
-- iner join
SELECT 
    *
FROM
    users
        INNER JOIN
    roles ON users.id = roles.id;
-- # id	name	email	role_id	id	name
-- 1	bob	bob@example.com	1	1	admin
-- 2	joe	joe@example.com	2	2	author
-- 3	sally	sally@example.com	3	3	reviewer
-- 4	adam	adam@example.com	3	4	commenter

SELECT 
    *
FROM
    users
        LEFT JOIN
    roles ON users.id = roles.id;

-- right join
SELECT 
    *
FROM
    users
        RIGHT JOIN
    roles ON users.id = roles.id;

-- q2. Write a query that shows each department along with the name of the current manager for that department.
USE employees;
SELECT 
    d.dept_name as 'Department Name', CONCAT (e.first_name,' ', e.last_name) as 'Department Manager'
FROM
    employees AS e
        INNER JOIN
    dept_manager AS m ON e.emp_no = m.emp_no
        INNER JOIN
    departments AS d ON d.dept_no = m.dept_no
WHERE
    to_date > NOW()
ORDER BY d.dept_name;

-- # Department Name	Department Manager
-- Customer Service	Yuchang Weedman
-- Development	Leon DasSarma
-- Finance	Isamu Legleitner
-- Human Resources	Karsten Sigstam
-- Marketing	Vishwani Minakawa
-- Production	Oscar Ghazalie
-- Quality Management	Dung Pesch
-- Research	Hilary Kambil
-- Sales	Hauke Zhang


-- q3. Find the name of all departments currently managed by women.
SELECT 
   d.dept_name as 'Department Name', CONCAT (e.first_name,' ', e.last_name) as 'Manager Name'
FROM
    employees AS e
        INNER JOIN
    dept_manager AS m ON e.emp_no = m.emp_no
        INNER JOIN
    departments AS d ON d.dept_no = m.dept_no
WHERE
    to_date > NOW() AND e.gender = 'F'
ORDER BY d.dept_name;

-- # Department Name, Manager Name
-- Development, Leon DasSarma
-- Finance, Isamu Legleitner
-- Human Resources, Karsten Sigstam
-- Research, Hilary Kambil


-- q4. Find the current titles of employees currently working in the Customer Service department.
SELECT 
    t.title AS 'Title', COUNT(distinct t.emp_no) AS 'Count'
FROM
    titles AS t
        JOIN
    dept_emp AS emp ON t.emp_no = emp.emp_no
        JOIN
    departments AS d ON d.dept_no = emp.dept_no
WHERE
    d.dept_name = 'Customer Service'
        AND t.to_date > NOW() AND emp.to_date>NOW()
GROUP BY t.title
ORDER BY t.title;


-- # Title	Count
-- Assistant Engineer	68
-- Engineer	627
-- Manager	1
-- Senior Engineer	1790
-- Senior Staff	11268
-- Staff	3574
-- Technique Leader	241


-- q5. Find the current salary of all current managers.
SELECT d.dept_name AS 'Department Name' ,CONCAT(e.first_name, ' ', e.last_name) AS 'Name', s.salary AS 'Salary'
FROM departments AS d JOIN dept_manager AS m ON d.dept_no = m.dept_no
JOIN employees AS e ON m.emp_no = e.emp_no
JOIN salaries AS s ON e.emp_no = s.emp_no
WHERE m.to_date>NOW() AND s.to_date>NOW()
ORDER BY d.dept_name;


-- # Department Name	Name	Salary
-- Customer Service	Yuchang Weedman	58745
-- Development	Leon DasSarma	74510
-- Finance	Isamu Legleitner	83457
-- Human Resources	Karsten Sigstam	65400
-- Marketing	Vishwani Minakawa	106491
-- Production	Oscar Ghazalie	56654
-- Quality Management	Dung Pesch	72876
-- Research	Hilary Kambil	79393
-- Sales	Hauke Zhang	101987


-- q6. Find the number of current employees in each department.
SELECT 
    d.dept_no AS 'dept_no',
    d.dept_name AS 'dept_name',
    COUNT(emp.emp_no) AS 'num_employees'
FROM
    departments AS d
        JOIN
    dept_emp AS emp ON d.dept_no = emp.dept_no
WHERE
    emp.to_date > NOW()
GROUP BY d.dept_no;


-- # dept_no	dept_name	num_employees
-- d001	Marketing	14842
-- d002	Finance	12437
-- d003	Human Resources	12898
-- d004	Production	53304
-- d005	Development	61386
-- d006	Quality Management	14546
-- d007	Sales	37701
-- d008	Research	15441
-- d009	Customer Service	17569


-- q7. Which department has the highest average salary? Hint: Use current not historic information.
SELECT 
    d.dept_name AS 'dept_name',  AVG(s.salary) AS 'average_salary'
FROM
    departments AS d
        JOIN
    dept_emp AS emp ON d.dept_no = emp.dept_no
        JOIN
    salaries AS s ON emp.emp_no = s.emp_no

WHERE emp.to_date > NOW() AND s.to_date > NOW()
GROUP BY d.dept_name
ORDER BY AVG(s.salary) DESC
LIMIT 1;


-- # dept_name	average_salary
-- Sales	88852.9695


-- q8. Who is the highest paid employee in the Marketing department?
SELECT 
    e.first_name AS first_name, e.last_name AS last_name
FROM
    employees AS e
        JOIN
    salaries AS s ON e.emp_no = s.emp_no
        JOIN
    dept_emp AS emp ON emp.emp_no = s.emp_no
        JOIN
    departments AS d ON d.dept_no = emp.dept_no
WHERE
    emp.to_date > NOW()
        AND s.to_date > NOW()
        AND d.dept_name = 'Marketing'
ORDER BY s.salary DESC
LIMIT 1;


-- # first_name	last_name
-- Akemi	Warwick


-- q9. Which current department manager has the highest salary?
SELECT 
    e.first_name, e.last_name, s.salary, d.dept_name
FROM
    departments AS d
        JOIN
    dept_manager AS m ON d.dept_no = m.dept_no
        JOIN
    salaries AS s ON m.emp_no = s.emp_no
        JOIN
    employees AS e ON s.emp_no = e.emp_no
WHERE
    s.to_date > NOW() AND m.to_date > NOW()
ORDER BY s.salary DESC
LIMIT 1;


-- # first_name	last_name	salary	dept_name
-- Vishwani	Minakawa	106491	Marketing


-- q10.
SELECT 
    d.dept_name, ROUND(AVG(s.salary))
FROM
    departments AS d
        JOIN
    dept_emp AS emp ON d.dept_no = emp.dept_no
        JOIN
    salaries AS s ON emp.emp_no = s.emp_no
GROUP BY d.dept_name
ORDER BY AVG(s.salary) DESC;


-- # dept_name	round(AVG(s.salary))
-- Sales	80668
-- Marketing	71913
-- Finance	70489
-- Research	59665
-- Production	59605
-- Development	59479
-- Customer Service	58770
-- Quality Management	57251
-- Human Resources	55575


-- q11. BONUS Find the names of all current employees, their department name, and their current manager's name.
SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS 'Employee Name',
    d.dept_name AS 'Department Name',
    CONCAT(e2.first_name, ' ', e2.last_name)
FROM
    employees AS e
        JOIN
    dept_emp AS emp ON e.emp_no = emp.emp_no
        JOIN
    dept_manager AS m ON m.dept_no = emp.dept_no
        JOIN
    departments AS d ON d.dept_no = m.dept_no
        JOIN
    employees AS e2 ON m.emp_no = e2.emp_no
WHERE
    emp.to_date > NOW()
        AND m.to_date > NOW();


-- q12. BONUS Who is the highest paid employee within each department.
-- SELECT d.dept_name, e.first_name, e.last_name, s.salary
-- FROM employees as e

--  join dept_emp as emp on e.emp_no = emp.emp_no
--  join salaries as s on emp.emp_no = s.emp_no
--  join departments as d on emp.dept_no = d.dept_no
-- GROUP BY d.dept_name, e.first_name, e.last_name, s.salary
-- ORDER BY (s.salary) DESC;


SELECT e.first_name, e.last_name, s.salary, d.dept_name--  COUNT(DISTINCT e.emp_no)
FROM employees as e
JOIN salaries AS s ON e.emp_no = s.emp_no
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
WHERE e.emp_no in (
    SELECT e.emp_no
    FROM salaries
    Where to_date > NOW()
      AND salary = (SELECT max(salary) FROM salaries)
)
GROUP BY e.first_name, e.last_name, s.salary, d.dept_name;
-- HAVING COUNT(e.emp_no) < 2;