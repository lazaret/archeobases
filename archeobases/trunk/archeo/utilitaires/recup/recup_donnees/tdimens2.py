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


db = database.DataBase(database=sys.argv[1], username="postgres")
lignes = sys.stdin.readlines()
l = 0
for ligne in lignes:
    ligne = string.strip(ligne[:-1])
    l = l + 1
    if (ligne != "") and (ligne[:4] != "gidi") and (ligne[:6] != "------") :
        champs = string.split(ligne, ",")
        for i in range(0, len(champs)):
            champs[i] = string.strip(champs[i])
            if champs[i] == '-':
                champs[i] = ''
            elif champs[i] in ['999','9999.99','999.99']:
                champs[i] = '0'
        new = []
        new.append(champs[0])  #0 zone
        new.append(champs[1])  #1 numero
        new.append(champs[2])  #2 bis
        new.append(champs[3])  #3 ordre
        new.append(champs[4])  #4a
        new.append(champs[5])  #5 b
        new.append(champs[6])  #6 c
        new.append(champs[7])  #7 d
        new.append(champs[8])  #8 e
        new.append(champs[9]) #9 f
        new.append(champs[10]) #g
        new.append(champs[11]) #h
        new.append(champs[12]) #i
        new.append(champs[13]) #j
        new.append(champs[14]) #k
        new.append(champs[15]) #l
        new.append(champs[16]) #m
        new.append(champs[17]) #na
        new.append(champs[18]) #nb
        new.append(champs[19]) #o
        new.append(champs[20]) #p
        new.append(champs[21]) #q
        new.append(champs[22]) #qq
        new.append(champs[23]) #r
        new.append(champs[24]) #rg
        new.append(champs[25]) #rd
        new.append(champs[26]) #rr
        new.append(champs[27]) #s
        new.append(champs[28]) #t
        new.append(champs[29]) #u
        new.append(champs[30]) #w1
        new.append(champs[31]) #w2
        new.append(champs[32]) #v1
        new.append(champs[33]) #v2
        new.append(champs[34]) #v3
        new.append(champs[35]) #x
        new.append(champs[36]) #xx
        new.append(champs[37]) #y
        new.append(champs[38]) #yy
        new.append(champs[39]) #x1
        new.append(champs[40]) #x2
        new.append(champs[41]) #x3
        new.append(champs[42]) #x4
        new.append(champs[43]) #x4
        for i in range(0, len(new)):
            if i  in [0, 2, 11, 12]:#11,12,19
                new[i] = db.quote(string.upper(new[i]), "text")
            elif new[i]!= '-':
                new[i] = db.quote(new[i], "")
        verify = "select * from galet_amenage where zone=" + new[0]+ " and numero =" + new[1] + " and bis=" + new[2] + ";"
        existe = db.query(verify)
        existe = existe.dictresult()
        liste = ["ga_cha", "ga_chb", "ga_chc", "ga_chd", "ga_che", "ga_chde", "ga_chf", "ga_chg", "ga_chh", "ga_chi", "ga_chj", "ga_chk", "ga_chna", "ga_chnb", "ga_chl", "ga_chm", "ga_cho", "ga_chp", "ga_chq", "ga_chqq", "ga_chr", "ga_chrg", "ga_chrd", "ga_chrr", "ga_chs", "ga_cht", "ga_chu", "ga_chw1", "ga_chw2", "ga_chv1", "ga_chv2", "ga_chv3", "ga_chx", "ga_chxx", "ga_chy", "ga_chyy", "ga_chz1", "ga_chz2", "ga_chz3", "ga_chz4"]
        if not existe:
            print "erreur: pas de parent ", (string.join(new, ','))
        elif new[0] != 'null' and new[1] != 'null' and new[2] != 'null':
            update = "UPDATE galet_amenage SET "
            for i in range(0, len(liste)):
                update = update + liste[i] + "=" + new[i+4] + ","
            update  = update[:-1] + " WHERE zone = " + new[0] + " AND numero = " + champs[1] +  " AND bis = " + new[2] + ";"
            db.query(update)
        else:
            print "!!!!!!!!!!! ", (string.join(new, ','))

