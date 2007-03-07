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
Correspondance = {      'publication_type':'type_biblio', \
                        'publication_itle':'titre', \
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
                 }
enregistrements = []                     
cpt = 0
for ligne in lignes:
        ligne = string.strip(ligne[:-1])
        if ligne:
                #s'il y a un ### en debut de ligne, il s'agit d'une nouvelle biblio
                if (ligne[0] == '#'):
                        new_biblio = {}
                        
                # sinon s'il s'agit d'un identifiant DRET-BIB        
                elif (ligne.find(':')>0):        
                        if (ligne[:4] == 'DRET'):
                                new_biblio['identifiant'] = ligne
                                print "identifiant = ", ligne
                        else:
                                print "pas DRET-BIB"
'''                else: 
                        #position du premier ':'
                        indice_1 = ligne.find(':')
                        
                        #position du deuxieme ':'
                        indice_2 = ligne[:ligne.find+1].find(':')
                        
                        clef = ligne[:indice_1]
                        clef = string.strip(clef)
                        
                        # on cherche la correspondance de la clef dans les champs de la base
                        clef = Correspondance[clef]
                                
                        valeur = ligne[indice_2:]
                        valeur = valeur.strip(valeur)
                        
                        new_biblio[clef] = valeur
'''                        
                        
                        
for n in range (0, len(enregistrements)):
        print enregistrements[n]
        print '\n\n'        
