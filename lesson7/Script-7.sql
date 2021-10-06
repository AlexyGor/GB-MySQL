-- Задание 1.
-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id)
) COMMENT = 'Заказы';


INSERT INTO orders VALUES
  (DEFAULT, 1, DEFAULT, DEFAULT),
  (DEFAULT, 1, DEFAULT, DEFAULT),
  (DEFAULT, 2, DEFAULT, DEFAULT);

SELECT 
	users.name,
	COUNT(orders.id) AS orders
FROM users
INNER JOIN orders ON (orders.user_id = users.id)
GROUP BY users.name
HAVING COUNT(orders.id) > 0;

-- Задание 2.
-- Выведите список товаров products и разделов catalogs, который соответствует товару.

SELECT 
	products.id,
	products.name,
	products.price,
	catalogs.id,
	catalogs.name AS catalog
FROM products
JOIN catalogs ON (products.catalog_id = catalogs.id); 
