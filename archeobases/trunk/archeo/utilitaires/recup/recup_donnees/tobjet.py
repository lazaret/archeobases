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

import sys
import string
import database
sys.path.append("../cgi")


db = database.DataBase(database=sys.argv[1], username = "postgres")
cpt = 0
lignes = sys.stdin.readlines()
l = 0
for ligne in lignes:
    ligne = string.strip(ligne[:-1])
    l = l + 1
    if (ligne != "") and (ligne[:4] != "zone") and (ligne[:6] != "------")  :
        champs = string.split(ligne, ",")
        for i in range(0, len(champs)) :
            champs[i] = string.strip(champs[i])
            if champs[i] == '-':
                champs[i] = ''
            elif champs[i] in ['999', '9999.99', '999.99']:
                champs[i] = '0'
        nouveaux = []
        titi = champs[0]
        if champs[0] in ['1/8', '1Q', '3-25', '3435', '3A', '5224', 'I4', 'est', 'G3', 'I2', 'ISF', 'N']:
            champs[0] = ''
        else:
            if titi[1:] == 'Q':
                champs[1] = titi[1:]
            if champs[0] == 'ND':
                champs[0] = 'IND'
        nouveaux.append(champs[0]) #0  #0 zone
        nouveaux.append(champs[1]) #1  #1 numero)
        nouveaux.append(champs[2]) #2  #2 bis
        nouveaux.append(champs[3]) #3  #3 locus
        nouveaux.append(champs[4]) #9  #10 couche
        nouveaux.append(champs[5]) #10 #12 nature
        nouveaux.append(champs[6]) #8  #9 sol
        nouveaux.append(champs[7]) #11 #16 x
        nouveaux.append(champs[8]) #12 #17 y
        nouveaux.append(champs[9]) #13 #18 zrela
        nouveaux.append(champs[10])#15 #20 zref
        nouveaux.append(champs[11])#14 #19 zabs
        nouveaux.append(champs[12])#16 #21 orientation
        nouveaux.append(champs[13])#17 #22 pendage
        nouveaux.append(champs[14])#18 #23 vers
        nouveaux.append(champs[15])#19 #24 longueur
        nouveaux.append(champs[16])#20 #25 largeur
        nouveaux.append(champs[17])#21 #26 ep
        date = champs[18]
        jour = date[:2]
        mois = date[3:5]
        an   = date[6:10]
        datetrouve = an + '-' + mois + '-' + jour
        if datetrouve == '****-**-**':
            datetrouve = 'null'
        nouveaux.append(datetrouve)# #27 trouve
        nouveaux.append(champs[19])#6  #7 ensemble
        nouveaux.append(champs[20])#7  #8 niveau
        nouveaux.append(champs[21])#4  #5 carre
        nouveaux.append(champs[22])#5  #6 souscarre
        for i in range(0, len(nouveaux)) :
            if i  in [0, 2, 3, 4, 5, 6, 12, 13, 14, 19, 20, 21, 22] :
                nouveaux[i] = db.quote(string.upper(nouveaux[i]), "text")
            elif i in [18] and nouveaux[i]!= 'null':
                nouveaux[i] = db.quote(nouveaux[i], "date")
        verify = "select * from carnet where zone=" + nouveaux[0]+ " and numero =" + nouveaux[1] + " and bis=" + nouveaux[2] + ";"
        existe = db.query(verify)
        existe = existe.dictresult()
        if existe :
            tata = ''
            try:
                print "erreur: ", (string.join(nouveaux, ','))
            except:
                print ("probleme ligne", nouveaux[0], " ",  nouveaux[1], " ", nouveaux[2])
        elif nouveaux[0] != 'null' and nouveaux[1] != 'null' and nouveaux[2] != 'null':
            insert = "INSERT INTO carnet (zone, numero, bis,locus,couche,nature,sol,x, y, zrelatif,zreference,zabsolu,orientation,pendage,vers,longueur,largeur,epaisseur,trouve, ensemble, niveau,carre,souscarre) VALUES ("
            insert = insert+string.join(nouveaux, ', ')
            insert = insert + ");"
            try:
                db.query(insert)
            except:
                print("probleme avec :", insert)
            cpt = cpt+1

