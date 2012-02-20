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
# ./import_carnet.py database < carnet.csv > repport.txt
# The carnet.csv file must values separated by `;`

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
        new_carnet = []
        new_carnet.append(champs[0])  #zone
        new_carnet.append(champs[1])  #numero
        new_carnet.append(champs[2])  #bis
        new_carnet.append(champs[3])  #localite
        new_carnet.append(champs[4])  #carre
        new_carnet.append(champs[5])  #souscarre
        new_carnet.append(champs[6])  #ensemble
        new_carnet.append(champs[7])  #niveau
        new_carnet.append(champs[8])  #sol
        new_carnet.append(champs[9])  #couche
        new_carnet.append(champs[10])  #foyer
        new_carnet.append(champs[11])  #nature
        if champs[12] == "": #nofouille
            new_carnet.append("NULL")
        else:
            new_carnet.append(champs[12])
        if champs[13] == "": #nomusee
            new_carnet.append("NULL")
        else:
            new_carnet.append(champs[13])
        if champs[14] == "": #nosopi
            new_carnet.append("NULL")
        else:
            new_carnet.append(champs[14])
        if champs[15] == "": #x
            new_carnet.append("NULL")
        else:
            new_carnet.append(champs[15])
        if champs[16] == "": #y
            new_carnet.append("NULL")
        else:
            new_carnet.append(champs[16])
        if champs[17] == "": #zrelatif
            new_carnet.append("NULL")
        else:
            new_carnet.append(champs[17])
        if champs[18] == "": #zreference
            new_carnet.append("NULL")
        else:
            new_carnet.append(champs[18])
        if champs[19] == "": #zabsolu
            new_carnet.append("NULL")
        else:
            new_carnet.append(champs[19])
        new_carnet.append(champs[20])  #orientation
        new_carnet.append(champs[21])  #pendage
        new_carnet.append(champs[22])  #vers
        if champs[23] == "": #longueur
            new_carnet.append("NULL")
        else:
            new_carnet.append(champs[23])
        if champs[24] == "": #largeur
            new_carnet.append("NULL")
        else:
            new_carnet.append(champs[24])
        if champs[25] == "": #epaisseur
            new_carnet.append("NULL")
        else:
            new_carnet.append(champs[25])
        for i in range(0, len(new_carnet)):
            if i in [1, 12, 13, 14, 15, 16, 17, 18, 19, 23, 24, 25]:
                pass
            else:
                new_carnet[i] = db.quote((new_carnet[i]), "text")

        verify = "SELECT * FROM carnet WHERE zone ="+new_carnet[0]+" AND numero ="+new_carnet[1]+" AND bis ="+new_carnet[2]+";"
        existe = db.query(verify)
        existe = existe.dictresult()
        if existe:
            print ("Enregistrement existant : "+new_carnet[0]+" "+new_carnet[1]+" "+new_carnet[2])
        else:
            insert_carnet = "INSERT INTO carnet (zone, numero, bis, localite, carre, souscarre, ensemble, niveau, \
                            sol, couche, foyer, nature, nofouille, nomusee, nosopi, x, y, zrelatif, zreference, \
                            zabsolu, orientation, pendage, vers, longueur, largeur, epaisseur) VALUES ("
            insert_carnet = insert_carnet+string.join(new_carnet, ", ")
            insert_carnet = insert_carnet + ");"
            try:
                db.query(insert_carnet)
                print ("OK : " +new_carnet[0]+" "+new_carnet[1]+" "+new_carnet[2])
            except:
                print ("Problem : " + insert_carnet)


