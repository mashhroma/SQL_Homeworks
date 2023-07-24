USE vk;

/*
1. Создайте представление с произвольным SELECT-запросом из прошлых уроков [CREATE VIEW]
*/
CREATE VIEW men_over_35 AS
SELECT user_id, gender, birthday
FROM profiles
WHERE gender = 'm' and birthday < NOW() - INTERVAL 35 YEAR;


/*
2. Выведите данные, используя написанное представление [SELECT]
*/
SELECT * FROM men_over_35;


/*
3. Удалите представление [DROP VIEW]
*/
DROP VIEW men_over_35;


/*
4. Сколько новостей (записей в таблице media) у каждого пользователя?
Вывести поля: news_count (количество новостей), user_id (номер пользователя), user_email (email пользователя).
Попробовать решить с помощью CTE или с помощью обычного JOIN.
*/
WITH news_quantity AS (
	SELECT DISTINCT
		media.user_id,
		COUNT(media.id) OVER (PARTITION BY media.user_id) AS news_count
	FROM media
)
SELECT news_count, user_id, users.email
FROM news_quantity
JOIN users ON user_id = users.id;