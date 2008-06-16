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

sys.path.append("../cgi")

import database

db = database.DataBase(database=sys.argv[1], username = "postgres")
cpt=0

lignes = sys.stdin.readlines()
l = 0

for ligne in lignes:
        ligne = string.strip(ligne[:-1])
        l = l + 1
        if (ligne != "") and (ligne[:4] != "ffid") and (ligne[:6] != "------")  :
                champs = string.split(ligne, ",")
                for i in range(0,len(champs)) :
                        champs[i] = string.replace(champs[i], "0.00" , "0")

                        champs[i] = string.strip(champs[i])

                        if champs[i] == '-':

                                champs[i] = ''

                        elif champs[i] in ['999','9999.99','999.99']:

                                champs[i] = '0'

                new_faune = []
                new_eclat     = []              
                if len(champs) == 45:
                        new_faune.append(champs[0])  #0  #0 zone
                        new_faune.append(champs[1])  #1  #1 numero
                        new_faune.append(champs[2])  #2  #2 bis
                        new_faune.append(champs[3])  #3  #3 L
                        new_faune.append(champs[4])  #4  #3 l
                        new_faune.append(champs[5])  #5  #3 e
                        
                        champs[6] = string.replace(champs[6], ".", "") 
                        new_faune.append(champs[6])  #6  #3 poids
                        
                        new_faune.append(champs[7]) #7  #5 oss
                        new_faune.append(champs[8]) #8 
                        new_faune.append(champs[9]) #9 
                        new_faune.append(champs[10]) #10 
                        new_faune.append(champs[11]) #11 
                        new_faune.append(champs[12]) #12
                        new_faune.append(champs[13]) #13
                        new_faune.append(champs[14]) #14 typos1
                        new_faune.append(champs[15]) #15 typos2
                        new_faune.append(champs[16]) #16 typos3
                        new_faune.append(champs[17]) # typos4
                        new_faune.append(champs[18]) #18 typos5
                        new_faune.append(champs[19]) #19 typos6
                        new_faune.append(champs[20]) #20 
                        new_faune.append(champs[21]) #15
                        new_faune.append(champs[22]) #11 
                        new_faune.append(champs[23]) #12 
                        new_faune.append(champs[24]) #13 
                        new_faune.append(champs[25]) #14
                        new_faune.append(champs[26]) #15  
                        new_faune.append(champs[27]) #15 
                        new_faune.append(champs[28]) #17  
                        new_faune.append(champs[29]) #18 
                        new_faune.append(champs[30]) #19 
                       # new_faune.append(champs[31]) #20 
                        new_faune.append(champs[32]) #21
                        new_faune.append(champs[33]) #22
                        new_faune.append(champs[34]) #23
                        new_faune.append(champs[35]) #24
                        new_faune.append(champs[36]) #25 decapage
                        new_faune.append(champs[37]) #26
                        new_faune.append(champs[38]) #27
                        new_faune.append(champs[39]) #28 associe
                        new_faune.append(champs[40]) #29
                        new_faune.append(champs[41]) #30
                        new_faune.append(champs[42]) #31
                        new_faune.append(champs[43]) #32
                        new_faune.append(champs[44]) #33
               
                        for i in range(0, len(new_faune)) :
                                if i  not in [1,3,4,5,6] :
                                        new_faune[i] = db.quote(string.upper(new_faune[i]), "text")
                                elif new_faune[i]!= '-':
                                        new_faune[i] = db.quote(new_faune[i], "")
                        verify = "select * from carnet where zone=" + new_faune[0]+ " and numero =" + new_faune[1] + " and bis=" + new_faune[2] + ";"                 
                        existe = db.query(verify)
                        existe = existe.dictresult()
                        
                        verify2 = "select * from faune where zone=" + new_faune[0]+ " and numero =" + new_faune[1] + " and bis=" + new_faune[2] + ";"                 
                        existe2 = db.query(verify2)
                        existe2 = existe2.dictresult()

                        if  not existe :

                                print "I   => pas de parent: ",(string.join(new_faune, ','))
                                
                        elif existe2:
                                print "I  => doublon: ",(string.join(new_faune, ','))

                        elif new_faune[0] != 'null' and new_faune[1] != 'null' and new_faune[2] != 'null':        
                                insert="INSERT INTO faune (zone, numero, bis, f_longueur, f_largeur, f_epaisseur, f_poids, f_ancien_oss,f_ordre, f_famille, f_ssfamille, f_genre, f_espece, f_ssespece, f_typos1,f_typos2, f_typos3,  f_typos4, f_typos5, f_typos6, f_lateralite, f_fragde, f_typedos, f_caltype, f_calcouleur, f_sexe, f_coraspect, f_corfissure, f_trace, f_concretion, f_tissu, f_datation, f_photo, f_dessin, f_agest, f_traitement, f_restauration, f_oxyde, f_association,f_taille, f_pathologie, f_moulage, f_conservation, f_couleur) VALUES ("
                                insert = insert+string.join(new_faune, ', ')
                                insert = insert + ");"
                                try:
                                        db.query(insert)
                                except:
                                        print ("probleme ligne", insert)
                                print(insert)

                                cpt=cpt +1
                else:       
                        print ("probleme champs", champs[0], " ",champs[1], " ",champs[2])
                        
print(cpt, "faunes inserees")

