#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Annuaire - (c) 2006-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
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
import annuaireconf
import annuairedata
import fiche
import afficheclefs


class Entree(annuairedata.Data) :
        #
        # le nom de la table
        __tablename__ = "entree"
        __new_record__ = "Nouveau"
        __color__ = annuaireconf.bas1_bgcolor
        #
        # tous les champs de la table entree
        __champs__ = { \
                        "identifiant" : { "type" : "int", "default" : 0,   "mandatory" : 1 , "longueur" : 6, "memory" : 1 }, \
                        "type_entree" : { "type" : "text", "default" : "",  "mandatory" : 1 , "longueur" : 0 , "memory" : 1 }, \
                    }

        #
        # liste des tables enfants
        __listenfants__ = [ "fiche"]
        __listeclefs__ = ["identifiant"]
        __vraiparent__ = "entree"

        #
        # liste des seuls champs que l'on veut pouvoir modifier
        __listechamps__ = [ "identifiant", "type_entree"]

        #
        # liste des champs dans leur ordre de saisie
        __ordrechamps__ = [ "identifiant", "type_entree"]


        __orderby__ = " ORDER BY identifiant ASC;"

        __controle_saisie__ =[""]

        #
        # liste des formulaires supplementaires
        __formsupp__ = ["fiche" ]

        def identifiant_verify(self, fieldname, value) :
                if (value == '') or self.champ_verify(fieldname, value) :
                        return -1
                else :
                        return 0


        def champ_verify(self, fieldname, value) :
                # si la longueur de la valeur issue du formulaire est > a la longueur
                # definie dans l'attribut longueur des champs
                if  (value != None) and (len(value) > self.__champs__[fieldname]["longueur"]) :
                        return -1       # erreur
                else:
                        return 0

        def __init__(self, parent) :
                for champ in self.__champs__.keys() :
                        if self.__champs__[champ]["longueur"] :
                                if not hasattr(self, "%s_verify" % champ) :
                                        setattr(self, "%s_verify" % champ, self.champ_verify)
                annuairedata.Data.__init__(self, parent)

        def identifiant_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.push()
                self.__doc__.td()
                afficheclefs.display_identifiant(self, enreg, penreg,2)

        def type_entree_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste(self, "type_entree", "type_entree", enreg, penreg, "", dontchange = 0)
                self.__doc__.pop()
                self.__doc__.pop()


##############################################################################################################################
#                                               METHODES
##############################################################################################################################

        def modifier(self) :
                """Met a jour l'entree courante"""
                self.__db__.query(self.make_update_query(["identifiant"]))
                return 0

        def supprimer(self) :
                # s'il existe des fiches associes a cette entree, on refuse la suppression
                if self.exist(["identifiant"], table = "fiche") :
                        return -1
                else :
                        # on efface l'entree
                        self.delete_records(["identifiant"])
                        return 0

        def creer(self) :
                # si l'objet n'existe pas déjà alors on la crée, sinon on refuse
                if self.exist(["identifiant"]) :
                        return (-1, { "identifiant" : None})
                else :
                        i = self.__form__["identifiant"].value
                        requete = (self.make_insert_query({ }))
                        self.__db__.query(requete)
                        primarykeys = { "identifiant" : i }
                        return (1, primarykeys)




