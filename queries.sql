
--Сумарний обсяг продажів:
--Напишіть SQL-запит, щоб знайти загальний обсяг продажів (суму) за всі замовлення.



SELECT sum(quantity)
FROM orders


--Кількість замовлень на кожного клієнта:
--Виведіть кількість замовлень для кожного клієнта, 
--використовуючи INNER JOIN між таблицями "customers" і "orders".
SELECT product_id, sum(quantity) as product_total
FROM orders
GROUP BY product_id;

SELECT products.product_id,products.name, sum(orders.quantity)
FROM products JOIN orders 
ON products.product_id == orders.product_id
GROUP BY products.product_id;





SELECT customers.customer_id,customers.email, orders.quantity
FROM customers JOIN orders 
ON customers.customer_id == orders.customer_id;



--Середній чек замовлення:
--Розрахуйте середній чек замовлення 
--(середню суму грошей в одному замовленні).

SELECT orders.order_id,products.name,
		products.price,sum(orders.quantity) as quantity,
		sum(orders.quantity) * products.price as global_price

FROM products JOIN orders
ON products.product_id == orders.product_id
GROUP BY products.product_id
ORDER BY name;

--Найбільш популярна категорія товарів:
--Знайдіть категорію товарів, яка має найбільше замовлень.
SELECT category,max(total_q)
FROM
	(SELECT products.category, sum(orders.quantity) as total_q
	FROM products JOIN orders
	ON products.product_id == orders.product_id
	GROUP BY products.category);


--Оновлення цін:
--Оновіть ціни товарів в категорії "смартфони" на 10% збільшення.
UPDATE products SET price = price * 1.1;

SELECT price,category
FROM products
WHERE category == 'Electronics';




