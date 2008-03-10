#! /usr/bin/env python
# -*- coding: utf-8 -*-
#
# montbego - (c) 1999      Jerome ALET <alet@unice.fr>
#                1999-2000 Rachel VAUDRON <rachel@cleo.unice.fr>
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2.0
# or, at your option, any higher version.
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#
# $Id: face.py,v 1.1.1.1 2000/11/06 08:33:17 jerome Exp $
#
# $Log: face.py,v $
# Revision 1.1.1.1  2000/11/06 08:33:17  jerome
# Reintroduction dans CVS apres modifs
#
# Revision 1.9  2000/05/30 15:24:07  rachel
# ajout de champs dans bego.sql concerant le type d'association et
# la description d'elements naturels
# mise de taille moyenne par defaut dans photo
# modif de roche pour que remarquable fonctionne
# modif de zone ?
# modif de face ( ajout des elements naturels, et du contenu de direction
# modif de figure modif style, dimension, direction=orientation
#
# Revision 1.8  2000/05/28 17:01:14  jerome
# Mise en place des liens parents/enfants et suppression (par test uniquement,
# le code reste en place) de l'affichage complet tel qu'il existait avant
#
# Revision 1.7  2000/05/27 13:58:58  jerome
# Integration du message de Log
#

import os
import string
import begoconf
import begodata
import figure
import afficheclefs
import re

