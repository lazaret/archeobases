#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Archeo - (c) 2003-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#

#       RECUPERE LES DONNEES DE L'ANCIENNE BASE

import os
import sys
import string
import database
sys.path.append("../cgi")


nom_base = raw_input('Nom de la nouvelle base:')
# RECUPERATION DU CONTENU DE LA BASE
#===================================
print("RECUPERATION DES ANCIENNES DONNEES")
print("les enregistrements posant probleme seront envoyes dans les fichiers nomtable.erreur")

################## CARNET ################
print ("RECUPERATION DE ROBJET EN COURS")
os.system ("./prog_recup/tobjet.py %s < ./donnees/robjet.txt > ./erreurs/robjet.erreur"%nom_base)
print("RECUPERATION DE ROBJET TERMINEE")

################## FAUNE #################
print("RECUPERATION DE RFAUNE EN COURS")
os.system ("./prog_recup/tfaune.py %s  ./donnees/rfaune.txt > ./erreurs/rfaune.erreur"%nom_base)
print("RECUPERATION DE RFAUNE TERMINEE")


print("RECUPERATION DE RMESURE EN COURS")
print("RECUPERATION DE RMESURE DES OS TERMINEE")


print("RECUPERATION DES RTRACE SUR OS EN COURS")
os.system ("./prog_recup/ttrace.py %s < ./donnees/rtrace.txt > ./erreurs/rtrace.erreur"%nom_base)
print("RECUPERATION DES RTRACE SUR OS TERMINEE")


################ INDUSTRIE ################
print("RECUPERATION DE ROUTIL EN COURS")
os.system ("./prog_recup/toutil.py %s < ./donnees/routil.txt > ./erreurs/routil.erreur"%nom_base)
print("RECUPERATION DE ROUTIL TERMINEE")

print("RECUPERATION DE RSIMPLE EN COURS")
os.system ("./prog_recup/tsimple.py %s < ./donnees/rsimple.txt > ./erreurs/rsimple.erreur"%nom_base)
print("RECUPERATION DE RSIMPLE TERMINEE")

print("RECUPERATION DE RFRACTUR EN COURS")
os.system ("./prog_recup/tfracture.py %s < ./donnees/rfractur.txt > ./erreurs/rfractur.erreur"%nom_base)
print("RECUPERATION DE RFRACTUR TERMINEE")

print("RECUPERATION DE RRETOUCH EN COURS")
os.system ("./prog_recup/tretouche.py %s < ./donnees/rretouch.txt > ./erreurs/rretouch.erreur"%nom_base)
print("RECUPERATION DE RRETOUCH TERMINEE")

print("RECUPERATION DE RSTIGMAT EN COURS")
os.system ("./prog_recup/tstigmat.py %s < ./donnees/rstigmat.txt > ./erreurs/rstigmat.erreur"%nom_base)
print("RECUPERATION DE RSTIGMAT TERMINEE")

print("RECUPERATION DE REXTREMI EN COURS")
os.system ("./prog_recup/textremi.py %s < ./donnees/rextremi.txt > ./erreurs/rextremi.erreur"%nom_base)
print("RECUPERATION DE REXTREMI TERMINEE")

print("RECUPERATION DE RGALET EN COURS")
os.system ("./prog_recup/tgalet.py %s < ./donnees/rgalet.txt > ./erreurs/rgalet.erreur"%nom_base)
print("RECUPERATION DE RGALET TERMINEE")

print("RECUPERATION DE RNUCLEUS EN COURS")
os.system ("./prog_recup/tnucleus.py %s < ./donnees/rnucleus.txt > ./erreurs/rnucleus.erreur"%nom_base)
print("RECUPERATION DE RNUCLEUS TERMINEE")
print("RECUPERATION DE RDIMENS EN COURS")
os.system ("./prog_recup/tdimens.py %s < ./donnees/rdimens.txt > ./erreurs/rdimens.erreur"%nom_base)
print("RECUPERATION DE RDIMENS TERMINEE")

print("RECUPERATION DE RDIMENS2 EN COURS")
os.system ("./prog_recup/tdimens2.py %s < ./donnees/rdimens2.txt > ./erreurs/rdimens2.erreur"%nom_base)
print("RECUPERATION DE RDIMENS2 TERMINEE")
 
db = database.DataBase(database=nom_base, username = "postgres")
db.query("UPDATE carnet SET zabsolu = zrelatif + zreference;")
