# -*- coding: UTF-8 -*-

import psycopg2
import sys
import argparse
import os


def createParser():
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(dest = "bank")
    
    indexParser = subparsers.add_parser("index")
    indexParser.add_argument("-l", "--license", choices = ["all", "ht2", "psj"],
        help = "Generates .reg files for HideTrack and ProSecure")
    indexParser.add_argument("atmId",
        help = "ATM ID")

    usbParser = subparsers.add_parser("usb")
    usbParser.add_argument("atmid")

    return parser
    

def main():
    con = None
    ver = None

    try:
        con = psycopg2.connect(database="mc", user="postgres", password="1Q2w3e4r", host="127.0.0.1", port="5432")
        cur = con.cursor()
        # cur.execute('SELECT version()')
        # ver = cur.fetchone()
        # print ver
        print "Opened database successfully"
        
        cur.execute("DROP TABLE IF EXISTS banks")        

        cur.execute("CREATE TABLE banks (id SERIAL PRIMARY KEY, name_short VARCHAR(10) NOT NULL, name_full VARCHAR(100), name_alias VARCHAR(100));")
        print "banks created successfully"
        
        cur.execute("INSERT INTO banks (name_short, name_full, name_alias) VALUES('Index', 'Credit Agricole', 'Індекс Банк');")
        con.commit()
        
        cur.execute("SELECT * FROM banks;")
        for row in cur:
            print row
        
    except psycopg2.DatabaseError, e:
        if con:
            con.rollback()
            
        print 'Error %s' % e
        sys.exit(1)
        

    finally:
        if con:
            con.close()

            
def import_atm():
    try:
        con = psycopg2.connect(database="mc", user="postgres", password="1Q2w3e4r", host="127.0.0.1", port="5432")
        cur = con.cursor()
        print "Opened database successfully"
        
        cur.execute("DROP TABLE IF EXISTS atms")        
        cur.execute("CREATE TABLE atms (id SERIAL PRIMARY KEY, model VARCHAR(30), luno VARCHAR(3), machine_no VARCHAR(6), address VARCHAR(100), serial VARCHAR(10), license_ht2 VARCHAR(16), license_psj VARCHAR(16));")        
        con.commit()
        print "atms created successfully"
        
        for line in (open("atm_index.csv")):
            values = line.split(":")            
            cur.execute("INSERT INTO atms (model, luno, machine_no, address , serial, license_ht2, license_psj) VALUES(%s, %s, %s, %s, %s, %s, %s);", (values[1].strip(), values[2].strip(), values[3].strip(), values[4].strip(), values[5].strip(), values[6].strip(), values[7].strip()))            
            
        con.commit()
                
    except psycopg2.DatabaseError, e:
        if con:
            con.rollback()
            
        print 'Error %s' % e
        sys.exit(1)
        

    finally:
        if con:
            con.close()
    
    
def regions():
    try:
        con = psycopg2.connect(database="mc", user="postgres", password="1Q2w3e4r", host="127.0.0.1", port="5432")
        cur = con.cursor()
        print "Opened database successfully"
        
        cur.execute("DROP TABLE IF EXISTS regions")
        cur.execute("CREATE TABLE regions (id SERIAL PRIMARY KEY, name VARCHAR(30));")        
        con.commit()
        print "regions created successfully"
        
        regions = ["Вінницька", "Волинська", "Дніпропетровська", "Донецька",
        "Житомирська", "Закарпатська", "Запорізька", "Івано-Франківська", 
        "Київська", "Кіровоградська", "Луганська", "Львівська", "Миколаївська",
        "Одеська", "Полтавська", "Рівненська", "Сумська", "Тернопільська",
        "Харківська", "Херсонська", "Хмельницька", "Черкаська", "Чернівецька",
        "Чернігівська"]
        
        for line in regions:            
            cur.execute("INSERT INTO regions (name) VALUES(%s);", (line, ))
            
        con.commit()
            
        
        
        
    except psycopg2.DatabaseError, e:
        if con:
            con.rollback()
            
        print 'Error %s' % e
        sys.exit(1)
        

    finally:
        if con:
            con.close()            

            
