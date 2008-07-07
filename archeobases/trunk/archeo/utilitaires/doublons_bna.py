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


########################################################################
# ce programme permet:
#          * de ne garder que la premiere et la derniere ligne d'une serie
#            ou la deuxieme colone de droite (z) est la meme
#          * de garder intacte les deux premier colone de la ligne ou la
#            zone apparait
#          * de faire la somme du total de lignes dans la troisieme colone
#            de la zone
########################################################################

import sys
import string


sys.path.append("../cgi")
x = z = cpt = z_prec = 0
ligne_prec = ""
lignes = sys.stdin.readlines()

for ligne in lignes:
    ligne = string.strip(ligne[:-1])
    if (ligne != ""):
        if (ligne[:1] == "\""):
            if (ligne_prec !=""):
                print ligne_prec
                ligne_prec = ""
                z_prec = 0
        print ligne
    else:
        champs = ligne.split(',')
        x = champs[0]
        z = champs[1]
        if (z == z_prec):
            ligne_prec = ligne
        else:
            if (ligne_prec != "" ):
                print ligne_prec
            ligne_prec = ""
            print ligne
            z_prec = z
            cpt = cpt +1
print ligne_prec
