#! /usr/bin/python
#
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
# ./recup_biblio collection < recup_excel.csv

# Correspondance EndNote <=> table biblio de la collection
#
#       @               type_biblio
#       indice          indice
#       author          auteur
#       title           titre
#       booktitle       nom
#       publisher       editeur
#       adress          adresse
#       pages           pages
#       year            annee
#       month           mois
#       volume          nombre_volume
#       abstract        resume
#       keywords        mots_clefs
#       journal         journal 
#       institution     institution
#       school          ecole
#       series          serie
#       edition         edition
# TODO: voir si adresse = ville edition
import sys
import string

sys.path.append("../cgi")

import database

db = database.DataBase(database=sys.argv[1], username = "postgres")

lignes = sys.stdin.readlines()
Correspondance = {      'Authors':'auteur', \
                        'Title':'titre', \
                        'BookTitle':'nom', \
                        'Publisher':'editeur', \
                        'Adress':'ville_edition', \
                        'Pages':'pages', \
                        'Year':'annee', \
                        'Month':'mois', \
                        'Volume':'nombre_volume', \
                        'Abstract':'resume', \
                        'Keywords':'mots_clefs', \
                        'Journal':'journal', \
                        'Institution':'institution', \
                        'School':'ecole', \
                        'Series':'serie', \
                        'Edition':'edition', \
                 }
precedent = 0                     
k_precedente = ''
enregistrements = []                     
cpt = 0
for ligne in lignes:
        #print "ligne:",ligne
        ligne = string.strip(ligne[:-1])
        if ligne:
                #s'il y a un @ en debut de ligne, il s'agit d'une nouvelle biblio
                if (ligne[0] == '@'):
                        new_biblio = {}
                        new_biblio['type_biblio']=ligne[1:-1]
                        #print "new_biblio:type=", new_biblio['type_biblio']
                        precedent = 1
                        cpt=1
                        k_precedente=''
                        
                else: 
                        trouve = 0
                        for k in Correspondance.keys(): 
                                longueur = len(k)
                                if (ligne[0:longueur]) == k:           
                                        trouve = 1
                                        k_precedente = k
                                        ind = longueur + 4
                                        new_biblio[k] = ligne[ind:-1]
                                        print "champs:",k, "  valeur:", new_biblio[k] 
                                        
                        # dans le cas de l'indice        
                        if (trouve == 0 and precedent == 1):
                                new_biblio['indice'] = ligne[:-1]
                                #print "indice:", new_biblio['indice'] 
                                
                        #dans le cas d'un texte sur plusieurs lignes
                        elif (k_precedente !='' and ligne):
                        
                                #print "champs_precedent:",k_precedente, "  valeur:", new_biblio[k_precedente] 
                                #print "new_biblio[k_precedente]=", new_biblio[k_precedente]
                                val = new_biblio[k_precedente] + ' ' + ligne[:-1]
                                print val
                                del new_biblio[k_precedente]
                                new_biblio[k_precedente] = val
                                
                        precedent = 0
                        
                enregistrements.append(new_biblio)                        
compteur = 0
for e in range (0, len(enregistrements)):
        #print enregistrements[e]
        liste_clefs = []
        liste_valeurs = []
        bib = enregistrements[e]
        for k in bib.keys():
                liste_clefs.append(k)
                liste_valeurs.append(bib[k])
                        
        cpt = cpt+1
        ident = ""
        if cpt <10 : ident="00000"
        elif cpt>9 and cpt<100 : ident="0000" 
        elif cpt>99 and cpt<1000 : ident="000" 
        elif cpt>999 and cpt<10000 : ident="00"
        elif cpt>9999 and cpt<100000 : ident="0"
        else : ident="99999999" 
        identifiant = "DRET-MAET-" + ident + str(cpt)
#        print "identifiant", identifiant
        
        db.query("SET CLIENT_ENCODING TO UTF8;")                
        # s'il existe deja un objet collection avec cet entifiant, on refuse l'insertion                
        # sinon on insere
        verify = "select * from objet where identifiant=" + db.quote(identifiant,"text") + ";"                 
        #count = db.query(verify)
        existe = db.query(verify)
        #print "existe : ", existe
        existe = existe.dictresult()
        
        insert_objet = "INSERT INTO objet(identifiant,type_objet) VALUES ("
        insert_objet = insert_objet + db.quote(identifiant,"text") + "," + db.quote("BIBLIO", "text") + ");"
        if existe:
                print "############ PB DOUBLON COLLECTION ############"
                print enregistrements[e]
        else:
                try:
                        print "insert objet", insert_objet
                       # db.query(insert_objet)
                except:
                        print ("probleme objet ", insert_objet)
        
        # s'il existe deja un objet biblio avec cet identifiant, on refuse l'insertion
        # sinon on insere
        verify2 = "select * from biblio where identifiant=" + db.quote(id,"text") + ";"                 
        existe2 = db.query(verify2)
        
        existe2 = existe2.dictresult()
        
        insert_biblio = "INSERT INTO biblio (" + string.join(liste_clefs, ',')
        insert_biblio = insert_biblio + ") VALUES (" + ",".join([db.quote(v, "text") for v in liste_valeurs])
        insert_biblio = insert_biblio + ");"
        
        if existe2:
                print "############ PB DOUBLON COLLECTION ############"
                print enregistrements[e]
        else:
                try:
                        print "insert biblio", insert_biblio
                       # db.query(insert_biblio)
                except:
                        print ("probleme biblio", insert_biblio)
