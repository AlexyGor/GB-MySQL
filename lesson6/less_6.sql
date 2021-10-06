
  1  Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека,
  который больше всех общался с выбранным пользователем (написал ему сообщений).
  WITH T AS (
	SELECT to_user_id AS best_friend_id FROM messages WHERE from_user_id = 201
	union ALL
	SELECT from_user_id  FROM messages WHERE to_user_id = 201
	)
	SELECT U.firstname, U.lastname, count(*) as rate FROM T
		INNER JOIN users U 
			ON U.id = T.best_friend_id
	GROUP BY best_friend_id
	ORDER BY rate DESC
	LIMIT 1;


  2  Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..
  
  SELECT count(*) as total_likes FROM media as m WHERE id IN (
	SELECT id FROM media 
	WHERE user_id IN (
		SELECT * FROM (
			SELECT user_id FROM profiles WHERE (YEAR(NOW())-YEAR(birthday)) < 10
		) as user_id		
	)
)
;
  
  
  3  Определить кто больше поставил лайков (всего): мужчины или женщины.
SELECT sex FROM (
	SELECT "M" as sex, COUNT(*) as total FROM likes WHERE user_id IN (SELECT user_id FROM profiles as p WHERE gender='M')
	UNION
	SELECT "F" as sex, COUNT(*) as total FROM likes WHERE user_id IN (SELECT user_id FROM profiles as p WHERE gender='F')
) as my_sort
ORDER BY total DESC
LIMIT 1;