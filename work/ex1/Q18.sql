SELECT co.country, -- 国、ID、売上
       COUNT(cu.customer_id) AS num_customers,
       SUM(p.amount) AS total_sales
FROM country co -- customerとpaymentまで主キーと外部キーで結合
JOIN city ci ON co.country_id = ci.country_id
JOIN address a ON ci.city_id = a.city_id
JOIN customer cu ON a.address_id = cu.address_id
JOIN payment p ON cu.customer_id = p.customer_id
GROUP BY co.country -- 国別
ORDER BY total_sales DESC; -- 売上の降順