SELECT a.city_id, a.city
FROM city a
LEFT JOIN address b ON a.city_id = b.city_id -- cityはNULLなし
WHERE b.address_id IS NULL; -- adderess側がNULLだと紐付いてない