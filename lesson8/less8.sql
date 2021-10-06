/* Задача 1.
Пусть задан некоторый пользователь. 
Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем. */

use vk;

select 
	from_user_id 
	, concat(
		(select firstname from users where id = m.from_user_id), ' ', 
		(select lastname from users where id = m.from_user_id)
	) as name
	, count(*) cnt
from messages m
where to_user_id = 1
group by from_user_id
order by cnt desc
limit 1;


/*Задача 2
 общее количество лайков, которые получили пользователи младше 10 лет. */

select count(*)
from likes l
join media m on l.media_id = m.id
join profiles p on p.user_id = m.user_id
where  YEAR(CURDATE()) - YEAR(birthday) < 10;

-- ---------------------------------------------------------------
/* Задача 3
Определить кто больше поставил лайков (всего) - мужчины или женщины? */

SELECT  gender, COUNT(*)
from likes
join profiles on likes.user_id = profiles.user_id 
group by gender;
