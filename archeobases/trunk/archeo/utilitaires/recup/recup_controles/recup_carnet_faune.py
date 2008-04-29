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
liste_carnet = ["zone", "bis", "locus", "localite", "carre", "souscarre", "ensemble", "niveau", "sol", "nature", "orientation", "pendage", "vers"]

liste_faune = ["f_classe", "f_ordre", "f_famille", "f_ssfamille", "f_affgenre", "f_genre", "f_affespece","f_espece", "f_ssespece", "f_typos1", "f_typos2", "f_typos3", "f_typos4", "f_typos5", "f_typos6","f_lateralite", "f_sexe", "f_taille","f_agecl", "f_stserie", "f_stdent", "f_pathologie", "f_couleur", "f_caltype", "f_calcouleur", "f_concretion", "f_oxyde", "f_coraspect", "f_corfissure", "f_fossilisation", "f_tissu", "f_typedos", "f_ilongueur", "f_icirconference", "f_eclat", "f_agent", "f_photo", "f_dessin", "f_traitement", "f_datation", "f_moulage", "f_conservation", "f_restauration"]

liste_usure_dent = ["ud_serie", "ud_lateralite", "ud_usure"]

liste_mesure_os = ["o_serie"]

liste_dent = ["d_serie", "d_type"]

liste_fracture_faune = ["ff_localisation1","ff_non1","ff_angle1","ff_aspect1","ff_profil1","ff_morphologie1","ff_localisation2","ff_non2","ff_angle2","ff_aspect2","ff_profil2","ff_morphologie2"]

liste_trace = ["t_ensemble",  "t_nature", "t_agent", "t_phenomene",  "t_locmusc",  "t_classe", "t_largeur","t_profondeur", "t_section", "t_dstrie", "t_trace", "t_allure","t_direction", "t_sens",   "t_dessin", "t_photo", "t_replique"]

liste_microfaune = ["mf_serie", "mf_type"]

dico_controle = {"carnet":liste_carnet, \
                 "faune": liste_faune,\
                 "trace":liste_trace, \
                 "usure_dent":liste_usure_dent, \
                 "microfaune":liste_microfaune,
                 "os":liste_mesure_os, \
                 "fracture_faune":liste_fracture_faune,\
                 
                 }
action = raw_input("Souhaitez-vous Récupérer la liste des valeurs possibles pour chaque champs de cette base ou Effacer les controles existants? R/E  ")

for d in dico_controle.keys():
        
        for c in dico_controle[d]:  

                if string.upper(action) == "R": 
                        req = "SELECT DISTINCT " + c + " FROM " + d + ";"
                        print req
                        res = db.query(req)
                        res = res.dictresult()

                        for ctrl in res:
                                for key in ctrl.keys():
                                        try:
                                                insert = "INSERT INTO controle_" + c + "(" + c + ") VALUES (" + db.quote(ctrl[key],"txt") + ");"
                                                db.query(insert)
                                        except:
                                                print("erreur", insert)
                elif string.upper(action) == "E":
                        req = "DELETE FROM controle_" + c + ";"
                        print(req)
                        db.query(req)

