/*
 * Use a JOIN to order the films by most profitable,
 * where the profit is the total amount that customers have paid for the film.
 * Use tables payment, rental, inventory, and film. 
 */
SELECT film.title, SUM(payment.amount) as profit
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
JOIN payment ON  rental.rental_id = payment.rental_id
GROUP BY film.title
ORDER BY SUM(payment.amount) DESC;

