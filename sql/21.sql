/*
 * For each film, show the customer who most recently rented it.
 *
 * HINT:
 * Use the first_value function.
 * The window will include both PARTITION BY and ORDER BY
 */
SELECT DISTINCT f.title, x.customer_id, x.customer_name
FROM film f
JOIN (
    SELECT inv.film_id,
           FIRST_VALUE(r.customer_id) OVER w AS customer_id,
           FIRST_VALUE(c.first_name || ' ' || c.last_name) OVER w AS customer_name
    FROM rental r
    JOIN inventory inv ON r.inventory_id = inv.inventory_id
    JOIN customer c    ON c.customer_id = r.customer_id
    WINDOW w AS (PARTITION BY inv.film_id ORDER BY r.rental_date DESC)
) x ON x.film_id = f.film_id
ORDER BY f.title;

