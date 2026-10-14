/* 
 * Use a JOIN to list the number of copies of each film in the inventory system that begins with the letter h.
 * Use tables inventory and film.
 * Order by film title in reverse alphabetical order.
 */

SELECT inventory.film_id, film.title, COUNT(inventory.inventory_id) as count
FROM inventory
JOIN film ON inventory.film_id = film.film_id
WHERE title ILIKE 'h%'
GROUP BY inventory.film_id, film.title
ORDER BY film.title DESC;
