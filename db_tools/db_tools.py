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

            
def importAtms():
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
            

def updateAtms():
    try:
        con = psycopg2.connect(database="mc", user="postgres", password="1Q2w3e4r", host="127.0.0.1", port="5432")
        cur = con.cursor()
        print "Opened database successfully"
        
        for line in (open("atms.csv")):
            values = line.split("|")            
            atmId = values[0].strip()
            atmIdFull = atmId.zfill(6)
            atmModel = values[4].strip()
            atmSerial = values[1].strip()
            atmAddress = values[2].strip()
            
            if atmId.isdigit():
                cur.execute("SELECT * FROM models WHERE name = %s", (atmModel,))
                result = cur.fetchone()
                
                if not result:
                    print "Can't find a '%s' model for ATM%s" % (atmModel, atmId)
                    modelId = None
                else:
                    modelId = result[2]
                
                cur.execute("SELECT * FROM atms WHERE machine_no = %s", (atmIdFull,))
                result = cur.fetchall()
                
                if len(result) > 1:
                    print result                    
                    
                elif len(result) < 1:
                    print 'adding...'
                    print atmModel, atmId[-3:], atmIdFull, atmAddress, atmSerial, '1', modelId, 'true'
                    cur.execute("INSERT INTO atms (model2, luno, machine_no, address, serial, bank_id, model_id, flm) VALUES (%s, %s, %s, %s, %s, %s, %s, %s);", (atmModel, atmId[-3:], atmIdFull, atmAddress, atmSerial, '1', modelId, 'true'))
                    print '-'*21
                    
                else:
                    print 'updating...'
                    print atmModel, atmId[-3:], atmIdFull, atmAddress, atmSerial, '1', modelId, 'true'
                    cur.execute("UPDATE atms  SET (model2, luno, machine_no, address , serial, bank_id, model_id, flm) = (%s, %s, %s, %s, %s, %s, %s, %s) WHERE machine_no = %s;", (atmModel, atmId[-3:], atmIdFull, atmAddress, atmSerial, '1', modelId, 'true', atmIdFull))
                    print '-'*21
            
        con.commit()
                
    except psycopg2.DatabaseError, e:
        if con:
            con.rollback()
            
        print 'Error %s' % e
        sys.exit(1)
        

    finally:
        if con:
            con.close()

    
    
def createRegions():
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
    
    
def getEKMS():
    result = None

    try:
        print "Connecting to DB..."        
        con = psycopg2.connect(database="mc", user="postgres", password="1Q2w3e4r", host="127.0.0.1", port="5432")
        cur = con.cursor()
        print "OK"
        
        count = 1
        
        file = open("serials.txt", "w")
        for atmId in (open("ekms.txt")):
            atmId = atmId.strip()
            
            
            file.write("---[%d]------------------------------\n" % count)
            # print "id: {ATMID}".format(ATMID = atmId)
            file.write("id: %s\n" % atmId)
            
            cur.execute("SELECT luno, serial FROM atms WHERE machine_no = %s", (atmId, ))
            result = cur.fetchone()
            
            if result:                
                # print "s/n: {SERIAL}".format(SERIAL = result[1])
                file.write("s/n: %s\n" % result[1])
                # print "luno: {LUNO}".format(LUNO = result[0])
                file.write("luno: %s\n\n" % result[0])
                # print "-" * 30
                
            # file.write("-" * 30 + "\n")
            count +=1
            
        file.close()
        print "Done."
        
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
    getEKMS()
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        