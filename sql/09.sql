/*
 * Use a JOIN to display the total amount rung up by each staff member in January of 2020.
 * Use tables staff and payment.
 */

SELECT first_name, last_name, SUM(amount) as sum 
FROM payment
JOIN staff ON payment.staff_id = staff.staff_id
WHERE payment.payment_date >= '2020-01-01' AND payment.payment_date < '2020-02-01'
GROUP BY staff.staff_id;
