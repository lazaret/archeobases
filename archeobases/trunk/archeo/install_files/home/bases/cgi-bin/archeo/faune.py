#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Archeo - (c) 1999-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
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
import string
import archeoconf
import archeodata
import afficheclefs
import usure_dent


class Faune(archeodata.Data):
    #
    # le nom de la table
    __tablename__ = "faune"
    __new_record__ = "Nouvelle"
    __color__ = archeoconf.bas1_bgcolor
    #
    # tous les champs de la table proprietaire
    __champs__ =    {
                    "zone"             : {"type": "text", "default": "", "mandatory": 1, "longueur": 0, "memory": 1},
                    "numero"           : {"type": "int", "default": 0, "mandatory": 1, "longueur": 6, "memory": 1},
                    "bis"              : {"type": "text", "default": "", "mandatory": 1, "longueur": 0, "memory": 1},
                    "f_longueur"       : {"type": "int", "default": 0, "mandatory": 0, "longueur": 3},
                    "f_largeur"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 3},
                    "f_epaisseur"      : {"type": "int", "default": 0, "mandatory": 0, "longueur": 3},
                    "f_poids"          : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "f_classe"         : {"type": "text", "default": "", "mandatory": 0, "longueur": 20, "memory": 1},
                    "f_ordre"          : {"type": "text", "default": "", "mandatory": 0, "longueur": 25, "memory": 1},
                    "f_famille"        : {"type": "text", "default": "", "mandatory": 0, "longueur": 20, "memory": 1},
                    "f_ssfamille"      : {"type": "text", "default": "", "mandatory": 0, "longueur": 20, "memory": 1},
                    "f_affgenre"       : {"type": "text", "default": "", "mandatory": 0, "longueur": 0, "memory": 1},
                    "f_genre"          : {"type": "text", "default": "", "mandatory": 0, "longueur": 15, "memory": 1},
                    "f_affespece"      : {"type": "text", "default": "", "mandatory": 0, "longueur": 0, "memory": 1},
                    "f_espece"         : {"type": "text", "default": "", "mandatory": 0, "longueur": 15, "memory": 1},
                    "f_ssespece"       : {"type": "text", "default": "", "mandatory": 0, "longueur": 15, "memory": 1},
                    "f_typos1"         : {"type": "text", "default": "", "mandatory": 0, "longueur": 1, "memory": 1},
                    "f_typos2"         : {"type": "text", "default": "", "mandatory": 0, "longueur": 4, "memory": 1},
                    "f_typos3"         : {"type": "text", "default": "", "mandatory": 0, "longueur": 3, "memory": 1},
                    "f_typos4"         : {"type": "text", "default": "", "mandatory": 0, "longueur": 3, "memory": 1},
                    "f_typos5"         : {"type": "text", "default": "", "mandatory": 0, "longueur": 3, "memory": 1},
                    "f_typos6"         : {"type": "text", "default": "", "mandatory": 0, "longueur": 3, "memory": 1},
                    "f_lateralite"     : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_stserie"        : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_sexe"           : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_taille"         : {"type": "text", "default": "", "mandatory": 0, "longueur": 0, "memory": 1},
                    "f_agecl"          : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_agest"          : {"type": "text", "default": "", "mandatory": 0, "longueur": 3},
                    "f_epins"          : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_reference"      : {"type": "text", "default": "", "mandatory": 0, "longueur": 15},
                    "f_stdent"         : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_taille"         : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_association"    : {"type": "int", "default": 0, "mandatory": 0, "longueur": 0},
                    "f_pathologie"     : {"type": "text", "default": "", "mandatory": 0, "longueur": 100},
                    "f_description"    : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_fragge"         : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_fragde"         : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_sauvefrag"      : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_couleur"        : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_caltype"        : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_calcouleur"     : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_concretion"     : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_oxyde"          : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_coraspect"      : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_corfissure"     : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_fossilisation"  : {"type": "text", "default": "O", "mandatory": 0, "longueur": 0},
                    "f_tissu"          : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_typedos"        : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_complement"     : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_pelote"         : {"type": "text", "default": "N", "mandatory": 0, "longueur": 0},
                    "f_coprolithe"     : {"type": "text", "default": "N", "mandatory": 0, "longueur": 0},
                    "f_ilongueur"      : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_icirconference" : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_eclat"          : {"type": "text", "default": "A", "mandatory": 0, "longueur": 0},
                    "f_agent"          : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_photo"          : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_dessin"         : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_traitement"     : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_datation"       : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_moulage"        : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_conservation"   : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_restauration"   : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_saisie"         : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "f_responsable"    : {"type": "text", "default": "", "mandatory": 0, "longueur": 15, "memory": 1},
                   }
    #
    # liste des tables enfants
    __listenfants__   = ("nonos", "dent", "microfaune", "fracture_faune", "trace")
    __listeparents__  = ("carnet",)
    __listeclefs__    = ("zone", "numero", "bis")
    __vraiparent__    = "carnet"
    #
    # liste des seuls champs que l'on veut pouvoir modifier
    __listechamps__ = ("zone", "numero", "bis", "f_longueur", "f_largeur", "f_epaisseur", "f_poids", "f_classe", "f_ordre", "f_famille", "f_ssfamille", "f_affgenre", "f_genre", "f_affespece", "f_espece", "f_ssespece", "f_typos1", "f_typos2", "f_typos3", "f_typos4", "f_typos5", "f_typos6", "f_lateralite", "f_fragge", "f_fragde", "f_sauvefrag", "f_typedos", "f_complement", "f_pelote", "f_coprolithe", "f_tissu", "f_sexe", "f_taille", "f_agecl", "f_agest", "f_epins", "f_stserie", "f_stdent", "f_association", "f_pathologie", "f_description", "f_couleur", "f_caltype", "f_calcouleur", "f_concretion", "f_oxyde", "f_fossilisation", "f_coraspect", "f_corfissure", "f_conservation", "f_ilongueur", "f_icirconference", "f_eclat", "f_agent", "f_photo", "f_dessin", "f_traitement", "f_datation", "f_moulage", "f_restauration", "f_responsable")
    # liste des champs de saisie que l'on souhaite controler
    __controle_saisie__ = ("f_typos1",)
    #
    #
    # liste des champs dans leur ordre de saisie
    __ordrechamps__ = ("zone", "numero", "bis", "nature", "couche", "orientation", "pendage", "sol", "x", "y", "zabsolu", "longueur", "largeur", "epaisseur", "f_longueur", "f_largeur", "f_epaisseur", "f_poids", "f_classe", "f_ordre", "f_famille", "f_ssfamille", "f_affgenre", "f_genre", "f_affespece", "f_espece", "f_ssespece", "f_typos1", "f_typos2", "f_typos3", "f_typos4", "f_typos5", "f_typos6", "f_lateralite", "f_stserie", "f_fragge", "f_fragde", "f_sauvefrag", "f_typedos", "f_complement", "f_tissu", "f_sexe", "f_taille", "f_agecl", "f_agest", "f_epins", "f_stdent", "f_reference", "f_association", "f_pathologie", "f_description", "f_couleur", "f_caltype", "f_calcouleur", "f_concretion", "f_oxyde", "f_fossilisation", "f_coraspect", "f_corfissure", "f_ilongueur", "f_icirconference", "f_eclat", "f_agent", "f_pelote", "f_coprolithe", "f_photo", "f_dessin", "f_traitement", "f_datation", "f_moulage", "f_restauration", "f_saisie", "f_responsable")
    #"f_conservation",
    __orderby__ = " ORDER BY zone, numero, bis ASC;"
    #
    # liste des formulaires supplementaires
    __formsupp__ = ("usure_dents", "photofaune")

    def zone_verify(self, fieldname, value):
        if value == '':
            return -1
        else:
            return 0

    def numero_verify(self, fieldname, value):
        if (value == '') or self.champ_verify(fieldname, value):
            return -1
        else:
            return 0

    def bis_verify(self, fieldname, value):
        if value == '':
            return -1
        else:
            return 0

    def champ_verify(self, fieldname, value):
        # si la longueur de la valeur issue du formulaire est > a la longueur
        # definie dans l'attribut longueur des champs
        if  (value != None) and (len(value) > self.__champs__[fieldname]["longueur"]):
            return -1       # erreur
        else:
            return 0

    def __init__(self, parent):
        for champ in self.__champs__.keys():
            if self.__champs__[champ]["longueur"]:
                if not hasattr(self, "%s_verify" % champ):
                    setattr(self, "%s_verify" % champ, self.champ_verify)
        archeodata.Data.__init__(self, parent)

    def zone_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td()
        self.__doc__.insert_text(" ")
        self.__doc__.pop()
        afficheclefs.display_zone(self, enreg, penreg, col=2)

    def numero_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_numero(self, enreg, penreg, 1, col=2)

    def bis_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_bis(self, enreg, penreg, col=2)
        self.__doc__.pop()

