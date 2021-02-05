import time
import standartTables
from selenium import webdriver
from selenium.common.exceptions import NoSuchElementException

def getTableOrion():
    try:
        """
        was a problem "gecodriver"
        Linux solution(insert in terminal)
        wget https://github.com/mozilla/geckodriver/releases/download/v0.23.0/geckodriver-v0.23.0-linux64.tar.gz
        sudo sh -c 'tar -x geckodriver -zf geckodriver-v0.23.0-linux64.tar.gz -O > /usr/bin/geckodriver'
        sudo chmod +x /usr/bin/geckodriver
        rm geckodriver-v0.23.0-linux64.tar.gz
        Windows solution(insert in code)
        gecko = os.path.normpath(os.path.join(os.path.dirname(__file__), 'geckodriver'))
        binary = FirefoxBinary(r'C:\Program Files (x86)\Mozilla Firefox\firefox.exe')
        driver = webdriver.Firefox(firefox_binary=binary, executable_path=gecko+'.exe')
        """
        #connect to site
        driver = webdriver.Firefox()
        siteAdress = "https://www.fgupntcorion.ru/kopiya-trebovaniya-k-zayavke-podach"
        driver.get(siteAdress)
        #find the wix table element
        found = False
        while not found:
            try:
                element = driver.find_element_by_xpath('//*[@title="Table Master"]')
                if element.is_displayed():
                    found = True
            except NoSuchElementException:
                time.sleep(0.5)
        print("table found")
        #insert src of table
        src = element.get_attribute("src")
        print(src)
        #open the wix table
        driver.get(src)
        found = False
        while not found:
            try:
                element = driver.find_element_by_id("theTable")
                if str(element.get_attribute('innerHTML')).replace("\n", "").replace("\t", "").replace(" ", "")!='':
                    found = True
            except NoSuchElementException:
                time.sleep(0.5)
        # crawl the table
        element = element.find_elements_by_xpath(".//tr")
        tableOrion = []
        i=0
        for row in element:
            tableOrion.append([td.text for td in row.find_elements_by_xpath(".//td")])
            if tableOrion[i]!=[]:
                for j in range(0, 8):
                    tableOrion[i][j] = tableOrion[i][j].rstrip().lstrip()
                    if tableOrion[i][j] == "-" or tableOrion[i][j] == "":
                        tableOrion[i][j] = "null"
            tableOrion[i] = standartTables.standartizationOrion(tableOrion[i])
            i += 1
        for row in tableOrion:
            if row and row[0].isdecimal():
                print(row)
        return tableOrion
    except Exception as e:
        print('Error(getTableOrion): ',str(e))
    finally:
        driver.quit()
def getTableFSS():
    try:
        """
        was a problem "gecodriver"
        Linux solution(insert in terminal)
        wget https://github.com/mozilla/geckodriver/releases/download/v0.23.0/geckodriver-v0.23.0-linux64.tar.gz
        sudo sh -c 'tar -x geckodriver -zf geckodriver-v0.23.0-linux64.tar.gz -O > /usr/bin/geckodriver'
        sudo chmod +x /usr/bin/geckodriver
        rm geckodriver-v0.23.0-linux64.tar.gz
        Windows solution(insert in code)
        gecko = os.path.normpath(os.path.join(os.path.dirname(__file__), 'geckodriver'))
        binary = FirefoxBinary(r'C:\Program Files (x86)\Mozilla Firefox\firefox.exe')
        driver = webdriver.Firefox(firefox_binary=binary, executable_path=gecko+'.exe')
        """
        # connect to site
        driver = webdriver.Firefox()
        siteAdress = "http://www.fsb.ru/fsb/science/single.htm%21id%3D10438106%40fsbResearchart.html"
        driver.get(siteAdress)
        # crawl DB
        element = driver.find_elements_by_xpath("//table")[1].find_elements_by_xpath(".//tr")
        tableFSS = []
        i = 0
        for row in element:
            tableFSS.append([td.text for td in row.find_elements_by_xpath(".//td")])
            for j in range(0, 8):
                tableFSS[i][j] = tableFSS[i][j].rstrip().lstrip()
                if tableFSS[i][j] == "-" or tableFSS[i][j] == "":
                    tableFSS[i][j] = "null"
            tableFSS[i] = standartTables.standartizationFSS(tableFSS[i])
            i += 1

        for row in tableFSS:
            if row[0].isdecimal():
                print(row)
        return tableFSS
    except Exception as e:
        print('Error(getTableFSS): '+str(e))
    finally:
        driver.quit()

