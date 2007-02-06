#! /usr/bin/python
# -*- coding: utf-8 -*-
#
# archeo - (c) 2006 Bertrand LECERVOISIER
#
# Version 0.3
#
#You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2.0
# or, at your option, any higher version.
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#

#===========CONVERTIT ET IMPORTE UN DUMP DE BASE SQL=================

# Pour exporter utiliser la commande :
# pg_dump -a -d -O -x mabase > mabase.sql
# -a = seulement les données
# -d commandes de type INSERT
# -O = pas de commandes "connect"
# -x sans droits sur les tables (deja crées par create_structure.py)

import os
import sys
import string
import database

print("")
print("--------------------------------------------------------------------------")
print("-> AVERTISSEMENT: placez-vous dans le répertoire où est votre fichier dump")
print("   Pour créer ce fichier utilisez les commandes suivante sur votre ancienne base :")
print("   'pg_dump -a -d -O -x mabase > mabase.sql'")
print("-> Excutez ce script apres le script 'create_structure.py' en mode root.")
print("-> (ne tenez compte des avertissement sur clef unique.)")
	
print("-> Version de Postgresql: ")
os.system ("psql -V")

nom_fichier = raw_input("-> Nom de votre fichier SVP ? (ex: arago.sql): ")
print ("   Info : Vous avez choisi de traiter le fichier : "+nom_fichier)

print("-> CONVERTION DU FICHIER AU FORMAT UTF8")
os.system ("iconv -f iso-8859-1 -t utf-8 "+nom_fichier+" > "+nom_fichier+"8")

nom_base = raw_input("-> Nom de votre base SVP ? (ex: arago): ")
print ("   Info : Vous avez choisi d'importer dans la base : "+nom_base)

print("-> IMPORTATION DU FICHIER DANS LA BASE")
os.system ("psql -d "+nom_base+" -U postgres < "+nom_fichier+"8 > /dev/null")

#Maintenance mini sur la nouvelle base
db = database.DataBase(database = nom_base, username = "postgres")
db.query("VACUUM ANALYSE;")
db.query("REINDEX DATABASE "+nom_base+";")
db.query("VACUUM ANALYSE;")
db.query("SET client_encoding = 'UTF8';")


print("-> SUPPRESSION DU FICHIER UF8")
os.system ("rm "+nom_fichier+"8")

print ("-> Apparement REUSSI !")	
print("--------------------------------------------------------------------------")
print ("Vous devriez maintenant lancer le script des mots de passes utilisateur :")
print ("./create_passwords.py")