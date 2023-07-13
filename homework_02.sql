/*
1. Создать БД vk, исполнив скрипт _vk_db_creation.sql (в материалах к уроку)
*/

-- успешно исполнен скрипт и создана база данных
USE vk;


/*
2. Написать скрипт, добавляющий в созданную БД vk 2-3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей) (CREATE TABLE)
*/

-- таблица с комментариями к постам
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`(
id SERIAL,
body TEXT NOT NULL,
user_id BIGINT UNSIGNED NOT NULL,
media_id BIGINT UNSIGNED NOT NULL,
created_at DATETIME DEFAULT NOW(),
is_reply BIT DEFAULT 0,
initial_id BIGINT UNSIGNED,

FOREIGN KEY (user_id) REFERENCES users(id),
FOREIGN KEY (media_id) REFERENCES media(id),
FOREIGN KEY (initial_id) REFERENCES comments(id)
);

-- типы мест учебы
DROP TABLE IF EXISTS `study_place_type`;
CREATE TABLE `study_place_type`(
id SERIAL,
type_name VARCHAR(50)
);

-- таблица с местами учебы
DROP TABLE IF EXISTS `study_places`;
CREATE TABLE `study_places`(
id SERIAL,
place_name VARCHAR(100),
study_type BIGINT UNSIGNED NOT NULL,
own_profile BIGINT UNSIGNED,
own_community BIGINT UNSIGNED,

FOREIGN KEY (study_type) REFERENCES study_place_type(id),
FOREIGN KEY (own_profile) REFERENCES users(id),
FOREIGN KEY (own_community) REFERENCES communities(id)
);


/*
3. Заполнить 2 таблицы БД vk данными (по 10 записей в каждой таблице) (INSERT)
*/

-- заполнение данными таблицы с пользователями
INSERT INTO `users`
	(firstname,
    lastname,
    email,
 	password_hash,
	phone)
VALUES
	('Иван', 'Андреев', 'sud-axotipo70@outlook.com', '58756bb44b1980960c57878f2c5f3e50069e9b46', '79997910357'),
	('Анастасия', 'Козлова', 'tipe-vekoxa64@outlook.com', '995ebb553fe05f6c72752c494326e7b964284c93', '79996341481'),
	('Александра', 'Позднякова', 'boy-egaxure99@mail.com', '559729f2a546ec2dfe52213657328b603c15d2a9', '79992270372'),
	('Есения', 'Агеева', 'licega_xawa83@hotmail.com', 'f074d256bddeb04b3a2e046312d35ffa757a7188', '79995103232'),
	('Александра', 'Сергеева', 'kohapit-aji90@hotmail.com', '8a33e93a87aa6e4d310f7164321b18a1384eacb7', '79993407987'),
	('Иван', 'Артемов', 'lih-usiraso8@outlook.com', '506b9dc8585e17139e94c3b95d318103a31c12f4', '79991276084'),
	('Анастасия', 'Зиновьева', 'wafo_gupene35@yahoo.com', 'be452a740cd2b661c1a75a0c45522c5f1b2e3b87', '79990134959'),
	('Анастасия', 'Малышева', 'gez-iyexege22@mail.com', '132b4bcf2d69af0943bf247dbec11bda03e81d96', '79997989219'),
	('Амелия', 'Иванова', 'pitu_sikati13@aol.com', '67509238095695ad7474b45951d73268cec806d0', '79995934711'),
	('Варвара', 'Мартынова', 'kum_ibihomo68@yahoo.com', 'a4d955a255104735edafe57bd5339e864f677ece', '79993854796'),
	('Виталий', 'Дмитриев', 'his-ibenato43@aol.com', '4055a89e0d9e02fa1064a72a6b14c8eed1938d9e', '79991020615'),
	('Есения', 'Мельникова', 'xilidal-aci24@hotmail.com', '3d2d22586883ca19a5e7687cd2c1397391dc250a', '79990433520'),
	('Демид', 'Гончаров', 'puzaz-agera86@gmail.com', '1d60e8c6a00b60c9b7b70246dd4231bd545e6c4a', '79992360570'),
	('Сафия', 'Климова', 'vedibut-eca49@yahoo.com', '8b62421b8347f6a07482a1ee66af7ea9aaffa449', '79995522590'),
	('Маргарита', 'Смирнова', 'lemur_otasi78@mail.com', '19afc0dfcd8a822efbe9e0a327bfa90dbf612e55', '79999385539'),
	('Анна', 'Морозова', 'sipulip-etu2@hotmail.com', '723a19830da43fb52e77624ce6360900ed97da5b', '79998294495'),
	('Савелий', 'Озеров', 'hiv_uxapojo2@aol.com', '205707cfe98c1f1a2c6e414038a5c4c5bbfce838', '79993278977'),
	('Степан', 'Родионов', 'jiwas_enebo66@mail.com', 'ec3ffbd78a622c7e5ccad65e3f1f0ed770300e52', '79993989986'),
	('Михаил', 'Воронин', 'wixay-ohoto87@outlook.com', '08a4b263314d9cc78f0e454e44a0888eb7beaaf1', '79992447833'),
	('Тихон', 'Вишневский', 'yikeje-runu79@outlook.com', '8ecf430b7c0e1d7d7b7a1941e8f551073c271dd9', '79995310367')
	;

-- заполнение данными таблицы с сообщениями
INSERT INTO `messages`
	(from_user_id,
    to_user_id,
    body,
    created_at)
VALUES
('1', '2', 
'Distinctio et ea ipsa quia soluta vel quasi. Omnis ipsa occaecati placeat exercitationem a explicabo quod aspernatur. Cupiditate aperiam vel nihil voluptas eum autem. Accusantium recusandae deleniti perferendis tempore qui eaque.', 
'2022-07-20 11:22:31'),
('2', '1', 
'Ab nemo mollitia magni nemo vel qui. Laboriosam et praesentium quidem officiis. In eaque suscipit sunt explicabo fuga alias. Ipsa ut qui alias.', 
'2022-12-15 11:57:34'),
('3', '4', 
'Dolores ut est voluptatem dolor autem consectetur. Aut sed et et consequatur laudantium distinctio dolor quam. Est doloremque omnis accusamus odit.', 
'2022-09-03 21:19:16'),
('4', '3', 
'Perspiciatis reprehenderit reiciendis dolores et ea voluptas. Harum quia autem quidem dolores voluptates optio. Reprehenderit corrupti vel non.', 
'2022-11-18 23:05:12'),
('4', '3', 
'Rerum a id iusto velit eius voluptatem. Sunt non dolore adipisci possimus. Quo velit voluptas dignissimos rerum tempora similique. Eaque nostrum dolor saepe voluptatum aut.', 
'2022-08-22 06:47:56'),
('4', '7', 
'Non cupiditate alias eum. Voluptatem deleniti est eum eum voluptatem repellat. Praesentium explicabo provident vitae similique. Qui ea optio sed facilis cum.', 
'2022-12-01 09:39:42'),
('11', '3',
'Assumenda laboriosam ut error asperiores minima. Nostrum velit et eos explicabo maiores. Harum ut possimus exercitationem est. Dolorem et at veniam occaecati nemo impedit.', 
'2022-02-06 23:21:54'),
('12', '6', 
'Necessitatibus suscipit et soluta eveniet nemo. Veniam libero voluptatibus repellendus qui est ad numquam. Omnis officia nobis est facere quis. Mollitia qui et eaque.', 
'2022-01-20 21:35:44'),
('3', '6', 
'Ea voluptate molestias dolore dicta perspiciatis dignissimos in. Quas dolores illo distinctio impedit et qui ut cumque. Quasi itaque repudiandae ipsum asperiores accusamus sint dolorum aut.', 
'2022-09-04 02:09:59'),
('19', '6', 
'Autem id et quo dignissimos enim alias. Sed fugiat non nihil. Nulla velit qui et iusto reprehenderit ratione.', 
'2022-11-21 23:00:24'),
('17', '5', 
'Inventore omnis deleniti molestiae excepturi sapiente. Ex facilis architecto voluptates. Voluptas qui non vel eveniet veniam et doloribus.', 
'2022-07-27 02:26:46'),
('5', '1', 
'Sapiente eos veniam quibusdam ut. Ipsum impedit iusto ut voluptatem dicta autem quo nisi. Ea voluptas culpa quo. Id autem itaque adipisci et rerum.', 
'2022-10-01 17:21:27'),
('9', '3', 
'Quod tempore omnis temporibus minus sint quod. Non sed illum provident aut velit sed. Ut id quibusdam est saepe esse similique. Exercitationem illum fuga consequuntur maiores.', 
'2022-03-31 23:18:31'),
('3', '9', 
'Quam unde ab rem id vero id aliquid. Quas vel distinctio veritatis.', 
'2022-09-08 22:53:50'),
('9', '3', 
'Odit repellendus voluptatibus delectus sit. Quod vel voluptatibus minima et. Ut consequatur ut quae sit aliquam facilis. Dolores qui qui dolorem.', 
'2022-07-05 08:20:37'),
('2', '6', 
'Nulla molestiae numquam dolores reprehenderit repudiandae natus inventore. Nesciunt optio unde deserunt optio quam sed. Sed repellendus voluptatem aut et numquam molestias exercitationem. Aliquam nihil rem perspiciatis ex.', 
'2022-12-03 19:06:22'),
('2', '5', 
'Qui deserunt tempora eos facere nulla consectetur. Ut consequatur ut assumenda est labore neque odit sit. Qui veniam qui debitis quis exercitationem fugiat unde.', 
'2022-01-14 09:33:22'),
('11', '12', 
'Ut sunt excepturi incidunt. Libero eum magni quidem itaque aut. Nemo et quia eos placeat. Possimus temporibus unde harum placeat sit delectus.', 
'2022-02-24 20:43:40'),
('11', '13', 
'Non quod consequatur illo deleniti quasi qui eaque. Veniam dolor ut nemo quas corporis.', 
'2022-09-04 17:31:24'),
('12', '11', 
'Temporibus quo velit necessitatibus at omnis mollitia. Vel ut est quia facilis aperiam in. Praesentium est adipisci ut voluptas illo unde minus. Consectetur omnis dignissimos nihil eos accusantium similique voluptatem.', 
'2022-10-25 20:08:57')
;


/*
4.  Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = true).
При необходимости предварительно добавить такое поле в таблицу profiles со значением по умолчанию = false (или 0) (ALTER TABLE + UPDATE)
*/

-- создаем новое поле is_active со значением false
ALTER TABLE profiles 
ADD COLUMN is_active BIT DEFAULT 0;

-- для проверки создаем несколько профилей
INSERT INTO `profiles`
	(
    user_id,
    gender,
    birthday,
    created_at,
 	hometown
    )
VALUES
	(1, 'M', '1985-05-03', '2022-01-01 10:00:01', 'Moscow'),
	(2, 'F', '2000-06-22', '2022-01-01 10:00:02', 'Moscow'),
	(3, 'F', '2007-07-15', '2022-01-01 10:00:03', 'Moscow'),
	(4, 'F', '2005-08-08', '2022-01-01 10:00:04', 'Moscow');

-- устанавливаем всем совершеннолетним в поле is_active значение true
UPDATE profiles
SET is_active = 1
WHERE (birthday + INTERVAL 18 YEAR) < NOW();

-- выводим данные для проверки
SELECT user_id, birthday, is_active
FROM `profiles`;


/*
5. Написать скрипт, удаляющий сообщения «из будущего» (дата позже сегодняшней) (DELETE)
*/

-- для проверки создадим несколько сообщений из будущего
INSERT INTO `messages`
	(from_user_id,
    to_user_id,
    body,
    created_at)
VALUES
('1', '2', 
'Distinctio et ea ipsa quia soluta vel quasi. Omnis ipsa occaecati placeat exercitationem a explicabo quod aspernatur. Cupiditate aperiam vel nihil voluptas eum autem. Accusantium recusandae deleniti perferendis tempore qui eaque.', 
'2024-07-20 11:22:31'),
('2', '1', 
'Ab nemo mollitia magni nemo vel qui. Laboriosam et praesentium quidem officiis. In eaque suscipit sunt explicabo fuga alias. Ipsa ut qui alias.', 
'2023-12-15 11:57:34');

-- скрипт для удаления сообщений из будущего
DELETE FROM `messages`
WHERE  created_at > NOW();

-- выводим данные для проверки
SELECT from_user_id, to_user_id, created_at
FROM `messages`;
