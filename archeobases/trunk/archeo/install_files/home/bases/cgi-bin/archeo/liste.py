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

import sys
import string
import database


sys.path.append("../cgi")
db = database.DataBase(database="archeo", username="archeo")

query = "DELETE from controle_ga_facture;"
db.query(query)

query = "DELETE from controle_eg_extremite;"
db.query(query)

query = "DELETE from controle_eg_profondeur;"
db.query(query)

query = "DELETE from controle_ga_arete;"
db.query(query)

query = "DELETE from controle_ga_forme;"
db.query(query)

query = "DELETE from controle_ga_qualite;"
db.query(query)

query = "DELETE from controle_eg_proeminence;"
db.query(query)

query = "DELETE from controle_eg_sens;"
db.query(query)

liste = ['M']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_ga_facture (ga_facture) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['B']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_ga_qualite (ga_qualite) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['SCONC']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_ga_forme (ga_forme) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['CRI']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_ga_arete (ga_arete) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

######################### ENLEVEMENT GA ####################
liste = ['CC']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_eg_profil (eg_profil) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['E']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_eg_profondeur (eg_profondeur) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['ATN']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_eg_extremite (eg_extremite) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['N']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_eg_proeminence (eg_proeminence) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['DIR']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_eg_sens (eg_sens) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

query = "DELETE from controle_bis;"
db.query(query)

query = "DELETE from controle_i_nature;"
db.query(query)

query = "DELETE from controle_i_roulage;"
db.query(query)

query = "DELETE from controle_i_patine;"
db.query(query)

query = "DELETE from controle_i_dpatine;"
db.query(query)

query = "DELETE from controle_i_alteration;"
db.query(query)

query = "DELETE from controle_i_encroutement;"
db.query(query)

query = "DELETE from controle_i_pmycellium;"
db.query(query)

query = "DELETE from controle_i_eolisation;"
db.query(query)

query = "DELETE from controle_i_lustrage;"
db.query(query)

query = "DELETE from controle_i_action;"
db.query(query)

query = "DELETE from controle_i_desilicification;"
db.query(query)

query = "DELETE from controle_e_section;"
db.query(query)

query = "DELETE from controle_e_contour;"
db.query(query)

query = "DELETE from controle_e_enlevement;"
db.query(query)

query = "DELETE from controle_e_bulbe;"
db.query(query)

query = "DELETE from controle_e_talon;"
db.query(query)

query = "DELETE from controle_e_cone;"
db.query(query)

query = "DELETE from controle_e_onde;"
db.query(query)

query = "DELETE from controle_e_epi;"
db.query(query)

query = "DELETE from controle_e_strie;"
db.query(query)

query = "DELETE from controle_e_parasite;"
db.query(query)

query = "DELETE from controle_e_secondaire;"
db.query(query)

query = "DELETE from controle_e_charniere;"
db.query(query)

query = "DELETE from controle_e_distale;"
db.query(query)

query = "DELETE from controle_o_code;"
db.query(query)

query = "DELETE from controle_o_retouche;"
db.query(query)

query = "DELETE from controle_e_distale;"
db.query(query)

query = "DELETE from controle_o_retouche;"
db.query(query)

query = "DELETE from controle_o_orientation;"
db.query(query)

query = "DELETE from controle_o_origine;"
db.query(query)

query = "DELETE from controle_o_destination;"
db.query(query)

query = "DELETE from controle_o_etat;"
db.query(query)

query = "DELETE from controle_o_localisation;"
db.query(query)

query = "DELETE from controle_o_sens;"
db.query(query)

query = "DELETE from controle_o_forme;"
db.query(query)

############################# CARNET ########################
liste = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'R', '--']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_bis (bis) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['DNT', 'ESQ', 'IND', 'MDB', 'OSD', 'PIE']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_nature (nature) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

############################ INDUSTRIE #######################
liste = ['BAM', 'BS', 'CAG', 'CAGS', 'CAI', 'CAM', 'CAR', 'CH', 'CHT', 'CLT', 'CPS', 'CRN', 'CS', 'CSUB', 'D', 'DNT', 'ES', 'G', 'GQZT1', 'CQGZT2', 'IND', 'J', 'LYD', 'MGS', 'MI', 'MM', 'OS', 'QBB', 'QBO', 'QBT', 'QI', 'QR', 'QZT1', 'QZT2', 'QZT3', 'QZT4', 'QZT5', 'S', 'SB', 'SCH', 'SF', 'SJ', 'SR', 'ST', 'VA', 'VB', 'VD', 'VI', 'VO', 'VR']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_i_nature (i_nature) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['NR', 'FR', 'TR']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_i_roulage (i_roulage) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['N', 'G', 'GBG', 'GM', 'GBT', 'GBL', 'GR', 'GV', 'GVR', 'BG', 'BR', 'BL', 'J', 'M', 'RL', 'RG', 'GN', 'VIO']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_i_patine (i_patine) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['H', 'RDF', 'RDS', 'RNP', 'RNO', 'RNR', 'RNI', 'RND', 'RNE', 'RN', 'RNER']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_i_dpatine (i_dpatine) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['NA', 'AF', 'MA', 'AT']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_i_alteration (i_alteration) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['ECC', 'ECE', 'ECP', 'ECF', 'ECT']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_i_encroutement (i_encroutement) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['PMC', 'PME', 'PMF', 'PMT']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_i_pmycellium (i_pmycellium) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['NE', 'FE', 'TE']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_i_eolisation (i_eolisation) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['NL', 'FL', 'TL']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_i_lustrage (i_lustrage) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['BL', 'GR', 'RB', 'RS', 'CQI', 'CQF', 'CQG', 'DPI', 'DPF', 'DPG', 'DCI', 'DCF', 'DCG', 'CI', 'ECF', 'ECG']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_i_action (i_action) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['ND', 'DF', 'DM', 'DT']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_i_desilicification (i_desilicification) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

