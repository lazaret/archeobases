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
import database


sys.path.append("../cgi")
db = database.DataBase(database=sys.argv[1], username = "postgres")
lignes = sys.stdin.readlines()
Correspondance =   {'publication_type':'type_biblio', \
                    'publication_title':'titre', \
                    'publication_year':'annee', \
                    'abstract':'resume', \
                    'publication_month':'mois', \
                    'journal':'journal', \
                    'volume':'volume', \
                    'number':'nombre_volume', \
                    'pages':'pages', \
                    'series':'serie', \
                    'edition':'edition', \
                    'editor':'redacteur', \
                    'publisher':'editeur', \
                    'chapter':'chapitre', \
                    'booktitle':'nom', \
                    'school':'ecole', \
                    'institution':'institution', \
                    'adress':'ville_edition', \
                    'isbn':'isbn', \
                    'description':'description', \
                    'keywords':'mots_clefs', \
                    'author':'auteur', \
                    'indice':'indice',\
                    }
enregistrements = []
cpt = 0
new_biblio = {}

for ligne in lignes:
    ligne = string.strip(ligne[:-1])
    if ligne:
        #s'il y a un ### en debut de ligne, il s'agit d'une nouvelle biblio
        if (ligne[0] == '#' and len(new_biblio.keys())>0):
            enregistrements.append(new_biblio)
            new_biblio = {}
        # sinon s'il s'agit d'un identifiant DRET-BIB
        elif (ligne.find(':') == -1):
            if (ligne[:4].upper() == 'DRET'):
                new_biblio['identifiant'] = ligne
            else:
                print "pas DRET-BIB: ", ligne
        else:
            #position du premier ':'
            indice_1 = ligne.find(':')
            #position du deuxieme ':'
            indice_2 = ligne[indice_1+1:].find(':') + indice_1  + 2
            clef = ligne[:indice_1]
            clef = string.strip(clef)
            # on cherche la correspondance de la clef dans les champs de la base
            try:
                clef = Correspondance[clef]
                valeur = ligne[indice_2:]
                valeur = string.strip(valeur)
                if valeur != '':
                    valeur = valeur[:-1]
                    valeur = valeur[1:]
                    new_biblio[clef] = valeur
            except:
                pass

for e in range (0, len(enregistrements)):
    liste_clefs = []
    liste_valeurs = []
    bib = enregistrements[e]
    for k in bib.keys():
        liste_clefs.append(k)
        liste_valeurs.append(bib[k])
        if k == 'identifiant':
            id = bib[k]
    db.query("SET CLIENT_ENCODING TO UTF8;")
    # s'il existe deja un objet collection avec cet identifiant, on refuse l'insertion
    # sinon on insere
    verify = "select * from objet where identifiant=" + db.quote(id,"text") + ";"
    existe = db.query(verify)
    existe = existe.dictresult()
    insert_objet = "INSERT INTO objet(identifiant,type_objet) VALUES ("
    insert_objet = insert_objet + db.quote(id,"text") + "," + db.quote("BIBLIO", "text") + ");"
    if existe:
        print "############ PB DOUBLON COLLECTION ############"
        print enregistrements[e]
    else:
        try:
            db.query(insert_objet)
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
            db.query(insert_biblio)
        except:
            print ("probleme biblio", insert_biblio)

