#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Archeo - (c) 2003-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#

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
    if (ligne != "") and (ligne[:4] != "zone") and (ligne[:6] != "------")  :
        champs = string.split(ligne, ",")
        for i in range(0, len(champs)) :
            champs[i] = string.strip(champs[i])
            if champs[i] == '-':
                champs[i] = ''
            elif champs[i] in ['999', '9999.99', '999.99']:
                champs[i] = '0'
        nouveaux = []
    titi = champs[0]
    if champs[0] in ['1/8', '1Q', '3-25', '3435', '3A', '5224', 'I4', 'est', 'G3', 'I2', 'ISF', 'N']:
        champs[0] = ''
    else:
        if titi[1:] == 'Q':
            champs[1] = titi[1:]
        if champs[0] == 'ND':
            champs[0] = 'IND'
    nouveaux.append(champs[9]) #13 #18 zrela
    nouveaux.append(champs[10])#15 #20 zref
    insert = "UPDATE carnet SET zrelatif=" + db.quote(champs[9],"decimal")+ " where zone=" + db.quote(champs[0],"text") + " and numero= " + db.quote(champs[1],"int") + " and bis=" + db.quote(champs[2],"text") + ";"
    print(insert)
    db.query(insert)
    insert = "UPDATE carnet SET zreference=" + db.quote(champs[10],"decimal")+ " where zone=" + db.quote(champs[0],"text") + " and numero= " + db.quote(champs[1],"int") + " and bis=" + db.quote(champs[2],"text") + ";"
    print(insert)
    db.query(insert)

