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
        if (ligne != "") and (ligne[:4] != "eout") and (ligne[:6] != "------")  :
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
                new.append("1")  # ordre
                new.append(champs[3])  # code
                new.append(champs[4])  # localisation
                new.append(champs[5])  # tranchant
                if champs[3][:1] == 'A':
                        new.append(champs[3])
                else:
                        new.append('null')

                for i in range(0, len(new)) :
                        if i not in [1, 3] :
                                new[i] = db.quote(string.upper(new[i]), "text")
                        elif new[i]!= '-' or new[i]!='99':

                                new[i] = db.quote(new[i], "")

                verify = "select * from eclat where zone=" + new[0]+ " and numero =" + new[1] + " and bis=" + new[2] + ";"                 
                existe = db.query(verify)
                existe = existe.dictresult()

                if not existe :
                        print "I   => pas de parent: ",(string.join(new, ','))
                        
                elif new[0] != 'null' and new[1] != 'null' and new[2] != 'null' and new[3] != 'null':
                        verify2 = "select * from bord where zone=" + new[0]+ " and numero =" + new[1] + " and bis=" + new[2] + " and b_ordre=" + new[3] + ";"                 
                        existe2 = db.query(verify2)
                        existe2 = existe2.dictresult()
                        i = 1
                        while existe2:
                                i = i + 1
                                verify2 = "select * from bord where zone=" + new[0]+ " and numero =" + new[1] + " and bis=" + new[2] + " and b_ordre=" + db.quote(i,"") + ";"                 
                                existe2 = db.query(verify2)
                                existe2 = existe2.dictresult()
                        new[3] = db.quote(i, "")
                        insert="INSERT INTO bord (zone , numero , bis , b_ordre , b_code, b_extremite,b_localisation,b_amincissement ) VALUES ("
                        insert = insert+string.join(new, ', ')
                        insert = insert + ");"
                        db.query(insert)

                        #print l, insert



#db.query("VACUUM;")


