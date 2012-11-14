#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Mont Bego - (c) 1999-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#

import os
import begoconf
import begodata
import afficheclefs


class Figure(begodata.Data):
    #
    # le nom de la table
    __tablename__ = "figure"
    __new_record__ = "Nouvelle"
    #
    # tous les champs de la table proprietaire
    __champs__ = {
                "zone"         :{"type": "decimal", "default": 0,  "mandatory": 1},
                "groupe"       :{"type": "decimal", "default": 0,  "mandatory": 1},
                "roche"        :{"type": "text",    "default": "", "mandatory": 1},
                "face"         :{"type": "text",    "default": "", "mandatory": 1},
                "figure"       :{"type": "text",    "default": "", "mandatory": 1},
                "carre"        :{"type": "text",    "default": "", "mandatory": 0},
                "identite"     :{"type": "text",    "default": "", "mandatory": 0},
                "signe"        :{"type": "text",    "default": "", "mandatory": 0},
                "style"        :{"type": "text",    "default": "", "mandatory": 0},
                "longueur"     :{"type": "decimal", "default": 0,  "mandatory": 0},
                "largeur"      :{"type": "decimal", "default": 0,  "mandatory": 0},
                "sens"         :{"type": "text",    "default": "", "mandatory": 0},
                "cardinale"    :{"type": "text",    "default": "", "mandatory": 0},
                "geographique" :{"type": "text",    "default": "", "mandatory": 0},
                "qualite"      :{"type": "text",    "default": "", "mandatory": 0},
                "contour"      :{"type": "text",    "default": "", "mandatory": 0},
                "debord"       :{"type": "text",    "default": "", "mandatory": 0},
                "profil"       :{"type": "text",    "default": "", "mandatory": 0},
                "strie"        :{"type": "text",    "default": "", "mandatory": 0},
                "alignement"   :{"type": "text",    "default": "", "mandatory": 0},
                "surface"      :{"type": "text",    "default": "", "mandatory": 0},
                "bavure"       :{"type": "text",    "default": "", "mandatory": 0},
                "perif"        :{"type": "text",    "default": "", "mandatory": 0},
                "raclage"      :{"type": "text",    "default": "", "mandatory": 0},
                "forme"        :{"type": "text",    "default": "", "mandatory": 0},
                "profondeur"   :{"type": "text",    "default": "", "mandatory": 0},
                "taille"       :{"type": "text",    "default": "", "mandatory": 0},
                "disposition"  :{"type": "text",    "default": "", "mandatory": 0},
                "description"  :{"type": "text",    "default": "", "mandatory": 0},
                "conti"        :{"type": "text",    "default": "", "mandatory": 0},
                }

    __listeparents__  = ("zone", "roche", "face")
    __listeclefs__ = ("zone", "groupe", "roche", "face", "figure")
    __vraiparent__ = "face"
    #
    # liste des seuls champs que l'on veut pouvoir modifier
    __listechamps__ = ("zone", "groupe", "roche", "face", "figure", "carre", "identite", "signe", "style", "sens", "longueur", "largeur", "cardinale", "geographique", "qualite", "contour", "debord", "profil", "strie", "alignement", "surface", "perif", "raclage", "forme", "profondeur", "taille", "bavure", "disposition", "description", "conti")
    #
    # liste des champs dans leur ordre de saisie
    __ordrechamps__ = ("zone", "groupe", "roche", "face", "figure", "carre", "identite", "conti", "signe", "style", "sens", "longueur", "largeur", "cardinale", "geographique", "qualite", "contour", "debord", "profil", "strie", "alignement", "surface", "perif", "raclage", "forme", "profondeur", "taille", "bavure", "disposition", "description")
    __orderby__ = " ORDER BY zone, groupe, roche, face, figure ASC;"
    #
    # liste des formulaires supplementaires
    __formsupp__ = ("photofigure",)

    def zone_base_to_form(self, enreg, penreg = None):
        self.__doc__.push()
        self.__doc__.tr()
        afficheclefs.display_zone(self, enreg, penreg)

    def groupe_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_groupe(self, enreg, penreg)

    def roche_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_roche(self, enreg, penreg)

    # cas particulier on peut changer la face d'une figure !
    def face_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_face_2(self, enreg, penreg)

    def figure_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_figure(self.__doc__, enreg, penreg)
        self.__doc__.pop()
        afficheclefs.ajoute_ligne(self, "100%", "1", "8", "6")

    def carre_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("Carré:", size=begoconf.font_size)
        self.__doc__.font(size=begoconf.font_size)
        if enreg != None:
            self.__doc__.text(name="carre", value=enreg["carre"], size=3, maxlength=3)
        else:
            self.__doc__.text(name="carre", size="3", maxlength="3", value="")
        self.__doc__.pop()

    def identite_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("Identification:", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle")
        self.__doc__.font(size=begoconf.font_size)
        if enreg != None:
            self.__doc__.text(name="identite", size="15", maxlength="15", value=enreg["identite"])
        else:
            self.__doc__.text(name="identite", size="15", maxlength="15", value="")
        self.__doc__.pop()

    def conti_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font(size=begoconf.font_size)
        self.__doc__.insert_text("Conti seulement:")
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle")
        self.__doc__.font(size=begoconf.font_size)
        liste = {"O Oui": "O", "N Non": "N"}
        afficheclefs.liste_deroulante(self.__doc__, "conti", liste, enreg)
        self.__doc__.pop()
        self.__doc__.pop()

    def signe_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("&nbsp;", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("Signe:", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle", colspan="2")
        liste = {"SEF Simple Elementaire Figuratif": "SEF", "SENF Simple Elementaire Non Fig": "SENF",
            "XYR compleXe sYnchrétique Réaliste": "XYR", "XYNR compleXe sYncrétique Non R": "XYNR", "T Transformé":"T",
            "CE Composé Elementaire": "CE", "CX Composé compleXe": "CX"}
        afficheclefs.liste_deroulante(self.__doc__, "signe", liste, enreg)
        self.__doc__.pop()
        self.__doc__.pop()
        self.__doc__.pop()

    def style_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("&nbsp;", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("Style:", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle")
        self.__doc__.font(size=begoconf.font_size)
        liste = {"A1": "A1", "A2": "A2", "A3": "A3", "B0": "B0", "B1": "B1", "B2": "B2", "C1": "C1", "C2": "C2", "M Mixte": "M"}
        afficheclefs.liste_deroulante(self.__doc__, "style", liste, enreg)
        self.__doc__.pop()

    def sens_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font(size=begoconf.font_size)
        self.__doc__.insert_text("Sens:")
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle")
        self.__doc__.font(size=begoconf.font_size)
        liste = {"H Haut": "H", "B Bas": "B", "D Droite": "D", "G Gauche": "G", "I Ind": "I"}
        afficheclefs.liste_deroulante(self.__doc__, "sens", liste, enreg)
        self.__doc__.pop()
        self.__doc__.pop()

    def longueur_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.u()
        self.__doc__.font("Dimensions:", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font(size=begoconf.font_size)
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle")
        self.__doc__.font("Longueur en cm: ", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle")
        self.__doc__.font(size=begoconf.font_size)
        if enreg != None:
            self.__doc__.text(name="longueur", value=enreg["longueur"], size=6, maxlength=6)
        else:
            self.__doc__.text(name="longueur", size="6", maxlength="6", value="")
        self.__doc__.pop()

    def largeur_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("Largeur en cm: ", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle")
        self.__doc__.font(size=begoconf.font_size)
        if enreg != None:
            self.__doc__.text(name="largeur", value=enreg["largeur"], size=6, maxlength=6)
        else:
            self.__doc__.text(name="largeur", size="6", maxlength="6", value="")
        self.__doc__.pop()
        self.__doc__.pop()

    def cardinale_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.u()
        self.__doc__.font("Direction:", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("cardinale", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle")
        self.__doc__.font(size=begoconf.font_size)
        liste = {"N": "N", "NE": "NE", "E": "E", "SE": "SE", "S": "S", "SO": "SO", "O": "O", "NO": "NO"}
        afficheclefs.liste_deroulante(self.__doc__, "cardinale", liste, enreg)
        self.__doc__.pop()

    def geographique_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("Géographique: ", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle")
        self.__doc__.font(size=begoconf.font_size)
        liste = {"M Montagne": "M", "V Vallée": "V", "E Element nat": "E"}
        afficheclefs.liste_deroulante(self.__doc__, "geographique", liste, enreg)
        self.__doc__.pop()

    def qualite_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.u()
        self.__doc__.font("Aspect général: ", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("Qualité: ", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle")
        self.__doc__.font(size=begoconf.font_size)
        liste = {"B Bonne": "B", "AB Assez Bonne": "AB", "M Moyenne": "M", "MA MAuvaise": "MA"}
        afficheclefs.liste_deroulante(self.__doc__, "qualite", liste, enreg)
        self.__doc__.pop()
        self.__doc__.pop()
        self.__doc__.pop()

    def contour_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.u()
        self.__doc__.font("Bords de la gravure: ", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font(size=begoconf.font_size)
        self.__doc__.font("Contour: ", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle")
        self.__doc__.font(size=begoconf.font_size)
        liste = {"NR Net & R": "NR", "PNR Pas Net & R": "PNR", "NI Net & I": "NI", "PNI Pas Net & I": "PNI"}
        afficheclefs.liste_deroulante(self.__doc__, "contour", liste, enreg)
        self.__doc__.pop()

    def debord_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("Cupules débordantes: ", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle")
        self.__doc__.font(size=begoconf.font_size)
        liste = {"O Oui": "O", "N Non": "N"}
        afficheclefs.liste_deroulante(self.__doc__, "debord", liste, enreg)
        self.__doc__.pop()
        self.__doc__.pop()

    def profil_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("&nbsp;", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("Profil du bord", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle")
        self.__doc__.font(size=begoconf.font_size)
        liste = {"A Arrondi": "A", "O Oblique": "O", "V abrupte": "V"}
        afficheclefs.liste_deroulante(self.__doc__, "profil", liste, enreg)
        self.__doc__.pop()

    def strie_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("Stries de contour:", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle")
        self.__doc__.font(size=begoconf.font_size)
        liste = {"I Inexistantes": "I", "D Discontinues": "D", "N Nettes": "N"}
        afficheclefs.liste_deroulante(self.__doc__, "strie", liste, enreg)
        self.__doc__.pop()
        self.__doc__.pop()

    def alignement_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("Alignement cupules: ", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle")
        self.__doc__.font(size=begoconf.font_size)
        liste = {"A Absent": "A", "P Présent": "P"}
        afficheclefs.liste_deroulante(self.__doc__, "alignement", liste, enreg)
        self.__doc__.pop()
        self.__doc__.pop()

    def surface_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.u()
        self.__doc__.font("Surface gravée:", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("Profondeur", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle", colspan = "2")
        self.__doc__.font(size=begoconf.font_size)
        liste = {"SR Superficielle & Régulière": "SR", "SI Superficielle & Irrégulière": "SI", "PPR Peu Profonde & Régulière": "PPR",
            "PPI Peu Profonde & Irrégulière": "PPI", "PR Profonde & Régulière": "PR", "PI Profonde et Irrégulière": "PI",
            "TPR Très Profonde & Régulière": "TPR", "TPI Très Profonde & Irrégulière": "TPI"}
        afficheclefs.liste_deroulante(self.__doc__, "surface", liste, enreg)
        self.__doc__.pop()
        self.__doc__.pop()

    def perif_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("Périphérie: ", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle")
        self.__doc__.font(size=begoconf.font_size)
        liste = {"I Id au centre": "I", "D Différente": "D"}
        afficheclefs.liste_deroulante(self.__doc__, "perif", liste, enreg)
        self.__doc__.pop()

    def raclage_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("Raclage:", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle")
        self.__doc__.font(size=begoconf.font_size)
        liste = {"A Absent": "A", "P Présent": "P"}
        afficheclefs.liste_deroulante(self.__doc__, "raclage", liste, enreg)
        self.__doc__.pop()
        self.__doc__.pop()

    def forme_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.u()
        self.__doc__.font("Cupules:", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("Forme: ", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle", colspan="2")
        self.__doc__.font(size=begoconf.font_size)
        liste = {"AR Arrondies & Régulières": "AR", "AI Arrondies & Irrégulières": "AI", "OR Ovales & Régulières": "OR",
            "OI Ovales et Irrégulières": "OI", "TR Triangulaires & Régulières": "TR", "TI Triangulaires & Irrégulières": "TI",
            "LR aLlongées & Régulières": "LR", "LI aLlongées & Irrégulières": "LI", "TLR Très aLlongées & Régulières": "TAR",
            "TLI Très aLlongées & Irrégulières": "TLI", "AOR AO & Régulières": "AOR", "AOI AO & Irrégulières": "AOI",
            "ALR AL & Régulières": "ALR", "ALI AL & Irrégulières": "ALI", "ATLR ATL & Régulières": "ATLR",
            "ATLI ATL & Irrégulières": "ATLI"}
        afficheclefs.liste_deroulante(self.__doc__, "forme", liste, enreg)
        self.__doc__.pop()
        self.__doc__.pop()

    def profondeur_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("Profondeur: ", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle", colspan="2")
        self.__doc__.font(size=begoconf.font_size)
        liste = {"SR Superficielle & Régulière": "SR", "SI Superficielle & Irrégulière": "SI", "PPR Peu Profonde & Régulière": "PPR",
            "PPI Peu Profonde & Irégulières": "PPI", "PR Profonde & Régulière": "PR", "PI Profonde et Irrégulière": "PI",
            "TPR Très Profonde & Régulière": "TPR", "TPI Très Profonde & Irrégulière": "TPI"}
        afficheclefs.liste_deroulante(self.__doc__, "profondeur", liste, enreg)
        self.__doc__.pop()
        self.__doc__.pop()

    def taille_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("&nbsp;", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("Taille: ", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle")
        self.__doc__.font(size=begoconf.font_size)
        liste = {"TP Très Petite": "TP", "P Petite": "P", "M Moyenne": "M", "G Grande": "G"}
        afficheclefs.liste_deroulante(self.__doc__, "taille", liste, enreg)
        self.__doc__.pop()
        self.__doc__.pop()

    def disposition_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("Disposition: ", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle", colspan="2")
        self.__doc__.font(size=begoconf.font_size)
        liste = {"SR Superposées & Régulières": "SR", "SI Superposées & Irrégulières": "SI", "JR Jointives & Régulières": "JR",
            "JI Jointives & Irrégulières": "JI", "CR Côte à côte & Régulières": "CR", "CI Côte à côte & Irrégulières": "CI",
            "ER Espacées & Régulières": "ER", "EI Espacées & Irrégulières": "EI"}
        afficheclefs.liste_deroulante(self.__doc__, "disposition", liste, enreg)
        self.__doc__.pop()
        self.__doc__.pop()

    def description_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td()
        self.__doc__.font(size=begoconf.font_size)
        self.__doc__.u()
        self.__doc__.insert_text("Description détaillée")
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(valign="middle", align="left", colspan = "3")
        self.__doc__.font(size=begoconf.font_size)
        self.__doc__.textarea(name="description", rows="4", cols="50", wrap="physical")
        if enreg != None:
            self.__doc__.insert_text(enreg["description"])
        else:
            self.__doc__.insert_text("")
        self.__doc__.pop()
        self.__doc__.pop()

##################################################################################################################
#                                               PHOTOS
##################################################################################################################
    def liste_photofigure(self, enreg):
        """ Affiche la liste des photos et le bouton d'ajout de photos."""
        resp = self.__db__.query("SELECT * FROM photofigure WHERE zone = " + self.__db__.quote(enreg["zone"], "decimal") + " AND groupe = " + self.__db__.quote(enreg["groupe"], "decimal") + " AND roche = " + self.__db__.quote(enreg["roche"], "text") + " AND face = " + self.__db__.quote(enreg["face"], "text") + " AND figure = " + self.__db__.quote(enreg["figure"], "text")  + " ORDER BY idphoto ASC;")
        resp = resp.dictresult()
        lg = len(resp)
        if lg:
            self.__doc__.push()
            self.__doc__.div(align="center")
            if lg > 1:
                s = "s"
            else:
                s = ""
            self.__doc__.font(`lg` + " photographie :" + s, color="red")
            self.__doc__.pop()
            self.__doc__.push()
            self.__doc__.table(border="0", cellpadding="0", cellspacing="0")
            for photo in resp:
                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.td()
                self.__doc__.form(method = "POST", action =  begoconf.script_location("modphoto"))
                self.__doc__.table(border = 5, cellpadding = 5, cellspacing = 5)
                self.__doc__.tr()
                self.__doc__.push()
                self.__doc__.td()
                self.__doc__.table(border=0, cellpadding=0, cellspacing=0)
                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.td(valign = "middle", align = "center")
                photo_url = begoconf.images_location + "Z" + `enreg["zone"]` + "/G" + `enreg["groupe"]` + "/R" + enreg["roche"] + "/F" + enreg["face"] + "/Fg" + enreg["figure"] + "/" + `photo["idphoto"]`
                self.__doc__.a(href = photo_url + ".jpg")
                xmax, ymax = begoconf.get_imagesize(begoconf.image_fullname("Z" + `enreg["zone"]` + os.sep + "G" + `enreg["groupe"]` + os.sep + "R" +  enreg["roche"] + os.sep + "F" + enreg["face"] + os.sep + "Fg" + enreg["figure"] + os.sep + `photo["idphoto"]` + "s.jpg"))
                self.__doc__.img(src = photo_url + "s.jpg", width=xmax, height=ymax)
                self.__doc__.pop()
                self.__doc__.tr()
                self.__doc__.td(valign="middle", align="center")
                self.__doc__.font(size=begoconf.font_size)
                self.__doc__.textarea(name="legende", rows="4", cols="50", wrap="physical")
                self.__doc__.insert_text(photo["legende"])
                self.__doc__.pop()
                self.__doc__.td(bgcolor=begoconf.basform_bgcolorright, valign="middle", align="center")
                self.__doc__.font(size=begoconf.font_size)
                self.__doc__.hidden(name="idphoto", value=photo["idphoto"])
                self.__doc__.hidden(name="zone", value=photo["zone"])
                self.__doc__.hidden(name="groupe", value=photo["groupe"])
                self.__doc__.hidden(name="roche", value=photo["roche"])
                self.__doc__.hidden(name="face", value=photo["face"])
                self.__doc__.hidden(name="figure", value=photo["figure"])
                self.__doc__.submit(name="action", value="Modifier")
                self.__doc__.br()
                self.__doc__.submit(name="action", value="Supprimer")
                self.__doc__.br()
                self.__doc__.submit(name="action", value="Nouvelle")
                self.__doc__.pop()
            self.__doc__.pop()
        else:
            self.__doc__.push()
            self.__doc__.form(method= "POST", action=begoconf.script_location("modphoto"))
            self.__doc__.hidden(name= "zone", value=enreg["zone"])
            self.__doc__.hidden(name= "groupe", value=enreg["groupe"])
            self.__doc__.hidden(name= "roche", value=enreg["roche"])
            self.__doc__.hidden(name= "face", value=enreg["face"])
            self.__doc__.hidden(name= "figure", value=enreg["figure"])
            self.__doc__.submit(name= "action", value="Nouvelle")
            self.__doc__.pop()
            self.__doc__.font("aucune photo", color="red", size=begoconf.font_size)

    def menu_photofigure(self, enreg, color, function):
        if enreg != None:
            self.__doc__.push()
            self.__doc__.tr()
            self.__doc__.td(bgcolor=color, colspan="2")
            self.__doc__.font(size=begoconf.font_size)
            self.__doc__.div(align="center")
            function(enreg)
            self.__doc__.pop()

    def photofigure(self, enreg, penreg=None):
        self.menu_photofigure(enreg, begoconf.basform_bgcolormiddle, self.liste_photofigure)

    def modifier(self):
        """Met a jour la figure courante"""
        # face pas dans les clefs primaires car on veut pouvoir la changer facilement
        self.__db__.query(self.make_update_query(("zone", "groupe", "roche", "figure")))
        return 0

    def supprimer(self):
        """ s'il existe des photos sur cette face on refuse la suppression"""
        if self.exist(self.__listeclefs__, table="photofigure"):
            return -1
        else:
            z = "Z" + self.__form__["zone"].value
            g = "G" + self.__form__["groupe"].value
            r = "R" + self.__form__["roche"].value
            f = "F" + self.__form__["face"].value
            fg = "Fg" + self.__form__["figure"].value
            rr = begoconf.image_fullname(z + os.sep + g + os.sep + r + os.sep + f + os.sep + fg)
            try:
                if os.path.isdir(rr):
                    os.rmdir(rr)
            except:
                begoconf.fatalerror_message("Impossible de supprimer le repertoire [%s]" % rr)
            # on efface la figure
            self.delete_records(self.__listeclefs__)
            return 0

    def creer(self):
        """ si la face n'existe pas déjà alors on la crée, sinon on refuse"""
        if self.exist(self.__listeclefs__):
            primarykeys = {"zone": None, "groupe": None, "roche": None, "face": None, "figure": None}
            return (-1, primarykeys)
        else:
            # on insère maintenant la figure dans la base
            # sauf si la face n'existe pas.
            if not self.exist(("zone", "groupe", "roche", "face"), table="face"):
                primarykeys = {"zone": None, "groupe": None, "roche": None, "face": None, "figure": None}
                return (-2, primarykeys)
            else:
                # on insère maintenant la figure dans la base
                z = self.__form__["zone"].value
                g = self.__form__["groupe"].value
                r = self.__form__["roche"].value
                f = self.__form__["face"].value
                fg = self.__form__["figure"].value
                self.__db__.query(self.make_insert_query({ }))
                primarykeys = {"zone": z, "groupe": g, "roche": r, "face": f, "figure": fg}
                return (0, primarykeys)

