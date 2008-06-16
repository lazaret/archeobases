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
for ligne in lignes:
        ligne = string.strip(ligne[:-1])
        l = l + 1
        if (ligne != "") and (ligne[:4] != "ffnu") and (ligne[:6] != "------")  :
                champs = string.split(ligne, ",")
                for i in range(0,len(champs)) :
                        champs[i] = string.strip(champs[i])
                        if champs[i] == '-':
                                champs[i] = ''
                        elif champs[i] in ['999','9999.99','999.99']:
                                champs[i] = '0'
                new = []
                new.append(champs[0]) #0  #0 zone
                new.append(champs[1]) #1  #1 numero
                new.append(champs[2]) #2  #2 bis
                new.append('1')        # n_ordre
                new.append(champs[3])  #
                new.append(champs[4])  #
                new.append(champs[5])  #
                new.append(champs[6])  #
                new.append(champs[7])  #
                new.append(champs[8])  #
                new.append(champs[9])  # 
                new.append(champs[10])# 
                new.append(champs[11])# 

                for i in range(0, len(new)) :
                        if i  in [0,2,9,11] :
                                new[i] = db.quote(string.upper(new[i]), "text")
                        elif new[i]!= '-':
                                new[i] = db.quote(new[i], "")
                verify = "select * from nucleus where zone=" + new[0]+ " and numero =" + new[1] + " and bis=" + new[2] + " and n_ordre =1;"                 
                existe = db.query(verify)
                existe = existe.dictresult()

                liste = ["n_cortotal","n_corfacea", "n_corfaceb", "n_dirtotal", "n_dirfacea", "n_dirfaceb","n_formule","n_nbplan", "n_rotation"]
                if not existe :
                        print "erreur: pas de parent ",(string.join(new, ','))
                elif new[0] != 'null' and new[1] != 'null' and new[2] != 'null':        
                        update="UPDATE nucleus SET "
                        for i in range(1, (len(new)-3)):
                                update = update + liste[i] + "=" + new[i+3] + "," 
                        update  = update[:-1] + " WHERE zone = " + new[0] + " AND numero = " + champs[1] +  " AND bis = " + new[2] + ";"
                        db.query(update)
                        print l,update

                else:
                        print "!!!!!!!!!!! ",(string.join(new, ','))

db.query("VACUUM;")


