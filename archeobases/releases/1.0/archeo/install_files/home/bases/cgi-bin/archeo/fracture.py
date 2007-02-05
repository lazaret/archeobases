#! /usr/bin/python
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

import os
import string
import archeoconf
import archeodata
import afficheclefs
import re

class Fracture(archeodata.Data) :
        #
        # le nom de la table
                
        __tablename__ = "fracture"
        __new_record__ = "Nouvelle"
        __color__ = archeoconf.bas3_bgcolor
        #
        # tous les champs de la table proprietaire
        __champs__ = { 
                        "zone"          : { "type" : "text", "default" : "", "mandatory" : 1 , "longueur" : 0}, \
                        "numero"        : { "type" : "decimal", "default" : 0, "mandatory" : 1 , "longueur" : 6}, \
                        "bis"           : { "type" : "text", "default" : "", "mandatory" : 1 , "longueur" : 0}, \
                        "fr_ordre"       : { "type" : "decimal", "default" : 1, "mandatory" : 1 , "longueur" : 0}, \
                        "fr_type"        : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "fr_percussion"  : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "fr_mode"        : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "fr_anciennete"   : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 3}, \
                      }
        #
        # liste des tables enfants
        __listenfants__ = []
        __listeclefs__ = ["zone", "numero", "bis", "fr_ordre"]
        
        __vraiparent__ = "industrie"
        __listeparents__ = ["industrie"]
        
        
        #
        # liste des seuls champs que l'on veut pouvoir modifier
        __listechamps__ = ["zone", "numero", "bis", "fr_ordre","fr_type",  "fr_percussion", "fr_mode",  "fr_anciennete"]


        #
        # liste des champs dans leur ordre de saisie
        __ordrechamps__ = ["zone", "numero", "bis", "fr_ordre","fr_type",  "fr_percussion", "fr_mode",  "fr_anciennete"]

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

        def fr_ordre_verify(self, fieldname, value) :
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
                self.__doc__.insert_text("FRACTURES")
                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.td()
                self.__doc__.insert_text(" ")
                self.__doc__.pop()
                afficheclefs.display_zone(self, enreg, penreg)

        def numero_base_to_form(self, enreg, penreg = None) :
                afficheclefs.display_numero(self, enreg, penreg)

        def bis_base_to_form(self, enreg, penreg = None) :
                afficheclefs.display_bis(self, enreg, penreg)

        def fr_ordre_base_to_form(self, enreg, penreg = None) :
                afficheclefs.display_x_ordre(self, "fr_ordre", 1,15, enreg, penreg)
                self.__doc__.pop()


################################### En entrée #########################     
        def fr_type_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_liste( self, "fr_type", "type", enreg, penreg, " ", dontchange = 0)
        
       def fr_percussion_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "fr_percussion", "percussion", enreg, penreg, "", dontchange = 0)
                self.__doc__.pop()
#######################
        def fr_mode_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_liste( self, "fr_mode", "mode", enreg, penreg, " ", dontchange = 0)
 
        def fr_anciennete_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "fr_anciennete", "anciennete", 3, 20, "", enreg, penreg)
                self.__doc__.pop()

##############################################################################################################################
#                                               METHODES
##############################################################################################################################

        def modifier(self) :
                """Met a jour l'fracture courant"""
                self.__db__.query(self.make_update_query(["zone", "numero", "bis", "fr_ordre"]))
                return 0

        def supprimer(self) :
                # s'il existe des figures ou des photos sur cette industrie on refuse la suppression
                        # on efface la fracture
                        self.delete_records(["zone", "numero", "bis", "fr_ordre"])
                        return 0

        def creer(self) :
                # si l' fracture existe, on refuse de le creer
                if self.exist(["zone", "numero", "bis", "fr_ordre"]) :
                        primarykeys = { "zone" : None, "numero" : None, "bis": None, "fr_ordre": None}
                        return (-1, primarykeys)
                else :
                        # sinon si son parent n'existe pas, on refuse
                        if not self.exist(["zone", "numero", "bis"], table = "industrie") :
                                primarykeys = { "zone" : None, "numero" : None, "bis": None}
                                return (-2, primarykeys)
                        # sinon si son parent existe, on le cree
                        else :
                                # on insère maintenant le fracture dans la base
                                z = self.__form__["zone"].value
                                n = self.__form__["numero"].value
                                b = self.__form__["bis"].value
                                o = self.__form__["fr_ordre"].value
                                self.__db__.query(self.make_insert_query({ }))
                                primarykeys = { "zone" : z, "numero" : n, "bis" : b, "fr_ordre" : o}
                                return (0, primarykeys)
