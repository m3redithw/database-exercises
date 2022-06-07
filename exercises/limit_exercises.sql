-- q2. # last_name
	-- Zykh
	-- Zyda
	-- Zwicker
	-- Zweizig
	-- Zumaque
	-- Zultner
	-- Zucker
	-- Zuberek
	-- Zschoche
	-- Zongker
SELECT DISTINCT last_name
FROM employees
ORDER BY last_name DESC
LIMIT 10;

-- q3. # emp_no, birth_date, first_name, last_name, gender, hire_date
	-- 'Alselm Cappello'
	-- 'Utz Mandell'
	-- 'Bouchung Schreiter'
	-- 'Baocai Kushner'
	-- 'Petter Stroustrup'

SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE '199%'
        AND birth_date LIKE '%12-25'
ORDER BY hire_date
LIMIT 5;

-- q4. page 1: offset (0) +limit (5)
	-- page 2: offset (5) + limit (5)
	-- page 3: offset (10) + limit (5)
	-- page 4: offset (15) + limit (5)
	-- page n: offset ((n-1)*5) + limit (5)