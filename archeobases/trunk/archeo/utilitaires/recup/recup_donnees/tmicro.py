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


db = database.DataBase(database=sys.argv[1], username="postgres")
lignes = sys.stdin.readlines()
l = 0
for ligne in lignes:
    ligne = string.strip(ligne[:-1])
    l = l + 1
    if (ligne != "") and (ligne[:4] != "mico") and (ligne[:6] != "------"):
        champs = string.split(ligne, ",")
        for i in range(0, len(champs)):
            champs[i] = string.replace(champs[i], "0.00" , "0")
            champs[i] = string.strip(champs[i])
            if champs[i] == '-':
                champs[i] = ''
            elif champs[i] in ['999','9999.99','999.99']:
                champs[i] = '0'
        new_micro = []
        new_micro.append(champs[0])  #0  #0 zone
        new_micro.append(champs[1])  #1  #1 numero
        new_micro.append(champs[2])  #2  #2 bis
        new_micro.append(champs[3])  #3  #3 serie
        new_micro.append(champs[4])  #type
        new_micro.append(champs[5])
        new_micro.append(champs[6])
        new_micro.append(champs[7])
        new_micro.append(champs[8])
        new_micro.append(champs[9])
        new_micro.append(champs[10])
        new_micro.append(champs[11])
        new_micro.append(champs[12])
        new_micro.append(champs[13])
        new_micro.append(champs[14])
        new_micro.append(champs[15])
        new_micro.append(champs[16])
        new_micro.append(champs[17])
        new_micro.append(champs[18])
        new_micro.append(champs[19])
        new_micro.append(champs[20])
        new_micro.append(champs[21])
        new_micro.append(champs[22])
        new_micro.append(champs[23])
        new_micro.append(champs[24])
        new_micro.append(champs[25])
        new_micro.append(champs[26])
        new_micro.append(champs[27])
        new_micro.append(champs[28])
        new_micro.append(champs[29])
        for i in range(0, len(new_micro)):
            if i  in [0, 2, 3, 4]:
                new_micro[i] = db.quote(string.upper(new_micro[i]), "text")
        verify = "select * from faune where zone=" + new_micro[0]+ " and numero =" + new_micro[1] + " and bis=" + new_micro[2] + ";"
        existe = db.query(verify)
        existe = existe.dictresult()
        verify2 = "select * from microfaune where zone=" + new_micro[0]+ " and numero =" + new_micro[1] + " and bis=" + new_micro[2] + " and mf_serie=" + new_micro[3] + ";"
        existe2 = db.query(verify2)
        existe2 = existe2.dictresult()
        #print  len(existe2)
        if  not existe:
            print "I => pas de parent: ", (string.join(new_micro, ','))
        elif existe2:
            print "I => doublon: ", (string.join(new_micro, ','))
        elif new_micro[0] != 'null' and new_micro[1] != 'null' and new_micro[2] != 'null' and new_micro[3] != 'null':
            insert = "INSERT INTO microfaune (zone, numero, bis,mf_serie,mf_type,mf_m1,mf_m2,mf_m3,mf_m4,mf_m5,mf_m6,mf_m7,mf_m8,mf_m9,mf_m10,mf_m11,mf_m12,mf_m13,mf_m14,mf_m15,mf_m16,mf_m17,mf_m18,mf_m19,mf_m20,mf_m21,mf_m22,mf_m23,mf_m24,mf_m25) VALUES ("
            insert = insert+string.join(new_micro, ', ')
            insert = insert + ");"
            db.query(insert)
db.query("VACUUM;")


