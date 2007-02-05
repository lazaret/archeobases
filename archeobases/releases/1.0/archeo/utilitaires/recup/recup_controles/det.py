#! /usr/bin/python
#


import sys
import string
sys.path.append("../cgi")
import database
                        
db = database.DataBase(database=sys.argv[1], username = "postgres")
classe   =[]
ordre    =[]
famille  =[]
genre    =[]
espece   =[]
ssespece =[]

lignes = sys.stdin.readlines()
for ligne in lignes:
    
        ligne = string.strip(ligne[:-1])
        ligne = string.upper(ligne)
        champs = string.split(ligne, "\t")
        for i in range(0,len(champs)) :
                champs[i] = string.strip(champs[i])

        classe=db.quote(champs[0], "text")
        try:
                insert ="INSERT INTO controle_f_classe(f_classe) VALUES (" + classe + ");"
                print(insert)
                db.query(insert)
        except:
                print("classe")
        ordre = db.quote(champs[1],"text")
        try:
                insert ="INSERT INTO controle_f_ordre(f_ordre) VALUES (" +ordre + ");"
                db.query(insert)
                print(insert)
        except:
                toto=0
        try:
                insert = "INSERT INTO remonte_ordre(classe, ordre) VALUES (" + classe + ","  + ordre + ");"
                print(insert)
                db.query(insert)
        except:
                print("ordre")
        famille = db.quote(champs[2],"text")
        try:
                insert="INSERT INTO controle_f_famille(f_famille) VALUES (" + famille + ");"
                db.query(insert)
                print(insert)
        except:
                toto=0
        try:
                insert= "INSERT INTO remonte_famille(classe, ordre, famille) VALUES (" + classe + ","  + ordre + ',' + famille  + ");"
                db.query(insert)
                print(insert)
        except:
                print("famille")
        genre = db.quote(champs[3],"text")
        try:
                insert="INSERT INTO controle_f_genre(f_genre) VALUES ("+ genre + ");"
                db.query(insert)
                print(insert)
        except:
                toto=0
        try:
                insert= "INSERT INTO remonte_genre(classe, ordre, famille, genre) VALUES (" + classe + ","  + ordre + "," + famille + "," + genre + ");" 
                db.query(insert)
                print(insert)
                
        except:
                toto=1


## db.query("VACUUM;")









