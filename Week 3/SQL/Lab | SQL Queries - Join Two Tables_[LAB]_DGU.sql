USE sakila;

# 1 - Which actor has appeared in the most films?
SELECT FIRST_NAME, LAST_NAME, count(FILM_ID) AS count_film FROM ACTOR
INNER JOIN film_actor
USING(ACTOR_ID)
GROUP BY ACTOR_ID
ORDER BY count_film DESC LIMIT 1;

# 2 - Most active customer (the customer that has rented the most number of films)
SELECT FIRST_NAME, LAST_NAME, count(rental_id) AS rent FROM CUSTOMER
INNER JOIN RENTAL
USING(customer_id)
GROUP BY customer_id
ORDER BY rent DESC LIMIT 1;

# 3 - List number of films per category.
SELECT CATEGORY.NAME, count(FILM_CATEGORY.film_id) FROM CATEGORY
INNER JOIN FILM_CATEGORY
USING(CATEGORY_id)
GROUP BY CATEGORY.NAME;

# 4 - Display the first and last names, as well as the address, of each staff member.
SELECT STAFF.first_name, STAFF.last_name, address.address FROM STAFF
INNER JOIN ADDRESS
USING(ADDRESS_id)
GROUP BY STAFF.staff_id;

# 5 - get films titles where the film language is either English or italian, and whose titles starts with letter "M"
# sorted by title descending.
SELECT film.title FROM film
INNER JOIN language
USING(language_id)
WHERE language_name = "English" OR language_name = "italian"
GROUP BY film.title;

# 6 - Display the total amount rung up by each staff member in August of 2005.

SELECT first_name, last_name, sum(amount) FROM staff
INNER JOIN payment
USING(staff_id)
WHERE payment_date BETWEEN "2005-08-01" AND "2005-08-31"
GROUP BY staff_id;

# 7 - List each film and the number of actors who are listed for that film.
SELECT film.title, count(film_actor.actor_id) FROM FILM
INNER JOIN film_actor
USING(film_id);

# 8 - Using the tables payment and customer and the JOIN command, list the total paid by each customer.
# List the customers alphabetically by last name.
SELECT first_name, last_name, sum(amount) FROM CUSTOMER
INNER JOIN PAYMENT
USING(customer_id)
GROUP BY customer_id;

# 9 - Write sql statement to check if you can find any actor who never particiapted in any film.
SELECT first_name, last_name, count(film_id) FROM ACTOR
INNER JOIN film_actor
USING(ACTOR_id)
GROUP BY ACTOR_id
HAVING count(film_id)<1;

# 10 - get the addresses that has NO customers, and ends with the letter "e"
SELECT address, CUSTOMER_id FROM ADDRESS
LEFT JOIN CUSTOMER
USING(address_id)
WHERE NULLIF(CUSTOMER_id, '') IS NULL