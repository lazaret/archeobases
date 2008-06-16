#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Archeo - (c) 1999-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2
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

# RECUPERATION DU NOM DE LA NOUVELLE BASE ET CONNEXION A template1
#=================================================================

nom_base = raw_input('Nom de la base sur laquelle vous souhaitez créer les droits:')
db = database.DataBase(database=nom_base, username = "postgres")

print(" CREATION DES DROITS SUR LES TABLES DE LA BASE")
#====================================================
#######GRANT SUR TABLES NORMALES
recup_table = "SELECT relname FROM pg_class WHERE relname NOT LIKE 'pg%' AND relname NOT LIKE 'controle_%' AND relname NOT LIKE 'seq_%' AND relname NOT LIKE '%pkey';"
res_table = db.query(recup_table).dictresult()
print (len(res_table))
for i in range( 1, len(res_table)):
        db.query("REVOKE ALL ON "+ res_table[i]["relname"] + " FROM super" + nom_base + ";")
        db.query("REVOKE ALL ON "+ res_table[i]["relname"] + " FROM " + nom_base + ";")
        db.query("REVOKE ALL ON "+ res_table[i]["relname"] + " FROM visiteur" + nom_base + ";")
        db.query("REVOKE ALL ON "+ res_table[i]["relname"] + " FROM public" + ";")
        grant_super = "GRANT ALL ON " + res_table[i]["relname"] + " TO super"+ nom_base + ";"   
        db.query(grant_super)
	print (grant_super)
        grant_normal = "GRANT ALL ON " + res_table[i]["relname"] + " TO "+ nom_base + ";"       
        db.query(grant_normal)

        grant_visiteur = "GRANT SELECT ON " + res_table[i]["relname"] + " TO visiteur"+ nom_base + ";"  
        db.query(grant_visiteur)

        grant_normal = "GRANT SELECT ON " + res_table[i]["relname"] + " TO "+ nom_base + ";"
        db.query(grant_normal)

        grant_visiteur = "GRANT SELECT ON " + res_table[i]["relname"] + " TO visiteur"+ nom_base + ";"
        db.query(grant_visiteur)

        grant_public = "GRANT SELECT ON " + res_table[i]["relname"] + " TO public;"
        db.query(grant_public)

        
grant_public = "GRANT SELECT ON " + res_table[i]["relname"] + " TO public;"  
        db.query(grant_public)

#######GRANT SUR TABLES CONTROLE
print "CREATION DES DROITS SUR LES TABLES CONTROLES"
recup_table = "SELECT relname FROM pg_class WHERE relname NOT LIKE 'pg%' AND relname LIKE 'controle_%' AND relname NOT LIKE '%pkey';"

res_table = db.query(recup_table).dictresult()
for i in range( 1, len(res_table)):
        db.query("REVOKE ALL ON "+ res_table[i]["relname"] + " FROM super" + nom_base + ";")
        db.query("REVOKE ALL ON "+ res_table[i]["relname"] + " FROM " + nom_base + ";")
        db.query("REVOKE ALL ON "+ res_table[i]["relname"] + " FROM visiteur" + nom_base + ";")
        db.query("REVOKE ALL ON "+ res_table[i]["relname"] + " FROM public" + ";")

        grant_super = "GRANT ALL ON " + res_table[i]["relname"] + " TO super"+ nom_base + ";"   
        db.query(grant_super)
	print grant_super

        grant_normal = "GRANT SELECT ON " + res_table[i]["relname"] + " TO "+ nom_base + ";"  
        db.query(grant_normal)

        grant_visiteur = "GRANT SELECT ON " + res_table[i]["relname"] + " TO visiteur"+ nom_base + ";"  
        db.query(grant_visiteur)

        grant_public = "GRANT SELECT ON " + res_table[i]["relname"] + " TO public;"
	db.query(grant_public)


grant_super = "GRANT ALL ON controle_zone TO super"+ nom_base + ";"
db.query(grant_super)
print grant_super

grant_normal = "GRANT SELECT ON controle_zone TO "+ nom_base + ";"
db.query(grant_normal)

grant_visiteur = "GRANT SELECT ON controle_zone TO visiteur"+ nom_base + ";"
db.query(grant_visiteur)

grant_public = "GRANT SELECT ON controle_zone TO public;"
db.query(grant_public)

