-- q1. Display the first and last names in all lowercase of all the actors.
SELECT 
    LOWER(first_name), LOWER(last_name)
FROM
    actor;

-- q2. You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe."
-- What is one query would you could use to obtain this information?
SELECT 
    actor_id, first_name, last_name
FROM
    actor
WHERE
    first_name = 'Joe';

-- q3. Find all actors whose last name contain the letters "gen":
SELECT 
    *
FROM
    actor
WHERE
    last_name LIKE '%gen%';

-- q4. Find all actors whose last names contain the letters "li".
-- This time, order the rows by last name and first name, in that order.
SELECT 
    *
FROM
    actor
WHERE
    last_name LIKE '%li%'
ORDER BY last_name , first_name;

-- q5. Using IN, display the country_id and country columns for the following countries:
-- Afghanistan, Bangladesh, and China:
SELECT 
    country_id, country
FROM
    country
WHERE
    country IN ('Afghanistan' , 'Bangladesh', 'China');
    
-- q6. List the last names of all the actors, as well as how many actors have that last name.
SELECT 
    last_name, LENGTH(last_name)
FROM
    actor;

-- q7. List last names of actors and the number of actors who have that last name,
-- but only for names that are shared by at least two actors
SELECT 
    last_name, COUNT(*) as number
FROM
    actor
GROUP BY last_name
HAVING number >= 2;

-- q8. You cannot locate the schema of the address table. Which query would you use to re-create it?
DESCRIBE address;

-- q9. Use JOIN to display the first and last names, as well as the address, of each staff member.
SELECT 
    s1.first_name, s1.last_name, s2.address_id
FROM
    staff AS s1
        JOIN
    staff AS s2 USING (staff_id);
    
-- q10. Use JOIN to display the total amount rung up by each staff member in August of 2005.
SELECT 
    staff_id, SUM(amount)
FROM
    staff
        JOIN
    payment USING (staff_id)
WHERE
    payment_date LIKE '2005-08%'
GROUP BY staff_id;

-- q11. List each film and the number of actors who are listed for that film.
SELECT 
    film_id, title, COUNT(actor_id)
FROM
    film
        JOIN
    film_actor USING (film_id)
GROUP BY film_id;

-- q12. How many copies of the film Hunchback Impossible exist in the inventory system?
SELECT 
    COUNT(inventory.film_id)
FROM
    film
        JOIN
    inventory USING (film_id)
WHERE
    title = 'Hunchback Impossible';
    
-- q13. The music of Queen and Kris Kristofferson have seen an unlikely resurgence. 
-- As an unintended consequence, films starting with the letters K and Q have also soared in popularity.
-- Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.

SELECT 
    title
FROM
    film
WHERE
    language_id = (SELECT 
            language_id
        FROM
            language
        WHERE
            name = 'English')
        AND title LIKE 'K%'
        OR 'Q%';
        
-- q14. Use subqueries to display all actors who appear in the film Alone Trip.
SELECT 
    actor.first_name, actor.last_name
FROM
    film_actor AS fa
        JOIN
    actor USING (actor_id)
WHERE
    fa.film_id = (SELECT 
            film_id
        FROM
            film
        WHERE
            title = 'Alone Trip');

-- q15. You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers.
SELECT 
    c.first_name, c.last_name, c.email
FROM
    customer AS c
        JOIN
    address AS a USING (address_id)
        JOIN
    city AS c USING (city_id)
        JOIN
    country AS co USING (country_id)
WHERE co.country = 'Canada';

-- q16. Sales have been lagging among young families,
-- and you wish to target all family movies for a promotion. Identify all movies categorized as famiy films.
SELECT 
    film.title
FROM
    category
        JOIN
    film_category USING (category_id)
        JOIN
    film USING (film_id)
WHERE
    category.name = 'Family';
    
-- q17. Write a query to display how much business, in dollars, each store brought in.


-- q18. Write a query to display for each store its store ID, city, and country.
SELECT 
    s.store_id, city.city, country.country
FROM
    store AS s
        JOIN
    address AS a USING (address_id)
        JOIN
    city USING (city_id)
        JOIN
    country USING (country_id);

-- q19. List the top five genres in gross revenue in descending order.
-- (Hint: you may need to use the following tables: category, film_category, inventory, payment, and rental.)