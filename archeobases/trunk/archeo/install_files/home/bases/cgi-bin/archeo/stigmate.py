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
import re

class Stigmate(archeodata.Data) :
        #
        # le nom de la table
        __tablename__ = "stigmate"
        __new_record__ = "Nouvelle"
        __color__ = archeoconf.bas4_bgcolor
        #
        # tous les champs de la table proprietaire
        __champs__ = { 
                        "zone"          : { "type" : "text", "default" : "", "mandatory" : 1 , "longueur" : 0, "memory" : 1}, \
                        "numero"        : { "type" : "decimal", "default" : 0, "mandatory" : 1 , "longueur" : 6, "memory" : 1}, \
                        "bis"           : { "type" : "text", "default" : "", "mandatory" : 1 , "longueur" : 0, "memory" : 1}, \
                        "s_ordre"       : { "type" : "decimal", "default" : 1, "mandatory" : 1 , "longueur" : 0, "memory" : 1}, \
                        "s_type"        : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "s_sous_type"   : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "s_lustrage"    : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "s_polissage"   : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "s_localisation": { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "s_situation"   : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "s_relation"    : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "s_longueur"    : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "s_largeur"     : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        #"s_outil"      : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "s_cimx"        : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "s_cimn"        : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "s_cr1s"        : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "s_cr2s"        : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "s_timx2"       : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "s_timn2"       : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "s_tr1s"        : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "s_tr2s"        : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "s_tang"        : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                      }
        #
        # liste des tables enfants
        __listenfants__ = []
        __listeclefs__ = ["zone", "numero", "bis", "s_ordre"]
        __listeparents__ = ["industrie"]
        __vraiparent__ = "industrie"
        
        
        #
        # liste des seuls champs que l'on veut pouvoir modifier
        __listechamps__ = ["zone", "numero", "bis", "s_ordre", "s_type", "s_sous_type", "s_lustrage", "s_polissage", "s_localisation", "s_situation", "s_relation", "s_longueur","s_largeur", "s_cimx", "s_cimn", "s_cr1s", "s_cr2s", "s_timx2", "s_timn2", "s_tr1s", "s_tr2s", "s_tang" ]
        #
        # liste des champs dans leur ordre de saisie
        __ordrechamps__ =  ["zone", "numero", "bis", "s_ordre", "s_type", "s_sous_type", "s_lustrage", "s_polissage", "s_localisation", "s_situation", "s_relation", "s_longueur","s_largeur", "s_cimx", "s_cimn", "s_cr1s", "s_cr2s", "s_timx2", "s_timn2", "s_tang", "s_tr1s", "s_tr2s" ]

        __orderby__ = " ORDER BY zone, numero, bis ASC;"

        #
        # liste des formulaires supplementaires
        __formsupp__ = []

        def __init__(self, parent, nomtable = None) :
                self.__tablename__ = nomtable
                #self.__vraiparent__ = parent
                archeodata.Data.__init__(self, parent)

        def zone_verify(self, fieldname, value) :
                if value == '' :
                        return -1
                else :
                        return 0

        def numero_verify(self, fieldname, value) :
                if (value == '') or self.champ_verify(fieldname, value) :
                        return -1
                else :
                        return 0

        def bis_verify(self, fieldname, value) :
                if value == '' :
                        return -1
                else :
                        return 0

        def s_ordre_verify(self, fieldname, value) :
                if value == '' :
                        return -1
                else :
                        return 0
        def champ_verify(self, fieldname, value) :
                # si la longueur de la valeur issue du formulaire est > a la longueur
                # definie dans l'attribut longueur des champs
                if  (value != None) and (len(value) > self.__champs__[fieldname]["longueur"]) :
                        return -1       # erreur
                else :          
                        return 0
                        
        def __init__(self, parent) :
                for champ in self.__champs__.keys() :
                        if self.__champs__[champ]["longueur"] :
                                if not hasattr(self, "%s_verify" % champ) :
                                        setattr(self, "%s_verify" % champ, self.champ_verify)
                archeodata.Data.__init__(self, parent)                                        
        
        def zone_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.td(align="center", colspan="8")
                self.__doc__.insert_text("STIGMATES")
                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.td()
                self.__doc__.insert_text(" ")
                self.__doc__.pop()
                afficheclefs.display_zone( self, enreg, penreg)

        def numero_base_to_form(self, enreg, penreg = None) :
                afficheclefs.display_numero(self, enreg, penreg)

        def bis_base_to_form(self, enreg, penreg = None) :
                afficheclefs.display_bis( self, enreg, penreg)

        def s_ordre_base_to_form(self, enreg, penreg = None) :
                afficheclefs.display_x_ordre(self, "s_ordre", 1,15, enreg, penreg)
                self.__doc__.pop()


################################### En entrée #########################     
        def s_type_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_liste( self, "s_type", "type", enreg, penreg, " ", dontchange = 0)
        
        def s_sous_type_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "s_sous_type", "sous_type", enreg, penreg, "", dontchange = 0)
                self.__doc__.pop()
#######################

        def s_lustrage_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_liste( self, "s_lustrage", "lustrage", enreg, penreg, " ", dontchange = 0)

        def s_polissage_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "s_polissage", "polissage", enreg, penreg, "", dontchange = 0)
                self.__doc__.pop()
