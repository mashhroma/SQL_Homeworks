/*
1. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке. [ORDER BY]
*/
SELECT DISTINCT firstname 
FROM users
ORDER BY firstname;


/*
2. Выведите количество мужчин старше 35 лет [COUNT].
*/
SELECT * 
FROM profiles
WHERE gender = 'm' and birthday < NOW() - INTERVAL 35 YEAR;


/*
3. Сколько заявок в друзья в каждом статусе? (таблица friend_requests) [GROUP BY]
*/
SELECT status, COUNT(*) as count
FROM friend_requests
GROUP BY status;


/*
4. Выведите номер пользователя, который отправил больше всех заявок в друзья (таблица friend_requests) [LIMIT].
*/
SELECT initiator_user_id, COUNT(*) as count
FROM friend_requests
GROUP BY initiator_user_id
ORDER BY count DESC
LIMIT 1;


/*
5. Выведите названия и номера групп, имена которых состоят из 5 символов [LIKE].
*/
SELECT * FROM `communities`
WHERE `name` LIKE '_____';