/*
 * Rank actors by how many films they appear in (most films first). Ties share a rank.
 *
 * HINT:
 * Join actor with film_actor.
 * Then use a window function with an appropriate ORDER BY clause (no PARTITION BY).
 */

SELECT a.actor_id, a.first_name, a.last_name,
       COUNT(*) AS films,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS rnk
FROM actor a
JOIN film_actor fa USING (actor_id)
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY rnk, a.actor_id;
