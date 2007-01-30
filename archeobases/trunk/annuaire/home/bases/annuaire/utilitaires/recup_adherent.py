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
                #champs[i] = string.replace(champs[i], "," , " ")
                champs[i] = string.strip(champs[i])
                new_personne = []
                new_adresse  = []
                if (len(champs) == 16) or (len(champs) == 15):
                        new_personne.append(champs[0])  #f0 numero_adh
                        new_personne.append(champs[1])  #f1 titre
                        new_personne.append(champs[2])  #f2 nom
                        new_personne.append(champs[3])  #f3 prenom
                        new_personne.append(champs[4])  #f4 cotisation
                        new_adresse.append(champs[5])   #a0 adresse_1
                        new_adresse.append(champs[6])   #a1 adresse_2
                        new_adresse.append(champs[7])   #a2 code  
                        new_adresse.append(champs[8])   #a3 ville
                        new_adresse.append(champs[9])   #a4 pays
                        new_adresse.append(champs[10])  #a5 telephone_1
                        new_adresse.append(champs[11])  #a6 email
                        new_personne.append(champs[12]) #f5 structure  
                        new_personne.append(champs[13]) #f6 fonction 
                        new_personne.append(champs[14]) #f7 specialite 
                        
                        new_personne.append(str(cpt+1000))   #a7 f8 identifiant
                        new_personne.append('PERSONNE')   #a7 f8 identifiant
                        new_personne.append('ADHERENT')   #a7 f8 identifiant
                        
                        new_adresse.append(str(cpt+1000))   #a7 f8 identifiant
                        new_adresse.append(str(1))   #a7 f8 identifiant
                        
                        for i in range(0, len(new_personne)) :
                                if i  not in [0,8] :
                                        new_personne[i] = db.quote(new_personne[i], "text")
                                        
                        for i in range(0, len(new_adresse)):                
                                new_adresse[i] = db.quote(new_adresse[i], "text")
                else:       
                        pb = 1
                        
        if pb:
                print ("probleme longueur: ", len(champs))
                pb = 0
        else:
                insert_fiche="INSERT INTO fiche (numero_adherent,titre,nom,prenom,cotisation,structure,fonction,specialite,identifiant,type_entree, type_personne) VALUES ("
                insert_fiche = insert_fiche+string.join(new_personne, ', ')
                insert_fiche = insert_fiche + ");"
                
                insert_adresse = "INSERT INTO adresse (adresse_1,adresse_2,code,ville,pays,telephone_1,email,identifiant, ordre) VALUES ("
                insert_adresse = insert_adresse+string.join(new_adresse, ', ')
                insert_adresse = insert_adresse + ");"
                
                try:
                        db.query(insert_fiche)
                        db.query(insert_adresse)
                        cpt=cpt +1
                except:
                        print ("probleme ligne", insert_fiche, "###", insert_adresse)
                        

                        
                        
                        
print(cpt, "adherents inseres")



#db.query("VACUUM;")





