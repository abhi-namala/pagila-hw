/*
 * Use a JOIN to count the number of English language films in each category.
 * Use table category, film_category, film, and language.
 */

SELECT category.name, COUNT(film_category.film_id) as sum
FROM film
JOIN language ON film.language_id = language.language_id
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE language.language_id = 1
GROUP BY category.name
ORDER BY category.name;
