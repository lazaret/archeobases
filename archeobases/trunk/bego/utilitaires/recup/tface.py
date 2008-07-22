#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Mont Bego - (c) 1999-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
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
db = database.DataBase(database="bego", username="bego")
lignes = sys.stdin.readlines()
l = 0

for ligne in lignes:
    ligne = string.strip(ligne[:-1])
    l = l + 1
    if (ligne != "") and (ligne[:6] != "fclero") and (ligne[:6] != "------") :
        champs = string.split(ligne, ";")
        for i in range(0, len(champs)):
            champs[i] = string.strip(champs[i])
        nouveaux = []
        nouveaux.append(champs[0]) #z
        nouveaux.append(champs[1]) #g
        if champs[2] in ("-", "--", "---"): #r
            nouveaux.append(champs[3])
        else:
            nouveaux.append(champs[3]+champs[2])
        nouveaux.append(string.lower(champs[4])) #f
        champs[8] = string.upper(champs[8])
        if champs[8] in ('-D', 'CH', 'D', 'DA', 'DD', 'DL'):
            nouveaux.append('D') #type
        elif champs[8] in ['0']:
            nouveaux.append('O') #type
        elif champs[8] in ['PA']:
            nouveaux.append('P') #type
        elif champs[8] in ['B', 'GB', 'BL']:
            nouveaux.append('B') #type
        else:
            nouveaux.append('')
        nouveaux.append(champs[10]) #longueur
        nouveaux.append(champs[9])  #largeur
        ################################################COULEUR
        champs[11] = string.upper(champs[11])
        if champs[11] in ('B', 'BL'):
            nouveaux.append('B') #couleur
        elif champs[11] in ('G', 'GR'):
            nouveaux.append('G') #couleur
        elif champs[11] in ('0', 'BO', 'O', 'OB', 'OR', 'OVE', 'RO', 'ROG', 'ROS', 'VEO', 'VIO'):
            nouveaux.append('O') #couleur
        elif champs[11] in ('R', 'RG', 'RVI', 'VIR', 'VRO'):
            nouveaux.append('R') #couleur
        elif champs[11] in ('VE',):
            nouveaux.append('VE') #couleur
        elif champs[11] in ('VI', 'VIB'):
            nouveaux.append('VI') #couleur
        elif champs[11] in ('BGO', 'GO', 'GOR', 'OG', 'OGV'):
            nouveaux.append('GO') #couleur
        elif champs[11] in ('GV', 'GVE', 'GVI', 'VEG'):
            nouveaux.append('GVE') #couleur
        elif champs[11] in ('GRO', 'GRV'):
            nouveaux.append('GR') #couleur
        elif champs[11] in ('GVI', 'VIG'):
            nouveaux.append('GVI') #couleur
        else:
            nouveaux.append('')
        ########################### ASPECT
        champs[12] = string.upper(champs[12])
        if champs[12] in ('L',):
            nouveaux.append('L') #aspect
        elif champs[12] in ('R',):
            nouveaux.append('R') #aspect
        elif champs[12] in ('ER',):
            nouveaux.append('ER') #aspect
        elif champs[12] in ('RER',):
            nouveaux.append('RER') #aspect
        elif champs[12] in ('LRE',):
            nouveaux.append('LRER') #aspect
        elif champs[12] in ('LER', 'ERL'):
            nouveaux.append('LER') #aspect
        elif champs[12] in ('LR',):
            nouveaux.append('LR') #aspect
        else:
            nouveaux.append('')
        ####################### DIRECTION
        champs[6] = string.upper(champs[6])
        if champs[6] in ('E', 'EO', 'EW', 'N100', 'N120', 'N70', 'N80', 'N90', 'O', 'W', 'WSW'):
            nouveaux.append('EW')  #direction
        elif champs[6] in ('ES', 'ESE', 'N135', 'N140', 'NW', 'NWSE', 'NO', 'SE', 'SSE', 'WNW'):
            nouveaux.append('NWSE')  #direction
        elif champs[6] in ('30', 'EN', 'ENE', 'N40', 'NE', 'NESW', 'SSO', 'SO', 'SSW', 'SW', 'WS'):
            nouveaux.append('NESW')  #direction
        elif champs[6] in ('160N', 'N', 'N20', 'NNE', 'NNW', 'NS', 'S', 'SN', 'SSSS'):
            nouveaux.append('NS')  #direction
        elif champs[6] in ('0', 'DA-H', 'H', 'IND'):
            nouveaux.append('IND')  #direction
        else:
            nouveaux.append('')
        nouveaux.append(champs[7])        #inclinaison
        ######################## ORIENTATION
        champs[5] = string.upper(champs[5])
        if champs[5] in ('0',):
            nouveaux.append('IND')  #orientation
        elif champs[5] in ('10E', '10N', '10NS', '16W', '20E', '20EW', '20N', '20NE', '20NW', '20SW', '20W', '25N', '25W', '5E', '5W', '7E', 'N', 'N10', 'N10E', 'N10W', 'N15', 'N15E', 'N15W', 'N18', 'N20', 'N20E', 'N20W', 'N23E', 'N24W', 'N25', 'N25E', 'N30', 'N30E', 'N30W', 'NE10', 'NNS', 'NS', 'NS10', 'S10W'):
            nouveaux.append('N')  #orientation
        elif champs[5] in ('30E', '30N', '30NW', '30O', '30S', '30SE', '30SW', '30W', '32NW', '34E', '34NW', '35E', '40E', '40N', '40NE', '40S', '40SE', '40W', '45E', '45N', '45NE', '45W', '48E', '40E', '50E', '50N', '50NE', '50W', '52E', '52W', '55E', '60', '60E', '60N', '60NE', '60S', '60W', '65E', '65N', '65NE', '68N', 'ENE', 'ENES', 'N40', 'N40E', 'N40W', 'N45', 'N45E', 'N48E', 'N50', 'N50E', 'N55', 'N60', 'N60E', 'N60S', 'N60W', 'N65', 'N70', 'N70E', 'N75', 'N75E', 'NE', 'NESN', 'NESO', 'NESW', 'NNE', 'NNES', 'S38E', 'S40W'):
            nouveaux.append('NE')  #orientation
        elif champs[5] in ('100E', '100N', '102E', '105E', '105N', '110E', '114E', '70E', '70N', '70S', '70W', '75E', '75N', '80E', '80N', '80NE', '80NW', '80S', '80W', '85E', '85N', '90E', '90N', '90W', '95E', '95N', 'E', 'N100', 'N110', 'N80', 'N80E', 'N80W', 'N85', 'N86E', 'N89E', 'N90', 'N90E', 'N95'):
            nouveaux.append('E')  #orientation
        elif champs[5] in ('115N', '120E', '120N', '120S', '120W', '125N', '12W', '130E', '130N', '130S', '135N', '140E', '140N', '140W', '145N', '150E', '150N', '150W', '15E', '15N', '15SW', '15W', 'ESE', 'N120', 'N130', 'N135', 'N140', 'SE', 'NNSE', 'SENO', 'SENW'):
            nouveaux.append('SE')  #orientation
        elif champs[5] in ('160E', '160N', '170N', '210N', 'N160', 'N170', 'N175', 'N180', 'N185', 'N190', 'S', 'SN'):
            nouveaux.append('S')  #orientation
        elif champs[5] in ('110N', '110S', '250S', 'ESW', 'SSE', 'SW', 'SSW', 'SWNE'):
            nouveaux.append('SW')  #orientation
        elif champs[5] in ('10W', '280N', '290N', 'EW', 'EO', 'WS', 'W', 'W10', 'WE', 'OE'):
            nouveaux.append('W')  #orientation
        elif champs[5] in ('10NW', '300N', '350N', 'NNW', 'NNWS', 'NW', 'NWES', 'NWSE', 'WNW'):
            nouveaux.append('NW')  #orientation
        else:
            nouveaux.append('')
        for i in range(0, len(nouveaux)):
            if i not in (0, 1, 5, 6, 14):
                nouveaux[i] = db.quote(nouveaux[i], "text")
        insert = "INSERT INTO face (zone, groupe, roche, face, type, longueur, largeur, couleur, aspect, direction, inclinaison, orientation) VALUES ("
        insert = insert+string.join(nouveaux, ', ')
        insert = insert +");"
        print l, insert
        db.query(insert)
db.query("VACUUM;")