class Face(begodata.Data) :
        #
        # le nom de la table
        __tablename__ = "face"
        __new_record__ = "Nouvelle"

        #
        # tous les champs de la table proprietaire
        __champs__ = { \
                        "zone"         : { "type" : "decimal", "default" : 0, "mandatory" : 1 }, \
                        "groupe"       : { "type" : "decimal", "default" : 0, "mandatory" : 1 }, \
                        "roche"        : { "type" : "text"   , "default" : "", "mandatory" : 1 }, \
                        "face"         : { "type" : "text"   , "default" : "", "mandatory" : 1 }, \
                        "type"         : { "type" : "text"   , "default" : "", "mandatory" : 0 }, \
                        "forme"        : { "type" : "text"   , "default" : "", "mandatory" : 0 }, \
                        "longueur"     : { "type" : "decimal", "default" : 0, "mandatory" : 0 }, \
                        "largeur"      : { "type" : "decimal", "default" : 0, "mandatory" : 0 }, \
                        "couleur"      : { "type" : "text"   , "default" : "", "mandatory" : 0 }, \
                        "aspect"       : { "type" : "text"   , "default" : "", "mandatory" : 0 }, \
                        "decrochement" : { "type" : "bool"   , "default" : "f", "mandatory" : 0 }, \
                        "fissure"      : { "type" : "bool"   , "default" : "f", "mandatory" : 0 }, \
                        "microflore"   : { "type" : "bool"   , "default" : "f", "mandatory" : 0 }, \
                        "nodule"       : { "type" : "bool"   , "default" : "f", "mandatory" : 0 }, \
                        "trou"         : { "type" : "bool"   , "default" : "f", "mandatory" : 0 }, \
                        "erosion"      : { "type" : "text"   , "default" : "f", "mandatory" : 0 }, \
                        "desquamation" : { "type" : "text"   , "default" : "", "mandatory" : 0 }, \
                        "direction"    : { "type" : "text"   , "default" : "", "mandatory" : 0 }, \
                        "inclinaison"  : { "type" : "decimal", "default" : "", "mandatory" : 0 }, \
                        "orientation"  : { "type" : "text"   , "default" : "", "mandatory" : 0 }, \
                        "nbthemes"     : { "type" : "decimal", "default" : "", "mandatory" : 0},
                    }

        #
        # liste des tables enfants
        __listenfants__ = [ "figure", "historique", "association"]
        __listeparents__ = ["zone", "roche"]
        __listeclefs__ = ["zone", "groupe", "roche", "face"]
        __vraiparent__ = "roche"


        #
        # liste des seuls champs que l'on veut pouvoir modifier
        __listechamps__ = [ "zone", "groupe", "roche", "face", "longueur", "largeur", "type", "forme", "couleur", "aspect", "decrochement", "fissure","microflore","nodule","trou", "erosion", "desquamation", "direction", "inclinaison", "orientation"]

        #
        # liste des champs dans leur ordre de saisie
        __ordrechamps__ = [ "zone", "groupe", "roche", "face", "longueur", "largeur", "type", "forme",  "couleur", "aspect", "decrochement", "fissure","microflore","nodule","trou", "erosion", "desquamation","direction", "inclinaison", "orientation", "nbthemes"]

        __orderby__ = " ORDER BY zone, groupe, roche, face ASC;"

        #
        # liste des formulaires supplementaires
        __formsupp__ = [ "photoface", "figures" ]

        def zone_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                self.__doc__.tr()
                afficheclefs.display_zone(self, enreg, penreg)

        def groupe_base_to_form(self, enreg, penreg = None) :
                afficheclefs.display_groupe(self, enreg, penreg)

        def roche_base_to_form(self, enreg, penreg = None) :
            afficheclefs.display_roche(self, enreg, penreg)


        def face_base_to_form(self, enreg, penreg = None) :
                afficheclefs.display_face(self, enreg, penreg)
                self.__doc__.pop()
                afficheclefs.ajoute_ligne(self, "100%", "1", "8", "4")

        def longueur_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.push()
                self.__doc__.td(align="right", valign="middle")
                self.__doc__.u()
                self.__doc__.font("Dimensions de la face : ", size=begoconf.font_size)
                self.__doc__.pop()
                self.__doc__.push()
                self.__doc__.td(align="right", valign="middle")
                self.__doc__.font(size=begoconf.font_size)
                self.__doc__.insert_text("Longueur en cm : ")
                if enreg != None :
                        self.__doc__.text(name = "longueur", value = enreg["longueur"], size = 6, maxlength = 6)
                else :
                        self.__doc__.text(name = "longueur", size = "6", maxlength = "6", value = "")
                self.__doc__.pop()

        def largeur_base_to_form(self, enreg, penreg = None) :

                self.__doc__.push()
                self.__doc__.td(align="right", valign="middle")
                self.__doc__.font("Largeur en cm : ", size=begoconf.font_size)
                self.__doc__.font(size=begoconf.font_size)
                self.__doc__.push()
                self.__doc__.td()
                if enreg != None :
                        self.__doc__.text(name = "largeur", value = enreg["largeur"], size = 6, maxlength = 6)
                else :
                        self.__doc__.text(name = "largeur", size = "6", maxlength = "6", value = "")
                self.__doc__.pop()
                self.__doc__.pop()
                self.__doc__.pop()

        def type_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.push()
                self.__doc__.td(align="right", valign="middle")
                self.__doc__.font("Type de la face:", size=begoconf.font_size)
                self.__doc__.pop()

                self.__doc__.push()
                self.__doc__.td(align="left", valign="middle")
                self.__doc__.font(size=begoconf.font_size)

                listetypes={"T Table":"T","M Marche":"M","S Sol":"S","P Paroi":"P","D Dalle":"D","O dOme":"O"}
                afficheclefs.liste_deroulante(self.__doc__,  "type", listetypes, enreg)
                self.__doc__.pop()

        def forme_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                self.__doc__.td(align="right", valign="middle")
                self.__doc__.font("Forme de la face : ", size=begoconf.font_size)
                self.__doc__.pop()

                self.__doc__.push()
                self.__doc__.td(align="left", valign="middle")
                self.__doc__.font(size=begoconf.font_size)
                listeformes={"D arronDie":"D","O Ovale":"O","R Rectang.":"R","C Carrée":"C","T Trapèz.":"T"}
                afficheclefs.liste_deroulante(self.__doc__, "forme", listeformes, enreg)
                self.__doc__.pop()
                self.__doc__.pop()

        def couleur_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.push()
                self.__doc__.td(align="right", valign="middle")
                self.__doc__.font("Couleur : ", size=begoconf.font_size)
                self.__doc__.pop()

                self.__doc__.push()
                self.__doc__.td(align="left", valign="middle")
                self.__doc__.font(size=begoconf.font_size)
                listecouleurs={"B Blanc":"B","G Gris":"G","VE VErt":"VE","O Orange":"O","BR BRun":"BR","RO ROse":"RO","R Rouge":"R","VI VIolet":"VI","GO Gris Orangé":"GO","GR Gris Rouge":"GR","GVE Gris VErt":"GVE","GVI Gris VIolet":"GVI"}
                afficheclefs.liste_deroulante(self.__doc__,  "couleur", listecouleurs, enreg)
                self.__doc__.pop()

        def aspect_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                self.__doc__.td(align="right", valign="middle")
                self.__doc__.font("Aspect de la surface : ",size=begoconf.font_size )
                self.__doc__.pop()

                self.__doc__.push()
                self.__doc__.td(align="left", valign="middle")
                self.__doc__.font(size=begoconf.font_size)
                listeaspects={"L Lisse":"L","R Rugueux":"R"}
                afficheclefs.liste_deroulante(self.__doc__,  "aspect", listeaspects, enreg)
                self.__doc__.pop()
                self.__doc__.pop()
                afficheclefs.ajoute_ligne_vide(self, "8", "4")


        def decrochement_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.push()
                self.__doc__.td(align="right", valign="middle")
                self.__doc__.u()
                self.__doc__.font("Eléments naturels : ", size=begoconf.font_size)
                self.__doc__.pop()

                self.__doc__.push()
                self.__doc__.td(align = "left", valign="middle")
                self.__doc__.font(size=begoconf.font_size)

                if enreg != None :
                    if enreg["decrochement"] == 't':
                        self.__doc__.checkbox_checked(name = "decrochement")
                    else :
                        self.__doc__.checkbox(name = "decrochement") # 'f' ou vide
                        #self.__doc__.option("decrochement", value = 'f')
                else :
                    self.__doc__.checkbox(name = "decrochement")         # 'f' est la valeur par defaut

                self.__doc__.insert_text("Décrochement")

                self.__doc__.pop()


        def fissure_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                self.__doc__.td(valign = "middle", align="left")
                self.__doc__.font(size=begoconf.font_size)

                if enreg != None :
                        if enreg["fissure"] == 't' :
                                self.__doc__.checkbox_checked(name = "fissure")
                        else :
                                self.__doc__.checkbox(name = "fissure") # 'f' ou vide
                else :
                        self.__doc__.checkbox(name = "fissure")         # 'f' est la valeur par defaut

                self.__doc__.insert_text("Fissure")
                self.__doc__.pop()

        def microflore_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                self.__doc__.td(valign = "middle", align="left")
                self.__doc__.font(size=begoconf.font_size)

                if enreg != None :
                        if enreg["microflore"] == 't' :
                                self.__doc__.checkbox_checked(name = "microflore")
                        else :
                                self.__doc__.checkbox(name = "microflore") # 'f' ou vide
                else :
                        self.__doc__.checkbox(name = "microflore")         # 'f' est la valeur par defaut

                self.__doc__.insert_text("Microflore")
                self.__doc__.pop()
                self.__doc__.pop()


        def nodule_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.push()
                self.__doc__.td(align="right", valign="middle")
                self.__doc__.pop()

                self.__doc__.push()
                self.__doc__.td(valign = "middle", align="left")
                self.__doc__.font(size=begoconf.font_size)

                if enreg != None :
                        if enreg["nodule"] == 't':
                                self.__doc__.checkbox_checked(name = "nodule")
                        else :
                                self.__doc__.checkbox(name = "nodule") # 'f' ou vide
                else :
                        self.__doc__.checkbox(name = "nodule")         # 'f' est la valeur par defaut

                self.__doc__.insert_text("Nodule")
                self.__doc__.pop()

        def trou_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                self.__doc__.td(valign = "middle", align="left")
                self.__doc__.font(size=begoconf.font_size)

                if enreg != None :
                        if enreg["trou"] == 't' :
                                self.__doc__.checkbox_checked(name = "trou")
                        else :
                                self.__doc__.checkbox(name = "trou") # 'f' ou vide
                else :
                        self.__doc__.checkbox(name = "trou")         # 'f' est la valeur par defaut

                self.__doc__.insert_text("Trou")
                self.__doc__.pop()
                self.__doc__.pop()
                afficheclefs.ajoute_ligne_vide(self, "8", "4")


        def erosion_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                self.__doc__.tr()

                self.__doc__.push()
                self.__doc__.td(align="right", valign="middle")
                self.__doc__.u()
                self.__doc__.font("Etat de conservation : ", size=begoconf.font_size)
                self.__doc__.pop()

                self.__doc__.push()
                self.__doc__.td(align="right", valign="middle")
                self.__doc__.font("Erosion: ", size=begoconf.font_size )

                liste={"NE Non Erodée":"NE","E Erodée": "E","TE Très Erodée" : "TE"}
                self.__doc__.font(size=begoconf.font_size)
                afficheclefs.liste_deroulante(self.__doc__, "erosion", liste, enreg)
                self.__doc__.pop()

        def desquamation_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                self.__doc__.td(align="right", valign="middle")
                self.__doc__.font("Desquamation : ",size=begoconf.font_size )
                self.__doc__.pop()

                self.__doc__.push()
                self.__doc__.td(align="left", valign="middle")
                self.__doc__.font(size=begoconf.font_size)
                liste={"ND Non D": "ND","D   Desquamée": "D","TD Très D" : "TD"}
                afficheclefs.liste_deroulante(self.__doc__, "desquamation", liste, enreg)
                self.__doc__.pop()

                self.__doc__.pop()

        def direction_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                self.__doc__.tr()

                self.__doc__.push()
                self.__doc__.td(align="right", valign="middle")
                self.__doc__.font("Direction et inclinaison : ", size=begoconf.font_size)
                self.__doc__.pop()

                self.__doc__.push()
                self.__doc__.td(align="left", valign="middle")
                self.__doc__.font(size=begoconf.font_size)
                #listedirections={"N":"N","NE":"NE","E":"E","SE":"SE","S":"S","SO":"SO","O":"O","NO":"NO"}
                listedirections={"N":"N","NE":"NE","E":"E","SE":"SE","S":"S","SW":"SW","W":"W","NW":"NW"}
                afficheclefs.liste_deroulante(self.__doc__,  "direction", listedirections, enreg)
                #self.__doc__.pop()


        def inclinaison_base_to_form(self, enreg, penreg = None) :
                #self.__doc__.push()
                #self.__doc__.td(align="left", valign="middle")
                self.__doc__.font(size=begoconf.font_size)
                if enreg != None :
                        self.__doc__.text(name = "inclinaison", value = enreg["inclinaison"], size = 7, maxlength = 7)
                else :
                        self.__doc__.text(name = "inclinaison", size = "3", maxlength = "3", value = "")
                self.__doc__.pop()

        def orientation_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                self.__doc__.td(align="right", valign="middle")
                self.__doc__.font("Orientation : ",size=begoconf.font_size )
                self.__doc__.pop()

                self.__doc__.push()
                self.__doc__.td(align="left", valign="middle")
                self.__doc__.font(size=begoconf.font_size)
                #Modifié pour ajouter des direction "inversées" à la demande des utilisateurs
                #listeorientations={"NS":"NS","EO":"EO","NESO":"NESO","NOSE":"NOSE"}
                listeorientations={"NS":"NS","SN":"SN","EW":"EW","WE":"WE","NWSE":"NWSE","NESW":"NESW","SWNE":"SWNE","SENW":"SENW"}
                afficheclefs.liste_deroulante(self.__doc__,  "orientation", listeorientations, enreg)
                self.__doc__.pop()
                self.__doc__.pop()


