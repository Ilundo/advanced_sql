import sqlite3

connection = sqlite3.connect("db.sqlite")
cursor = connection.cursor()


cursor.execute("SELECT * FROM customers")
data = cursor.fetchall()

#Сумарний обсяг продажів:
#Напишіть SQL-запит, щоб знайти загальний обсяг продажів (суму) за всі замовлення.
