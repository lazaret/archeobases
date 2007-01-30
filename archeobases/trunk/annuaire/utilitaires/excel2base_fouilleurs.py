#! /usr/bin/python
#
# Annuaire - (c) 2006 Rachel VAUDRON <rachel@lazaret.unice.fr>
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2.0
# or, at your option, any higher version.
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#
# usage: ./excel2base_fouilleurs.py annuaire < fichier.csv

import sys
import string

sys.path.append("../cgi")

import database

db = database.DataBase(database=sys.argv[1], username = "postgres")
cpt=0
pb=0
lignes = sys.stdin.readlines()
l = 0

for ligne in lignes:
        ligne = string.strip(ligne[:-1])
        l = l + 1
        champs = string.split(ligne, ";")
        for i in range(0,len(champs)) :
                champs[i] = string.replace(champs[i], "," , ",")
                champs[i] = string.strip(champs[i])
                new_fiche = []
                new_adresse  = []
                if len(champs) == 9:
                        new_fiche.append(champs[0])  #f0 titre
                        new_fiche.append(champs[1])  #f1 prenom
                        new_fiche.append(champs[2])  #f2 nom
                        new_adresse.append(champs[3])   #a0 adresse_1
                        new_adresse.append(champs[4])   #a1 adresse_2
                        new_adresse.append(champs[5])   #a2 code  
                        new_adresse.append(champs[6])   #a3 ville
                        new_adresse.append(champs[7])   #a4 pays
                        new_fiche.append(champs[8])  #f3 commentaire
                        new_adresse.append(str(1))      #a5 ordre
                        new_fiche.append('PERSONNE') #f4 type_entree
                        new_fiche.append('FOUILLEUR')#f5 type_personne
                        
               
                        for i in range(0, len(new_fiche)) :
                                #new_fiche[i] = db.quote(string.upper(new_fiche[i]), "text")
                                new_fiche[i] = db.quote(new_fiche[i], "text")
                        
                        for i in range(0, len(new_adresse)) :
                                if i != 5:
                                        new_adresse[i] = db.quote(new_adresse[i], "text")
                       
                else:       
                        pb =1
        if pb:       
                print ("probleme longueur champs", champs[0], " ",champs[1], " ",champs[2])
                pb=0
        else:        
                verify = "SELECT * from fiche where prenom=" + new_fiche[1] + " and nom="+ new_fiche[2] +";"
                existe = db.query(verify)
                existe = existe.dictresult()
                
                if not existe:
                        identifiant = cpt+2000
                        new_fiche.append(str(identifiant))
                        #print new_fiche
                        insert_fiche ="INSERT INTO fiche (titre,prenom,nom,commentaire,type_entree,type_personne,identifiant) VALUES ("
                        insert_fiche = insert_fiche + string.join(new_fiche, ', ')
                        insert_fiche = insert_fiche + ");"
                        
                        new_adresse.append(str(identifiant))
                        insert_adresse ="INSERT INTO adresse (adresse_1,adresse_2,code,ville,pays,ordre,identifiant) VALUES ("
                        insert_adresse = insert_adresse + string.join(new_adresse, ', ')
                        insert_adresse = insert_adresse + ");"
                        
                        try:
                                db.query(insert_fiche)
                                db.query(insert_adresse)
                        except:
                                print ("probleme ligne", insert)
                        #print(insert_fiche)
                        #print(insert_adresse)
                        
                        cpt=cpt +1
                else:
                        print("Enregistrement deja existant:",champs[0], " ",champs[1], " ",champs[2])
                        
print(cpt, "fouilleurs inseres")



#db.query("VACUUM;")