###################################################################################################################
#                                       CHAMPS EN SORTIE UNIQUEMENT
###################################################################################################################
        def nbthemes_base_to_form(self, enreg, penreg = None) :
                if enreg != None:
                        total = 0
                        self.__doc__.br()
                        self.__doc__.push()
                        self.__doc__.tr()
                        self.__doc__.td(align="center", valign="middle", colspan ="5")
                        self.__doc__.font(size=begoconf.font_size)

                        self.__doc__.push()

                        self.__doc__.table(border = "2", cellspading = "0", cellspacing = "0", bgcolor = begoconf.basform_bgcolorright )
                        self.__doc__.font(size=begoconf.font_size)

                        self.__doc__.push()
                        self.__doc__.caption()
                        self.__doc__.font(size=begoconf.font_size)
                        self.__doc__.b("Thèmes :")
                        self.__doc__.pop()
################################################
                        id = self.__db__.query("SELECT identite FROM figure WHERE zone = " + self.__db__.quote(enreg["zone"], "decimal") + " AND groupe = " + self.__db__.quote(enreg["groupe"], "decimal") + " AND roche = " + self.__db__.quote(enreg["roche"], "text") + " AND face = " + self.__db__.quote(enreg["face"], "text") + ";" )
                        id = id.dictresult()
                        nbreticule   = 0
                        nbfigurative = 0
                        nbsinueuse   = 0
                        nbzigzag     = 0
                        nbcupulee    = 0
                        nbplager     = 0
                        nbplagem     = 0
                        nbplage      = 0
                        nbcupulej    = 0
                        nbcercle     = 0
                        nbcorniforme = 0
                        nbpoignard   = 0
                        nbhallebarde = 0
                        nbhache      = 0
                        nbhomme      = 0
                        nbattelage   = 0
                        nbgeocomp    = 0
                        nbrectangle  = 0
                        nbspirale    = 0
                        nbcroix      = 0
                        nbrouelle    = 0
                        nbreticulea  = 0
                        nbbarre      = 0
                        nbgroupe     = 0

                        for i in range(0,len(id)) :
                                identite = id[i]['identite']
                                lgid = len(identite)
                                if (lgid > 1):
                                        if ((identite[0] =='A') and (identite[1] == 'h')):
                                                nbhache = nbhache + 1

                                        elif (identite[0] == 'C'):
                                                nbcorniforme = nbcorniforme + 1

                                        elif (identite[0] =='F'):
                                                nbhallebarde = nbhallebarde + 1

                                        elif (identite[0] == 'H'):
                                                nbhomme = nbhomme + 1

                                        elif (identite[0] =='N'):
                                                if (identite[1] == 'b'):
                                                        nbfigurative = nbfigurative + 1
                                                        for j in range(2, lgid):
                                                                if (identite[j] == 's') :
                                                                        nbsinueuse = nbsinueuse + 1
                                                                elif (identite[j] == 'z'):
                                                                        nbzigzag = nbzigzag + 1
                                                elif (identite[1] == 'p'):
                                                        if (lgid > 4) and (identite[4] == 'r') :
                                                                nbplager = nbplager + 1
                                                        if (lgid > 2) and (identite[2] == 'm'):
                                                                nbplagem = nbplagem + 1
                                                        if (lgid > 3) and (identite[3] == '1'):
                                                                nbcupulej = nbcupulej + 1
                                                        elif (lgid > 3) and (identite[3] == '2'):
                                                                nbcupulee = nbcupulee +1
                                        elif (identite[0] == 'P'):
                                                nbpoignard = nbpoignard + 1

                                        elif (identite[0] =='R'):
                                                if (identite[1] == 'a'):
                                                        nbreticulea = nbreticulea + 1
                                                elif (identite[1] == 'p'):
                                                        nbgeocomp = nbgeocomp + 1
                                                elif (identite[1] == 's'):
                                                        if (lgid > 2) and (identite[2] == 'f'):
                                                                if (lgid > 3) and (identite[3] == '1'):
                                                                        nbcercle = nbcercle +1
                                                                elif (lgid > 3) and (identite[3] == '2'):
                                                                        nbrectangle = nbrectangle + 1
                                                        elif (lgid > 2) and (identite[2] == 'r'):
                                                                if (lgid > 3) :
                                                                        if (identite[3] == '1'):
                                                                                nbcoix = nbcroix + 1
                                                                        elif (identite[3] == '3'):
                                                                                nbrouelle = nbrouelle + 1
                                                                        elif (identite[3] == '5'):
                                                                                nbspirale = nbspirale + 1
                                                elif (identite[1] == 'r'):
                                                        nbreticule = nbreticule + 1

                                        elif (identite[0] =='T'):
                                                nbattelage = nbattelage + 1

                                        nbbarre = nbfigurative - nbsinueuse - nbzigzag
                                        nbgroupe = nbcupulee - nbplager - nbplagem
                                        nbplage = nbcupulej - nbplager

                        #######################
                        self.__doc__.push()
                        self.__doc__.tr()

                        self.__doc__.push()
                        self.__doc__.td()
                        self.__doc__.font(size=begoconf.font_size)
                        self.__doc__.insert_text("Corniforme : ")
                        self.__doc__.insert_text(nbcorniforme)
                        self.__doc__.pop()

                        self.__doc__.push()
                        self.__doc__.td()
                        self.__doc__.font(size=begoconf.font_size)
                        self.__doc__.insert_text("Poignards : ")
                        self.__doc__.insert_text(nbpoignard)
                        self.__doc__.pop()

                        self.__doc__.push()
                        self.__doc__.td()
                        self.__doc__.font(size=begoconf.font_size)
                        self.__doc__.insert_text("Hallebardes : ")
                        self.__doc__.insert_text(nbhallebarde)
                        self.__doc__.pop()

                        self.__doc__.push()
                        self.__doc__.td()
                        self.__doc__.font(size=begoconf.font_size)
                        self.__doc__.insert_text("Haches : ")
                        self.__doc__.insert_text(nbhache)
                        self.__doc__.pop()
                        self.__doc__.pop()

                        #####################

                        self.__doc__.push()
                        self.__doc__.tr()
                        self.__doc__.push()
                        self.__doc__.td()
                        self.__doc__.font(size=begoconf.font_size)
                        self.__doc__.insert_text("Antropomorphes : ")
                        self.__doc__.insert_text(nbhomme)
                        self.__doc__.pop()

                        self.__doc__.push()
                        self.__doc__.td()
                        self.__doc__.font(size=begoconf.font_size)
                        self.__doc__.insert_text("Attelages : ")
                        self.__doc__.insert_text(nbattelage)
                        self.__doc__.pop()

                        self.__doc__.push()
                        self.__doc__.td()
                        self.__doc__.font(size=begoconf.font_size)
                        self.__doc__.insert_text("Fig géo composées : ")
                        self.__doc__.insert_text(nbgeocomp)
                        self.__doc__.pop()

                        self.__doc__.push()
                        self.__doc__.td()
                        self.__doc__.font(size=begoconf.font_size)
                        self.__doc__.insert_text("Barres : ")
                        self.__doc__.insert_text(nbbarre)
                        self.__doc__.pop()
                        self.__doc__.pop()

                        #####################
                        self.__doc__.push()
                        self.__doc__.tr()
                        self.__doc__.push()
                        self.__doc__.td()
                        self.__doc__.font(size=begoconf.font_size)
                        self.__doc__.insert_text("Cercles : ")
                        self.__doc__.insert_text(nbcercle)
                        self.__doc__.pop()

                        self.__doc__.push()
                        self.__doc__.td()
                        self.__doc__.font(size=begoconf.font_size)
                        self.__doc__.insert_text("Rectangles : ")
                        self.__doc__.insert_text(nbrectangle)
                        self.__doc__.pop()

                        self.__doc__.push()
                        self.__doc__.td()
                        self.__doc__.font(size=begoconf.font_size)
                        self.__doc__.insert_text("Spirales : ")
                        self.__doc__.insert_text(nbspirale)
                        self.__doc__.pop()

                        self.__doc__.push()
                        self.__doc__.td()
                        self.__doc__.font(size=begoconf.font_size)
                        self.__doc__.insert_text("Croix : ")
                        self.__doc__.insert_text(nbcroix)
                        self.__doc__.pop()
                        self.__doc__.pop()

                        #####################
                        self.__doc__.push()
                        self.__doc__.tr()
                        self.__doc__.push()
                        self.__doc__.td()
                        self.__doc__.font(size=begoconf.font_size)
                        self.__doc__.insert_text("Rouelles : ")
                        self.__doc__.insert_text(nbrouelle)
                        self.__doc__.pop()

                        self.__doc__.push()
                        self.__doc__.td()
                        self.__doc__.font(size=begoconf.font_size)
                        self.__doc__.insert_text("Réticulés : ")
                        self.__doc__.insert_text(nbreticule)
                        self.__doc__.pop()

                        self.__doc__.push()
                        self.__doc__.td()
                        self.__doc__.font(size=begoconf.font_size)
                        self.__doc__.insert_text("Réticulé à appendice : ")
                        self.__doc__.insert_text(nbreticulea)
                        self.__doc__.pop()

                        self.__doc__.push()
                        self.__doc__.td()
                        self.__doc__.font(size=begoconf.font_size)
                        self.__doc__.insert_text("Plages rectangulaires : ")
                        self.__doc__.insert_text(nbplager)
                        self.__doc__.pop()
                        self.__doc__.pop()

                        ##################
                        self.__doc__.push()
                        self.__doc__.tr()
                        self.__doc__.push()
                        self.__doc__.td()
                        self.__doc__.font(size=begoconf.font_size)
                        self.__doc__.insert_text("Lignes sinueuses : ")
                        self.__doc__.insert_text(nbsinueuse)
                        self.__doc__.pop()

                        self.__doc__.push()
                        self.__doc__.td()
                        self.__doc__.font(size=begoconf.font_size)
                        self.__doc__.insert_text("Zig-Zag : ")
                        self.__doc__.insert_text(nbzigzag)
                        self.__doc__.pop()

                        self.__doc__.push()
                        self.__doc__.td()
                        self.__doc__.font(size=begoconf.font_size)
                        self.__doc__.insert_text("Groupes de cupules : ")
                        self.__doc__.insert_text(nbgroupe)
                        self.__doc__.pop()

                        self.__doc__.push()
                        self.__doc__.td()
                        self.__doc__.font(size=begoconf.font_size)
                        self.__doc__.insert_text("Plages de cupules : ")
                        self.__doc__.insert_text(nbplage)
                        self.__doc__.pop()
                        self.__doc__.pop()


                        #####################
                        self.__doc__.push()
                        self.__doc__.tr()
                        self.__doc__.push()
                        self.__doc__.td()
                        self.__doc__.font(size=begoconf.font_size)
                        self.__doc__.insert_text("Autres : ")
                        totaltheme = nbcorniforme + nbpoignard + nbhallebarde + nbhache + nbhomme + nbattelage + nbgeocomp + nbbarre + nbcercle +nbrectangle + nbspirale + nbcroix + nbrouelle + nbreticule + nbreticulea + nbplager + nbsinueuse + nbzigzag + nbgroupe + nbplage
                        nbautre = len(id) - totaltheme
                        self.__doc__.insert_text(nbautre)
                        self.__doc__.pop()

                        self.__doc__.push()
                        self.__doc__.td()
                        self.__doc__.font(size=begoconf.font_size)
                        self.__doc__.insert_text("&nbsp;")
                        self.__doc__.pop()

                        self.__doc__.push()
                        self.__doc__.td()
                        self.__doc__.font(size=begoconf.font_size)
                        self.__doc__.insert_text("&nbsp;")
                        self.__doc__.pop()

                        self.__doc__.push()
                        self.__doc__.td()
                        self.__doc__.font(size=begoconf.font_size)
                        self.__doc__.insert_text("&nbsp;")
                        self.__doc__.pop()
                        self.__doc__.pop()

                        self.__doc__.pop()
                        self.__doc__.pop()



