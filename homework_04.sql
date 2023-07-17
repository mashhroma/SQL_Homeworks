USE vk;

/*
1. Подсчитать количество групп (сообществ), в которые вступил каждый пользователь.
*/
SELECT users.id, users.firstname, users.lastname, COUNT(*) AS group_count
FROM users_communities AS uc
JOIN users ON users.id = uc.user_id
GROUP BY uc.user_id;


/*
2. Подсчитать количество пользователей в каждом сообществе.
*/
SELECT communities.id, communities.name, COUNT(*) AS users_count
FROM users_communities AS uc
JOIN communities ON communities.id = uc.community_id
GROUP BY uc.community_id
ORDER BY communities.id;


/*
3. Пусть задан некоторый пользователь.
Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).
*/
SELECT users.firstname, users.lastname, COUNT(*) AS total_messages_to_user_1
FROM messages
JOIN users ON users.id = messages.from_user_id
WHERE to_user_id = 1
GROUP BY from_user_id
ORDER BY COUNT(*) DESC
LIMIT 1;


/*
4. Подсчитать общее количество лайков, которые получили пользователи младше 18 лет.
*/
SELECT COUNT(*) AS total_likes_under_18
FROM likes
JOIN profiles ON likes.user_id = profiles.user_id
WHERE profiles.birthday + INTERVAL 18 YEAR > NOW();


/*
5. Определить кто больше поставил лайков (всего): мужчины или женщины.
*/
SELECT profiles.gender, COUNT(*) AS total_likes
FROM likes
JOIN profiles ON likes.user_id = profiles.user_id
GROUP BY profiles.gender
ORDER BY COUNT(*) DESC
LIMIT 1;