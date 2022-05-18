USE employees;
SHOW tables;
DESCRIBE departments;
DESCRIBE dept_emp;
DESCRIBE dept_manager;
DESCRIBE employees;
DESCRIBE salaries;
DESCRIBE titles;


-- q6. Which table(s) do you think contain a numeric type column?
-- answer: departments, dept_emp, dept_manager, employees, salaires, titles table contain a numeric type column
-- q7. Which table(s) do you think contain a string type column? 
-- answer: deparments, dept_emp, dept_manager,  employees, titles table contain a string value
-- q8. Which table(s) do you think contain a date type column? 
-- answer: dept_emp, dept_manager, employees, salaries, titles contain date type column
-- q9. What is the relationship between the employees and the departments tables? 
-- answer: they are from the same database,
-- with primary key "dept_no" and "emp_no" which are both associated with the dept_manager table

SHOW CREATE TABLE dept_manager;
-- dept_manager	CREATE TABLE `dept_manager` (
--   `emp_no` int NOT NULL,
--   `dept_no` char(4) NOT NULL,
--   `from_date` date NOT NULL,
--   `to_date` date NOT NULL,
--   PRIMARY KEY (`emp_no`,`dept_no`),
--   KEY `dept_no` (`dept_no`),
--   CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
--   CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1
