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


lignes = sys.stdin.readlines()
l = 0
for ligne in lignes:
        ligne = string.strip(ligne[:-1])
        l = l + 1
        if (ligne != "") and (ligne[:4] != "fido") and (ligne[:6] != "------")  :
                champs = string.split(ligne, ",")
                for i in range(0,len(champs)) :
                        champs[i] = string.strip(champs[i])
                        if champs[i] == '-':
                                champs[i] = ''
                        elif champs[i] in ['999','9999.99','999.99']:
                                champs[i] = '0'
		
                new_industrie = []
		new_eclat     = []		
                new_industrie.append(champs[0])  #0  #0 zone
                new_industrie.append(champs[1])  #1  #1 numero
                new_industrie.append(champs[2])  #2  #2 bis
                new_industrie.append(champs[5])  #3  #3 oa
                new_industrie.append(champs[6])  #4  #3 ob
                new_industrie.append(champs[7])  #5  #3 oc
                new_industrie.append(champs[8])  #6  #3 poids
                new_industrie.append(champs[9]) #7  #5 nature
                new_industrie.append(champs[10]) #8  #5 forme

		#11,12,13 a ne pas recuperer L,l,e du carnet
                new_industrie.append(champs[15]) #9 SUPPORT-TYPE

		######

                new_industrie.append(champs[29]) #11 patine 

                new_industrie.append(champs[30]) #12 dpatinE

                new_industrie.append(champs[31]) #13 alteration

                new_industrie.append(champs[32]) #14 desilic

                new_industrie.append(champs[33]) #15 encroutement

                new_industrie.append(champs[34]) #16 action

                new_industrie.append(champs[35]) #17 eolisation
		#print("LUSTRAGE", champs[35])

                new_industrie.append(champs[36]) #18 LUSTRAGE

                new_industrie.append(champs[37]) #19 roule
             
                for i in range(0, len(new_industrie)) :
                        if i  in [0,2,5,7,8,9,10,11,12,13,14,15,16,17,18] :
                                new_industrie[i] = db.quote(string.upper(new_industrie[i]), "text")
                        elif new_industrie[i]!= '-':
                                new_industrie[i] = db.quote(new_industrie[i], "")
                verify = "select * from carnet where zone=" + new_industrie[0]+ " and numero =" + new_industrie[1] + " and bis=" + new_industrie[2] + ";"                 
                existe = db.query(verify)
                existe = existe.dictresult()
                verify2 = "select * from industrie where zone=" + new_industrie[0]+ " and numero =" + new_industrie[1] + " and bis=" + new_industrie[2] + ";"                 
		#print("verify2", verify2)
                existe2 = db.query(verify2)
                existe2 = existe2.dictresult()
                #print  len(existe2)
                if not existe :
                        print "I   => pas de parent: ",(string.join(new_industrie, ','))
		elif existe2:
                        print "I  => doublon: ",(string.join(new_industrie, ','))
                elif new_industrie[0] != 'null' and new_industrie[1] != 'null' and new_industrie[2] != 'null':        
                        insert="INSERT INTO industrie (zone, numero, bis, i_oa, i_ob, i_oc,i_poids, i_matiere,i_forme_galet, i_support, i_patine, i_dpatine, i_alteration, i_desilicification, i_encroutement, i_action, i_eolisation, i_lustrage, i_roulage) VALUES ("
                        insert = insert+string.join(new_industrie, ', ')
                	insert = insert + ");"
                	db.query(insert)

################# ECLAT ##################################
		if champs[13]:
			#print (champs[13])
                	new_eclat.append(champs[0]) #0  #0 zone
                	new_eclat.append(champs[1]) #1  #1 numero
                	new_eclat.append(champs[2]) #2  #2 bis

                	new_eclat.append(champs[14]) #3   # debitage
                	new_eclat.append(champs[15]) #4   #type
               		new_eclat.append(champs[16]) #5   # section_trans
                	new_eclat.append(champs[17]) #6   # contour
                	new_eclat.append(champs[18]) #7   # enlevement
                	new_eclat.append(champs[19]) #8   #talon
                	new_eclat.append(champs[20]) #9   # bulbe
                	new_eclat.append(champs[21]) #10   #cone
                	new_eclat.append(champs[22]) #11  #onde
                	new_eclat.append(champs[23]) #12  #epi
                	new_eclat.append(champs[24]) #13  #strie
                	new_eclat.append(champs[25]) #14  #parasite
                	new_eclat.append(champs[26]) #15  #secondaire
                	new_eclat.append(champs[27]) #16  #charniere
                	new_eclat.append(champs[28]) #17  #carene

                	for i in range(0, len(new_eclat)) :
                        	if i  in [0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17] :
                                	new_eclat[i] = db.quote(string.upper(new_eclat[i]), "text")

                        	elif new_eclat[i]!= '-':
                                	new_eclat[i] = db.quote(new_eclat[i], "")
                	verify = "select * from industrie where zone=" + new_eclat[0]+ " and numero =" + new_eclat[1] + " and bis=" + new_eclat[2] + ";"                 
                	existe = db.query(verify2)
                	existe = existe.dictresult()
                	#print  len(existe)



	                verify2 = "select * from eclat where zone=" + new_industrie[0]+ " and numero =" + new_industrie[1] + " and bis=" + new_industrie[2] + ";"                 
                	existe2 = db.query(verify2)
                	existe2 = existe2.dictresult()
                	#print  len(existe2)
                	if not existe :
                        	print "E  ===> pas de parent ",(string.join(new_eclat, ','))
			elif existe2:
                        	print "E  ===> doublon ",(string.join(new_eclat, ','))
                	elif new_eclat[0] != 'null' and new_eclat[1] != 'null' and new_eclat[2] != 'null':        
                        	insert="INSERT INTO eclat (zone, numero, bis, e_debitage, e_type,e_section_trans, e_contour,e_enlevement, e_talon,e_bulbe,e_cone,e_onde,e_epi,e_strie,e_parasite,e_secondaire,e_charniere,e_carene) VALUES ("
                        	insert = insert+string.join(new_eclat, ', ')
                		insert = insert + ");"
				if champs[15]!='null':
                			db.query(insert)
               				#print(l, insert)
				else:
					print("c'est pas un eclat")




#db.query("VACUUM;")