############################### En sortie ###################################
    def nature_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            afficheclefs.ajoute_ligne(self, "100%", "1", "10", "7")
            self.__doc__.push()
            liste_clefs = ("zone", "numero", "bis")
            self.champ_nliste_table("carnet", liste_clefs, "nature", "nature", 2, enreg, penreg, "Carnet", dontchange=None)

    def  couche_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            liste_clefs = ("zone", "numero", "bis")
            self.champ_nsaisie_table("carnet", liste_clefs, "couche", "couche", 3, 20, "", 2, enreg, penreg)

    def sol_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            liste_clefs = ("zone", "numero", "bis")
            self.champ_nliste_table("carnet", liste_clefs, "sol", "sol", 2, enreg, penreg, "", dontchange=None)
            self.__doc__.pop()

    def x_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            self.__doc__.push()
            liste_clefs = ("zone", "numero", "bis")
            self.champ_nsaisie_table("carnet", liste_clefs, "x", "x", 3, 20, " ", 2, enreg, penreg)

    def y_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            liste_clefs = ("zone", "numero", "bis")
            self.champ_nsaisie_table("carnet", liste_clefs, "y", "y", 3, 20, "", 2,  enreg, penreg)

    def zabsolu_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            liste_clefs = ("zone", "numero", "bis")
            self.champ_nsaisie_table("carnet", liste_clefs, "zabsolu", "zabs", 3, 20, "", 2, enreg, penreg)
            self.__doc__.pop()

    def longueur_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            self.__doc__.push()
            liste_clefs = ("zone", "numero", "bis")
            self.champ_nsaisie_table("carnet", liste_clefs, "longueur", "L", 3, 20, " ", 2, enreg, penreg)

    def largeur_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            liste_clefs = ("zone", "numero", "bis")
            self.champ_nsaisie_table("carnet", liste_clefs, "largeur", "l", 3, 20, "", 2, enreg, penreg)

    def epaisseur_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            liste_clefs = ("zone", "numero", "bis")
            self.champ_nsaisie_table("carnet", liste_clefs, "epaisseur", "e", 3, 20, "", 2, enreg, penreg)
            self.__doc__.pop()

    def saisie_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            liste_clefs = ("zone", "numero", "bis")
            self.__doc__.push()
            self.__doc__.tr()
            self.__doc__.td()
            self.__doc__.insert_text("Saisi le")
            self.__doc__.font(size=archeoconf.font_size)
            self.__doc__.insert_text("Saisi le")
            self.__doc__.text(name="f_saisie", value=enreg["f_saisie"], size=3, maxlength=20)
            self.__doc__.pop()

