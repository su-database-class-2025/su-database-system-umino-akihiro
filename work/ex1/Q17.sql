SELECT c.name AS category, -- カテゴリー、平均貸出日数
-- DATE_PARTで日付を取り出す
-- 返却日 - 貸出日
       AVG(DATE_PART('day', r.return_date - r.rental_date)) AS avg_days
FROM category c -- rentalまで主キーと外部キーで結合
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.name -- カテゴリごと
ORDER BY avg_days DESC; -- 平均貸出日数の降順
