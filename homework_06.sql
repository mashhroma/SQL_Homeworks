USE vk;

/*
1. Написать функцию, которая удаляет всю информацию об указанном пользователе из БД vk.
Пользователь задается по id.
Удалить нужно все сообщения, лайки, медиа записи, профиль и запись из таблицы users.
Функция должна возвращать номер пользователя.
*/

DROP FUNCTION IF EXISTS delete_user;

DELIMITER //
CREATE FUNCTION delete_user (del_id BIGINT UNSIGNED)
RETURNS BIGINT READS SQL DATA
BEGIN
	DECLARE `user_id` BIGINT;
	SET FOREIGN_KEY_CHECKS = 0;

	DELETE FROM users
	WHERE users.id = del_id;

	DELETE FROM friend_requests
	WHERE initiator_user_id = del_id OR target_user_id = del_id;

	DELETE FROM likes
	WHERE user_id = del_id;

	DELETE FROM media
	WHERE user_id = del_id;

	DELETE FROM messages
	WHERE from_user_id = del_id OR to_user_id = del_id;

	DELETE FROM profiles
	WHERE user_id = del_id;

	DELETE FROM users_communities
	WHERE user_id = del_id;

	SET FOREIGN_KEY_CHECKS = 1;

	SET `user_id` = del_id;

	RETURN `user_id`;

END//
DELIMITER ;

SELECT delete_user(8);


/*
2. Предыдущую задачу решить с помощью процедуры и обернуть используемые команды в транзакцию внутри процедуры.
*/

DROP PROCEDURE IF EXISTS delete_user_proc;

DELIMITER //
CREATE PROCEDURE delete_user_proc (del_id BIGINT UNSIGNED)
BEGIN
	START TRANSACTION;
		SET FOREIGN_KEY_CHECKS = 0;

		DELETE FROM users
		WHERE users.id = del_id;

		DELETE FROM friend_requests
		WHERE initiator_user_id = del_id OR target_user_id = del_id;

		DELETE FROM likes
		WHERE user_id = del_id;

		DELETE FROM media
		WHERE user_id = del_id;

		DELETE FROM messages
		WHERE from_user_id = del_id OR to_user_id = del_id;

		DELETE FROM profiles
		WHERE user_id = del_id;

		DELETE FROM users_communities
		WHERE user_id = del_id;

		SET FOREIGN_KEY_CHECKS = 1;
	COMMIT;
END//
DELIMITER ;

CALL delete_user_proc(12);


/*
3. Написать триггер, который проверяет новое появляющееся сообщество.
Длина названия сообщества (поле name) должна быть не менее 5 символов.
Если требование не выполнено, то выбрасывать исключение с пояснением.
*/

DROP TRIGGER IF EXISTS check_new_communities;

DELIMITER //
CREATE TRIGGER check_new_communities BEFORE INSERT ON communities
FOR EACH ROW
BEGIN
    IF NEW.name REGEXP '^.{1,4}$' THEN
		SIGNAL SQLSTATE '45000' 
		SET MESSAGE_TEXT = 'Невозможно добавить сообщество. Длина названия должна быть 5 или более символов.';
    END IF;
END//
DELIMITER ;