################################### En entrée ###########################
    def f_longueur_base_to_form(self, enreg, penreg=None):
        afficheclefs.ajoute_ligne(self, "100%", "1", "10", "7")
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "f_longueur", "L", 3, 20, "Dimensions", enreg, penreg)

    def f_largeur_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "f_largeur", "l", 3, 20, "", enreg, penreg)

    def f_epaisseur_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "f_epaisseur", "e", 3, 20, "", enreg, penreg)

    def f_poids_base1_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "f_poids", "p", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

    def f_classe_base_to_form(self, enreg, penreg=None):
        afficheclefs.ajoute_ligne(self, "100%", "1", "10", "7")
        self.__doc__.push()
        afficheclefs.champ_nsaisie(self, "f_classe", "classe", 20, 35, "Détermination", 2, enreg, penreg)

    def f_ordre_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_nsaisie(self, "f_ordre", "ordre", 20, 35, "", 2, enreg, penreg)
        self.__doc__.pop()

    ########
    def f_famille_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_nsaisie(self, "f_famille", "famille", 20, 35, " ", 2, enreg, penreg)

    def f_ssfamille_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_nsaisie(self, "f_ssfamille", "ssfamille", 20, 35, "", 2, enreg, penreg)
        self.__doc__.pop()

########
    def f_affgenre_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_nliste(self, "f_affgenre", "genre", enreg, penreg, " ", 1, dontchange=0)

    def f_genre_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie_simple(self, "f_genre", 15, 35, enreg, penreg)

    def f_affespece_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_nliste(self, "f_affespece", "espece", enreg, penreg, "", 1, dontchange=0)

    def f_espece_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie_simple(self, "f_espece", 15, 35, enreg, penreg)

    def f_ssespece_base_to_form(self, enreg, penreg=None):
