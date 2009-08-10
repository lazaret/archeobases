#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Collection - (c) 2006-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#

# usage:
# ./recup_biblio collection < fichier_recup_excel.csv

import sys
import string
import database


sys.path.append("../cgi")
db = database.DataBase(database=sys.argv[1], username = "postgres")
lignes = sys.stdin.readlines()
l = 0

for ligne in lignes:
    ligne = string.strip(ligne[:-1])
    l = l + 1
    if (ligne != ""):
        champs = string.split(ligne, ";")
        for i in range(0, len(champs)):
            champs[i] = string.strip(champs[i])
        new_biblio = []
        new_biblio.append(champs[0])  #identifiant
        new_biblio.append(champs[1])  #type_biblio
        new_biblio.append(champs[2])  #indice
        new_biblio.append(champs[3])  #titre ouvrage
        new_biblio.append(champs[4])  #auteur
        new_biblio.append(champs[5])  #titre article
        new_biblio.append(champs[6])  #titre periodique
        new_biblio.append(champs[7])  #pages
        new_biblio.append(champs[8])  #maison edition
        new_biblio.append(champs[9])  #ville edition
        new_biblio.append(champs[10]) #dir pub
        new_biblio.append(champs[11]) #annee
        new_biblio.append(champs[12]) #mois
        if champs[13] == '': #nb volumes
            new_biblio.append("NULL")
        else:
            new_biblio.append(champs[13])
        new_biblio.append(champs[14]) #serie
        new_biblio.append(champs[15]) #fasc
        new_biblio.append(champs[16]) #tome
        new_biblio.append(champs[17]) #numero
        new_biblio.append(champs[18]) #volume
        new_biblio.append(champs[19]) #langue doc
        new_biblio.append(champs[20]) #langue resume
        new_biblio.append(champs[21]) #etablissement
        new_biblio.append(champs[22]) #description
        new_biblio.append(champs[23]) #isbn
        new_biblio.append(champs[24]) #issn
        new_biblio.append(champs[25]) #resume
        new_biblio.append(champs[26]) #mots-clefs
        for i in range(0, len(new_biblio)):
            if i == 13:
                pass
            else:
                new_biblio[i] = db.quote((new_biblio[i]), "text")
        verify = "SELECT * FROM biblio WHERE identifiant =" +new_biblio[0]+ ";"
        existe = db.query(verify)
        existe = existe.dictresult()
        if existe:
            print ("Enregistrement existant : " +new_biblio[0])
        else:
            insert_biblio = "INSERT INTO biblio (identifiant,b_type_biblio,b_indice,b_titre_ouvrage,b_auteur, \
                            b_titre_article,b_titre_periodique,b_pages,b_maison_edition,b_ville_edition,b_dir_pub, \
                            b_annee,b_mois,b_nombre_volume,b_serie,b_fascicule,b_tome,b_numero,b_volume, \
                            b_langue_document,b_langue_resume,b_etablissement,b_description,b_isbn,b_issn,b_resume, \
                            b_mots_clefs) VALUES ("
            insert_biblio = insert_biblio+string.join(new_biblio, ", ")
            insert_biblio = insert_biblio + ");"
            try:
                db.query(insert_biblio)
                print ("OK identifiant : " + champs[0])
            except:
                print ("Problem : " + insert_biblio)


