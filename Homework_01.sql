/*
1. Создайте таблицу с мобильными телефонами, используя графический интерфейс.
Необходимые поля таблицы:
product_name (название товара),
manufacturer (производитель),
product_count (количество),
price (цена).
Заполните БД произвольными данными.
*/
CREATE DATABASE homework_01;
USE homework_01;

CREATE TABLE products
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(30) NOT NULL,
    manufacturer VARCHAR(20) NOT NULL,
    product_count INT DEFAULT 0,
    price DECIMAL
);

INSERT INTO products (product_name, manufacturer, product_count, price)
VALUES
	('IphoneX', 'Apple', 3, 79000),
	('Iphone10', 'Apple', 2, 54000),
	('Galaxy S9', 'Samsung', 2, 59000),
	('Galaxy S8', 'Samsung', 1, 44000),
	('P20 PRO', 'Huawei', 5, 39000);


/*
2. Напишите SELECT-запрос, который выводит название товара, производителя и цену для товаров, 
количество которых превышает 2
*/
SELECT product_name, manufacturer, price
FROM products
WHERE product_count > 2;


/*
3. Выведите SELECT-запросом весь ассортимент товаров марки “Samsung”
*/
SELECT * FROM products
WHERE manufacturer = 'Samsung';


/*
4. С помощью SELECT-запроса с оператором LIKE / REGEXP найти:
*/

-- 4.1 Товары, в которых есть упоминание "Iphone"
SELECT * FROM products
WHERE product_name LIKE '%Iphone%';

-- 4.2 Товары, в которых есть упоминание "Samsung"
SELECT * FROM products
WHERE manufacturer LIKE '%Samsung%';

-- 4.3 Товары, в названии которых есть ЦИФРЫ
SELECT * FROM products
WHERE product_name REGEXP '[0-9]';

-- 4.4 Товары, в названии которых есть ЦИФРА "8"
SELECT * FROM products
WHERE product_name LIKE '%8%';
