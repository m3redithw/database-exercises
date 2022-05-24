-- q1. SELECT statements
-- a. Select all columns from the actor table.
USE sakila;
SELECT 
    *
FROM
    actor;

-- b. Select only the last_name column from the actor table.
SELECT 
    last_name
FROM
    actor;

-- c. Select only the film_id, title, and release_year columns from the film table.
SELECT 
    film_id, title, release_year
FROM
    film;


-- q2. DISTINCT operator
-- a. Select all distinct (different) last names from the actor table.
SELECT DISTINCT
    last_name
FROM
    actor;

-- b. Select all distinct (different) postal codes from the address table.
SELECT DISTINCT
    postal_code
FROM
    address;

-- c. Select all distinct (different) ratings from the film table.
SELECT DISTINCT
    rating
FROM
    film;


-- q3. WHERE clause
-- a. Select the title, description, rating, movie length columns from the films table that last 3 hours or longer.
SELECT 
    title, description, rating, length
FROM
    film
WHERE
    length > 180;

-- b. Select the payment id, amount, and payment date columns from the payments table for payments made on or after 05/27/2005.
SELECT 
    payment_id, amount, payment_date
FROM
    payment
WHERE
    payment_date > '2005-05-27';

-- c. Select the primary key, amount, and payment date columns from the payment table for payments made on 05/27/2005.
SELECT 
    payment_id, amount, payment_date
FROM
    payment
WHERE
    payment_date LIKE '2005-05-27%';
    
-- d. Select all columns from the customer table for rows that have a last names beginning with S and a first names ending with N.
SELECT 
    *
FROM
    customer
WHERE
    last_name LIKE 'S%'
        AND first_name LIKE '%N';
        
-- e. Select all columns from the customer table for rows where the customer is inactive or has a last name beginning with "M".
SELECT 
    *
FROM
    customer
WHERE
    last_name LIKE 'M%' AND active <> 1;
    
-- f. Select all columns from the category table for rows where the primary key is greater than 4 and the name field begins with either C, S or T.
SELECT 
    *
FROM
    category
WHERE
    category_id > 4
        AND (name LIKE 'C%' OR name LIKE 'S%'
        OR name LIKE 'T%');
        
-- g. Select all columns minus the password column from the staff table for rows that contain a password.
SELECT 
    *
FROM
    staff
WHERE
    password IS NOT NULL;

-- h. Select all columns minus the password column from the staff table for rows that do not contain a password.
SELECT 
    staff_id,
    first_name,
    last_name,
    address_id,
    picture,
    email,
    store_id,
    active,
    username,
    last_update
FROM
    staff
WHERE
    password IS NULL;


-- 4. IN operator
-- a. Select the phone and district columns from the address table for addresses in California, England, Taipei, or West Java.
SELECT 
    phone, district
FROM
    address
WHERE
    district IN ('California' , 'England', 'Taipei', 'West Java');

-- b. Select the payment id, amount, and payment date columns from the payment table for payments made on 05/25/2005, 05/27/2005, and 05/29/2005.
-- (Use the IN operator and the DATE function, instead of the AND operator as in previous exercises.)
SELECT 
    payment_id, amount, payment_date
FROM
    payment
WHERE
    DATE(payment_date) IN ('2005-05-25' , '2005-05-27', '2005-05-29');

-- c. Select all columns from the film table for films rated G, PG-13 or NC-17.
SELECT 
    rating
FROM
    film
WHERE
    rating IN ('G' , 'PG-13', 'NC-17');


-- 5. BETWEEN operator
-- a. Select all columns from the payment table for payments made between midnight 05/25/2005 and 1 second before midnight 05/26/2005.
SELECT 
    *
FROM
    payment
WHERE
    payment_date BETWEEN '2005-05-25 00:00:00' AND '2005-05-25 23:59:59';

-- b. Select the film_id, title, and descrition columns from the film table for films where the length of the description is between 100 and 120.
SELECT 
    film_id, title, description
FROM
    film
WHERE
    LENGTH(description) BETWEEN 100 AND 120;


