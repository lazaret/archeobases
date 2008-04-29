#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Mont Bego - (c) 1999-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
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

db = database.DataBase(database="bego", username = "bego")
######### avant d'inserer les rcohes, il faut creer les zones ##########
for i in range (0, 23):
	zone = "INSERT INTO zone(zone) VALUES(" + db.quote(i, "text") + ");"
        db.query(zone)

lignes = sys.stdin.readlines()
l = 0
for ligne in lignes:
	ligne = string.strip(ligne[:-1])
	l = l + 1
	if (ligne != "") and (ligne[:4] != "zone") and (ligne[:6] != "------")	:
		champs = string.split(ligne, ";")
		for i in range(0,len(champs)) :
			champs[i] = string.strip(champs[i])
		nouveaux = []
		nouveaux.append(champs[0]) #z
		nouveaux.append(champs[1]) #g

		if champs[2] in ["-","--","---"] : #r
			nouveaux.append(champs[3])
		else :
			nouveaux.append(champs[3]+champs[2])
		nouveaux.append(champs[4]) #x
		nouveaux.append(champs[5]) #y
		nouveaux.append(champs[6]) #z

		champs[7] = string.upper(champs[7])
		if (champs[7] in ['G','GS','S','SG']) :
			nouveaux.append(champs[7]) #nature
		elif (champs[7] in ['SG']) :
			nouveau.append('S')

		for i in range(0, len(nouveaux)) :
			if i  in [0, 2, 6] :
				nouveaux[i] = db.quote(nouveaux[i], "text")

		insert="INSERT INTO roche (zone, groupe, roche, x, y, z, nature) VALUES ("
		insert = insert+string.join(nouveaux, ', ')
		insert = insert + ");"


		db.query(insert)

		print l, insert

db.query("VACUUM;")

