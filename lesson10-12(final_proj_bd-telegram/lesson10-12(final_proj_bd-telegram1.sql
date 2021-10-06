DROP DATABASE IF EXISTS telegram;
CREATE DATABASE telegram;
USE telegram;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    username VARCHAR(120) UNIQUE,
 	password_hash VARCHAR(100), 
	phone BIGINT UNSIGNED UNIQUE, 
	
    INDEX users_firstname_lastname_idx(firstname, lastname)
);

DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
	user_id BIGINT UNSIGNED NOT NULL UNIQUE,
    birthday DATE,
	photo_id BIGINT UNSIGNED NULL,
    created_at DATETIME DEFAULT NOW(),
    occupation VARCHAR(100),
    hometown VARCHAR(100),
    is_active BIGINT UNSIGNED NOT NULL
);



ALTER TABLE profiles ADD CONSTRAINT tg_user_id
    FOREIGN KEY (user_id) REFERENCES users(id)
    ON UPDATE CASCADE 
    ON DELETE RESTRICT; 

DROP TABLE IF EXISTS media_types;
CREATE TABLE media_types(
	id SERIAL,
    name VARCHAR(255), 
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS media;
CREATE TABLE media(
	id SERIAL,
    media_type_id BIGINT UNSIGNED NOT NULL,
    user_id BIGINT UNSIGNED NOT NULL,
    message_id BIGINT UNSIGNED NOT NULL,
  	body text,
    filename VARCHAR(255),	
    SIZE INT,
	metadata JSON,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (media_type_id) REFERENCES media_types(id),
    FOREIGN KEY (message_id) REFERENCES messages(id)
);

DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
	id SERIAL, 
	from_user_id BIGINT UNSIGNED NOT NULL,
    to_user_id BIGINT UNSIGNED NOT NULL,
    body TEXT,
    created_at DATETIME DEFAULT NOW(), 

    FOREIGN KEY (from_user_id) REFERENCES users(id),
    FOREIGN KEY (to_user_id) REFERENCES users(id)
);


DROP TABLE IF EXISTS channels;
CREATE TABLE channels(
	id SERIAL,
	name VARCHAR(150),
	admin_user_id BIGINT UNSIGNED NOT NULL,
	leave_channel DATETIME DEFAULT NOW(),
	add_channel DATETIME DEFAULT NOW(),
	
	INDEX channels_name_idx(name),
	FOREIGN KEY (admin_user_id) REFERENCES users(id)
);
    
DROP TABLE IF EXISTS users_channels;
CREATE TABLE users_channels(
	user_id BIGINT UNSIGNED NOT NULL,
	channel_id BIGINT UNSIGNED NOT NULL,
  
	PRIMARY KEY (user_id, channel_id), 
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (channel_id) REFERENCES channels(id)
);

DROP TABLE IF EXISTS tg_group;
CREATE TABLE tg_group(
	id SERIAL,
	name VARCHAR(150),
	admin_id BIGINT UNSIGNED NOT NULL,
	leave_tg_group DATETIME DEFAULT NOW(),
	add_tg_group DATETIME DEFAULT NOW(),
	
	INDEX tg_group_name_idx(name),
	FOREIGN KEY (admin_id) REFERENCES users(id)
);
    
DROP TABLE IF EXISTS users_tg_group;
CREATE TABLE users_tg_group(
	user_id BIGINT UNSIGNED NOT NULL,
	tg_group_id BIGINT UNSIGNED NOT NULL,
  
	PRIMARY KEY (user_id, tg_group_id), 
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (tg_group_id) REFERENCES tg_group(id)
);

DROP TABLE IF EXISTS particiipants;
CREATE TABLE  particiipants (
	id SERIAL,
	users_id BIGINT UNSIGNED NOT NULL,
	tg_group_id BIGINT UNSIGNED NOT NULL,
	media_types_id BIGINT UNSIGNED NOT NULL,
	channel_id BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (users_id) REFERENCES users(id),
	FOREIGN KEY (tg_group_id) REFERENCES tg_group(id),
	FOREIGN KEY (media_types_id) REFERENCES media_types(id),
	FOREIGN KEY (channel_id) REFERENCES channels(id)
);

DROP TABLE IF EXISTS contacts;
CREATE TABLE contacts (
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	firstname VARCHAR(20),
    lastname VARCHAR(20),
    email VARCHAR(255) UNIQUE,
	phone VARCHAR(14) UNIQUE,
	
	FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS block_list;
CREATE TABLE block_list (
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	contacts_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (contacts_id) REFERENCES contacts(id)
);
