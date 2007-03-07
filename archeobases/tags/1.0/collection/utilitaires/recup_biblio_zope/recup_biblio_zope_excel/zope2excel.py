#! /usr/bin/python
import urllib
# -*- coding: UTF-8 -*-
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

lignes = sys.stdin.readlines()
Liste_clefs = ['publication_type','publication_title','publication_year','publication_month','author',
               'indice','journal','chapter', \
                'volume','number','pages','series','edition','editor','publisher','chapter','booktitle', \
               'school','institution','adress','isbn','description','keywords','indice','abstract','authors']
               
enregistrements = []                     
#liste_clefs = []
cpt = 0
new_biblio = []
for ligne in lignes:
        #ligne = string.strip(ligne[:-1])
        #print "ligne:", ligne
        #ligne = unicode(ligne,'UTF-8')
        #print "ligne unicode:", ligne
        #ligne.encode('ISO-8859-15')
        #print "ligne encode:", ligne
        if ligne:
                #s'il y a un # en debut de ligne, il s'agit d'une nouvelle biblio
                if (ligne[0] == '#' and len(new_biblio)>0):
                        liste = string.join(new_biblio,'|')
                        new_biblio = []
                        cpt = cpt+1
                        print liste
                        
                # sinon s'il s'agit d'un identifiant DRET-BIB        
                elif (ligne.find(':') == -1):        
                        if (ligne[:4].upper() == 'DRET'):
                                new_biblio.append(ligne[:-1])
                else: 
                        #position du premier ':'
                        indice_1 = ligne.find(':')
                        propriete = ligne[:indice_1]
                        propriete = string.strip(propriete)
                        
                        if (propriete in Liste_clefs):
                                #position du deuxieme ':'
                                indice_2 = ligne[indice_1+1:].find(':') + indice_1  + 2
                                
                                valeur = ligne[indice_2:]
                                valeur = string.strip(valeur)
                                #valeur = valeur[:-1]
                                #valeur = valeur[1:]
                                new_biblio.append(valeur)
                                
print "nombre d'enregistrements: ",cpt
