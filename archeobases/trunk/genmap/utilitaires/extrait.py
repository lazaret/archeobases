#! /usr/bin/env python

import sys
import string
import pg

requete = """SELECT zone, numero, bis, 
                    x, y, zabsolu, nature, 
                    longueur, largeur, epaisseur, 
                    orientation, pendage
                FROM carnet    
                WHERE zone LIKE '_%s' AND y BETWEEN %i AND %i;"""
                
db = pg.connect(dbname="arago", user="postgres")

for zone in range(21, 24) :
    print "Extraction zone %s..." % zone
    for y in range(10) :
        print "\tbande %i" % (y*10)
        q = requete % (zone, y*10, (y+1)*10 - 1)
        resultat = db.query(q)
        fichier = open("arago-%s-%02i.datas" % (zone, y*10), "w")
        fichier.write("%s\n" % string.join(resultat.listfields(), ","))
        for line in resultat.getresult() :
            champs = []
            for field in line :
                try :
                    v = float(field)
                except :    
                    v = "'%s'" % field
                else :    
                    v = str(field)
                champs.append(v)
            fichier.write("%s\n" % string.join(champs, ","))
        fichier.close()
    print
db.close()
