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

""" Injection de sols dans la base à partir des objets.

Le fichier à traiter doit être de la forme zone,numero,bis,sol
pour les fichier csv, penser à retirer les guilemets.

Les fichiers doivent être placé temporairement dans /home/bases/cgi-bin/archeo
Usage : ./reinjecte_sol.py nom_de_la_base < fichier.txt
Exemple : ./reinjecte_sol.py Le_Lazaret < sols.csv
Pour obtenir le résustat de l'execution dans un fichier : ./reinjecte_sol.py Le_Lazaret < sols.csv > resultat.txt
"""

import sys
import string
import database


sys.path.append("../cgi")
db = database.DataBase(database=sys.argv[1], username="postgres")
lignes = sys.stdin.readlines()
l = 0

for ligne in lignes:
    ligne = string.strip(ligne[:-1])
    l = l + 1
    if (ligne != ""):
        champs = string.split(ligne, ",")
        for i in range(0, len(champs)):
            champs[i] = string.strip(champs[i])
        new = []
        new.append(champs[0])  # zone
        new.append(champs[1])  # numero
        new.append(champs[2])  # bis
        new.append(champs[3])  # sol
        for i in range(0, len(new)) :
            if i  in [0, 2, 3] :
                new[i] = db.quote(string.upper(new[i]), "text")
        verify = "SELECT * FROM carnet WHERE zone=" + new[0]+ " AND numero =" + new[1] + " AND bis =" + new[2] + ";"
        existe = db.query(verify)
        existe = existe.dictresult()
        if not existe :
            print ("Pas d'objet: ", (string.join(new, ',')))
        else:
            where = " WHERE zone=" + new[0] + " AND numero=" + new[1] + " AND bis=" + new[2] + ";"
            update = "UPDATE carnet SET sol = " + new[3] + where
            print(update)
            try:
                db.query(update)
            except:
                print ("pb update: ", (string.join(new, ",")))












