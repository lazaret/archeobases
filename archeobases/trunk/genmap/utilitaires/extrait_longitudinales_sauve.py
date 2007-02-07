#! /usr/bin/env python


import sys
import string
import pg

requete = """SELECT zone, numero, bis, 
                    x, y, zabsolu, nature, 
                    longueur, largeur, epaisseur, 
                    orientation, pendage
                FROM carnet    
                WHERE zone LIKE '%s%%' AND x BETWEEN %i AND %i;"""
                
db = pg.connect(dbname="arago", user="postgres")

for zone in "BCDEFGHIJKL" :
    print "Extraction zone %s..." % zone
    for x in range(10) :
        print "\t%i" % (x*10)
        q = requete % (zone, x*10, (x+1)*10 - 1)
        resultat = db.query(q)
        fichier = open("arago-%s-%02i.datas" % (zone, x*10), "w")
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
