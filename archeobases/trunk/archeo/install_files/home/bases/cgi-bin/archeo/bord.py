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
# $Id: bord.py,v 1.6 2001/07/05 15:29:09 rachel Exp $
#
# $Log: bord.py,v $
# Revision 1.6  2001/07/05 15:29:09  rachel
# plein de modifs
#
# Revision 1.5  2001/04/05 09:44:27  rachel
# remise en place des modfis pour le +1 qui fonctionne.
# de plus les listes et le champ numeros sont bien en dontchange =0 lors de nouveau comptage ou bien recherche.
# il doit falloir que je generalise pour que cela s'applique a tous les chmaps.
# il faut aussi que je fasse les modifs pour les liens ainsi que popur les chmaps a memoriser.
#
# Revision 1.4  2001/03/20 19:59:29  jerome
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

class Bord(archeodata.Data) :
        #
        # le nom de la table
        __tablename__ = "bord"
        __new_record__ = "Nouvelle"
        __color__ = archeoconf.bas2_bgcolor

        #
        # tous les champs de la table proprietaire
        __champs__ = { 
                        "b_ordre" : { "type" : "seq", "default": "nextval('seq_bord')", "mandatory" : 1 , "longueur" : 0 }, \
                        "zone"          : { "type" : "text", "default" : "", "mandatory" : 1, "longueur" : 0 , "memory":1}, \
                        "numero"        : { "type" : "decimal", "default" : 0, "mandatory" : 1, "longueur" : 6 , "memory":1}, \
                        "bis"           : { "type" : "text", "default" : "", "mandatory" : 1, "longueur" : 0 , "memory":1}, \
                        "b_ordre"       : { "type" : "decimal", "default" : 0, "mandatory" : 1, "longueur" : 2 }, \
                        "b_extremite"   : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0 }, \
                        "b_code"        : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0 }, \
                        "b_amincissement" : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0 }, \
                        "b_localisation": { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 7 }, \
                      }
        #
        # liste des tables enfants
        __listenfants__ = []
        __listeclefs__ = ["zone", "numero", "bis"]
        
        __vraiparent__ = "eclat"
        #
        # liste des seuls champs que l'on veut pouvoir modifier
        __listechamps__ = ["zone", "numero", "bis","b_ordre", "b_extremite","b_code", "b_localisation", "b_amincissement"]

        #
        # liste des champs dans leur ordre de saisie
        __ordrechamps__ =["zone", "numero", "bis", "b_ordre","b_extremite","b_code", "b_localisation", "b_amincissement"]

        __orderby__ = " ORDER BY zone, numero, bis ASC;"

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

        def b_ordre_verify(self, fieldname, value) :
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
                self.__doc__.insert_text("BORDS")
                self.__doc__.push()
                self.__doc__.br()
                self.__doc__.br()
                self.__doc__.tr()
                self.__doc__.td()
                self.__doc__.insert_text(" ")
                self.__doc__.pop()
                afficheclefs.display_zone( self, enreg, penreg)

        def numero_base_to_form(self, enreg, penreg = None) :
                afficheclefs.display_numero(self, enreg, penreg)

        def bis_base_to_form(self, enreg, penreg = None) :
                afficheclefs.display_bis( self, enreg, penreg)

        def b_ordre_base_to_form(self, enreg, penreg = None) :
                afficheclefs.display_x_ordre(self, "b_ordre", 1, 15, enreg, penreg)
                self.__doc__.pop()

################################### En entrée ##############################################
        def b_extremite_base_to_form(self, enreg, penreg = None) :
                afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
                self.__doc__.push()
                self.__doc__.br()
                afficheclefs.champ_liste( self, "b_extremite", "extrémité", enreg, penreg, " ", dontchange = 0)

        def b_code_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "b_code", "code", enreg, penreg, "", dontchange = 0)
                self.__doc__.pop()

        def b_localisation_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_localisation", "localisation", 7, 20, " ", enreg, penreg)
        def b_amincissement_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "b_amincissement", "amincissement", enreg, penreg, "", dontchange = 0)
                self.__doc__.pop()

##############################################################################################################################
#                                               METHODES
##############################################################################################################################

        def modifier(self) :
                """Met a jour l'bord courant"""
                liste = ["zone", "numero","bis","b_ordre"]
                self.__db__.query(self.make_update_query(liste))
                return 0

        def supprimer(self) :

                        # on efface le bord
                        self.delete_records(["zone","numero","bis","b_ordre"])
                        return 0

        def creer(self) :

                # si le bord existe, on refuse de le creer
                if self.exist(["zone", "numero", "bis", "b_ordre"]) :
                        primarykeys = { "zone" : None, "numero" : None, "bis": None, "b_ordre": None,}
                        return (-1, primarykeys)
                else :
                        # sinon si son parent n'existe pas, on refuse
                        if not self.exist(["zone", "numero", "bis"], table = "eclat") :
                                primarykeys = { "zone" : None, "numero" : None, "bis": None}
                                return (-2, primarykeys)
                        # sinon si son parent existe, on le cree
                        else :
                                # on insère maintenant le enlevement dans la base
                                z = self.__form__["zone"].value
                                n = self.__form__["numero"].value
                                b = self.__form__["bis"].value
                                o = self.__form__["b_ordre"].value
                                self.__db__.query(self.make_insert_query({ }))
                                primarykeys = { "zone" : z, "numero" : n, "bis" : b, "b_ordre" : o}
                                return (0, primarykeys)
