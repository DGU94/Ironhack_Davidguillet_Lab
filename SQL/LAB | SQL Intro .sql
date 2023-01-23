#1. Review the tables in the database.
USE sakila;
#SELECT * FROM sakila.Tables GO

#2. Explore tables by selecting all columns from each table or using the in built review features for your client.
#select * from sakila.columns where table_schema = 'sakila'  and table_name = 'Your_tablename'
SELECT * FROM actor;

#3. Select one column from a table. Get film titles.
SELECT title FROM film;

#4. Select one column from a table and alias it. Get unique list of film languages under the alias language.
#Note that we are not asking you to obtain the language per each film, but this is a good time to think about
#how you might get that information in the future.
SELECT language_id  AS 'language' FROM film;

#5.1 Find out how many stores does the company have?
SELECT COUNT(store_id) FROM store;
#they are 2 stores

#5.2 Find out how many employees staff does the company have?
SELECT COUNT(staff_id) FROM staff; #they are 2 employees

#5.3 Return a list of employee first names only?
SELECT `first_name` FROM staff
