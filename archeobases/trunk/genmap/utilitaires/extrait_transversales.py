#! /usr/bin/env python
# -*- coding: ISO-8859-15 -*-


import sys
import string
import pg


# mode d'emploi
# extrait_transversales.py nom_base zone_min zone_max ep_tranche

if __name__ == "__main__" :
    if len(sys.argv) != 5 :
        sys.stderr.write("usage : %s  base  zonemin  zonemax  epaisseur\n" % sys.argv[0])
    else :
        ma_base    = sys.argv[1]
        zone_min   = int(sys.argv[2])
        zone_max   = int(sys.argv[3])
        ep_tranche = int(sys.argv[4])
        
        requete = """SELECT zone, numero, bis, 
                            x, y, zabsolu, nature, 
                            longueur, largeur, epaisseur, 
                            orientation, pendage
                        FROM carnet    
                        WHERE zone LIKE '_%s' AND y BETWEEN %i AND %i;"""
                        
        try :
            db = pg.connect(dbname=ma_base, user="postgres")
        except :    
            sys.stderr.write("Impossible de se connecter à la base %s\n" % ma_base)
        
        for zone in range(zone_min, zone_max) :
            print "Extraction zone %s..." % zone
            for y in range(int(100.0 / ep_tranche)) :
                print "\t%i" % (y*ep_tranche)
                q = requete % (zone, y*ep_tranche, (y+1)*ep_tranche - 1)
                resultat = db.query(q)
                fichier = open("arago-%s-%02i.datas" % (zone, y*ep_tranche), "w")
                fichier.write("%s\n" % string.join(resultat.listfields(), ","))
                for line in resultat.getresult() :
                    champs = []
                    for field in line :
                        try :
                            float(field)
                        except :    
                            # Chaine ou None (NULL), stocké en tant que 'None'
                            v = "'%s'" % field
                        else :    
                            # Numérique entier ou flottant
                            v = str(field)
                        champs.append(v)
                    fichier.write("%s\n" % string.join(champs, ","))
                fichier.close()
            print
            
        try :    
            db.close()
        except :     
            pass # ignore les erreurs
