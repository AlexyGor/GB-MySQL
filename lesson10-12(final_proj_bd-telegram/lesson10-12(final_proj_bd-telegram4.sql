use telegram;

/*хранимые процедуры / триггеры;*/

/*проверяем возраст при добавлении в телеграм канал*/


DROP TRIGGER IF EXISTS check_user_age_adding_channel;

DELIMITER //

CREATE TRIGGER check_user_age_adding_channel BEFORE UPDATE ON profiles
FOR EACH ROW
begin
    IF NEW.birthday >= CURRENT_DATE() THEN
        SIGNAL SQLSTATE '82000' SET MESSAGE_TEXT = 'Access to the channels TV channels is prohibited, you are under 18 years old!';
    END IF;
END//

DELIMITER ;


/*Создадим процедуру , которая будет предлогать пользователю новых друзей
 * Критерии выбора:
 * - из одного города;
 * - общие группы;
 * - друзья из контактов.
 */

DROP PROCEDURE IF EXISTS friend_requests;

DELIMITER //
CREATE PROCEDURE friend_requests(IN for_user_id INT)
  BEGIN
	/*общий город*/
	SELECT p2.user_id
	FROM profiles p1
	JOIN profiles p2 
	    ON p1.hometown = p2.hometown
	WHERE p1.user_id = for_user_id 
	    AND p2.user_id <> for_user_id 
	
		UNION 
		
	/* общие группы*/
	SELECT utg2.user_id
	FROM users_tg_group utg1
	JOIN users_tg_group utg2
	    ON utg1.tg_group_id = utg2.tg_group_id 
	WHERE utg2.user_id = for_user_id 
	    AND utg2.user_id <> for_user_id 

	    UNION 
	
	/*из контактов*/
	SELECT c2.user_id
	FROM contacts c1
	JOIN contacts c2
	    ON c1.id = c2.id 
	WHERE c1.user_id = for_user_id 
	    AND c2.user_id <> for_user_id 
	    
ORDER BY RAND() 
	LIMIT 2; 
  END// 
DELIMITER ; 









