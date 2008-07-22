#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Collection - (c) 2006-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#

import collectionconf
import collectiondata
import afficheclefs


class Association(collectiondata.Data):
    #
    # le nom de la table
    __tablename__ = "association"
    __new_record__ = "Nouvelle"
    __color__ = collectionconf.bas1_bgcolor
    #
    # tous les champs de la table proprietaire
    __champs__ = {
                "identifiant_1": {"type": "text", "default": "", "mandatory": 1, "longueur": 20, "memory": 1},
                "identifiant_2": {"type": "text", "default": "", "mandatory": 1, "longueur": 20, "memory": 1},
                }
    #
    # liste des tables enfants
    __listenfants__   = ()
    __listeclefs__    = ("identifiant_1", "identifiant_2")
    __vraiparent__    = "association"
    #
    # liste des seuls champs que l'on veut pouvoir modifier
    __listechamps__ = ("identifiant_1", "identifiant_2")
    # liste des champs dans leur ordre de saisie
    __ordrechamps__ = ("identifiant_1", "identifiant_2")
    __orderby__ = " ORDER BY identifiant_1, identifiant_2 ASC;"
    #
    # liste des formulaires supplementaires
    __formsupp__ = ()

    def identifiant_1_verify(self, fieldname, value):
        if (value == '') or self.champ_verify(fieldname, value):
            return -1
        else:
            return 0

    def identifiant_2_verify(self, fieldname, value):
        if (value == '') or self.champ_verify(fieldname, value):
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
        collectiondata.Data.__init__(self, parent)

################################### En entrée ###########################
    def identifiant_1_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td()
        self.__doc__.insert_text(" ")
        afficheclefs.display_identifiant_1(self, enreg, penreg, 2)
        self.__doc__.pop()

    def identifiant_2_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td()
        self.__doc__.insert_text(" ")
        afficheclefs.display_identifiant_2(self, enreg, penreg, 2)
        self.__doc__.pop()
        self.__doc__.pop()
        self.__doc__.pop()

###############################################################################
#                                METHODES
##############################################################################
    def modifier(self):
        """Met a jour la association courante"""
        self.__db__.query(self.make_update_query(self.__listeclefs__))
        return 0

    def supprimer(self):
        # on efface l' association
        self.delete_records(self.__listeclefs__)
        return 0

    def creer(self):
        # si la association n'existe pas déjà alors on la crée, sinon on refuse
        i1 = self.__form__["identifiant_1"].value
        i2 = self.__form__["identifiant_2"].value
        if (self.exist_association_identique(self.__db__.quote(i1,"text"), self.__db__.quote(i2,"text"), "association")== 1):
            primarykeys = {"identifiant_1": None, "identifiant_2": None}
            return (-1, primarykeys)
        else:
            # on insere maintenant la association dans la base
            self.__db__.query(self.make_insert_query({ }))
            primarykeys = {"identifiant_1": i1, "identifiant_2":i2}
            return (0, primarykeys)




