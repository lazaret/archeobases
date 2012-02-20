#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Archeo - (c) 2006-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#

# usage:
# ./excel2roche.py database < roche.csv > repport.txt

import sys
import string
import database


sys.path.append("../cgi")
db = database.DataBase(database=sys.argv[1], username = "postgres")
lignes = sys.stdin.readlines()
l = 0

for ligne in lignes:
    ligne = string.strip(ligne[:-1])
    l = l + 1
    if (ligne != ""):
        champs = string.split(ligne, ";")
        for i in range(0, len(champs)):
            champs[i] = string.strip(champs[i])
        new_roche = []
        new_roche.append(champs[0])  #zone
        new_roche.append(champs[1])  #groupe
        new_roche.append(champs[2])  #roche
        new_roche.append(champs[3]) #nature
        new_roche.append(champs[4]) #type
        if champs[5] == "": #longueur
            new_roche.append("NULL")
        else:
            new_roche.append(champs[5])
        if champs[6] == "": #largeur
            new_roche.append("NULL")
        else:
            new_roche.append(champs[6])
        if champs[7] == "": #epaisseur
            new_roche.append("NULL")
        else:
            new_roche.append(champs[7])
        new_roche.append(champs[8]) #orientation
        new_roche.append(champs[9]) #nom
        for i in range(0, len(new_roche)):
            if i in [0, 1, 5, 6, 7]:
                pass
            else:
                new_roche[i] = db.quote((new_roche[i]), "text")

        verify = "SELECT * FROM roche WHERE zone ="+new_roche[0]+" AND groupe ="+new_roche[1]+" AND roche ="+new_roche[2]+";"
        existe = db.query(verify)
        existe = existe.dictresult()
        if existe:
            insert_roche = "UPDATE roche SET zone ="+new_roche[0]+", groupe ="+new_roche[1]+", roche ="+new_roche[2]+", \
                            nature ="+new_roche[3]+", type ="+new_roche[4]+", longueur="+new_roche[5]+", \
                            largeur ="+new_roche[6]+", epaisseur ="+new_roche[7]+", orientation ="+new_roche[8]+", \
                            nom ="+new_roche[9]+" WHERE (zone ="+new_roche[0]+" AND groupe ="+new_roche[1]+" \
                            AND roche ="+new_roche[2]+");"
        else:
            insert_roche = "INSERT INTO roche (zone, groupe, roche, nature, type, longueur, largeur, \
                            epaisseur, orientation, nom) VALUES ("
            insert_roche = insert_roche+string.join(new_roche, ", ")
            insert_roche = insert_roche + ");"
        try:
            db.query(insert_roche)
            print ("OK : roche "+champs[2])
        except:
            print ("Problem : " + insert_roche)


