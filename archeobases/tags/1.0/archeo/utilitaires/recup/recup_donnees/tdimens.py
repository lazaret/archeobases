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
        if (ligne != "") and (ligne[:4] != "fdim") and (ligne[:6] != "------")  :
                champs = string.split(ligne, ",")
                for i in range(0,len(champs)) :
                        champs[i] = string.strip(champs[i])
                        if champs[i] == '-':
                                champs[i] = ''
                        elif champs[i] in ['999','9999.99','999.99']:
                                champs[i] = '0'
                new_eclat = []
                new_eclat.append(champs[0]) #0  #0 zone
                new_eclat.append(champs[1]) #1  #1 numero
                new_eclat.append(champs[2]) #2  #2 bis
                new_eclat.append(champs[3])  #3  #3 Longm
                new_eclat.append(champs[4])  #4  #5 larm
                new_eclat.append(champs[5])  #  #6 fa
                new_eclat.append(champs[6])  #  # fb
                new_eclat.append(champs[7])  #  # fc
                new_eclat.append(champs[8])  #  # fd
                new_eclat.append(champs[9])  #  # fe
                new_eclat.append(champs[10])#  # ff
                new_eclat.append(champs[11])#  # ta
                new_eclat.append(champs[12])#  # tb
                new_eclat.append(champs[13])#  # tc
                new_eclat.append(champs[14])#  # td
                new_eclat.append(champs[15])#  # te
                new_eclat.append(champs[16])#  # tf
                new_eclat.append(champs[17])#  # ti
                new_eclat.append(champs[18])#  # tg
                new_eclat.append(champs[19])#  # thc

                for i in range(0, len(new_eclat)) :
                        if i  in [0,2] :
                                new_eclat[i] = db.quote(string.upper(new_eclat[i]), "text")
                        elif new_eclat[i]!= '-':
                                new_eclat[i] = db.quote(new_eclat[i], "")
                verify = "select * from eclat where zone=" + new_eclat[0]+ " and numero =" + new_eclat[1] + " and bis=" + new_eclat[2] + ";"                 
                existe = db.query(verify)
                existe = existe.dictresult()
                #print  len(existe)

		liste = ["e_longm","e_largm","e_fa","e_fb","e_fc","e_fd","e_fe","e_ff","e_ta","e_tb","e_tc","e_td","e_te","e_tf","e_tg","e_thc","e_ti"]
                if not existe :
                        print "erreur: pas de parent ",(string.join(new_eclat, ','))
                elif new_eclat[0] != 'null' and new_eclat[1] != 'null' and new_eclat[2] != 'null':        
                        update="UPDATE eclat SET "
			for i in range(0, (len(new_eclat)-3)):
				update = update + liste[i] + "=" + new_eclat[i+3] + "," 
			update  = update[:-1] + " WHERE zone = " + new_eclat[0] + " AND numero = " + champs[1] +  " AND bis = " + new_eclat[2] + ";"
                	db.query(update)
                        #print l,update

		else:
                        print "!!!!!!!!!!! ",(string.join(new_eclat, ','))


db.query("VACUUM;")