-- 6. LIKE operator
-- a. Select the following columns from the film table for rows where the description begins with "A Thoughtful".
SELECT 
    description
FROM
    film
WHERE
    description LIKE 'A Thoughtful%';
    
-- b. Select the following columns from the film table for rows where the description ends with the word "Boat".
SELECT 
    description
FROM
    film
WHERE
    description LIKE '%Boat';

-- c. Select the following columns from the film table where the description contains the word "Database"
-- and the length of the film is greater than 3 hours.
SELECT 
    description
FROM
    film
WHERE
    description LIKE '%Database%'
        AND length > 180;
        
        
-- 7. LIMIT Operator
-- a. Select all columns from the payment table and only include the first 20 rows.
SELECT 
    *
FROM
    payment
LIMIT 20;

-- b. Select the payment date and amount columns from the payment table for rows where the payment amount is greater than 5,
-- and only select rows whose zero-based index in the result set is between 1000-2000.
SELECT 
    *, payment_date, amount
FROM
    payment
WHERE
    amount > 5
        AND payment_id BETWEEN 999 AND 1999;
        
-- c. Select all columns from the customer table, limiting results to those where the zero-based index is between 101-200.
SELECT 
    *
FROM
    customer
WHERE
    costomer_id BETWEEN 101 AND 200;
-- not sure about zero-based index meaning


-- 8. ORDER BY statement
-- a. Select all columns from the film table and order rows by the length field in ascending order.
SELECT * from film
order by length;

-- b. Select all distinct ratings from the film table ordered by rating in descending order.
SELECT DISTINCT rating from film order by rating DESC;

-- c. Select the payment date and amount columns from the payment table for the first 20 payments ordered by payment amount in descending order.
select payment_date, amount from payment
order by amount
limit 20;

-- d. Select the title, description, special features, length,
-- and rental duration columns from the film table for the first 10 films
-- with behind the scenes footage under 2 hours in length and a rental duration between 5 and 7 days, ordered by length in descending order.
SELECT 
    title,
    description,
    special_features,
    length,
    rental_duration
FROM
    film
WHERE
    length < 120
        AND (rental_duration BETWEEN 5 AND 7)
ORDER BY length DESC
LIMIT 10;


-- 9. JOINs
-- a. Select customer first_name/last_name and actor first_name/last_name columns from performing a left join
-- between the customer and actor column on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
SELECT 
    c.first_name, c.last_name, a.first_name, a.last_name
FROM
    customer AS c
        LEFT JOIN
    actor AS a ON c.last_name = a.last_name;

-- 620 rows returned

-- b. Select the customer first_name/last_name and actor first_name/last_name columns from performing a /right join
-- between the customer and actor column on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
SELECT 
    c.first_name, c.last_name, a.first_name, a.last_name
FROM
    customer AS c
        RIGHT JOIN
    actor AS a ON c.last_name = a.last_name;

-- 200 rows returned

-- c. Select the customer first_name/last_name and actor first_name/last_name columns from performing an inner join
-- between the customer and actor column on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
SELECT 
    c.first_name, c.last_name, a.first_name, a.last_name
FROM
    customer AS c
        INNER JOIN
    actor AS a ON c.last_name = a.last_name;

-- 43 rows returnd

-- d. Select the city name and country name columns from the city table,
-- performing a left join with the country table to get the country name column.
SELECT 
    city.city, country.country
FROM
    city
        LEFT JOIN
    country USING (country_id);

-- 600 rows returned

-- e. Select the title, description, release year,
-- and language name columns from the film table, performing a left join
-- with the language table to get the "language" column.
SELECT 
    title, description, release_year, language_id, l.name
FROM
    film
        LEFT JOIN
    language AS l USING (language_id);
    
-- 1000 rows returned

-- f.  Select the first_name, last_name, address, address2, city name, district, and postal code columns
-- from the staff table, performing 2 left joins with the address table then the city table
-- to get the address and city related columns.
select first_name, last_name, address_id, address2, city name, district, postal_code
from staff left join address using (address_id) left join city using (city_id);

-- 2 rows returned