#        liste_clefs = ["zone", "numero", "bis"]
        afficheclefs.champ_nsaisie(self, "f_ssespece", "ssespece", 15, 35, "", 2, enreg, penreg)
        self.__doc__.pop()

    def f_typos1_base_to_form(self, enreg, penreg=None):
        afficheclefs.ajoute_ligne(self, "100%", "1", "10", "7")
        self.__doc__.push()
        afficheclefs.champ_saisie_typos(self, "f_typos1", "f_typos1", 1, 35, "Nature de l'os", enreg, penreg)

    def f_typos2_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_simple_saisie(self, "f_typos2", "f_typos2", 4, 20, enreg, penreg)

    def f_typos3_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_simple_saisie(self, "f_typos3", "f_typos3", 3, 20, enreg, penreg)

    def f_typos4_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_simple_saisie(self, "f_typos4", "f_typos4", 3, 20, enreg, penreg)

    def f_typos5_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_simple_saisie(self, "f_typos5", "f_typos5", 3, 20, enreg, penreg)

    def f_typos6_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_simple_saisie(self, "f_typos6", "f_typos6", 3, 20, enreg, penreg)
        self.__doc__.pop()
        self.__doc__.pop()

    def f_lateralite_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_nliste(self, "f_lateralite", "latéralité", enreg, penreg, "", "2", dontchange=0)
        self.__doc__.pop()

    def f_stserie_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_nsaisie(self, "f_stserie", "série dentaire", 46, 46, "Fragmentation", 4, enreg, penreg)

    def f_fragge_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_nsaisie(self, "f_fragge", "générale", 12, 30, "", 3, enreg, penreg)
        self.__doc__.pop()

    def f_fragde_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_nsaisie(self, "f_fragde", "détaillée", 50, 50, " ", 4, enreg, penreg)
        self.__doc__.pop()

    def f_sauvefrag_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_nsaisie(self, "f_sauvefrag", "ancienne", 50, 50, " ", 4, enreg, penreg)
        self.__doc__.pop()

#######
    def f_sexe_base_to_form(self, enreg, penreg=None):
        afficheclefs.ajoute_ligne(self, "100%", "1", "10", "7")
        self.__doc__.push()
        afficheclefs.champ_nliste(self, "f_sexe", "sexe", enreg, penreg, "Individu", "1", dontchange=0)

    def f_taille_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_nliste(self, "f_taille", "taille", enreg, penreg, "", 2, dontchange=0)

#######
    def f_agecl_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_nliste(self, "f_agecl", "classe âge", enreg, penreg, "", "2", dontchange=0)

    def f_agest_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_nsaisie(self, "f_agest", "estimation", 6, 20, "", 1, enreg, penreg)
        self.__doc__.pop()

#######
    def f_association_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_nsaisie(self, "f_association", "numero", 4, 20, "Association", 1, enreg, penreg)
        self.__doc__.pop()

#######
    def f_pathologie_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_liste(self, "f_pathologie", "pathologie", enreg, penreg, "Pathologie", dontchange=0)

    def f_description_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_nsaisie(self, "f_description", "description", 30, 35, "", 3, enreg, penreg)
        self.__doc__.pop()

#######
    def f_couleur_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.ajoute_ligne(self, "100%", "1", "10", "7")
        afficheclefs.champ_nliste(self, "f_couleur", "couleur os", enreg, penreg, "Etat physique", 1, dontchange=0)

#######
    def f_caltype_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_nliste(self, "f_caltype", "type calci", enreg, penreg, "", 2, dontchange=0)

    def f_calcouleur_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_nliste(self, "f_calcouleur", "couleur calci", enreg, penreg, "", 2, dontchange=0)

