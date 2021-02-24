-- Labs Joins Multiple tables

SELECT store_id, address_table.address, city, country
FROM sakila.store as store_table 
JOIN sakila.address as address_table on store_table.address_id = address_table.address_id
JOIN sakila.city as city_table on address_table.city_id = city_table.city_id
JOIN sakila.country as country_table on city_table.country_id = country_table.country_id;

-- Write a query to display how much business, in dollars, each store brought in.

SELECT store_table.store_id, sum(amount)
FROM sakila.store as store_table 
JOIN sakila.staff as staff_table on store_table.store_id = staff_table.store_id
JOIN sakila.payment as payment_table on staff_table.staff_id = payment_table.staff_id
GROUP BY store_id;

-- What is the average running time of films by category?

SELECT name, avg(length)
FROM sakila.film as film_table
JOIN sakila.film_category as film_category_table on film_table.film_id = film_category_table.film_id
JOIN sakila.category as category_table on film_category_table.category_id = category_table.category_id
GROUP BY name;

-- Which film categories are longest?

SELECT name, avg(length)
FROM sakila.film as film_table
JOIN sakila.film_category as film_category_table on film_table.film_id = film_category_table.film_id
JOIN sakila.category as category_table on film_category_table.category_id = category_table.category_id
GROUP BY name
ORDER BY avg(length) desc
LIMIT 5;

-- Display the most frequently rented movies in descending order.

SELECT title, count(rental_id)
FROM sakila.film as film_table
JOIN sakila.inventory as inventory_table on film_table.film_id = inventory_table.film_id
JOIN sakila.rental as rental_table on rental_table.inventory_id = inventory_table.inventory_id
GROUP BY title
ORDER BY count(rental_id) desc;

-- List the top five genres in gross revenue in descending order.

SELECT name, sum(amount)
FROM sakila.category as category_table
JOIN sakila.film_category as film_category_table on category_table.category_id = film_category_table.category_id
JOIN sakila.film as film_table on film_category_table.film_id = film_table.film_id
JOIN sakila.inventory as inventory_table on film_table.film_id = inventory_table.inventory_id
JOIN sakila.rental as rental_table on inventory_table.inventory_id = rental_table.inventory_id
JOIN sakila.payment as payment_table on rental_table.rental_id = payment_table.payment_id
GROUP BY name
ORDER BY sum(amount) desc
LIMIT 5;

-- Is "Academy Dinosaur" available for rent from Store 1?

SELECT distinct title
FROM sakila.inventory as inventory_table
JOIN sakila.film as film_table on inventory_table.film_id = film_table.film_id
WHERE store_id = 1 and title = "Academy Dinosaur";


