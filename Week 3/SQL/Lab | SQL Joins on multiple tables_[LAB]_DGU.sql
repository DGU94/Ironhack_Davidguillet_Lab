USE sakila;
# 1 - Write a query to display for each store its store ID, city, and country.
SELECT store_ID, city, country FROM STORE
INNER JOIN CITY
INNER JOIN COUNTRY
USING(store_id);


# 2 - Write a query to display how much business, in dollars, each store brought in.
SELECT store_id, sum(amount) FROM STORE
INNER JOIN STAFF
USING(store_id)
INNER JOIN PAYMENT
USING(staff_id)
GROUP BY store_id;

# 3 - What is the average running time(length) of films by category?
SELECT `name`, AVG(length) FROM FILM
INNER JOIN FILM_CATEGORY
USING(film_id)
INNER JOIN CATEGORY
USING(category_id)
GROUP BY name;

# 4 - Which film categories are longest(length) (find Top 5)? (Hint: You can rely on question 3 output.)
SELECT `name`, AVG(length) FROM FILM
INNER JOIN FILM_CATEGORY
USING(film_id)
INNER JOIN CATEGORY
USING(category_id)
GROUP BY name LIMIT 5;

# 5 - Display the top 5 most frequently(number of times) rented movies in descending order.
SELECT title FROM FILM
INNER JOIN INVENTORY USING(film_id)
INNER JOIN RENTAL USING(inventory_id)
GROUP BY title
ORDER BY count(rental_id) DESC LIMIT 5;

# 6 - List the top five genres in gross revenue in descending order.
SELECT `name` FROM CATEGORY
INNER JOIN FILM_CATEGORY USING(CATEGORY_id)
#INNER JOIN FILM USING(FILM_id)
INNER JOIN INVENTORY USING(film_id)
INNER JOIN RENTAL USING(inventory_id)
INNER JOIN PAYMENT USING(staff_id)
GROUP BY `name`
ORDER BY sum(amount) DESC LIMIT 5;




