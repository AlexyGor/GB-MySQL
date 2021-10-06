/*1.	Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.*/

   UPDATE users set created_at = NOW(), updated_at = NOW();
   
/*2.	Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR 
и в них долгое время помещались значения в формате "20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME, 
сохранив введеные ранее значения.*/
	
	ALTER TABLE users ADD created_at_dt DATETIME, updated_at_dt DATETIME;
	UPDATE users
	SET created_at_dt = STR_TO_DATE(created_at, '%d.%m.%Y %h:%i'),
	    updated_at_dt = STR_TO_DATE(updated_at, '%d.%m.%Y %h:%i');
	ALTER TABLE users 
	    DROP created_at, DROP updated_at, 
	    RENAME COLUMN created_at_dt TO created_at, RENAME COLUMN updated_at_dt TO updated_at;

/*3.	В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, 
если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, 
чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.*/

	SELECT 0 AS line, * FROM storehouses_products WHERE value > 0
	UNION 
	SELECT 1 AS line, * FROM storehouses_products WHERE value < 1
	ORDER BY line, value
	
/*4.	(по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
Месяцы заданы в виде списка английских названий ('may', 'august')*/

     SELECT * FROM users WHERE birthday in ('may', 'august')


	 
/*1.	Подсчитайте средний возраст пользователей в таблице users*/

	SELECT ROUND(AVG((TO_DAYS(NOW()) - TO_DAYS(birthday)) / 365.25), 0) AS AVG_Age FROM profiles;
	или
	SELECT ROUND(AVG(TIMESTAMPDIFF(YEAR, birthday, NOW())), 0) AS AVG_Age FROM profiles;

/*2.	Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
 Следует учесть, что необходимы дни недели текущего года, а не года рождения.*/
 
	 SELECT
		DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday), DAY(birthday))), '%W') AS day,
		COUNT(*) AS total
	FROM
		profiles
	GROUP BY
		day
	ORDER BY
		total DESC;
/*3.	(по желанию) Подсчитайте произведение чисел в столбце таблицы*/

CREATE TABLE integers(
    value SERIAL PRIMARY KEY
);

INSERT INTO integers VALUES
    (1),
    (2),
    (3),
    (4),
    (5),
    (6);


SELECT ROUND(exp(SUM(ln(value))), 0) AS factorial FROM integers;