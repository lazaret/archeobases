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

        if (ligne != "") and (ligne[:4] != "dfob") and (ligne[:6] != "------")  :

                champs = string.split(ligne, ",")

                

                for i in range(0,len(champs)) :

                        #print(champs[i])

                        champs[i] = string.replace(champs[i], "0.00" , "0")

                        #print(champs[i])

                        champs[i] = string.strip(champs[i])

                        if champs[i] == '-':

                                champs[i] = ''

                        elif champs[i] in ['999','9999.99','999.99']:

                                champs[i] = '0'

                new_dent = []



                new_dent.append(champs[0])  #0  #0 zone

                new_dent.append(champs[1])  #1  #1 numero

                new_dent.append(champs[2])  #2  #2 bis

                new_dent.append(champs[3])  #3  #3 serie



                new_dent.append(champs[4])  #type

		

                new_dent.append(champs[5])

                new_dent.append(champs[6])

                new_dent.append(champs[7])

                new_dent.append(champs[8])

                new_dent.append(champs[9])

                new_dent.append(champs[10])

                new_dent.append(champs[11])

                new_dent.append(champs[12])

                new_dent.append(champs[13])

                new_dent.append(champs[14])

                for i in range(0, len(new_dent)) :

                        if i  in [0,2,3,4] :

                                new_dent[i] = db.quote(string.upper(new_dent[i]), "text")

                        #elif new_dent[i]!= '-':

                         #       new_dent[i] = db.quote(new_dent[i], "")

                verify = "select * from faune where zone=" + new_dent[0]+ " and numero =" + new_dent[1] + " and bis=" + new_dent[2] + ";"                 

                existe = db.query(verify)

                existe = existe.dictresult()

                verify2 = "select * from dent where zone=" + new_dent[0]+ " and numero =" + new_dent[1] + " and bis=" + new_dent[2] + " and d_serie=" + new_dent[3] + " and d_type=" + new_dent[4] + ";"                 

                existe2 = db.query(verify2)

                existe2 = existe2.dictresult()

                print  len(existe2)

                if  not existe :

                        print "I   => pas de parent: ",(string.join(new_dent, ','))

                elif existe2:

                        print "I  => doublon: ",(string.join(new_dent, ','))

                elif new_dent[0] != 'null' and new_dent[1] != 'null' and new_dent[2] != 'null' and new_dent[3] != 'null':        



                        insert="INSERT INTO dent (zone, numero, bis,d_serie,d_type,d_m1,d_m2,d_m3,d_m4,d_m5,d_m6,d_m7,d_m8,d_m9,d_m10) VALUES ("

                        insert = insert+string.join(new_dent, ', ')

                        insert = insert + ");"

                        #db.query(insert)

                        #print(insert)









#db.query("VACUUM;")





