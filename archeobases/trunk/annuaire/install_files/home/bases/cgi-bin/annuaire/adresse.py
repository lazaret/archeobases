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
import afficheclefs
import re


class Adresse(annuairedata.Data):
    #
    # le nom de la table
    __tablename__ = "adresse"
    __new_record__ = "Nouvelle"
    __color__ = annuaireconf.bas2_bgcolor
    #
    # tous les champs de la table proprietaire
    __champs__ = {
                "identifiant"   : {"type": "int",  "default": 0,  "mandatory": 1, "longueur": 6, "memory": 1},
                "ordre"         : {"type": "int",  "default": 1,  "mandatory": 1, "longueur": 2},
                "type_adresse"  : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                "adresse_1"     : {"type": "text", "default": "", "mandatory": 0, "longueur": 50, "memory": 1},
                "adresse_2"     : {"type": "text", "default": "", "mandatory": 0, "longueur": 50, "memory": 1},
                "adresse_3"     : {"type": "text", "default": "", "mandatory": 0, "longueur": 50, "memory": 1},
                "adresse_4"     : {"type": "text", "default": "", "mandatory": 0, "longueur": 50, "memory": 1},
                "code"          : {"type": "text", "default": "", "mandatory": 0, "longueur": 20, "memory": 1},
                "ville"         : {"type": "text", "default": "", "mandatory": 0, "longueur": 25, "memory": 1},
                "pays"          : {"type": "text", "default": "", "mandatory": 0, "longueur": 20, "memory": 1},
                "telephone_1"   : {"type": "text", "default": "", "mandatory": 0, "longueur": 20, "memory": 1},
                "telephone_2"   : {"type": "text", "default": "", "mandatory": 0, "longueur": 20, "memory": 1},
                "fax"           : {"type": "text", "default": "", "mandatory": 0, "longueur": 20, "memory": 1},
                "email"         : {"type": "text", "default": "", "mandatory": 0, "longueur": 30, "memory": 1},
                "modif_adresse" : {"type": "date", "mandatory" : 0 , "longueur" : 10},
                }
    #
    # liste des tables enfants
    __listenfants__ = ()
    __listeclefs__ = ("identifiant", "ordre")
    __vraiparent__ = "fiche"
    __listparents__ = ("fiche",)
    #
    # liste des seuls champs que l'on veut pouvoir modifier
    __listechamps__ = ("identifiant", "ordre", "type_adresse", "adresse_1", "adresse_2", "adresse_3", "adresse_4", "code", "ville", "pays", "telephone_1", "telephone_2", "fax", "email")
    #
    # liste des champs dans leur ordre de saisie
    __ordrechamps__ = ("identifiant", "ordre", "type_adresse", "adresse_1", "adresse_2", "adresse_3", "adresse_4", "code", "ville", "pays", "telephone_1", "telephone_2", "fax", "email", "modif_adresse")
    __orderby__ = " ORDER BY identifiant, ordre ASC;"
    #
    # liste des formulaires supplementaires
    __formsupp__ = ()

    def __init__(self, parent, nomtable=None):
        self.__tablename__ = nomtable
        annuairedata.Data.__init__(self, parent)

    def identifiant_verify(self, fieldname, value):
        if (value == '') or self.champ_verify(fieldname, value):
            return -1
        else:
            return 0

    def ordre_verify(self, fieldname, value):
        if value == '':
            return -1
        else:
            return 0

    def champ_verify(self, fieldname, value):
        # si la longueur de la valeur issue du formulaire est > a la longueur
        # definie dans l'attribut longueur des champs
        if  (value != None) and (len(value) > (self.__champs__[fieldname]["longueur"])*2):
            return -1       # erreur
        else:
            return 0

    def __init__(self, parent):  ###FIXME why to __init__ lethods ?
        for champ in self.__champs__.keys():
            if self.__champs__[champ]["longueur"]:
                if not hasattr(self, "%s_verify" % champ):
                    setattr(self, "%s_verify" % champ, self.champ_verify)
        annuairedata.Data.__init__(self, parent)

    def identifiant_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td()
        afficheclefs.display_identifiant(self, enreg, penreg, 2)

    def ordre_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_x_ordre(self, "ordre", 1, 5, enreg, penreg)
        self.__doc__.pop()

################################### En entree ##############################################
    def type_adresse_base_to_form(self, enreg, penreg=None):
        afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
        self.__doc__.push()
        afficheclefs.champ_liste( self, "type_adresse", "Type", enreg, penreg, " ", dontchange=0)
        self.__doc__.pop()

    def adresse_1_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "adresse_1", "Adresse", 50, 50, " ", enreg, penreg)
        self.__doc__.pop()

    def adresse_2_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "adresse_2", "", 50, 50, " ", enreg, penreg)
        self.__doc__.pop()

    def adresse_3_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "adresse_3", "", 50, 50, " ", enreg, penreg)
        self.__doc__.pop()

    def adresse_4_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "adresse_4", "", 50, 50, " ", enreg, penreg)
        self.__doc__.pop()

    def code_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "code", "Code Postal", 10, 10, " ", enreg, penreg)

    def ville_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "ville", "Ville", 25, 25, " ", enreg, penreg)
        self.__doc__.pop()

    def pays_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "pays", "Pays", 20, 20, " ", enreg, penreg)
        self.__doc__.pop()

    def telephone_1_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "telephone_1", "Telephone", 20, 20, " ", enreg, penreg)

    def telephone_2_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "telephone_2", "", 20, 20, " ", enreg, penreg)
        self.__doc__.pop()

    def fax_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "fax", "Fax", 20, 20, " ", enreg, penreg)

    def email_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "email", "Email", 30, 30, " ", enreg, penreg)
        self.__doc__.pop()
        self.__doc__.pop()

    def modif_adresse_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        if enreg != None:
            afficheclefs.champ_saisie(self, "modif_adresse", "MAJ", 10, 20, " ", enreg, penreg)
        self.__doc__.pop()

##############################################################################################################################
#                                               METHODES
##############################################################################################################################
    def modifier(self) :
        """Met a jour l'adresse courante"""
        self.__db__.query(self.make_update_query(self.__listeclefs__))
        i = self.__form__["identifiant"].value
        update_date = "UPDATE adresse SET modif_adresse='now' WHERE identifiant=" + i  + ";"
        self.__db__.query(update_date)
        return 0

    def supprimer(self):
        # on efface l'adresse
        self.delete_records(self.__listeclefs__)
        return 0

    def creer(self):
        # si l'adresse existe, on refuse de le creer
        if self.exist(self.__listeclefs__):
            primarykeys = {"identifiant": None, "ordre": None}
            return (-1, primarykeys)
        else :
            # sinon si son parent n'existe pas, on refuse
            if not self.exist(["identifiant"], table = "fiche"):
                primarykeys = {"identifiant": None}
                return (-2, primarykeys)
            # sinon si son parent existe, on le cree
            else:
                # on insere maintenant l'adresse dans la base
                i = self.__form__["identifiant"].value
                o = self.__form__["ordre"].value
                self.__db__.query(self.make_insert_query({ }))
                primarykeys = {"identifiant": i, "ordre": o}
                update_date = "UPDATE adresse SET modif_adresse='now' WHERE identifiant=" + i  + ";"
                self.__db__.query(update_date)
                return (0, primarykeys)