#######
    def f_concretion_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_nliste(self, "f_concretion", "concrétion", enreg, penreg, "", 2, dontchange=0)
        self.__doc__.pop()

    def f_oxyde_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_nsaisie(self, "f_oxyde", "oxyde", 4, 20, " ", 1, enreg, penreg)

    def f_fossilisation_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_nliste(self, "f_fossilisation", "fossilisation", enreg, penreg, "", 2, dontchange=0)

#######
    def f_coraspect_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_nliste(self, "f_coraspect", "aspect cortex", enreg, penreg, "", 2, dontchange=0)

    def f_corfissure_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_nliste(self, "f_corfissure", "corfissure", enreg, penreg, "", 4, dontchange=0)
        self.__doc__.pop()

    def totof_conservation_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_nliste(self, "f_conservation", "conservation", enreg, penreg, "", 1, dontchange=0)
        self.__doc__.pop()

#######
    def f_typedos_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_nliste(self, "f_typedos", "type d'os", enreg, penreg, "Les indét", 2, dontchange=0)

    def f_complement_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_nliste(self, "f_complement", "complement", enreg, penreg, "", 2, dontchange=0)

    def f_tissu_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_nliste(self, "f_tissu", "tissu", enreg, penreg, "", 2, dontchange=0)
        self.__doc__.pop()

#######
    def f_ilongueur_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.ajoute_ligne(self, "100%", "1", "10", "7")
        afficheclefs.champ_nliste(self, "f_ilongueur", "ilongueur", enreg, penreg, "Fractures", 1, dontchange=0)

    def f_icirconference_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_nliste(self, "f_icirconference", "icirconf", enreg, penreg, "", 2, dontchange=0)

    def f_eclat_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_nliste(self, "f_eclat", "éclat", enreg, penreg, "", 2, dontchange=0)
        self.__doc__.pop()

    def f_agent_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_nsaisie(self, "f_agent", "agent", 7, 20, "Dommages", 1, enreg, penreg)

#######
    def f_pelote_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_nliste(self, "f_pelote", "pelote", enreg, penreg, "", 2, dontchange=0)

    def f_coprolithe_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_nliste(self, "f_coprolithe", "coprolithe", enreg, penreg, "", 2, dontchange=0)
        self.__doc__.pop()

#######
    def f_photo_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.ajoute_ligne(self, "100%", "1", "10", "7")
        afficheclefs.champ_nsaisie(self, "f_photo", "photo", 3, 20, "Renseignements", 2, enreg, penreg)

    def f_dessin_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_nsaisie(self, "f_dessin", "dessin", 3, 20, "", 2, enreg, penreg)

#######
    def f_traitement_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_nsaisie(self, "f_traitement", "traite", 20, 30, "", 3, enreg, penreg)
        self.__doc__.pop()

    def f_datation_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_nsaisie(self, "f_datation", "datation", 8, 20, " ", 2, enreg, penreg)

#######
    def f_moulage_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_nsaisie(self, "f_moulage", "moulage", 10, 20, "", 2, enreg, penreg)

    #gestion remplacera restauration avec memoire sur ce champs
    def f_restauration_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_nliste(self, "f_restauration", "gestion", enreg, penreg, "", 2, dontchange=0)
        self.__doc__.pop()
#######

    def f_saisie_base_to_form(self, enreg, penreg=None):
        afficheclefs.ajoute_ligne(self, "100%", "1", "5", "7")
        self.__doc__.push()
        afficheclefs.champ_nsaisie(self, "f_saisie", "Fiche saisie le", 10, 20, " ", 2, enreg, penreg)

#######
    def f_responsable_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_nliste(self, "f_responsable", "responsable", enreg, penreg, "", 2, dontchange=0)
        self.__doc__.pop()
        self.__doc__.pop()

###############################################################################
#                                       USURE_DENTS
###############################################################################
    def usure_dents(self, enreg, penreg=None):
        if enreg != None:
            self.__doc__.push()
            self.__doc__.tr()
            self.__doc__.td(bgcolor=archeoconf.basform_bgcolorcenter, colspan="2")
            self.__doc__.font(size=archeoconf.font_size)
            penreg = {"zone": enreg["zone"], "numero": enreg["numero"], "bis": enreg["bis"]}
            usure_dent.Usure_Dent(self).traite_saisie(("zone", "numero", "bis", "ud_serie"), parent=self.__tablename__, penreg=penreg)
            self.__doc__.pop()

