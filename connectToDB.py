"""
Work with MySqlDB
D-D(linux):
sudo apt install mysql-server mysql-client
pip3 install PyMySql
sudo mysql
(MYSQL->)create database if not exists testTask;
(MYSQL->)CREATE USER 'user'@'localhost' IDENTIFIED BY 'Abcd123!';
(MYSQL->)GRANT ALL PRIVILEGES ON testTask.* TO 'user'@'localhost';

(MYSQL->)
CREATE TABLE IF NOT EXISTS tableOrion (
                     ID int PRIMARY KEY,
                     dateFrom date,
                     dateTo date,
                     factoryNumber int,
                     name varchar(200),
                     owner varchar(200),
                     developer varchar(200),
                     addInf varchar(200)
                     );

(MYSQL->)exit
"""
import datetime

import pymysql.cursors

# Connect to db
connection = pymysql.connect(host='localhost',
                             user='user',
                             password='Abcd123!',
                             db='testTask',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)

def execute(sql):
    try:
        # Execute sql
        with connection.cursor() as cursor:
            cursor.execute(sql)
        return cursor.fetchall()
    except Exception as e:
        print(e)

print("Connection with DB established.")
today = str(datetime.date.today()).replace('-','')
execute(f"""CREATE TABLE IF NOT EXISTS tableOrion{today} (
                     ID int PRIMARY KEY,
                     dateFrom varchar(10),
                     dateTo varchar(10),
                     factoryNumber varchar(500),
                     name varchar(300),
                     owner varchar(200),
                     developer varchar(200),
                     addInf varchar(200)
                     ); """.replace("\n",""))
execute(f"""CREATE TABLE IF NOT EXISTS tableFSS{today} (
                     ID int PRIMARY KEY,
                     dateFrom varchar(10),
                     dateTo varchar(10),
                     factoryNumber varchar(500),
                     name varchar(300),
                     owner varchar(200),
                     developer varchar(200),
                     addInf varchar(200)
                     ); """.replace("\n",""))
print("DB initialized. Tables created.")