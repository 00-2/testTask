import connectToDB

def getFromDB(organization, ID):
    sql = f"select * from tableOrion20210205 WHERE ID={ID}"
    data = connectToDB.execute(sql)
    return data

def compare(date):
    date = "20210205"
    differences = {}
    i = 0
    while(dataOrion!="()" or dataFSS!="()"):
        i+=1
        ID = i
        dataOrion = getFromDB(f'Orion{date}',ID)
        dataFSS = getFromDB(f'FSS{date}',ID)