#########################################################################
#                                PHOTOS
#########################################################################
    def liste_photofaune(self, enreg):
        resp = self.__db__.query("SELECT * FROM photofaune WHERE zone = " + self.__db__.quote(enreg["zone"], "text") + " AND numero = " + self.__db__.quote(enreg["numero"], "decimal") + " AND bis = " + self.__db__.quote(enreg["bis"], "text")  + " ORDER BY idphoto ASC;")
        resp = resp.dictresult()
        lg = len(resp)
        if lg:
            self.__doc__.push()
            self.__doc__.div(align="center")
            if lg > 1:
                s = "s"
            else:
                s = ""
            self.__doc__.font(`lg` + " photo" + s, color="red")
            self.__doc__.pop()
            self.__doc__.push()
            self.__doc__.table(border="0", cellpadding="0", cellspacing="0")
            for photo in resp:
                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.td()
                self.__doc__.form(method="POST", action=archeoconf.script_location("modphotofaune"))
                self.__doc__.table(border=5, cellpadding=5, cellspacing=5)
                self.__doc__.tr()
                self.__doc__.push()
                self.__doc__.td()
                self.__doc__.table(border=0, cellpadding=0, cellspacing=0)
                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.td(valign="middle", align="center")
                photo_url = archeoconf.images_location + "Z" + enreg["zone"] + "/N" + `enreg["numero"]` + "/B" + enreg["bis"]  + "/" + `photo["idphoto"]`
                self.__doc__.a(href=photo_url + ".jpeg")
                xmax, ymax = archeoconf.get_imagesize(archeoconf.image_fullname("Z" + enreg["zone"] + os.sep + "N" + `enreg["numero"]` + os.sep + "B" +  enreg["bis"] +  os.sep + `photo["idphoto"]` + "s.jpeg"))
                self.__doc__.img(src=photo_url + "s.jpeg", width=xmax, height=ymax)
                self.__doc__.br()
                self.__doc__.a("original", href=photo_url + ".tiff")
                self.__doc__.pop()
                self.__doc__.tr()
                self.__doc__.td(valign="middle", align="center")
                self.__doc__.font(size=archeoconf.font_size)
                self.__doc__.textarea(name="legende", rows="4", cols="50", wrap="physical")
                if photo["legende"] == None:
                    self.__doc__.insert_text("&nbsp;")
                else:
                    self.__doc__.insert_text(photo["legende"])
                self.__doc__.pop()
                self.__doc__.td(bgcolor=archeoconf.basform_bgcolorright, valign= "middle", align="center")
                self.__doc__.font(size=archeoconf.font_size)
                self.__doc__.hidden(name="idphoto", value=photo["idphoto"])
                self.__doc__.hidden(name="zone", value=photo["zone"])
                self.__doc__.hidden(name="numero", value=photo["numero"])
                self.__doc__.hidden(name="bis", value=photo["bis"])
                self.__doc__.hidden(name="refer", value=self.__doc__.script_name())
                self.__doc__.submit(name="action", value="Modifier")
                self.__doc__.br()
                self.__doc__.submit(name="action", value="Supprimer")
                self.__doc__.br()
                self.__doc__.submit(name="action", value="Nouvelle")
                self.__doc__.pop()
            self.__doc__.pop()
        else:
            self.__doc__.push()
            self.__doc__.form(method="POST", action=archeoconf.script_location("modphotofaune"))
            self.__doc__.hidden(name="zone", value=enreg["zone"])
            self.__doc__.hidden(name="numero", value=enreg["numero"])
            self.__doc__.hidden(name="bis", value=enreg["bis"])
            self.__doc__.submit(name="action", value="Nouvelle image")
            self.__doc__.pop()
            self.__doc__.font("aucune image", color="red", size=archeoconf.font_size)

    def menu_photofaune(self, enreg, color, function):
        if enreg != None:
            self.__doc__.push()
            self.__doc__.tr()
            self.__doc__.td(bgcolor=color, colspan="2")
            self.__doc__.font(size=archeoconf.font_size)
            self.__doc__.div(align="center")
            function(enreg)
            self.__doc__.pop()

    def photofaune(self, enreg, penreg=None):
        self.menu_photofaune(enreg, archeoconf.basform_bgcolormiddle, self.liste_photofaune)

