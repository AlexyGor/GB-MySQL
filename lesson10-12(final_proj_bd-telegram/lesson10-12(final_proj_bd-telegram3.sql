

use telegram;

--Выбираем данные по конкретному пользователю

SELECT 
		username,
		phone,
		photo_id,
		hometown,
		is_active,
		body,
		media_type_id AS medya
	FROM users u 
	  JOIN profiles p ON u.id = p.user_id
	  JOIN media m ON u.id = m.user_id
  WHERE u.id = 106;
 
 --Какие друзья находятся в черном списке
  
 SELECT 
	 firstname,
	 lastname,
	 contacts_id AS total_friends,
	 created_at
  FROM contacts c 
    JOIN block_list bl ON c.id = bl.contacts_id 
  where c.id = 2
  GROUP BY c.id
  ORDER BY total_friends DESC;
 
 --Количество групп и чатов пользователя
 
 SELECT 
	 firstname,
	 lastname,
	 tg.name group_tg,
	 c.name channels_tg, 
	 tg.leave_tg_group ,
	 c.leave_channel 
  FROM users u 
    JOIN channels c ON u.id = c.admin_user_id 
    JOIN tg_group tg ON u.id = tg.admin_id 
  WHERE u.id = 109;

 --представление, выбирающее активный профайл
 
 CREATE OR REPLACE VIEW tg_profiles
	AS
 
  SELECT *
  FROM users u
    JOIN profiles p ON u.id = p.user_id 
  WHERE p.is_active = 1

  	UNION
  	
 SELECT *
  FROM users u
    JOIN profiles p ON u.id = p.birthday 
  WHERE  p.is_active = 1;

 SELECT 
 	firstname,
	 lastname,
	 hometown,
	 phone
 FROM tg_profiles;

/*представление, выбирающее друзей пользователя из групп*/

CREATE or replace VIEW tg_friends_groups
AS 
	SELECT *
  	FROM users_tg_group utg 
    	JOIN tg_group tg ON utg.tg_group_id = tg.id 
  	WHERE 
  	tg.name = 'animi';


 SELECT 
 	name,
 	admin_id
 FROM tg_friends_groups;

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  
  
 