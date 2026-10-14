/*
 * For each payment, show the customer's total amount paid overall.
 *
 * HINT:
 * Use a window function with a PARTITION BY (but no ORDER BY).
 */

SELECT c.customer_id,
       c.first_name,
       c.last_name,
       p.payment_id,
       p.amount,
       SUM(p.amount) OVER (PARTITION BY p.customer_id) AS customer_total
FROM customer c
JOIN payment p ON p.customer_id = c.customer_id
ORDER BY c.customer_id, p.payment_id;
