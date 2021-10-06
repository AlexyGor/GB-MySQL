use telegram;

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password_hash`, `phone`) VALUES 
	('101', 'Janae', 'Spencer', 'gutkowski.clovis', '64897fae6816b7558f446dd6b24d57fc63fee1bc', '39'),
	('102', 'Candice', 'Quigley', 'terry.amos', '2c0428c9a1d5136b613385d0f9143f344a7bf6bc', '1'),
	('103', 'Zita', 'Schinner', 'gia57', 'f41d94c1a96773b8aac14d72987147b51386506a', '450'),
	('104', 'Preston', 'Collier', 'baby12', '6e9fd4d3ee7c8e1a3b657a98e00af9cfe850b929', '366247'),
	('105', 'Percival', 'Reichert', 'nzieme', '1b287dac2e114437f7991a3450e26cae4a9cc3dc', '565779'),
	('106', 'Lexus', 'Orn', 'claudie14', '57890b9338baa1812bed67790e29848be343bc0d', '2733866540'),
	('107', 'Aiyana', 'Conn', 'tyra99', '34285f0a6807f7ebb91bccf0f1fef89bba19a604', '221'),
	('108', 'Everett', 'Legros', 'doberbrunner', '3a879b4fdb06f8d8897873354fba60bb6beee663', '5924716684'),
	('109', 'Hattie', 'Armstrong', 'karl.rice', '66d18b72a04f44d5adc2c744f32537d6ca31a23e', '154021709'),
	('110', 'Madie', 'Hartmann', 'rolando85', '7ce6d838666f9dbdb5a4d437fd82db492f6a74da', '109');

INSERT INTO profiles ( `user_id` ,`birthday`, `photo_id`, `created_at`, `occupation`, `hometown`, `is_active`) VALUES 
	('101', '1979-04-19', '0', '1997-03-15 02:19:09', NULL, NULL, '0'),
	('102','1985-09-14', '300', '1991-08-23 09:09:09', NULL, NULL, '1'),
	('103', '2003-11-04', '300', '2018-10-27 04:29:47', NULL, NULL, '0'),
	('104', '2010-03-22', '300', '1974-08-26 12:17:36', NULL, NULL, '0'),
	('105', '1978-06-08', '300', '2011-08-15 01:04:40', NULL, NULL, '0'),
	('106', '1991-05-12', '200', '2009-05-22 07:14:52', NULL, NULL, '1'),
	('107', '1984-01-29', '200', '1982-06-10 15:17:18', NULL, NULL, '1'),
	('108', '1988-09-25', '300', '1988-10-28 08:16:54', NULL, NULL, '1'),
	('109', '1978-12-17', '300', '1996-06-09 17:58:09', NULL, NULL, '0'),
	('110','2012-04-27', '200', '1980-06-15 02:50:09', NULL, NULL, '1');
	
INSERT INTO `block_list` (`id`, `user_id`, `contacts_id`, `created_at`) VALUES 
	('1', '101', '1', '2009-05-29 18:16:01'),
	('2', '102', '2', '1987-05-19 08:59:41'),
	('3', '103', '3', '2012-04-29 08:31:55'),
	('4', '104', '4', '2014-05-09 00:17:50'),
	('5', '105', '5', '1982-06-20 22:40:30'),
	('6', '106', '6', '1994-08-07 05:55:34'),
	('7', '107', '7', '1988-01-26 23:43:35'),
	('8', '108', '8', '1999-04-27 19:18:00'),
	('9', '109', '9', '1995-06-22 00:38:28'),
	('10', '110', '10', '2011-10-09 09:42:12');

INSERT INTO `contacts` (`id`, `user_id`, `firstname`, `lastname`, `email`, `phone`) VALUES 
	('1', '101', 'Roel', 'Doyle', 'smayert@example.org', '(817)080-8791x'),
	('2', '102', 'Dejuan', 'Kub', 'ryan.elody@example.org', '+70(1)14739374'),
	('3', '103', 'Katlynn', 'Heaney', 'ricky.ortiz@example.net', '+34(5)53470188'),
	('4', '104', 'Nicholas', 'Runolfsdottir', 'keichmann@example.org', '1-896-107-1156'),
	('5', '105', 'Dewayne', 'Stracke', 'morris58@example.net', '008.714.1781x7'),
	('6', '106', 'Samanta', 'Boyer', 'kilback.connie@example.net', '(133)082-7083x'),
	('7', '107', 'Christophe', 'Windler', 'koepp.jennyfer@example.net', '+10(1)06480951'),
	('8', '108', 'Gregory', 'Smitham', 'roob.esmeralda@example.net', '179-257-5986x7'),
	('9', '109', 'Robyn', 'Sawayn', 'torphy.raven@example.org', '344.553.2662x4'),
	('10', '110', 'Milford', 'Smitham', 'quigley.tanner@example.com', '(481)725-1833');


INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `message_id`, `body`, `filename`, `SIZE`, `metadata`, `created_at`, `updated_at`) VALUES 
	('1', '1', '101', '1', 'l', 'g', 101, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	('2', '2', '102', '2', 'q', 'd', 104, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	('3', '3', '103', '3', 'z', 's', 105, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	('4', '4', '104', '4', 'r', 'd', 107, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	('5', '5', '105', '5', 'x', 'g', 109, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	('6', '6', '106', '6', 'd', 'g', 110, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	('7', '7', '107', '7', 'v', 'n', 113, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	('8', '8', '108', '8', 'a', 'k', 114, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	('9', '9', '109', '9', 'v', 'k', 115, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	('10', '10', '110', '10', 'v', 'e', 116, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');


INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES 
	('1', 'dolorum', '1997-03-18 11:18:15', '1997-06-05 21:31:39'),
	('2', 'qui', '2014-03-31 17:22:10', '2017-11-12 18:41:21'),
	('3', 'est', '1994-05-10 17:35:04', '1976-04-15 20:20:01'),
	('4', 'maxime', '2009-06-14 19:17:24', '1996-01-28 10:34:59'),
	('5', 'non', '1981-02-15 15:46:05', '1983-05-19 01:01:56'),
	('6', 'saepe', '1996-12-10 06:16:48', '2017-04-19 02:55:19'),
	('7', 'vel', '1999-05-27 12:19:03', '2013-07-07 19:55:58'),
	('8', 'harum', '1991-10-05 02:06:32', '1978-11-05 21:04:20'),
	('9', 'molestiae', '2018-03-11 06:01:25', '1988-05-20 15:36:17'),
	('10', 'blanditiis', '2019-08-28 23:55:37', '2012-10-06 23:36:53');


INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES 
('1', '101', '101', 'Possimus tempore quia animi pariatur hic et sed nesciunt. Asperiores omnis qui maiores eos quod enim quia quidem. Est quis ratione enim mollitia placeat ut. Et fugiat illo consectetur magni vero omnis.', '1985-08-21 20:52:50'),
('2', '102', '102', 'Voluptas pariatur est et voluptate et ab est nobis. Quidem libero ut occaecati omnis magnam. Non necessitatibus nisi ut omnis voluptatem quaerat. Voluptatum qui cupiditate quam eos et.', '1976-11-20 07:56:45'),
('3', '103', '103', 'Ab dolorem consectetur dolore deserunt. Commodi consequuntur eaque eos odio. Eum reiciendis id excepturi sed.', '1978-07-23 08:27:21'),
('4', '104', '104', 'Consequuntur assumenda illo aut odio. Aut recusandae aut ut qui autem sit voluptatem. Ut molestiae rerum ab illum rerum omnis. Saepe totam modi consequatur ut ad officia consequatur. Non omnis voluptas rerum perferendis perferendis ut voluptatum.', '2000-06-21 06:23:45'),
('5', '105', '105', 'Consequatur aspernatur cumque facilis quos. Consectetur id dolorum aut nemo omnis quod officia. Ex dolores deleniti delectus dolorem vel incidunt.', '1990-10-22 20:22:32'),
('6', '106', '106', 'Id vitae exercitationem laboriosam enim. Cum sint repellat rerum ex enim eum nesciunt aut. Explicabo qui quibusdam ut quod delectus modi.', '1985-09-05 01:56:40'),
('7', '107', '107', 'Eos maiores non eveniet eligendi explicabo. Quis magni vitae aut id et. Nulla eaque asperiores animi asperiores et eos.', '1996-08-09 06:11:12'),
('8', '108', '108', 'Aliquam voluptatem id et amet aut sit dolorum. Aut alias sed nihil voluptatem dolores modi. Soluta expedita harum mollitia vitae.', '1984-06-25 17:10:02'),
('9', '109', '109', 'Quo ut animi recusandae earum est. Ut in necessitatibus deleniti qui. Facere quos molestiae cumque.', '1999-07-12 13:43:02'),
('10', '110', '110', 'Odit adipisci et adipisci et dolorum. In eius quae non ut blanditiis facilis. Aut est omnis dolorum voluptates ut. Et necessitatibus fuga nihil voluptatum accusantium sit.', '1978-10-09 00:58:10');

INSERT INTO `tg_group` (`id`, `name`, `admin_id`, `leave_tg_group`, `add_tg_group`) VALUES 
	('1', 'animi', '101', '1987-09-04 13:40:02', '2005-12-28 03:54:35'),
	('2', 'esse', '102', '1985-09-23 04:45:49', '2007-05-24 03:52:06'),
	('3', 'voluptatibus', '103', '1987-03-12 09:28:13', '2011-10-06 15:06:27'),
	('4', 'odio', '104', '2005-01-17 13:50:19', '1973-03-16 03:36:32'),
	('5', 'qui', '105', '2010-08-23 01:51:33', '1987-01-11 07:50:47'),
	('6', 'cumque', '106', '1984-12-28 08:19:42', '1995-07-02 22:21:03'),
	('7', 'aspernatur', '107', '1997-01-31 22:20:10', '1995-07-27 10:20:23'),
	('8', 'iusto', '108', '1992-10-02 19:10:56', '2002-07-07 19:47:39'),
	('9', 'delectus', '109', '2011-08-19 14:17:14', '2017-06-09 12:11:34'),
	('10', 'rerum', '110', '1998-08-31 11:09:54', '2015-11-20 04:00:16');


INSERT INTO `users_tg_group` (`user_id`, `tg_group_id`) VALUES
('101', '1'),
('102', '2'),
('103', '3'),
('104', '4'),
('105', '5'),
('106', '6'),
('107', '7'),
('108', '8'),
('109', '9'),
('110', '10');


INSERT INTO `channels` (`id`, `name`, `admin_user_id`, `leave_channel`, `add_channel`) VALUES 
	('1', 'animi', '101', '1987-09-04 13:40:02', '2005-12-28 03:54:35'),
	('2', 'esse', '102', '1985-09-23 04:45:49', '2007-05-24 03:52:06'),
	('3', 'voluptatibus', '103', '1987-03-12 09:28:13', '2011-10-06 15:06:27'),
	('4', 'odio', '104', '2005-01-17 13:50:19', '1973-03-16 03:36:32'),
	('5', 'qui', '105', '2010-08-23 01:51:33', '1987-01-11 07:50:47'),
	('6', 'cumque', '106', '1984-12-28 08:19:42', '1995-07-02 22:21:03'),
	('7', 'aspernatur', '107', '1997-01-31 22:20:10', '1995-07-27 10:20:23'),
	('8', 'iusto', '108', '1992-10-02 19:10:56', '2002-07-07 19:47:39'),
	('9', 'delectus', '109', '2011-08-19 14:17:14', '2017-06-09 12:11:34'),
	('10', 'rerum', '110', '1998-08-31 11:09:54', '2015-11-20 04:00:16');


INSERT INTO `users_channels` (`user_id`, `channel_id`) VALUES
('101', '1'),
('102', '2'),
('103', '3'),
('104', '4'),
('105', '5'),
('106', '6'),
('107', '7'),
('108', '8'),
('109', '9'),
('110', '10');

INSERT INTO `particiipants` (`id`, `users_id`, `tg_group_id`, `media_types_id` , `channel_id`) VALUES 
('1', '101', '1', '1', '1'),
('2', '102', '2', '2', '2'),
('3', '103', '3', '3', '3'),
('4', '104', '4', '4', '4'),
('5', '105', '5', '5', '5'),
('6', '106', '6', '6', '6'),
('7', '107', '7', '7', '7'),
('8', '108', '8', '8', '8'),
('9', '109', '9', '9', '9'),
('10', '110', '10', '10', '10');



