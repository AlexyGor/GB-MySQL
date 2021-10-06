USE vk;
/*тестовая таблица*/
DROP TABLE IF EXISTS ignor_test;
CREATE TABLE ignor_test(
	id SERIAL,
    user_id BIGINT UNSIGNED NOT NULL,
    media_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(),
	FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS deleted_messages;
CREATE TABLE deleted_messages(
	id SERIAL,
	deleted_messages_id varchar(100) DEFAULT NULL,
    user_id BIGINT UNSIGNED NOT NULL,
    news_id BIGINT UNSIGNED NOT NULL,
    deketed_at DATETIME,
	FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS follower;
CREATE TABLE follower(
	id SERIAL,
	name VARCHAR(150),
	user_id BIGINT UNSIGNED NOT NULL,
	INDEX follower_name_idx(name),
	foreign key (user_id) references users(id)
);