#! /usr/bin/python
# -*- coding: utf-8 -*-
#
# Archeo   - (c) 1999      Jerome ALET <alet@unice.fr>
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
#
import os
import faune
import string
import archeoconf
import archeodata
import afficheclefs
import re

class Fracture_Faune(archeodata.Data) :
        #
        # le nom de la table
        __tablename__ = "fracture_faune"
        __new_record__ = "Nouvelle"
        __color__ = archeoconf.bas_bgcolor
        #
        # tous les champs de la table proprietaire
        __champs__ = { 
                        "zone"          : { "type" : "text", "default" : "", "mandatory" : 1 , "longueur" : 0, "memory" : 1}, \
                        "numero"        : { "type" : "decimal", "default" : 0, "mandatory" : 1 , "longueur" : 6, "memory" : 1}, \
                        "bis"           : { "type" : "text", "default" : "", "mandatory" : 1 , "longueur" : 0, "memory" : 1}, \
                        "ff_localisation1": { "type" : "text", "mandatory" : 0 , "longueur" : 0}, \
                        "ff_non1"         : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "ff_angle1"       : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "ff_aspect1"      : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "ff_profil1"      : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 3}, \
                        "ff_morphologie1" : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 3}, \
                        "ff_localisation2": { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "ff_non2"         : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "ff_angle2"       : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "ff_aspect2"      : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "ff_profil2"      : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 3}, \
                        "ff_morphologie2" : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 3}, \
                        }
        #
        # liste des tables enfants
        __listenfants__ = []
        __listeparents__ = ["carnet", "faune"] 
        __listeclefs__ = ["zone", "numero", "bis"]
        __vraiparent__ = "faune"
        
        
        #
        # liste des seuls champs que l'on veut pouvoir modifier
        __listechamps__ = ["zone", "numero", "bis", "ff_localisation1", "ff_non1","ff_angle1","ff_aspect1","ff_profil1","ff_morphologie1", "ff_localisation2", "ff_non2","ff_angle2","ff_aspect2","ff_profil2","ff_morphologie2"]
        #
        # liste des champs dans leur ordre de saisie
        __ordrechamps__ = ["zone", "numero", "bis", "ff_localisation1", "ff_non1","ff_angle1","ff_aspect1","ff_profil1","ff_morphologie1", "ff_localisation2", "ff_non2","ff_angle2","ff_aspect2","ff_profil2","ff_morphologie2"]

        __orderby__ = " ORDER BY zone, numero, bis;"

        #
        # liste des formulaires supplementaires
        __formsupp__ = []

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
                afficheclefs.display_zone( self, enreg, penreg)

        def numero_base_to_form(self, enreg, penreg = None) :
                afficheclefs.display_numero(self, enreg, penreg)

        def bis_base_to_form(self, enreg, penreg = None) :
                afficheclefs.display_bis( self, enreg, penreg)
                self.__doc__.pop()

################################### En entrée ########################################
        def ff_localisation1_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_liste( self, "ff_localisation1", "localisation1", enreg, penreg, "", dontchange = 0)
        
        def ff_non1_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "ff_non1", "non1", enreg, penreg, "", dontchange = 0)
        
        def ff_angle1_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "ff_angle1", "angle1", enreg, penreg, "", dontchange = 0)
                self.__doc__.pop()
#######################
        def ff_aspect1_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                self.__doc__.tr()
                afficheclefs.champ_liste( self, "ff_aspect1", "aspect1", enreg, penreg, "", dontchange = 0)
 
        def ff_profil1_base_to_form(self, enreg, penreg = None) : 
                afficheclefs.champ_liste( self, "ff_profil1", "profil1", enreg, penreg, "", dontchange = 0)

        def ff_morphologie1_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ff_morphologie1", "morphologie1", 3, 20, "", enreg, penreg)
                self.__doc__.pop()
###############
################
        def ff_localisation2_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                self.__doc__.tr()
                afficheclefs.champ_liste( self, "ff_localisation2", "localisation2", enreg, penreg, "", dontchange = 0)
        
        def ff_non2_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "ff_non2", "non2", enreg, penreg, "", dontchange = 0)
        
        def ff_angle2_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "ff_angle2", "angle2", enreg, penreg, "", dontchange = 0)
                self.__doc__.pop()
#######################
        def ff_aspect2_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                self.__doc__.tr()
                afficheclefs.champ_liste( self, "ff_aspect2", "aspect2", enreg, penreg, "", dontchange = 0)
 
        def ff_profil2_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "ff_profil2", "profil2", enreg, penreg, "", dontchange = 0)

        def ff_morphologie2_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ff_morphologie2", "morphologie2", 3, 20, "", enreg, penreg)
                self.__doc__.pop()

##############################################################################################################################
#                                               METHODES
##############################################################################################################################

        def modifier(self) :
                """Met a jour la fracture courante"""
                self.__db__.query(self.make_update_query(["zone", "numero", "bis"]))
                return 0

        def supprimer(self) :
                # on efface la fracture_faune sur éclat
                self.delete_records(["zone", "numero", "bis"])
                return 0

        def creer(self) :
                # si la fracture_faune n'existe pas déjà alors on la crée, sinon on refuse
                if self.exist(["zone", "numero", "bis"]) :
                        primarykeys = { "zone" : None, "numero" : None, "bis": None,}
                        return (-1, primarykeys)
                else :
                        # on insère maintenant la fracture_faune dans la base
                        # sauf si la faune n'existe pas.
                        if not self.exist(["zone", "numero", "bis"], table = "faune") :
                                primarykeys = { "zone" : None, "numero" : None, "bis": None}
                                return (-2, primarykeys)
                        else :
                                # on insère maintenant la fracture_faune dans la base
                                z = self.__form__["zone"].value
                                n = self.__form__["numero"].value
                                b = self.__form__["bis"].value
                                self.__db__.query(self.make_insert_query({ }))
                                primarykeys = { "zone" : z, "numero" : n, "bis" : b}
                                return (0, primarykeys)



