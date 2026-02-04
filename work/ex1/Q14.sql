SELECT a.store_id, b.address, c.city
FROM store a
JOIN address b ON a.address_id = b.address_id
JOIN city c ON b.city_id = c.city_id