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
    if (ligne != "") and (ligne[:4] != "gout") and (ligne[:6] != "------") :
        champs = string.split(ligne, ",")
        for i in range(0, len(champs)):
            champs[i] = string.strip(champs[i])
            if champs[i] == "-":
                champs[i] = ""
            elif champs[i] in ("999", "9999.99", "999.99"):
                champs[i] = "0"
        new_ga = []
        new_eg = []
        new_en = []
        new_n  = []
        if champs[5] !="" and (champs[5][0] == "N"):
            ###### NUCLEUS #####
            new_n.append(champs[0])  #0 zone
            new_n.append(champs[1])  #1 numero
            new_n.append(champs[2])  # bis
            new_n.append(1)  # ordre
            new_n.append(champs[5])  # type
            new_n.append(champs[8])  # A
            new_n.append(champs[9])  # B
            new_n.append(champs[10]) #  P
            for i in range(0, len(new_n)):
                if i  in [0, 2, 3]:
                    new_n[i] = db.quote(string.upper(new_n[i]), "text")
                elif new_n[i]!= "-" or new_n[i]!="99":
                    new_n[i] = db.quote(new_n[i], "")
            verify = "select * from industrie where zone=" + new_n[0]+ " and numero =" + new_n[1] + " and bis=" + new_n[2] + ";"
            existe = db.query(verify)
            existe = existe.dictresult()
            verify2 = "select * from nucleus where zone=" + new_n[0]+ " and numero =" + new_n[1] + " and bis=" + new_n[2] + " and n_ordre = 1;"
            existe2 = db.query(verify2)
            existe2 = existe2.dictresult()
            if not existe:
                print ("erreur: pas de parents nucleus", (string.join(new_n, ", ")))
            elif existe2:
                print ("erreur: doublon nucleus", (string.join(new_n, ", ")))
            elif new_n[0] != "null" and new_n[1] != "null" and new_n[2] != "null":
                insert = "INSERT INTO nucleus (zone, numero, bis, n_ordre, n_type, n_nba, n_nbb, n_nbp) VALUES ("
                insert = insert+string.join(new_n, ", ")
                insert = insert + ");"
                db.query(insert)
                where = " WHERE zone = " + new_n[0] + " AND numero=" + new_n[1] + " AND bis=" + new_n[2] +";"
                update = "update industrie set i_objet='NUC' " + where
                db.query (update)
            ###### ENLEVEMENT NUCLEUS #####
            new_en.append(champs[0])  #0 zone
            new_en.append(champs[1])  #1 numero
            new_en.append(champs[2])  # bis
            new_en.append(1)          # ordre
            new_en.append(champs[27]) # Lg
            new_en.append(champs[28]) #  lg
            new_en.append(champs[29]) #  obliquite
            new_en.append(champs[30]) #  corde
            new_en.append(champs[31]) #  fleche
            new_en.append(champs[32]) #  dptimpact
            new_en.append(champs[33]) #  frappe
            new_en.append(champs[34]) # franumero
            new_en.append(champs[35]) #  inclinaison
            new_en.append(champs[36]) #  direction
            for i in range(0, len(new_en)):
                if i  in [0, 2, 4, 11, 13, 14]:
                    new_en[i] = db.quote(string.upper(new_en[i]), "text")
                elif new_en[i] != "-" or new_en[i] != "99":
                    new_en[i] = db.quote(new_en[i], "")
            verify = "select * from nucleus where zone=" + new_en[0]+ " and numero =" + new_en[1] + " and bis=" + new_en[2] + " and n_ordre = 1;"
            existe = db.query(verify)
            existe = existe.dictresult()
            verify2 = "select * from enlevement_nucleus where zone=" + new_en[0]+ " and numero =" + new_en[1] + " and bis=" + new_en[2] + " and n_ordre=1 and en_rang=" + new_en[3] + ";"
            existe2 = db.query(verify2)
            existe2 = existe2.dictresult()
            if not existe:
                print "erreur: pas de parents enlevement nucleus", (string.join(new_en, ", "))
            elif existe2:
                print ("")
            elif new_en[0] != "null" and new_en[1] != "null" and new_en[2] != "null" and new_en[3] != "null":
                insert = "INSERT INTO enlevement_nucleus (zone, numero, bis,n_ordre,en_rang,  en_longueur, en_largeur,en_obliquite_degre, en_corde, en_fleche, en_dptimpact, en_frappe,en_numero, en_inclinaison, en_direction) VALUES ("
                insert = insert+string.join(new_en, ", ")
                insert = insert + ");"
                db.query(insert)
        else:
            ##### GALET #####
            new_ga.append(champs[0])  #0 zone
            new_ga.append(champs[1])  #1 numero
            new_ga.append(champs[2])  # bis
            new_ga.append(champs[3])  # ordre
            new_ga.append(champs[5])  # type
            if champs[5] in ("1", "12", "PL4"):
                champs[5] = ""
            elif champs[5] == "FA1C5":
                champs[5] = "IA1C5"
            elif champs[5] in ("G2", "GALC", "GLF"):
                champs[5] = "GALF"
            elif champs[5] in ("GALENT", "GALENTR", "GALENTER"):
                champs[5] = "GALF"
            new_ga.append(champs[6])  #   facture
            new_ga.append(champs[7])  # qualite
            new_ga.append(champs[8])  # A
            new_ga.append(champs[9])  # B
            new_ga.append(champs[10]) #  P
            new_ga.append(champs[12]) # forme
            new_ga.append(champs[13]) # arete
            new_ga.append(champs[14]) # orientation
            new_ga.append(champs[18]) # obliquite
            new_ga.append(champs[21]) # retouche
            for i in range(0, len(new_ga)):
                if i  in [0, 2, 3, 4, 5, 6, 10, 11, 12, 13, 14, 15]:
                    new_ga[i] = db.quote(string.upper(new_ga[i]), "text")
                elif new_ga[i]!= "-" or new_ga[i]!="99":
                    new_ga[i] = db.quote(new_ga[i], "")
            verify = "select * from industrie where zone=" + new_ga[0]+ " and numero =" + new_ga[1] + " and bis=" + new_ga[2] + ";"
            existe = db.query(verify)
            existe = existe.dictresult()
            verify2 = "select * from galet_amenage where zone=" + new_ga[0]+ " and numero =" + new_ga[1] + " and bis=" + new_ga[2] + " and ga_ordre= " + new_ga[3] + ";"
            existe2 = db.query(verify2)
            existe2 = existe2.dictresult()
            if not existe:
                print "erreur: pas de parents galet", (string.join(new_ga, ", "))
            elif existe2:
                print "erreur: doublon galet", (string.join(new_ga, ", "))
            elif new_ga[0] != "null" and new_ga[1] != "null" and new_ga[2] != "null":
                insert = "INSERT INTO galet_amenage (zone, numero, bis,ga_ordre,ga_type, ga_facture, ga_qualite, ga_nba, ga_nbb, ga_nbp, ga_forme, ga_arete, ga_orientation, ga_obliquite ,ga_retouche) VALUES ("
                insert = insert+string.join(new_ga, ", ")
                insert = insert + ");"
                db.query(insert)
                where = " WHERE zone = " + new_ga[0] + " AND numero=" + new_ga[1] + " AND bis=" + new_ga[2] +";"
                type = db.quote(champs[5],"text")
                if type in ("'DEB'", "'DGAL'", "'G3'"):
                    insert = "insert into eclat(zone, numero, bis, e_code) values (" + new_ga[0] + "," + new_ga[1] + "," + new_ga[2] + "," + type + ");"
                    update = "update industrie set i_objet='DEB' " + where
                    delete1 = "delete from enlevement_galet " + where
                    delete2 ="delete from galet_amenage " + where
                    try:
                        db.query(insert)
                        db.query(update)
                        db.query(delete1)
                        db.query(delete2)
                    except:
                        print("doublon eclat")
                elif type == "'GALF'":
                    update = "update industrie set i_objet='GALF' " + where
                    db.query(update)
                elif champs[5][:1] =="I":
                    update = "update industrie set i_objet='GAM' " + where
                    db.query(update)
                elif type =="'PERC'":
                    update = "update industrie set i_objet='PERC' " + where
                    db.query(update)
                elif type =="'RET'":
                    update = "update industrie set i_objet='RET' " + where
                    db.query(update)
                elif champs[5][:1] =="V":
                    update = "update industrie set i_objet='GAM' " + where
                    db.query(update)
            ##### ENLEVEMENT GALET #####
            new_eg.append(champs[0])  #0 zone
            new_eg.append(champs[1])  #1 numero
            new_eg.append(champs[2])  #2 bis
            new_eg.append(champs[3])  #3 ordre
            new_eg.append("1")        #4 rang
            new_eg.append(champs[11]) #5 element
            new_eg.append(champs[15]) # 6longueur
            new_eg.append(champs[16]) # profil
            new_eg.append(champs[17]) # profondeur
            new_eg.append(champs[19]) # extemite
            new_eg.append(champs[20]) # proeminence
            new_eg.append(champs[22]) # sens
            new_eg.append(champs[23]) # support
            new_eg.append(champs[24]) # localisation
            new_eg.append(champs[25]) # situation
            new_eg.append(champs[26]) # epaisseur
            new_eg.append(champs[27]) #
            new_eg.append(champs[28]) #
            new_eg.append(champs[29]) #
            new_eg.append(champs[30]) #
            new_eg.append(champs[31]) #
            new_eg.append(champs[32]) #
            for i in range(0, len(new_eg)):
                if i  in [0, 2, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]:
                    new_eg[i] = db.quote(string.upper(new_eg[i]), "text")
                elif new_eg[i]!= "-" or new_eg[i]!="99":
                    new_eg[i] = db.quote(new_eg[i], "")
            verify = "select * from galet_amenage where zone=" + new_eg[0]+ " and numero =" + new_eg[1] + " and bis=" + new_eg[2]  + " and ga_ordre=" + new_eg[3] + ";"
            existe = db.query(verify)
            existe = existe.dictresult()
            verify2 = "select * from enlevement_galet where zone=" + new_eg[0]+ " and numero =" + new_eg[1] + " and bis=" + new_eg[2] + " and ga_ordre=" + new_eg[3] + " and eg_rang=" + new_eg[4] + ";"
            existe2 = db.query(verify2)
            existe2 = existe2.dictresult()
            if not existe:
                print "erreur: pas de parents enlevement galet", (string.join(new_eg, ", "))
            elif existe2:
                print ("erreur: doublon enlevement galet", (string.join(new_eg, ", ")))
            elif (new_eg[0] != "null") and (new_eg[1] != "null") and (new_eg[2] !="null") and (new_eg[3] != "null") and (new_eg[4] != "null"):
                insert = "INSERT INTO enlevement_galet (zone, numero, bis,ga_ordre,eg_rang,eg_element,  eg_longueur_generale, eg_profil, eg_profondeur, eg_extremite, eg_proeminence, eg_sens,eg_support, eg_localisation, eg_situation,eg_epaisseur, eg_longueur, eg_largeur, eg_obliquite_degre, eg_corde, eg_fleche, eg_dptimpact) VALUES ("
                insert = insert+string.join(new_eg, ", ")
                insert = insert + ");"
                db.query(insert)
                where2 = " WHERE zone = " + new_ga[0] + " AND numero=" + new_ga[1] + " AND bis=" + new_ga[2] + " AND eg_ordre=" + new_eg[3]

