# -*- coding: UTF-8 -*-

import os
import psycopg2

def main():

    i = 0
    
    
    con = psycopg2.connect(database="mc", user="postgres", password="1Q2w3e4r", host="127.0.0.1", port="5432")
    cur = con.cursor()    
    print "Opened database successfully"

    #dir = "d:\\temp\\Index\\"
    dir = "X:\\!!!FLM!!!\\INI\\Index\\" 
    list = os.listdir(dir)    
    
    for name in list:
        file = os.path.join(dir, name)
        mn= None
        
        if os.path.isfile(file) and name[-4:] == ".ini":
            print file
            
            for line in open(file):
                if line.startswith("mn="):
                    mn = line.split("=")[1].strip()                
                    
                if line.startswith("model="):
                    model = line.split("=")[1].strip()
                    break
                    
            if mn and model:
                i+=1                
                cur.execute("UPDATE atms SET model = %s WHERE  machine_no = %s;", (model, mn))
    
        else:
            print "invalid file or directory"
    con.commit()
    con.close()
    print "all {}".format(i)
    
if __name__ == "__main__":
    main()
