#! /usr/bin/python
#
# archeo - (c) 2003 Rachel VAUDRON <rachel@lazaret.unice.fr>

#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2.0
# or, at your option, any higher version.
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

liste_coprolithe =  ["c_sediment","c_couleur","c_motif","c_motnat","c_motcou","c_forme","c_vol","c_volext","c_retrecissement","c_extremite","c_ext1","c_ext2","c_alteration","c_altnat","c_inclusion","c_incl1","c_incl2","c_incl3","c_element","c_granulometrie","c_liant","c_consistance","c_ordre","c_famille","c_genre","c_parasito","c_palyno","c_lame","c_autre","c_mif","c_macroreste"]

liste_industrie = ["i_forme_galet", "i_matiere","i_objet","i_patine","i_dpatine","i_alteration", "i_encroutement","i_pmycellium","i_eolisation","i_lustrage","i_roulage","i_action","i_desilicification","i_support"]


liste_eclat = ["e_code","e_debitage","e_section_long","e_section_trans","e_contour","e_enlevement","e_bulbe","e_talon","e_cone","e_onde","e_epi","e_strie","e_parasite", "e_secondaire","e_charniere","e_carene","e_type"]

liste_bord = ["b_extremite", "b_code"]

liste_stigmate = ["s_ordre", "s_type","s_sous_type", "s_lustrage", "s_polissage","s_localisation", "s_situation", "s_relation"]


liste_retouche = ["r_ordre", "r_type", "r_obliquite", "r_denticulation", "r_cas", "r_utilisation", "r_dimension", "r_association", "r_superposition", "r_extremite", "r_bord",  "r_frequence", "r_ecrasement", "r_lustrage",  "r_strie", "r_origine", "r_destination", "r_sens", "r_tranchant"]
#"r_longueur",

liste_fracture_industrie = ["fi_type", "fi_percussion", "fi_mode"]

liste_outil = ["o_code", "o_retouche","o_orientation","o_origine","o_destination","o_etat","o_localisation","o_sens","o_forme"]

liste_galet_amenage = ["ga_type","ga_facture","ga_qualite","ga_forme","ga_arete","ga_orientation","ga_retouche","ga_obliquite"]

#"ga_longueur_generale", "ga_profil", "ga_profondeur", "ga_extremite", "ga_proeminence", "ga_sens", "ga_localisation", "ga_situation", "ga_epaisseur"]

liste_enlevement_galet = ["eg_longueur_generale", "eg_profil", "eg_profondeur", "eg_extremite", "eg_proeminence", "eg_sens", "eg_situation", "eg_epaisseur"]

liste_nucleus = ["n_type", "n_epuisement"]

liste_enlevement_nucleus = ["en_obliquite", "en_dptimpact", "en_frappe", "en_inclinaison", "en_direction"]
 #"en_profondeur",
liste_bord = ["b_extremite", "b_code"]

liste_biface = ["b_type","b_base","b_surface","b_enlevement","b_amenagement_bord","b_amenagement_distal","b_distale","b_biseau","b_bord","b_meplat","b_extension","b_symetrie","b_facture","b_bilaterale","b_bifaciale","b_arete","b_retouche", "b_support", "b_dat1","b_dat2","b_dat"]

liste_hachereau = ["h_type","h_base","h_surface","h_amenagement_bord","h_distale","h_biseau","h_bord","h_meplat","h_extension","h_symetrie","h_bilaterale","h_facture","h_arete","h_retouche"]


dico_controle = {"carnet":liste_carnet, \
		 "faune": liste_faune,\
		 "trace":liste_trace, \
		 "usure_dent":liste_usure_dent, \
		 "microfaune":liste_microfaune,
		 "os":liste_mesure_os, \
		 "fracture_faune":liste_fracture_faune,\
		 "coprolithe":liste_coprolithe,\
		 "industrie":liste_industrie, \
		 "outil":liste_outil, \
		 "eclat": liste_eclat,\
		 "bord":liste_bord,\
		 "stigmate":liste_stigmate, \
		 "retouche":liste_retouche,\
		 "fracture_industrie": liste_fracture_industrie,\
		 "galet_amenage":liste_galet_amenage,\
		 "enlevement_galet": liste_enlevement_galet,\
		 "nucleus":liste_nucleus,\
		 "enlevement_nucleus":liste_enlevement_nucleus,\
		 "biface" : liste_biface,\
		 "hachereau":liste_hachereau,\
		 
		 }
action = raw_input("Souhaitez-vous RÅÈcupÅÈrer la liste des valeurs possibles pour chaque champs de cette base ou Effacer les controles existants? R/E  ")

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









