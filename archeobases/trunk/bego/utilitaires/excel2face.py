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
        new_face = []
        new_face.append(champs[0]) #zone
        new_face.append(champs[1]) #groupe
        new_face.append(champs[2]) #roche
        new_face.append(champs[3]) #face
        new_face.append(champs[4]) #type
        new_face.append(champs[5]) #forme
        if champs[6] == "": #longueur
            new_face.append("NULL")
        else:
            new_face.append(champs[6])
        if champs[7] == "": #largeur
            new_face.append("NULL")
        else:
            new_face.append(champs[7])
        new_face.append(champs[8]) #couleur
        new_face.append(champs[9]) #aspect
        if champs[10] == "t": #trou
            new_face.append("TRUE")
        else:
            new_face.append("FALSE")
        new_face.append(champs[11]) #erosion
        new_face.append(champs[12]) #desquamation
        new_face.append(champs[13]) #direction
        new_face.append(champs[14]) #contour
        if champs[15] == "": #inclinaison
            new_face.append("NULL")
        else:
            new_face.append(champs[15])
        new_face.append(champs[16]) #orientation
        for i in range(0, len(new_face)):
            if i in [0, 1, 6, 7, 10, 15]:
                pass
            else:
                new_face[i] = db.quote((new_face[i]), "text")

        verify = "SELECT * FROM face WHERE zone ="+new_face[0]+" AND groupe ="+new_face[1]+" \
                 AND roche ="+new_face[2]+" AND face="+new_face[3]+";"
        existe = db.query(verify)
        existe = existe.dictresult()
        if existe:
            insert_face = "UPDATE face SET zone ="+new_face[0]+", groupe ="+new_face[1]+", roche ="+new_face[2]+", \
                            face ="+new_face[3]+", type ="+new_face[4]+", forme="+new_face[5]+", \
                            longueur ="+new_face[6]+", largeur ="+new_face[7]+", couleur ="+new_face[8]+", \
                            aspect ="+new_face[9]+", trou ="+new_face[10]+", erosion ="+new_face[11]+", \
                            desquamation ="+new_face[12]+", direction ="+new_face[13]+", contour ="+new_face[14]+", \
                            inclinaison ="+new_face[15]+", orientation ="+new_face[16]+", modif=TRUE WHERE (zone ="+new_face[0]+" \
                            AND groupe ="+new_face[1]+" AND roche ="+new_face[2]+" AND face ="+new_face[3]+");"
        else:
            insert_face = "INSERT INTO face (zone, groupe, roche, face, type, forme, longueur, largeur, couleur, \
                           aspect, trou, erosion, desquamation, direction, contour, inclinaison, orientation) VALUES ("
            insert_face = insert_face+string.join(new_face, ", ")
            insert_face = insert_face + ");"
        try:
            db.query(insert_face)
            print ("OK : roche "+champs[2]+" | face "+champs[3])
        except:
            print ("Problem : " + insert_face)