def towns():
    try:
        con = psycopg2.connect(database="mc", user="postgres", password="1Q2w3e4r", host="127.0.0.1", port="5432")
        cur = con.cursor()
        print "Opened database successfully"
        
        cur.execute("DROP TABLE IF EXISTS towns")
        cur.execute("CREATE TABLE towns (id SERIAL PRIMARY KEY, region_id INTEGER NOT NULL REFERENCES regions, name VARCHAR(30) NOT NULL);")        
        con.commit()
        print "towns created successfully"
        
        #for line in regions:            
            # cur.execute("INSERT INTO regions (name) VALUES(%s);", (line, ))
            
        # con.commit()
        
        
    except psycopg2.DatabaseError, e:
        if con:
            con.rollback()
            
        print 'Error %s' % e
        sys.exit(1)
        

    finally:
        if con:
            con.close()                        

            
def generateHt2File(license):

    sys.stdout.write("Generating sn_ht2.reg...\t")
    sys.stdout.flush()
    
    try:
        file = open("sn_ht2.reg", "w")
        file.write('REGEDIT4\n\n')
        file.write('; HT2 Activation code for this ATM\n')
        file.write('[HKEY_LOCAL_MACHINE\SOFTWARE\Wincor Nixdorf\ProTopas\CurrentVersion\CCOPEN\CCProtFW1]\n')
        file.write('"ACTIVATING_CODE"="%s"\n' % license)
        file.close()
        
        print "OK"
    
    except:
        print "FAIL"


def generatePsjFile(license):

    sys.stdout.write("Generating sn_psj.reg...\t")
    sys.stdout.flush()
    
    try:
        file = open("sn_psj.reg", "w")
        file.write('REGEDIT4\n\n')
        file.write('; PSJ Activation code for this ATM\n')
        file.write('[HKEY_LOCAL_MACHINE\SOFTWARE\Wincor Nixdorf\ProTopas\CurrentVersion\CCOPEN\JOURNAL]\n')
        file.write('"ACTIVATING_CODE"="%s"\n' % license)
        file.close()

        print "OK"

    except:
        print "FAIL"


def getAtmInfoFromDb(bank, atmId):
    result = None

    try:
        sys.stdout.write("Connecting to DB...\t\t")
        sys.stdout.flush()            
        con = psycopg2.connect(database="mc", user="postgres", password="1Q2w3e4r", host="127.0.0.1", port="5432")
        cur = con.cursor()
        print "OK"
    
        sys.stdout.write("Retrieving ATM data...\t\t")
        sys.stdout.flush()
        cur.execute("SELECT * FROM atms WHERE machine_no = %s", (atmId, ))
        result = cur.fetchone()            
    
    except psycopg2.DatabaseError, e:
        if con:
            con.rollback()
            
        print 'Error %s' % e
        sys.exit(1)

    finally:
        if con:
            con.close()
            
    return result

        
if __name__ == "__main__":
    # main()
    # import_atm()
    # regions()
    # towns()

    parser = createParser()
    namespace = parser.parse_args(sys.argv[1:])
    # print namespace
    
    if namespace.bank == "index":
        atmId = namespace.atmId[-6:].zfill(6)
        
        if atmId.isdigit():
            result = getAtmInfoFromDb(namespace.bank, atmId)
            if result:
                print "OK"
                
                if namespace.license:
                    print "Generating .reg files for \tATM {}".format(atmId) 
                    licenseHt2 = result[6]
                    licensePsj = result[7]                    
                    
                    if not os.path.isdir(atmId):
                        os.mkdir(atmId)
            
                    os.chdir(atmId)
                
                    if namespace.license == "all":
                        if licenseHt2 != None:
                            generateHt2File(licenseHt2)
                
                        if licensePsj != None:
                            generatePsjFile(licensePsj)
                    
                    if namespace.license == "ht2":
                        if licenseHt2 != None:
                            generateHt2File(licenseHt2)
                            
                    if namespace.license == "psj":
                        if licensePsj != None:
                            generatePsjFile(licensePsj)
            
                print "All done!"
            
            else:
                print "FAIL"
                print "ATM with ID {} not found!".format(atmId)                
            
        else:
            print "Invalid ATM ID - {}".format(atmId)

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        