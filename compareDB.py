import connectToDB

def getTables():
    print("Для сравнения доступны следующие дни:")
    sql = f"SHOW tables;"
    data = connectToDB.execute(sql)
    setData = set()
    """
    for table in data:
        setData.add(table['Tables_in_testTask'].replace("tableOrion","").replace("tableFSS", ""))
    i = 0; dateFSS = 0; dateOrion = 0;
    arr = []
    for date in setData:
        print(i, ') ', setData)
        arr.append(setData)
        i+=1
    i=i-1
    print("Введите номера дат для сравнения(сравнение в тот же день - введите одинаковые числа):")
    print("Первый день(ФСБ):")
    print('1)'); dateFSS = int(input());
    while(dateFSS<0 or dateFSS>i):
        print("Ошибка, введите доступный день")
        print('1)');dateFSS = int(input())
    print("Второй день(Орион):")
    print('2)');dateOrion = int(input());
    while (dateOrion < 0 or dateOrion > i):
        print("Ошибка, введите доступный день")
        print('2)');dateOrion = int(input())
    """
    dateFSS = 20210502
    dateOrion = 20210502
    compare(dateFSS, dateOrion)

def getFromDB(organization, ID):
    sql = f"select * from tableOrion20210205 WHERE ID={ID}"
    data = connectToDB.execute(sql)
    return data

def compare(dateFSS, dateOrion):
    differences = []
    i = 0
    j = 0
    while(i<=300):
        i+=1
        ID = i
        dataOrion = getFromDB(f'Orion{dateOrion}',ID)
        dataFSS = getFromDB(f'FSS{dateFSS}',ID)
        print(dataOrion)
        print(dataFSS)

    print(differences)