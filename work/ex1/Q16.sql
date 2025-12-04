SELECT c.name AS category, -- カテゴリ、本数、売上
       COUNT(r.rental_id) AS rentals,
       SUM(p.amount) AS total_amount
FROM category c -- rentalとpaymentまで主キーと外部キーで結合
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY c.name -- カテゴリごと
ORDER BY rentals DESC; -- 本数の降順