##################################################################################################################
#                                               PHOTOS
##################################################################################################################
        def liste_photoface(self, enreg) :
                resp = self.__db__.query("SELECT * FROM photoface WHERE zone = " + self.__db__.quote(enreg["zone"], "decimal") + " AND groupe = " + self.__db__.quote(enreg["groupe"], "decimal") + " AND roche = " + self.__db__.quote(enreg["roche"], "text") + " AND face = " + self.__db__.quote(enreg["face"], "text")  + " ORDER BY idphoto ASC;")
                resp = resp.dictresult()
                lg = len(resp)
                if lg :
                        self.__doc__.push()
                        self.__doc__.div(align = "center")
                        if lg > 1 :
                                s = "s"
                        else :
                                s = ""
                        self.__doc__.font(`lg` + " photo" + s, color = "red")
                        self.__doc__.pop()

                        self.__doc__.push()
                        self.__doc__.table(border = "0", cellpadding = "0", cellspacing = "0")
                        for photo in resp :
                                self.__doc__.push()
                                self.__doc__.tr()
                                self.__doc__.td()
                                self.__doc__.form(method = "POST", action =  begoconf.script_location("modphoto"))
                                self.__doc__.table(border = 5, cellpadding = 5, cellspacing = 5)
                                self.__doc__.tr()

                                self.__doc__.push()
                                self.__doc__.td()
                                self.__doc__.table(border = 0, cellpadding = 0, cellspacing = 0)

                                self.__doc__.push()
                                self.__doc__.tr()
                                self.__doc__.td(valign = "middle", align = "center")
                                photo_url = begoconf.images_location + "Z" + `enreg["zone"]` + "/G" + `enreg["groupe"]` + "/R" + enreg["roche"] + "/F" + enreg["face"] + "/" + `photo["idphoto"]`
                                self.__doc__.a(href = photo_url + ".jpeg")
                                xmax,ymax = begoconf.get_imagesize(begoconf.image_fullname("Z" + `enreg["zone"]` + os.sep + "G" + `enreg["groupe"]` + os.sep + "R" +  enreg["roche"] + os.sep + "F" +  enreg["face"] + os.sep + `photo["idphoto"]` + "s.jpeg"))
                                self.__doc__.img(src = photo_url + "s.jpeg", width=xmax, height=ymax)
                                self.__doc__.pop()

                                self.__doc__.tr()
                                self.__doc__.td(valign="middle", align="center")
                                self.__doc__.font(size=begoconf.font_size)
                                self.__doc__.textarea(name = "legende", rows="4", cols="50", wrap="physical")
                                self.__doc__.insert_text(photo["legende"])
                                self.__doc__.pop()

                                self.__doc__.td(bgcolor = begoconf.basform_bgcolorright, valign= "middle", align = "center")
                                self.__doc__.font(size = begoconf.font_size)
                                self.__doc__.hidden(name = "idphoto", value = photo["idphoto"])
                                self.__doc__.hidden(name = "zone",    value = photo["zone"])
                                self.__doc__.hidden(name = "groupe",  value = photo["groupe"])
                                self.__doc__.hidden(name = "roche",   value = photo["roche"])
                                self.__doc__.hidden(name = "face",  value = photo["face"])
                                self.__doc__.submit(name = "action",  value = "Modifier")
                                self.__doc__.br()
                                self.__doc__.submit(name = "action",  value = "Supprimer")
                                self.__doc__.br()
                                self.__doc__.submit(name = "action",  value = "Nouvelle")

                                self.__doc__.pop()
                        self.__doc__.pop()
                else :
                        self.__doc__.push()
                        self.__doc__.form(method = "POST", action = begoconf.script_location("modphoto"))
                        self.__doc__.hidden(name = "zone", value = enreg["zone"])
                        self.__doc__.hidden(name = "groupe", value = enreg["groupe"])
                        self.__doc__.hidden(name = "roche", value = enreg["roche"])
                        self.__doc__.hidden(name = "face", value = enreg["face"])
                        self.__doc__.submit(name = "action", value = "Nouvelle photo")
                        self.__doc__.pop()
                        self.__doc__.font("aucune photo", color = "red", size = begoconf.font_size)

        def menu_photoface(self, enreg, color, function) :
                if enreg != None :
                        self.__doc__.push()
                        self.__doc__.tr()
                        self.__doc__.td(bgcolor = color, colspan = "2")
                        self.__doc__.font(size = begoconf.font_size)
                        self.__doc__.div(align = "center")
                        function(enreg)
                        self.__doc__.pop()

        def photoface(self, enreg, penreg = None) :
                self.menu_photoface(enreg, begoconf.basform_bgcolormiddle, self.liste_photoface)

