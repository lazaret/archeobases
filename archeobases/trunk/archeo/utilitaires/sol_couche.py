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

""" Injection de sols dans la base à partir des zones et couches uniquement pour les numéros R.

Le fichier à traiter doit être de la forme zone,couche,sol
pour les fichier csv, penser à retirer les guilemets.

Les fichiers doivent être placé temporairement dans /home/bases/cgi-bin/archeo
Usage : ./sol_couche.py nom_de_la_base < fichier.txt
Exemple : ./sol_couche.py Le_Lazaret < sols.csv
Pour obtenir le résustat de l'execution dans un fichier : ./sol_couche.py Le_Lazaret < sols.csv > resultat.txt
"""

import sys
import string
import database

sys.path.append("../cgi")
db = database.DataBase(database=sys.argv[1], username="postgres")
lignes = sys.stdin.readlines()

for ligne in lignes:
    ligne = string.strip(ligne[:-1])
    champs = string.split(ligne, ",")
    for i in range(0, len(champs)):
        champs[i] = db.quote(string.upper(champs[i]), "text")
    update = "UPDATE carnet SET sol = " + champs[2] + " WHERE zone = " + champs[0] + " AND couche = " + champs[1] + " AND bis like 'R%';"
    print update
    try:
        db.query(update)
    except:
        print ("probleme ligne", update)























