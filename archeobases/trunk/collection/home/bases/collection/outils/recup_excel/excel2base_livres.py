#! /usr/bin/python
#
# -*- coding: UTF-8 -*-
# Collection - (c) 2006 Rachel VAUDRON <rachel@lazaret.unice.fr>
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2.0
# or, at your option, any higher version.
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#
# a uiliser comme suit:
# ./recup_biblio collection < fichier_recup_excel.csv

import sys
import string

sys.path.append("../cgi")

import database

db = database.DataBase(database=sys.argv[1], username = "postgres")
cpt=0
cpt_ok =0
pb=0

lignes = sys.stdin.readlines()
l = 0

for ligne in lignes:
        ligne = string.strip(ligne[:-1])
        #ligne = unicode(ligne, "UTF-8")
        
        #ligne.encode("UTF-8")
        l = l + 1
        champs = string.split(ligne, ";")
        for i in range(0,len(champs)) :
                #print ligne
                champs[i] = string.strip(champs[i])
                new_objet = []
                new_biblio  = []
                if (len(champs) >= 12):
                        
                        #print "longueur OK ",len(champs)
                        new_biblio.append('DRET-BIB-00' + champs[0])  #identifiant
                        new_biblio.append('LIVRE')  #type_biblio
                        new_biblio.append(champs[1])  #indice
                        new_biblio.append(champs[2])  #auteur 
                        new_biblio.append(champs[3])  #titre 
                        new_biblio.append(champs[4])  #mots-clefs
                        new_biblio.append(champs[5])  #ville_edition
                        new_biblio.append(champs[6])  #maison_edition
                        #print "type du champs: ", type(champs[7])
                        if (champs[7] <'1700' or champs[7] > '2010'):
                                #print "annee str",champs[6]        
                                champs[7] = '0'
                        new_biblio.append(champs[7])  #annee
                        new_biblio.append(champs[8])  #pages  
                        new_biblio.append(champs[9])  #nombre_exemplaire
                        new_biblio.append(champs[10])  #langue
                        new_biblio.append('ESSAI_INSERTION_LIVRE')         #resume  
                        
                        for i in range(0, len(new_biblio)):                
                                new_biblio[i] = db.quote((new_biblio[i]), "text")
                else:       
                        pb = 1
                        
        try:
                delete = "DELETE FROM biblio WHERE identifiant=" + new_biblio[0] + ";"
                delete = delete.encode("UTF-8")  
                #db.query(delete)
        except:
                print "erreur delete"
                        
        if pb:
                print ligne
                print ("probleme longueur: ", len(champs))
                pb = 0
        else:
                q = "SELECT COUNT(*) FROM biblio "
                q = q + "WHERE identifiant=" + new_biblio[0] + ";"
                q = q.encode("UTF-8")
                res = db.query(q)
                res = res.dictresult()
                res = res[0]["count"]
        
                if res:
                        cpt = cpt + 1
                else:
                        insert_biblio = "INSERT INTO biblio (identifiant,b_type_biblio,b_indice,b_auteur,b_titre_ouvrage,b_mots_clefs,b_ville_edition,b_maison_edition,b_annee,b_pages,b_nombre_ex_supp,b_langue_document,b_resume) VALUES ("
                        insert_biblio = insert_biblio+string.join(new_biblio, ', ')
                        insert_biblio = insert_biblio + ");"
                        
                        try:        
                                #insert_biblio = insert_biblio.encode("UTF-8")
                                #print insert_biblio
                                db.query(insert_biblio)
                                cpt_ok =cpt_ok + 1
                        except:        
                                print ("probleme ligne", insert_biblio)
print(cpt, " doublons")
print(cpt_ok, " OK")



#db.query("VACUUM;")





