def standartizationOrion(rowInTableOrion):# bring tables back to normal view
    if rowInTableOrion==[]:
        return []
    try:
        """ 1 - number, PK
            2 - dateFrom
            3 - dateTo/NULL
            4 - factoryNumbers - pattern is ('номер'/SW '0-9'/SW 'A-z')
            5 - factoryNumbers - pattern is ('номер'/SW '0-9'/SW 'A-z')
            6 - name - pattern is (SW 'А-Я')
            7 - owner - pattern is (SW 'А-Я')
            8 - developer - pattern is (SW 'А-Я'/SW 'A-Z')
        """
        number = rowInTableOrion[0]

        dateFrom = rowInTableOrion[1]
        if dateFrom != 'null':
            dateFrom = dateFrom.split(".")
            day = dateFrom[0]
            month = dateFrom[1]
            year = dateFrom[2]
            dateFrom = f"{year}-{month}-{day}"
            rowInTableOrion[1] = dateFrom

        dateTo = rowInTableOrion[2]
        if dateTo != "null":
            dateTo = dateTo.split(".")
            day = dateTo[0]
            month = dateTo[1]
            year = dateTo[2]
            dateTo = f"{year}-{month}-{day}"
            rowInTableOrion[2] = dateTo


        factoryNumbers = rowInTableOrion[3].replace('null', '')+rowInTableOrion[4].replace('null', '')
        factoryNumbers = factoryNumbers.replace('\n', '').replace(' ', '').lower()
        if factoryNumbers == '':
            factoryNumbers = 'null'
        rowInTableOrion[3] = factoryNumbers
        for i in range(5,7):
            tmp = rowInTableOrion[i]
            rowInTableOrion[i-1] = tmp
        rowInTableOrion[7] = 'null'
        return rowInTableOrion
    except Exception as e:
        print("error in standartizationOrion:"+e)


def standartizationFSS(rowInTableFSS):
    if rowInTableFSS==[]:
        return []
    try:
        """ 1 - number, PK
            2 - dateFrom
            3 - dateTo/NULL
            4-? - factoryNumbers - pattern is ('номер'/SW '0-9'/SW 'A-z')
            5 - name - pattern is (SW 'А-Я')
            6 - owner - pattern is (SW 'А-Я')
            7 - developer - pattern is (SW 'А-Я'/SW 'A-Z')
            8 - addInf - pattern is (SW 'А-Я')
        """
        number = rowInTableFSS[0]
        dateFrom = rowInTableFSS[1]
        if dateFrom.replace(".","").isdecimal():
            dateFrom = dateFrom.split(".")
            day = dateFrom[0]
            month = dateFrom[1]
            year = dateFrom[2]
            dateFrom = f"{year}-{month}-{day}"
            rowInTableFSS[1] = dateFrom

        dateTo = rowInTableFSS[2].lower().replace('до ', '')
        if dateTo.replace(".","").isdecimal():
            dateTo = dateTo.split(".")
            day = dateTo[0]
            month = dateTo[1]
            year = dateTo[2]
            dateTo = f"{year}-{month}-{day}"
            rowInTableFSS[2] = dateTo

        factoryNumbers = str(rowInTableFSS[3]).lower().replace('зав.номера:','')
        indexOfN = factoryNumbers.rfind('№')
        if indexOfN == -1 and factoryNumbers[0]=='н':
            indexOfN = factoryNumbers.find(',')
        if indexOfN!=-1:
            indexOfN+=1
            factoryNumbers = factoryNumbers[indexOfN:]
        factoryNumbers = factoryNumbers.replace('\n', '').replace(' ', '')
        rowInTableFSS[3] = factoryNumbers
        
        name = rowInTableFSS[4]
        owner = rowInTableFSS[5]
        developer = rowInTableFSS[6]
        addInf = rowInTableFSS[7]

        return rowInTableFSS
    except Exception as e:
        print("error in standartizationFSS:"+e)
