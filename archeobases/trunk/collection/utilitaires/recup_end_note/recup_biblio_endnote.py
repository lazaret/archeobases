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
Correspondance =   {'Authors':'auteur', \
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
enregistrements = []
cpt = 0
new_biblio = {}

for ligne in lignes:
    if ligne :
        #s'il y a un @ en debut de ligne, il s'agit d'une nouvelle biblio
        if (ligne[0] == '@' and len(new_biblio.keys())>0):
            enregistrements.append(new_biblio)
            new_biblio = {}
            ligne = ligne[1:]
            new_biblio['type_biblio'] = string.upper(ligne)
            print "type_biblio= ", ligne
            precede = 1
    else:
        print "pb"
