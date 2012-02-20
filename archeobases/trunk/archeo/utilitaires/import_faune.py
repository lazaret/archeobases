#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Archeo - (c) 2006-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#

# usage:
# ./import_faune.py database < carnet.csv > repport.txt
# The faune.csv file must values separated by `;`
# and related objets must existe before in the `carnet` table

import sys
import string
import database


sys.path.append("../cgi")
db = database.DataBase(database=sys.argv[1], username = "postgres")
lignes = sys.stdin.readlines()
l = 0

for ligne in lignes:
    ligne = string.strip(ligne[:-1])
    l = l + 1
    if (ligne != ""):
        champs = string.split(ligne, ";")
        for i in range(0, len(champs)):
            champs[i] = string.strip(champs[i])
        new_faune = []
        new_faune.append(champs[0]) #zone
        new_faune.append(champs[1]) #numero
        new_faune.append(champs[2]) #bis
        if champs[3] == "": #f_longueur
            new_faune.append("NULL")
        else:
            new_faune.append(champs[3])
        if champs[4] == "": #f_largeur
            new_faune.append("NULL")
        else:
            new_faune.append(champs[4])
        if champs[5] == "": #f_epaisseur
            new_faune.append("NULL")
        else:
            new_faune.append(champs[5])
        if champs[6] == "": #f_poids
            new_faune.append("NULL")
        else:
            new_faune.append(champs[6])
        new_faune.append(champs[7])  #f_classe
        new_faune.append(champs[8])  #f_ordre
        new_faune.append(champs[9])  #f_famille
        new_faune.append(champs[10]) #f_ssfamille
        new_faune.append(champs[11]) #f_affgenre
        new_faune.append(champs[12]) #f_genre
        new_faune.append(champs[13]) #f_affespece
        new_faune.append(champs[14]) #f_espece
        new_faune.append(champs[15]) #f_ssespece
        new_faune.append(champs[16]) #f_typos1
        new_faune.append(champs[17]) #f_typos2
        new_faune.append(champs[18]) #f_typos3
        new_faune.append(champs[19]) #f_typos4
        new_faune.append(champs[20]) #f_typos5
        new_faune.append(champs[21]) #f_typos6
        new_faune.append(champs[22]) #f_lateralite
        new_faune.append(champs[23]) #f_sexe
        new_faune.append(champs[24]) #f_agecl
        new_faune.append(champs[25]) #f_agest
        new_faune.append(champs[26]) #f_stserie
        new_faune.append(champs[27]) #f_stdent
        new_faune.append(champs[28]) #f_taille
        if champs[29] == "": #f_association
            new_faune.append("NULL")
        else:
            new_faune.append(champs[29])
        new_faune.append(champs[30]) #f_pathologie
        new_faune.append(champs[31]) #f_description
        new_faune.append(champs[32]) #f_fragge
        new_faune.append(champs[33]) #f_fragde
        new_faune.append(champs[34]) #f_sauvefrag
        new_faune.append(champs[35]) #f_couleur
        new_faune.append(champs[36]) #f_caltype
        new_faune.append(champs[37]) #f_calcouleur
        new_faune.append(champs[38]) #f_concretion
        new_faune.append(champs[39]) #f_oxyde
        new_faune.append(champs[40]) #f_coraspect
        new_faune.append(champs[41]) #f_corfissure
        new_faune.append(champs[42]) #f_trace
        new_faune.append(champs[43]) #f_tissu
        for i in range(0, len(new_faune)):
            if i in [1, 3, 4, 5, 6, 29]:
                pass
            else:
                new_faune[i] = db.quote((new_faune[i]), "text")

        verify = "SELECT * FROM faune WHERE zone ="+new_faune[0]+" AND numero ="+new_faune[1]+" AND bis ="+new_faune[2]+";"
        existe = db.query(verify)
        existe = existe.dictresult()
        if existe:
            print ("Enregistrement existant : "+new_faune[0]+" "+new_faune[1]+" "+new_faune[2])
        else:
            insert_faune = "INSERT INTO faune (zone, numero, bis, f_longueur, f_largeur, f_epaisseur, f_poids, \
                            f_classe, f_ordre, f_famille, f_ssfamille, f_affgenre, f_genre, f_affespece, f_espece, \
                            f_ssespece, f_typos1, f_typos2, f_typos3, f_typos4, f_typos5, f_typos6, f_lateralite, \
                            f_sexe, f_agecl, f_agest, f_stserie, f_stdent, f_taille, f_association, f_pathologie, \
                            f_description, f_fragge, f_fragde, f_sauvefrag, f_couleur, f_caltype, f_calcouleur, \
                            f_concretion, f_oxyde, f_coraspect, f_corfissure, f_trace, f_tissu) VALUES ("
            insert_faune = insert_faune+string.join(new_faune, ", ")
            insert_faune = insert_faune + ");"
            try:
                db.query(insert_faune)
                print ("OK : " +new_faune[0]+" "+new_faune[1]+" "+new_faune[2])
            except:
                print ("Problem : " + insert_faune)