###############################################################################
#                                METHODES
##############################################################################
    def remonte_determination(self, primarykeys, table=None):
        table = "faune"
        o = string.upper(self.__getfield__("f_ordre"))
        f = string.upper(self.__getfield__("f_famille"))
        g = string.upper(self.__getfield__("f_genre"))
        update_genre = ""
        if g != "''":
            recup = "SELECT * FROM remonte_genre WHERE genre=%s;" % g
            res = self.__db__.query(recup).dictresult()
            if res:
                update_genre = ("UPDATE %s SET f_classe =" % table) + self.__db__.quote(res[0]["classe"], "text") + \
                ", f_ordre="   + self.__db__.quote(res[0]["ordre"], "text") + \
                ", f_famille=" + self.__db__.quote(res[0]["famille"], "text") + \
                ", f_genre="   + self.__db__.quote(res[0]["genre"], "text")
                update_genre = update_genre + self.__createwhere__(primarykeys) + ";"
                self.__db__.query(update_genre)
            else:
                archeoconf.fatalerror_message("La valeur [%s] saisie dans le champ %s est invalide !" %(g, "genre"))
        elif f != "''":
            recup = "SELECT * FROM remonte_famille WHERE famille=%s;" % f
            res = self.__db__.query(recup).dictresult()
            update_genre = ("UPDATE %s SET f_classe =" % table) + self.__db__.quote(res[0]["classe"], "text") + ", f_ordre=" + self.__db__.quote(res[0]["ordre"], "text") + ", " + ", f_famille=" + self.__db__.quote(res[0]["famille"], "text") + ", f_genre=''"
        elif o != "''":
            recup = "SELECT * FROM remonte_ordre WHERE ordre=%s;" % o
            res = self.__db__.query(recup).dictresult()
            update_genre = ("UPDATE %s SET f_classe =" % table) + self.__db__.quote(res[0]["classe"], "text") + ", " + " f_ordre=" + self.__db__.quote(res[0]["ordre"], "text") + " ,f_famille='', f_genre=''"


    def modifier(self):
        """Met a jour la faune courante"""
        self.__db__.query(self.make_update_query(self.__listeclefs__))
        self.remonte_determination(self.__listeclefs__)
        return 0

    def supprimer(self):
       # s'il existe des figures ou des photos sur cette faune on refuse la suppression
        if self.exist(self.__listeclefs__, table="photofaune"):
            return -1
        else:
            z = "Z" + self.__form__["zone"].value
            n = "N" + self.__form__["numero"].value
            b = "B" + self.__form__["bis"].value
            rr = archeoconf.image_fullname(z + os.sep + n + os.sep + b + os.sep)
            try:
                if os.path.isdir(rr):
                    os.rmdir(rr)
            except:
                archeoconf.fatalerror_message("Impossible de supprimer le répertoire [%s]" % rr)
            # on efface l' faune
            self.delete_records(self.__listeclefs__)
            return 0

    def creer(self):
        # si la faune n'existe pas déjà alors on la crée, sinon on refuse
        if self.exist(self.__listeclefs__, table="faune"):
            primarykeys = {"zone": None, "numero": None, "bis": None}
            return (-1, primarykeys)
        else:
            # on insère maintenant la faune dans la base
            # sauf si le carnet n'existe pas.
            if not self.exist(self.__listeclefs__, table="carnet"):
                primarykeys = {"zone": None, "numero": None, "bis": None}
                return (-2, primarykeys)
            else:
                # on insère maintenant la faune dans la base
                z = self.__form__["zone"].value
                n = self.__form__["numero"].value
                b = self.__form__["bis"].value
                requete = (self.make_insert_query({}))
                if not requete:
                    return (1, primarykeys)
                    primarykeys = {"zone": z, "numero": n, "bis": b}
                else:
                    self.__db__.query(requete)
                    self.remonte_determination(self.__listeclefs__)
                    primarykeys = {"zone": z, "numero": n, "bis": b}
                    return (0, primarykeys)

