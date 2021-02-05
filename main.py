import getTables
import connectToDB
import datetime
import compareDB
import shutil

def printDel(text):
    width = shutil.get_terminal_size().columns
    print(text.center(width,"-"))

def toDB(table,organization):
    try:
        today = str(datetime.date.today()).replace('-','')
        organization += today
        for i in range(0,len(table)):
            if table[i]!=[]:
                sql = f"""INSERT INTO table{organization} (ID, dateFrom, dateTo, factoryNumber, name, owner, developer, addInf) VALUES ({table[i][0]},'{table[i][1]}','{table[i][2]}','{table[i][3]}','{table[i][4]}','{table[i][5]}','{table[i][6]}','{table[i][7]}');""".replace("\n","").replace("\t","").replace("'null'",'null')
                print(sql)
                connectToDB.execute(sql);
    except IndexError:
        print('error(toDB): indexError')
"""describe table in DB:
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| ID            | int          | NO   | PRI | NULL    |       |
| dateFrom      | date         | YES  |     | NULL    |       |
| dateTo        | date         | YES  |     | NULL    |       |
| factoryNumber | varchar(300) | YES  |     | NULL    |       |
| name          | varchar(200) | YES  |     | NULL    |       |
| owner         | varchar(200) | YES  |     | NULL    |       |
| developer     | varchar(200) | YES  |     | NULL    |       |
| addInf        | varchar(200) | YES  |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
"""

# tableFSS is similar to table in DB
# ex ['1', '12.02.2018', '12.02.2021', '-', 'Детектор паров и следов взрывчатых веществ\n«М-Ион» ТУ 4215-282-17942806-13', 'ООО «Диагностика М»\n105118, г. Москва, 5-я ул. Соколиной горы, д. 22', 'ООО «Диагностика М»', 'В соответствии с п. 54 Правил обязательной сертификации ТС ОТБ выдан сертификат рег. № 28']
"""printDel("getTablseFSS")
tableFSS = getTables.getTableFSS()
toDB(tableFSS, 'FSS')
# 'Заводские номера' FSS equals to concat('Заводской номер', 'Номер партии')
# ex ['1', '12.02.2018', '12.02.2021', '-', '-', 'Детектор паров и следов взрывчатых веществ «М-Ион» ТУ 4215-282-17942806-13', 'ООО «Диагностика М» 105118, г. Москва, 5-я ул. Соколиной горы, д.22', 'ООО «Диагностика М»']
printDel("getTableOrion")
tableOrion = getTables.getTableOrion()
toDB(tableOrion, 'Orion')
"""
printDel("compareDB")
compareDB.getTables()
