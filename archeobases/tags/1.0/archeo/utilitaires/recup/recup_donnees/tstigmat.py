#! /usr/bin/python
#
# archeo - (c) 2003 Rachel VAUDRON <rachel@lazaret.unice.fr>
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2.0
# or, at your option, any higher version.
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
cpt = 0

lignes = sys.stdin.readlines()
l = 0
for ligne in lignes:
        ligne = string.strip(ligne[:-1])
        l = l + 1
        if (ligne != "") and (ligne[:4] != "sobj") and (ligne[:6] != "------")  :
                champs = string.split(ligne, ",")
                for i in range(0,len(champs)) :
                        champs[i] = string.strip(champs[i])
                        if champs[i] == '-':
                                champs[i] = ''
                        elif champs[i] in ['999','9999.99','999.99']:
                                champs[i] = '0'
		
                new= []

		new.append(champs[0])  #0 zone
		new.append(champs[1])  #1 numero
		new.append(champs[2])  # bis
		new.append(1)          # ordre
		new.append(champs[3])  # composite
		new.append(champs[4])  # simple
		new.append(champs[5])  # support
		new.append(champs[6])  # roche
		new.append(champs[7])  # geometrie
		new.append(champs[8])  # alteration
		new.append(champs[9])  # concretion
		new.append(champs[10])  # longueur
		new.append(champs[11])  # largeur
		new.append(champs[12])  # epaisseur
		new.append(champs[13])  # poids
		new.append(champs[14])  # plan
		new.append(champs[15])  # dessin
		new.append(champs[16])  # coupe
		new.append(champs[17])  # photo
		new.append(champs[18])  # analyse


		for i in range(0, len(new)) :
			if i not in [1,3,11,12,13,14] :
				new[i] = db.quote(string.upper(new[i]), "text")
			elif new[i]!= '-' or new[i]!='99':

				new[i] = db.quote(new[i], "")

                verify = "select * from industrie where zone=" + new[0]+ " and numero =" + new[1] + " and bis=" + new[2] + ";"                 
                existe = db.query(verify)
                existe = existe.dictresult()
		
                verify2 = "select * from stigmate where zone=" + new[0]+ " and numero =" + new[1] + " and bis=" + new[2] + " and s_ordre=" + new[3] + ";"                 
		#print("verify2", verify2)
                existe2 = db.query(verify2)
                existe2 = existe2.dictresult()
                #print  len(existe2)

                if not existe :
                        print "I   => pas de parent: ",(string.join(new, ','))
		elif existe2:
                        print "I  => doublon: ",(string.join(new, ','))
                        insert = insert+string.join(new, ', ')
                	insert = insert + ");"
                	db.query(insert)
		elif new[0] != 'null' and new[1] != 'null' and new[2] != 'null' and new[3] != 'null':
		        insert="INSERT INTO stigmate (zone , numero , bis , s_ordre, s_composite, s_simple, s_support, s_roche, s_geometrie, s_alteration, s_concretion, s_longueur, s_largeur, s_epaisseur,s_poids, s_plan, s_dessin, s_coupe, s_photo, s_analyse) VALUES ("
			insert = insert+string.join(new, ', ')
			insert = insert + ");"
			#print(insert)
			db.query(insert)

			#print l, insert

			cpt = cpt + 1

print (cpt, " objets inseres")


#db.query("VACUUM;")


