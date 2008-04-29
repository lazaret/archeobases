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
# a utiliser comme suit:
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
precede = 0                     
suit = 0
enregistrements = []                     
cpt = 0
new_biblio = {}
for ligne in lignes:
        ligne = string.strip(ligne[:-1])
        if ligne :
                #s'il y a un @ en debut de ligne, il s'agit d'une nouvelle biblio
                if (ligne[0] == '@'): 
                        if (len(new_biblio)>0):
                                enregistrements.append(new_biblio)
                        new_biblio = {}
                        ligne = ligne[1:]
                        new_biblio['type_biblio'] = string.upper(ligne)
                        print "nouvelle biblio"
                        precede = 1
                        suit = 0
                        
                        
                # sinon s'il n'y a pas de =, il s'agit d'un indice
                elif ((ligne.find('=')== -1) and (precede == 1) and (suit == 0)):        
                        new_biblio['indice'] = ligne
                        print "indice = ",ligne
                        precede = 0
                elif precede == 0: 
                        #position du '='
                        indice_1 = ligne.find('=')
                        
                        clef = ligne[:indice_1]
                        clef = string.strip(clef)
                        print "clef = ", clef
                        
                        # on cherche la correspondance de la clef dans les champs de la base
                        try:
                                clef = Correspondance[clef]
                                print "clef = ", clef
                                valeur = ligne[indice_1:]
                                valeur = string.strip(valeur)
                                valeur = valeur[:-1]
                                valeur = valeur[3:]
                                print "valeur = ", valeur
                                new_biblio[clef] = valeur
                                suit = 1
                                
                        except:        
                                print "clef non prise en compte = ", clef
compteur = 0
for e in range (0, len(enregistrements)):
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
        
        db.query("SET CLIENT_ENCODING TO UTF8;")                
        # s'il existe deja un objet collection avec cet entifiant, on refuse l'insertion                
        # sinon on insere
        verify = "select * from objet where identifiant=" + db.quote(identifiant,"text") + ";"                 
        existe = db.query(verify)
        existe = existe.dictresult()
        
        insert_objet = "INSERT INTO objet(identifiant,type_objet) VALUES ("
        insert_objet = insert_objet + db.quote(identifiant,"text") + "," + db.quote("BIBLIO", "text") + ");"
        if existe:
                print "############ PB DOUBLON COLLECTION ############"
                print enregistrements[e]
        else:
                try:
                        print "insert objet", insert_objet
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
                except:
                        print ("probleme biblio", insert_biblio)
