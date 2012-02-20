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
# ./excel2face.py database < face.csv > repport.txt

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
        new_figure = []
        new_figure.append(champs[0]) #zone
        new_figure.append(champs[1]) #groupe
        new_figure.append(champs[2]) #roche
        new_figure.append(champs[3]) #face
        new_figure.append(champs[4]) #figure
        new_figure.append(champs[5]) #carre
        new_figure.append(champs[6]) #identite
        new_figure.append(champs[7]) #signe
        new_figure.append(champs[8]) #style
        if champs[9] == "": #longueur
            new_figure.append("NULL")
        else:
            new_figure.append(champs[9])
        if champs[10] == "": #largeur
            new_figure.append("NULL")
        else:
            new_figure.append(champs[10])
        new_figure.append(champs[11]) #cardinale
        new_figure.append(champs[12]) #qualite
        new_figure.append(champs[13]) #contour
        new_figure.append(champs[14]) #debord
        new_figure.append(champs[15]) #profil
        new_figure.append(champs[16]) #strie
        new_figure.append(champs[17]) #alignement
        new_figure.append(champs[18]) #surface
        new_figure.append(champs[19]) #bavure
        new_figure.append(champs[20]) #perif
        new_figure.append(champs[21]) #raclage
        new_figure.append(champs[22]) #forme
        new_figure.append(champs[23]) #profondeur
        new_figure.append(champs[24]) #taille
        new_figure.append(champs[25]) #disposition
        new_figure.append(champs[26]) #description
        new_figure.append(champs[27]) #conti
        for i in range(0, len(new_figure)):
            if i in [0, 1, 9, 10]:
                pass
            else:
                new_figure[i] = db.quote((new_figure[i]), "text")

        verify = "SELECT * FROM figure WHERE zone ="+new_figure[0]+" AND groupe ="+new_figure[1]+" \
                 AND roche ="+new_figure[2]+" AND face="+new_figure[3]+" AND figure="+new_figure[4]+";"
        existe = db.query(verify)
        existe = existe.dictresult()
        if existe:
            insert_figure = "UPDATE figure SET zone ="+new_figure[0]+", groupe ="+new_figure[1]+", roche ="+new_figure[2]+", \
                            face ="+new_figure[3]+", figure ="+new_figure[4]+", carre="+new_figure[5]+", \
                            identite ="+new_figure[6]+", signe ="+new_figure[7]+", style ="+new_figure[8]+", \
                            longueur ="+new_figure[9]+", largeur ="+new_figure[10]+", cardinale ="+new_figure[11]+", \
                            qualite ="+new_figure[12]+", contour ="+new_figure[13]+", debord ="+new_figure[14]+", \
                            profil ="+new_figure[15]+", strie ="+new_figure[16]+", alignement ="+new_figure[17]+", \
                            surface ="+new_figure[18]+", bavure ="+new_figure[19]+", perif ="+new_figure[20]+", \
                            raclage ="+new_figure[21]+", forme ="+new_figure[22]+", profondeur ="+new_figure[23]+", \
                            taille ="+new_figure[24]+", disposition ="+new_figure[25]+", description ="+new_figure[26]+", \
                            conti ="+new_figure[27]+", modif=TRUE WHERE (zone ="+new_figure[0]+" AND groupe ="+new_figure[1]+"\
                            AND roche ="+new_figure[2]+" AND face ="+new_figure[3]+" AND figure="+new_figure[4]+");"
        else:
            insert_figure = "INSERT INTO figure (zone, groupe, roche, face, figure, carre, identite, signe, style, \
                           longueur, largeur, cardinale, qualite, contour, debord, profil, strie, alignement, \
                           surface, bavure, perif, raclage, forme, profondeur, taille, disposition, description, conti) VALUES ("
            insert_figure = insert_figure+string.join(new_figure, ", ")
            insert_figure = insert_figure + ");"
        try:
            db.query(insert_figure)
            print ("OK : roche "+champs[2]+" | face "+champs[3]+" | figure "+champs[4])
        except:
            print ("Problem : " + insert_figure)


###TODO changement de faces ? 1 seul numero de figure par roche ?
###QUID des faces non modifiées ? A suuprimer ?
