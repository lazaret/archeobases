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
# $Id: enlevement_galet.py,v 1.12 2002/07/08 16:32:53 rachel Exp $
#
# $Log: enlevement_galet.py,v $
# Revision 1.12  2002/07/08 16:32:53  rachel
# Dernieres modifs
#
# Revision 1.11  2001/11/09 15:25:38  rachel
# *** empty log message ***
#
# Revision 1.10  2001/11/09 08:32:34  rachel
# tout plein de modifs pdt que CVS ne fonctionnait pas
#
# Revision 1.9  2001/07/05 15:29:12  rachel
# plein de modifs
#
# Revision 1.8  2001/04/05 09:44:29  rachel
# remise en place des modfis pour le +1 qui fonctionne.
# de plus les listes et le champ numeros sont bien en dontchange =0 lors de nouveau comptage ou bien recherche.
# il doit falloir que je generalise pour que cela s'applique a tous les chmaps.
# il faut aussi que je fasse les modifs pour les liens ainsi que popur les chmaps a memoriser.
#
# Revision 1.7  2001/03/20 19:59:32  jerome
# Ajout des tags CVS Id et Log
#
#
#

import os
import string
import archeoconf
import archeodata
import afficheclefs
import re

class Enlevement_Biface(archeodata.Data) :
        #
        # le nom de la table
        __tablename__ = "enlevement_biface"
        __new_record__ = "Nouvel"
        __color__ = archeoconf.bas3_bgcolor
        #
        # tous les champs de la table proprietaire
        __champs__ = { 
                        "zone"              : { "type" : "text", "default" : "", "mandatory" : 1 , "longueur" : 0, "memory" : 1}, \
                        "numero"            : { "type" : "int", "default" : 0, "mandatory" : 1 , "longueur" : 6, "memory" : 1}, \
                        "bis"               : { "type" : "text", "default" : "", "mandatory" : 1 , "longueur" : 0, "memory" : 1}, \
                        "eb_rang"          : { "type" : "text", "default" : "0", "mandatory" : 1 , "longueur" : 1}, \
                        "eb_longueur"       : { "type" : "int", "mandatory" : 0 , "longueur" : 3}, \
                        "eb_largeur"        : { "type" : "int", "mandatory" : 0 , "longueur" : 3}, \
                        "eb_obliquite"      : { "type" : "int", "mandatory" : 0 , "longueur" : 3}, \
                        "eb_corde"          : { "type" : "int", "mandatory" : 0 , "longueur" : 3}, \
                        "eb_fleche"         : { "type" : "int", "mandatory" : 0 , "longueur" : 3}, \
                        "eb_tranche"        : { "type" : "text", 
"default" : "","mandatory" : 0 , "longueur" : 8}, \
                
                      }
        #
        # liste des tables enfants
        __listenfants__ = []
        __listeclefs__ = ["zone", "numero", "bis", "eb_rang"]
        __listeparents__ = ["carnet","biface"]
        
        __vraiparent__ = "biface"
        
        
        #
        # liste des seuls champs que l'on veut pouvoir modifier
        __listechamps__ = ["zone", "numero", "bis", "eb_rang", "eb_longueur", "eb_largeur", "eb_obliquite", "eb_corde", "eb_fleche", "eb_tranche"]


        #
        # liste des champs dans leur ordre de saisie
        __ordrechamps__ = ["zone", "numero", "bis", "eb_rang", "eb_longueur", "eb_largeur", "eb_obliquite", "eb_corde", "eb_fleche", "eb_tranche"]

        __orderby__ = " ORDER BY zone, numero, bis, eb_rang ASC;"

         #
        # liste des formulaires supplementaires
        __formsupp__ = []
        def __init__(self, parent, nomtable = None) :
                self.__tablename__ = nomtable
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

        def eb_rang_verify(self, fieldname, value) :
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
                self.__doc__.insert_text("ARCHEOMETRIE DES ENLEVEMENTS")
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

        def eb_rang_base_to_form(self, enreg, penreg = None) :
                afficheclefs.display_x_rang(self, "eb_rang", "45", enreg, penreg)
                self.__doc__.pop()


################################### En entrée ##############################################

        def eb_longueur_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "eb_longueur", "longueur", 3, 20, " ", enreg, penreg)

        def eb_largeur_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "eb_largeur", "largeur", 3, 20, "", enreg, penreg)

        def eb_obliquite_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "eb_obliquite", "obliquité", 3, 20, "", enreg, penreg)
                self.__doc__.pop()
########################

        def eb_corde_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "eb_corde", "corde", 3, 20, " ", enreg, penreg)

        def eb_fleche_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "eb_fleche", "fleche", 3, 20, "", enreg, penreg)

        def eb_tranche_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "eb_tranche", "n° tranche", 8, 20, "", enreg, penreg)
                self.__doc__.pop()


##############################################################################################################################
#                                               METHODES
##############################################################################################################################

        def modifier(self) :
                """Met a jour l'enlevement courant"""
                self.__db__.query(self.make_update_query(["zone", "numero", "bis","eb_rang"]))
                return 0

        def supprimer(self) :
                # on efface l' enlevement
                self.delete_records(["zone", "numero", "bis", "eb_rang"])
                return 0

        def creer(self) :
                # si l' enlevement existe, on refuse de le creer
                if self.exist(["zone", "numero", "bis", "eb_rang"]) :
                        primarykeys = { "zone" : None, "numero" : None, "bis": None, "eb_rang": None,}
                        return (-1, primarykeys)
                else :
                        # sinon si son parent n'existe pas, on refuse
                        if not self.exist(["zone", "numero", "bis"], table = "biface") :
                                primarykeys = { "zone" : None, "numero" : None, "bis": None}
                                return (-2, primarykeys)
                        # sinon si son parent existe, on le cree
                        else :
                                # on insère maintenant le enlevement dans la base
                                z = self.__form__["zone"].value
                                n = self.__form__["numero"].value
                                b = self.__form__["bis"].value
                                r = self.__form__["eb_rang"].value
                                self.__db__.query(self.make_insert_query({ }))
                                primarykeys = { "zone" : z, "numero" : n, "bis" : b, "eb_rang" : r}
                                return (0, primarykeys)
