USE sakila;
# 1 - List all films whose length is longer than the average of all the films.
SELECT title FROM film
WHERE length > (SELECT avg(length) FROM film);


# 2 - How many copies of the film Hunchback Impossible exist in the inventory system?
#SELECT inventory_id FROM INVENTORY WHERE count(inventory_id)
SELECT title, count(INVENTORY.inventory_id) FROM FILM
WHERE film_id IN (SELECT film_id FROM FILM
				 WHERE film_id IN (SELECT film_id FROM INVENTORY
									WHERE title = "Hunchback Impossible"));

# 3 - Use subqueries to display all actors who appear in the film Alone Trip.
SELECT first_name, last_name FROM ACTOR
WHERE actor_id IN (SELECT actor_id FROM FILM_ACTOR
				  WHERE film_id IN (SELECT film_id FROM FILM
								   WHERE title = "Alone Trip"));

# 4 - Sales have been lagging among young families, and you wish to target all family movies for a promotion.
# Identify all movies categorized as family films.
SELECT title FROM FILM
WHERE film_id IN (SELECT film_id FROM FILM_CATEGORY
					WHERE category_id IN (SELECT category_id FROM CATEGORY
										   WHERE `name` = "family"));

# 5 - Get name and email from customers from Canada using subqueries.
# Do the same with joins. Note that to create a join, you will have to identify the correct tables with their
#  primary keys and foreign keys, that will help you get the relevant information.
										
 SELECT first_name, last_name, email FROM CUSTOMER
 WHERE address_id IN (SELECT address_id FROM ADDRESS
					  WHERE city_id IN (SELECT city_id FROM CITY
										WHERE country_id IN (SELECT country_id FROM COUNTRY
															WHERE country = "CANADA")));
                                                            
# Optional
# 6 - Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films.
# First you will have to find the most prolific actor and then use that actor_id to find
# the different films that he/she starred.

SELECT actor_id FROM ACTOR
