#! /usr/bin/python
#
# archeo - (c)  1999-2003 Rachel VAUDRON <rachel@cleo.unice.fr>
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2.0
# or, at your option, any higher version.
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#

#       CREE UNE NOUVELLE BASE AVEC SES UTILISATEURS

import os
import sys
import string
import database
sys.path.append("../cgi")


print("AVERTISSEMENT: placez-vous dans le répertoire où est votre schema_archeo.sql")



# RECUPERATION DU NOM DE LA NOUVELLE BASE ET CONNEXION A template1
#=================================================================
liste_base = ['essai', 'fate', 'fejej','isernia','lazaret','kadagona']
requete = raw_input("Rentrez votre requête:\n")

for i in range(0, len(liste_base)):
	db = database.DataBase(database=liste_base[i], username = "postgres")
	db.query(requete)
		

