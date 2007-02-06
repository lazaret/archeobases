#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#                2003 Rachel VAUDRON <rachel@lazaret.unice.fr>
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2.0
# or, at your option, any higher version.
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#


########################################################################
# ce programme permet de recuperer le contenu du lexique d'industrie dans les controles de la base archeo
# ./liste_industrie.py < liste-industrie.txt    
########################################################################

import sys
import string

sys.path.append("../cgi")
import database

db = database.DataBase(database=sys.argv[1], username = "postgres")


lignes = sys.stdin.readlines()
for ligne in lignes:
        ligne = string.strip(ligne[:-1])
        
        if (ligne != "") and (ligne[:1] == "("):
                x = len(ligne)-1
                nom_champ = ligne[1:x]
                print ("nom_champ : ", nom_champ)
        elif ligne != "":
                insert = "INSERT INTO controle_" + nom_champ + "(" + nom_champ + ")  VALUES (" +  db.quote(ligne,"text") + ");"
                db.query(insert)
                print(insert)
                
db.query("VACUUM;")