#######################

        def s_localisation_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_liste( self, "s_localisation", "localisation", enreg, penreg, " ", dontchange = 0)

        def s_situation_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "s_situation", "situation", enreg, penreg, "", dontchange = 0)

        def s_relation_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "s_relation", "relation", 4, 20, "", enreg, penreg)
                self.__doc__.pop()
#######################

        def s_longueur_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "s_longueur", "longueur", 3, 20, " ", enreg, penreg)

        def s_largeur_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "s_largeur", "largeur", 3, 20, "", enreg, penreg)
                self.__doc__.pop()


#######################

        def s_cimx_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "s_cimx", "CIMX", 3, 20, "Cortical", enreg, penreg)

        def s_cimn_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "s_cimn", "CIMN", 3, 20, "", enreg, penreg)
                self.__doc__.pop()

#######################

        def s_cr1s_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "s_cr1s", "rayon 1s", 3, 20, " ", enreg, penreg)

        def s_cr2s_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "s_cr2s", "rayon 2s", 3, 20, "", enreg, penreg)
                self.__doc__.pop()
#######################

        def s_timx2_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "s_timx2", "TIMX2", 3, 20, "Tranchant", enreg, penreg)

        def s_timn2_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "s_timn2", "TIMN2", 3, 20, "", enreg, penreg)

        def s_tang_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "s_tang", "TANG", 3, 20, "", enreg, penreg)
                self.__doc__.pop()

#######################

        def s_tr1s_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "s_tr1s", "rayon 1s", 3, 20, " ", enreg, penreg)

        def s_tr2s_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "s_tr2s", "rayon 2s", 3, 20, "", enreg, penreg)
                self.__doc__.pop()


##############################################################################################################################
#                                               METHODES
##############################################################################################################################

        def modifier(self) :
                """Met a jour l'stigmate courant"""
                self.__db__.query(self.make_update_query(["zone", "numero", "bis", "s_ordre"]))
                return 0

        def supprimer(self) :
                # s'il existe des figures ou des photos sur cette industrie on refuse la suppression
                        # on efface la stigmate
                        self.delete_records(["zone", "numero", "bis", "s_ordre"])
                        return 0

        def creer(self) :
                        # si son parent n'existe pas, on refuse
                if not self.exist(["zone", "numero", "bis"], table = "industrie") :
                        primarykeys = { "zone" : None, "numero" : None, "bis": None}
                        return (-2, primarykeys)
                else :
                        if self.exist(["zone", "numero", "bis", "s_ordre"]) :
                        # si l' stigmate existe, on refuse de le creer
                                primarykeys = { "zone" : None, "numero" : None, "bis": None, "s_ordre": None}
                                return (-1, primarykeys)
                        # sinon si son parent existe, on le cree
                        else :
                                # on insère maintenant le stigmate dans la base
                                z = self.__form__["zone"].value
                                n = self.__form__["numero"].value
                                b = self.__form__["bis"].value
                                o = self.__form__["s_ordre"].value
                                self.__db__.query(self.make_insert_query({ }))
                                primarykeys = { "zone" : z, "numero" : n, "bis" : b, "s_ordre" : o}
                                return (0, primarykeys)