############################### ECLAT ########################
liste = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'P', 'R']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_e_section (e_section) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['A1', 'A2', 'A3', 'Q1', 'Q2', 'Q3', 'Q4', 'Q5', 'Q6', 'P', 'TC', 'TD', 'R', 'I']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_e_contour (e_contour) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['O', 'LC', 'LU', 'LB', 'TU', 'TB', 'OR', 'E', 'C', 'I', 'D']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_e_enlevement (e_enlevement) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['A', 'E1', 'E2', 'E3', 'I', 'UC', 'UD', 'UN', 'UP', 'UPD', 'UTC', 'M1A', 'M1B', 'M1C', 'M1D', 'M1E', 'M2A', 'M2B', 'M2C', 'M2D']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_e_bulbe (e_bulbe) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['TL1', 'TL2', 'TL3', 'TD1A', 'TD1B', 'TD4A', 'TD4B', 'TD5A', 'TD5B', 'TD3A', 'TD3B', 'TF1A', 'TF1B', 'TF2A', 'TF2B', 'TF4A', 'TF4B', 'TF5A', 'TF5B', 'TF3A', 'TF3B', 'TR6C', 'TR6D', 'TR7', 'TR', 'TC', 'TO8', 'TO9', 'TI', 'TA']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_e_talon (e_talon) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['N', 'FD', 'D', 'TD', 'A']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_e_cone (e_cone) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['N', 'FD', 'D', 'TD', 'A']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_e_onde (e_onde) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['N', 'FD', 'D', 'TD', 'A']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_e_epi (e_epi) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['N', 'P', 'A']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_e_strie (e_strie) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['N', 'PP', 'PM', 'PG', 'PTG', 'A']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_e_parasite (e_parasite) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['N', 'PU', 'PQ', 'PN', 'A']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_e_secondaire (e_secondaire) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['N', 'O', 'AN', 'S', 'P', 'A']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_e_charniere (e_charniere) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = []
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_e_distale (e_distale) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

######################### OUTIL #######################
liste = ['RACLAT', 'ENCRES', 'DENTCLAT']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_o_code (o_code) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['AE', 'DE', 'M', 'MD', '1/2E', '1/2D']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_o_retouche (o_retouche) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['P']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_o_orientation (o_orientation) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['A', 'B', 'P', 'AF', 'BF', 'PF', 'FL', 'BT', 'BC', 'BR', 'BD', 'BTA', 'BTC', 'BTP', 'BTE', 'BTDC', 'BTDN', 'BTT', 'BTPI', 'BTPC', 'BTPM', 'BTPT', 'BTPR', 'M']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_o_origine  (o_origine) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['A', 'B', 'P', 'AF', 'BF', 'PF', 'FL', 'BT', 'BC', 'BR', 'BD', 'BTA', 'BTC', 'BTP', 'BTE', 'BTDC', 'BTDN', 'BTT', 'BTPI', 'BTPC', 'BTPM', 'BTPT', 'BTPR', 'M']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_o_destination (o_destination) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['1', '2A', '2B', '2C', '2D', '2E', '2F', '3']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_o_etat (o_etat) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['IND', 'ANGPROX', 'LATGT', 'LATGPROX', 'LATGMES', 'LATGDIS', 'ANGGDIS', 'TRDIST', 'TRDISG', 'TRDISMES', 'TRDISD', 'PTDIS', 'ANGDDIS', 'LATDT', 'LATDDIS', 'LATDMES', 'LATDPROX', 'ANGDPROX', 'TRPROXT', 'TRPROXD', 'TRPROXMES', 'TRPROXG', 'PTPROX', 'ARMEDT', 'ARMEDPROX', 'ARMEDMES', 'ARMEDDIS', 'PERIP']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_o_localisation (o_localisation) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

liste = ['DIR', 'INV', 'MIX', 'MIXAL', 'PROFL', 'PROFT', 'PROFM', 'MSG', 'MSD', 'MSX', 'MIG', 'MID']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_o_sens (o_sens) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

########## o_serie
liste = ['REC', 'CONV', 'CONC', 'SCONV', 'SCONC']
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_o_forme (o_forme) VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)

######### o_chronologie
liste = []
for i in range (0, len(liste)):
    insert = "INSERT INTO controle_ () VALUES (" + db.quote(string.upper(liste[i]), "text") + ");"
    db.query(insert)
db.query("VACUUM;")
