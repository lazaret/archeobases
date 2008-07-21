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
    if (ligne != "") and (ligne[:4] != "sout") and (ligne[:6] != "------") :
        champs = string.split(ligne, ",")
        for i in range(0, len(champs)):
            champs[i] = string.strip(champs[i])
            if champs[i] == '-':
                champs[i] = ''
            elif champs[i] in ['999', '9999.99', '999.99']:
                champs[i] = '0'
        new = []
        new.append(champs[0])  #0 zone
        new.append(champs[1])  #1 numero
        new.append(champs[2])  # bis
        new.append(champs[3])  # ordre
        new.append(string.upper(champs[5]))  # type
        if champs[5] == 'BEC+ENCCTT':
            champs[5] = 'BECENCCTT'
        if champs[5] == 'CHUB':
            champs[5] = 'CHBU'
        if champs[5] == 'PEE1':
            champs[5] = 'PEC'
        if champs[5] == 'PEE1':
            champs[5] = 'PEC'
        if champs[5] in ('D2', 'D3'):
            champs[5] = 'DEB'
        new.append(champs[6])  # type
        new.append(champs[7])  # type
        new.append(champs[8])  # A
        new.append(champs[9])  # B
        new.append(champs[10]) #  P
        new.append(champs[11]) #  P
        new.append(champs[12]) #  P
        new.append(champs[14]) #  P
        new.append(champs[15]) #  P
        new.append(champs[16]) #  P
        new.append(champs[17]) #  P
        new.append(champs[18]) #  P
        new.append(champs[19]) #  P
        new.append(champs[20]) #  P
        new.append(champs[21]) #  P
        new.append(champs[22]) #  P
        for i in range(0, len(new)):
            if i  in [0, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12]:
                new[i] = db.quote(string.upper(new[i]), "text")
            elif new[i]!= '-':
                new[i] = db.quote(new[i], "")
        verify = "select * from industrie where zone=" + new[0]+ " and numero =" + new[1] + " and bis=" + new[2] + ";"
        existe = db.query(verify)
        existe = existe.dictresult()
        verify2 = "select * from outil where zone=" + new[0]+ " and numero =" + new[1] + " and bis=" + new[2] + " and o_ordre=" + new[3] + ";"
        existe2 = db.query(verify2)
        existe2 = existe2.dictresult()
        if not existe:
            pass
        elif existe2:
            pass
        if new[0] != 'null' and new[1] != 'null' and new[2] != 'null' and new[3] != 'null':
            where = " where zone=" + new[0] + "and numero=" + new[1] + "and bis=" + new[2] + ";"
            where2 = " where zone=" + new[0] + "and numero=" + new[1] + "and bis=" + new[2] + "and o_ordre=" + new[3] + ";"
            insert = "INSERT INTO outil (zone, numero, bis,o_ordre,o_code,o_forme,o_orientation,o_retouche,o_etat,o_origine,o_destination,o_sens,o_localisation,o_a,o_b,o_c,o_d,o_e,o_f,o_g,o_h) VALUES ("
            insert = insert+string.join(new, ', ')
            insert = insert + ");"
            try:
                db.query(insert)
                print(insert)
            except:
                pass
            #####################
            # REMPLIR i_objet
            ####################
            if champs[5] in ('--', '---', '-C--', 'ALEI', 'ALEM', 'AMCB', 'AMCUG', 'CONV', '^?'):
                update = "update outil set o_code= null" + where
                db.query(update)
            elif champs[5] in ('CHBU','LAML','LAMLC'):
                update = "update industrie set i_objet='LAML'"+ where
                db.query(update)
            elif (champs[5] in ('LAM','LAMC','LAMC','LAMDBT')):
                update = "update industrie set i_objet='LAM'"+ where
                db.query(update)
            elif (champs[5] in ('DEB','DEBU','DGB','MDE','MDEB','G3','PDE','PDEB')):
                update = "update industrie set i_objet='DEB'"+ where
                db.query(update)
            elif champs[5] in ('ECL','ECLC','ECLDBT','ECLL','ECLF','ECLFB','ECLP','ECLR','ECLTH','ECLU', 'PTE'):
                update = "update industrie set i_objet='ECL'" + where
                db.query(update)
            elif champs[5][:2]=='IA' or champs[5][:2]=='IM':
                update = "update industrie set i_objet='GAM'" + where
                db.query(update)
            elif champs[5] in ('G1','GAL'):
                update = "update industrie set i_objet='GAL'" + where
                db.query(update)
            elif champs[5] in ('G2','GALF'):
                update = "update industrie set i_objet='GALF'" + where
                db.query(update)
            elif champs[5][:2]=='ER':
                update = "update industrie set i_objet='ERT'" + where
                db.query(update)
            elif champs[5][:1]=='N':
                update = "update industrie set i_objet='NUC'" + where
                db.query(update)
            elif champs[5] in ('PEL', 'PECL','PECF','PECDBT','PEC'):
                update = "update industrie set i_objet='PEC'" + where
                db.query(update)
            else:
                update = "update industrie set i_objet='OUT'" + where
                db.query(update)
            ####################
            # REMPLIR e_code
            ####################
            if champs[5] in ('CHBU', 'DEB', 'DEBU', 'ECL', 'ECLU', 'ECLF', 'ERT', 'LAM', 'LAML', 'MDE', 'PDE', 'PEC', 'PTE', 'PEL'):
                update = "update eclat set e_code= " + db.quote(champs[5],"text") + where
                db.query(update)
            elif champs[5] in ('D2','D3','DGB','G3'):
                update = "update eclat set e_code= 'DEB' " + where
                db.query(update)
            elif champs[5] in ('ECLDBT','ECLFB','ECLL','ECLP','ECLR','ECLTH'):
                update = "update eclat set e_code='ECL'"+ where
                db.query(update)
            elif champs[5] in ('DBG','G3'):
                update = "update eclat set e_code='DEB'"+ where
                db.query(update)
            elif champs[5] == 'ECLC':
                update = "update eclat set e_code='ECLF'"+ where
                db.query(update)
            elif champs[5] in ('ER','ERT'):
                update = "update eclat set e_code='ERT'"+ where
                db.query(update)
            elif champs[5]  == 'LAMC':
                update = "update eclat set e_code='LAMF'"+ where
                db.query(update)
            elif champs[5] == 'LAMDBT':
                update = "update eclat set e_code='LAM'"+ where
                db.query(update)
            elif champs[5] =='LAMLC':
                update = "update eclat set e_code='LAML'"+ where
                db.query(update)
            elif champs[5] in ('PEC', 'PECDBT','PECF','PECL','PEL'):
                update = "update eclat set e_code='PEC'"+ where
                db.query(update)
            elif champs[5] =='PDEB':
                update = "update eclat set e_code='PDE'"+ where
                db.query(update)
            elif champs[5] =='MDEB':
                update = "update eclat set e_code='MDE'"+ where
                db.query(update)
            ###################
            # REMPLIR NUCLEUS
            ###################
            if champs[5][:1] == 'N':
                insert = "insert into nucleus(zone,numero,bis,n_ordre, n_type) values (" + new[0] + "," + new[1] + "," + new[2] + ",1," + db.quote(champs[5],"text") + ");"
                try:
                    db.query(insert)
                except:
                    print("erreur nucleus")
            ###################
            # EFFACER LES ECLATS DES PETITS OUTILS
            ###################
            ok = 0
            for i in range (0, len(champs[5])):
                if champs[5][i] == '+':
                    ok = 1
            if ok == 1:
                update = "update outil set o_code_comp=" + db.quote(champs[5],"text") + where2
                db.query(update)
                update = "update outil set o_code='' " + where2
            if champs[5][:1] == 'N' or champs[5] in ('CHBU', 'D2', 'D3', 'DEB', 'DEBU', 'DGB', 'ER', 'ERT', 'G3', 'LAM', 'LAMC', 'LAML', 'LAMDBT', 'LAMLC', 'MDE', 'PDE', 'PEC', 'PECDBT', 'PECF', 'PECL', 'PTE', 'PDEB') or champs[5][:3] == 'ECL':
                delete = "delete from outil " + where2
                db.query(delete)
db.query("VACUUM;")


