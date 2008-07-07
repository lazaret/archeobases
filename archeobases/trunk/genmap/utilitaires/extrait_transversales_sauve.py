#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Genmap - (c) 2004-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#

import string
import pg


requete = """SELECT zone, numero, bis,
                    x, y, zabsolu, nature,
                    longueur, largeur, epaisseur,
                    orientation, pendage
                FROM carnet
                WHERE zone LIKE '_%s' AND y BETWEEN %i AND %i;"""
db = pg.connect(dbname="arago", user="postgres")

for zone in range(8, 18):
    print "Extraction zone %s..." % zone
    for y in range(10):
        print "\t%i" % (y*10)
        q = requete % (zone, y*10, (y+1)*10 - 1)
        resultat = db.query(q)
        fichier = open("arago-%s-%02i.datas" % (zone, y*10), "w")
        fichier.write("%s\n" % string.join(resultat.listfields(), ","))
        for line in resultat.getresult():
            champs = []
            for field in line:
                try:
                    v = float(field)
                except:
                    v = "'%s'" % field
                else:
                    v = str(field)
                champs.append(v)
            fichier.write("%s\n" % string.join(champs, ","))
        fichier.close()
    print
db.close()
