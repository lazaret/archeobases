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

# description :
# import with replacement the datas of the table `roche` from a csv file

# usage:
# ./excel2base_roche.py database < fichier_recup.csv > repport.txt

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
        new_carnet.append("'"+champs[0]+"'")  #zone
        new_carnet.append(champs[1])  #numero
        new_carnet.append("'"+champs[2]+"'")  #bis
        if champs[3] == "": #ensemble
            new_carnet.append("NULL")
        else:
            new_carnet.append("'"+champs[3]+"'")
        if champs[4] == "": #niveau
            new_carnet.append("NULL")
        else:
            new_carnet.append("'"+champs[4]+"'")
        if champs[5] == "": #couche
            new_carnet.append("NULL")
        else:
            new_carnet.append("'"+champs[5]+"'")
        if champs[6] == "": #nature
            new_carnet.append("NULL")
        else:
            new_carnet.append("'"+champs[6]+"'")
        if champs[7] == "": #x
            new_carnet.append("NULL")
        else:
            new_carnet.append(champs[7])
        if champs[8] == "": #y
            new_carnet.append("NULL")
        else:
            new_carnet.append(champs[8])
        if champs[9] == "": #zrelatif
            new_carnet.append("NULL")
        else:
            new_carnet.append(champs[9])
        if champs[10] == "": #orientation
            new_carnet.append("NULL")
        else:
            new_carnet.append("'"+champs[10]+"'")
        if champs[11] == "": #trouve
            new_carnet.append("NULL")
        else:
            new_carnet.append("'"+champs[11]+"'")
        verify = "SELECT * FROM carnet WHERE zone ="+new_carnet[0]+" AND numero ="+new_carnet[1]+" AND bis ="+new_carnet[2]+";"
        existe = db.query(verify)
        existe = existe.dictresult()
        if existe:
            print ("Enregistrement existant : "+new_carnet[0]+" "+new_carnet[1]+" "+new_carnet[2])
        else:
            insert_carnet = "INSERT INTO carnet (zone, numero, bis, ensemble, niveau, couche, nature, \
                            x, y, zrelatif, orientation, trouve) VALUES ("
            insert_carnet = insert_carnet+string.join(new_carnet, ", ")
            insert_carnet = insert_carnet + ");"
            try:
                db.query(insert_carnet)
                print ("OK : " +new_carnet[0]+" "+new_carnet[1]+" "+new_carnet[2])
            except:
                print ("Problem : " + insert_carnet)


