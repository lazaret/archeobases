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


lignes = sys.stdin.readlines()
l = 0
cpt = 0
for ligne in lignes:
        ligne = string.strip(ligne[:-1])
        l = l + 1
        if (ligne != "") and (ligne[:4] != "ftob") and (ligne[:6] != "------")  :
                champs = string.split(ligne, ",")
		
                for i in range(0,len(champs)) :
			champs[i] = string.replace(champs[i], "0.00" , "0")
                        champs[i] = string.strip(champs[i])
                        if champs[i] == '-':
                                champs[i] = ''
                        elif champs[i] in ['999','9999.99','999.99']:
                                champs[i] = '0'
                new_trace = []

                new_trace.append(champs[0])  #0  #0 zone
                new_trace.append(champs[1])  #1  #1 numero
                new_trace.append(champs[2])  #2  #2 bis
                new_trace.append(champs[3])  #3  #3 ensemble
                new_trace.append(champs[4])  #ensemble
		new_trace.append(champs[5])  #nature
		new_trace.append(champs[6])  #origine
		new_trace.append(champs[7])  #localisation
		new_trace.append(champs[8])  #position
		new_trace.append(champs[9])  #nombre
		new_trace.append(champs[10]) #longueur
		new_trace.append(champs[11]) #classe
		new_trace.append(champs[12]) #largeur
		new_trace.append(champs[13]) #profondeur
		new_trace.append(champs[14]) #locmusc
		new_trace.append(champs[15]) #direction
		new_trace.append(champs[16]) #sens
		new_trace.append(champs[17]) #dessin
		new_trace.append(champs[18]) #replique
		
                for i in range(0, len(new_trace)) :
                        if i  in [1,8] :
                                new_trace[i] = db.quote(string.upper(new_trace[i]), "text")
                        elif new_trace[i]!= '-':
                                new_trace[i] = db.quote(new_trace[i], "")
                verify = "select * from faune where zone=" + new_trace[0]+ " and numero =" + new_trace[1] + " and bis=" + new_trace[2] + ";"                 
                existe = db.query(verify)
                existe = existe.dictresult()
                verify2 = "select * from trace where zone=" + new_trace[0]+ " and numero =" + new_trace[1] + " and bis=" + new_trace[2] + " and t_ensemble=" + new_trace[3] + ";"                 
                existe2 = db.query(verify2)
                existe2 = existe2.dictresult()
                if  not existe :
                        print "I   => pas de parent: ",(string.join(new_trace, ','))
		elif existe2:
                        print "I  => doublon: ",(string.join(new_trace, ','))
                elif new_trace[0] != 'null' and new_trace[1] != 'null' and new_trace[2] != 'null' and new_trace[3] != 'null':        

                        insert="INSERT INTO trace (zone, numero, bis,t_ensemble,t_nature,t_agent, t_localisation,t_position, t_nombre,t_longueur,t_classe,t_largeur,t_profondeur,t_allure,t_locmusc,t_direction, t_sens,t_dessin, t_replique) VALUES ("
                        insert = insert+string.join(new_trace, ', ')
                	insert = insert + ");"
                	db.query(insert)
			cpt = cpt + 1


db.query("VACUUM;")