##############################################################################################################################
#                                       LIEN AVEC L'ECRAN FIGURE
##############################################################################################################################
        def figures(self, enreg, penreg = None) :
                if enreg != None :
                        self.__doc__.push()
                        self.__doc__.tr()
                        self.__doc__.td(bgcolor = begoconf.basform_bgcolorcenter, colspan = "2")
                        self.__doc__.font(size = begoconf.font_size)
                        penreg = { "zone": enreg["zone"], "groupe": enreg["groupe"], "roche": enreg["roche"], "face": enreg["face"] }
                        figure.Figure(self).traite_saisie(["zone", "groupe", "roche", "face", "figure"], parent = self.__tablename__, penreg = penreg)
                        self.__doc__.pop()

##############################################################################################################################
#                                               METHODES
##############################################################################################################################

        def modifier(self) :
                """Met a jour la face courante"""
                self.__db__.query(self.make_update_query(["zone", "groupe", "roche", "face"]))
                return 0

        def supprimer(self) :
                # s'il existe des figures ou des photos sur cette face on refuse la suppression
                if self.exist(["zone", "groupe", "roche", "face"], table = "figure") or self.exist(["zone", "groupe", "roche", "face"], table = "photoface") :
                        return -1
                else :
                        z = "Z" + self.__form__["zone"].value
                        g = "G" + self.__form__["groupe"].value
                        r = "R" + self.__form__["roche"].value
                        f = "F" + self.__form__["face"].value
                        rr = begoconf.image_fullname(z + os.sep + g + os.sep + r + os.sep + f)
                        try :
                                if os.path.isdir(rr) :
                                        os.rmdir(rr)
                        except :
                                begoconf.fatalerror_message("Impossible de supprimer le repertoire [%s]" % rr)

                        # on efface la face
                        self.delete_records(["zone", "groupe", "roche", "face"])
                        return 0

        def creer(self) :
                # si la face n'existe pas déjà alors on la crée, sinon on refuse
                if self.exist(["zone", "groupe", "roche", "face"]) :
                        primarykeys = { "zone" : None, "groupe" : None, "roche": None, "face": None}
                        return (-1, primarykeys)
                else :
                        # on insère maintenant la face dans la base
                        # sauf si la roche n'existe pas.
                        if not self.exist(["zone", "groupe", "roche"], table = "roche") :
                                primarykeys = { "zone" : None, "groupe" : None, "roche": None, "face": None}
                                return (-2, primarykeys)
                        else :
                                # on insère maintenant la face dans la base
                                z = self.__form__["zone"].value
                                g = self.__form__["groupe"].value
                                r = self.__form__["roche"].value
                                f = self.__form__["face"].value
                                self.__db__.query(self.make_insert_query({ }))
                                primarykeys = { "zone" : z, "groupe" : g, "roche" : r, "face" : f }
                                return (0, primarykeys)
