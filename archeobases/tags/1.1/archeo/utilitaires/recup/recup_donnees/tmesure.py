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

sys.path.append("../cgi")
import database

db = database.DataBase(database=sys.argv[1], username = "postgres")

lignes = sys.stdin.readlines()
l = 0
for ligne in lignes:
        ligne = string.strip(ligne[:-1])
        l = l + 1
        if (ligne != "") and (ligne[:4] != "fmme") and (ligne[:6] != "------")  :
                champs = string.split(ligne, ",")
                
                for i in range(0,len(champs)) :
                        champs[i] = string.replace(champs[i], "0.00" , "0")
                        champs[i] = string.strip(champs[i])
                        if champs[i] == '-':
                                champs[i] = ''
                        elif champs[i] in ['999','9999.99','999.99']:
                                champs[i] = '0'
                new_nonos = []

                new_nonos.append(champs[0])  #0  #0 zone
                new_nonos.append(champs[1])  #1  #1 numero
                new_nonos.append(champs[2])  #2  #2 bis
                new_nonos.append(champs[3])  #3  #3 serie
                new_nonos.append(champs[4])  #m l
                new_nonos.append(champs[5])
                new_nonos.append(champs[6])
                new_nonos.append(champs[7])
                new_nonos.append(champs[8])
                new_nonos.append(champs[9])
                new_nonos.append(champs[10])
                new_nonos.append(champs[11])
                new_nonos.append(champs[12])
                new_nonos.append(champs[13])
                new_nonos.append(champs[14])
                new_nonos.append(champs[15])
                new_nonos.append(champs[16])
                new_nonos.append(champs[17])
                new_nonos.append(champs[18])
                new_nonos.append(champs[19])
                new_nonos.append(champs[20])
                new_nonos.append(champs[21])
                new_nonos.append(champs[22])
                new_nonos.append(champs[23])
                new_nonos.append(champs[24])
                new_nonos.append(champs[25])
                new_nonos.append(champs[26])
                new_nonos.append(champs[27])
                new_nonos.append(champs[28])
                for i in range(0, len(new_nonos)) :
                        if i in [0,2,3] :
                                new_nonos[i] = db.quote(string.upper(new_nonos[i]), "text")
                verify = "select * from faune where zone=" + new_nonos[0]+ " and numero =" + new_nonos[1] + " and bis=" + new_nonos[2] + ";"                 
                existe = db.query(verify)
                existe = existe.dictresult()
                verify2 = "select * from os where zone=" + new_nonos[0]+ " and numero =" + new_nonos[1] + " and bis=" + new_nonos[2] + " and o_sserie=" + new_nonos[3] + ";"                 
                existe2 = db.query(verify2)
                existe2 = existe2.dictresult()
                if  not existe :
                        print "I   => pas de parent: ",(string.join(new_nonos, ','))
                elif existe2:
                        print "I  => doublon: ",(string.join(new_nonos, ','))
                elif new_nonos[0] != 'null' and new_nonos[1] != 'null' and new_nonos[2] != 'null' and new_nonos[3] != 'null':        

                        insert="INSERT INTO os (zone, numero, bis,o_sserie,o_m1,o_m2,o_m3,o_m4,o_m5,o_m6,o_m7,o_m8,o_m9,o_m10,o_m12,o_m13,o_m14,o_m15,o_m16,o_m17,o_m18,o_m19,o_m20,o_m21,o_m22,o_m23,o_m24,o_m25, o_m26, o_m27,o_m28) VALUES ("
                        insert = insert+string.join(new_nonos, ', ')
                        insert = insert + ");"
                        db.query(insert)

db.query("VACUUM;")


