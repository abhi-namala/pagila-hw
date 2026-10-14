/*
 * Use a JOIN to order the countries by most profitable,
 * where the profit is the total amount that all customers from that country have payed.
 * Use tables payment, rental, customer, address, city, and country.
 * Order by country alphabetically.
 */

SELECT country.country, SUM(payment.amount) as profit
FROM payment
JOIN rental on payment.rental_id = rental.rental_id
JOIN customer on rental.customer_id = customer.customer_id
JOIN address on customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
GROUP BY country.country
ORDER BY country.country;

