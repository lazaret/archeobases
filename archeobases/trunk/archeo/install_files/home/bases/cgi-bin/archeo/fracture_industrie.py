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

import archeoconf
import archeodata
import afficheclefs


class Fracture_Industrie(archeodata.Data):
    #
    # le nom de la table
    __tablename__ = "fracture_industrie"
    __new_record__ = "Nouvelle"
    __color__ = archeoconf.bas3_bgcolor
    #
    # tous les champs de la table proprietaire
    __champs__ =   {
                    "zone"         : {"type": "text", "default": "", "mandatory": 1, "longueur": 0, "memory": 1},
                    "numero"       : {"type": "decimal", "default": 0, "mandatory": 1, "longueur": 6, "memory": 1},
                    "bis"          : {"type": "text", "default": "", "mandatory": 1, "longueur": 0, "memory": 1},
                    "fi_ordre"     : {"type": "decimal", "default": 0, "mandatory": 1, "longueur": 0, "memory": 0},
                    "fi_type"      : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "fi_percussion": {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "fi_mode"      : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "fi_localisation": {"type": "text", "default": "", "mandatory": 0, "longueur": 10},
                    "fi_anciennete": {"type": "text", "default": "", "mandatory": 0, "longueur": 3},
                    "fi_relation"  : {"type": "text", "default": "", "mandatory": 0, "longueur": 7},
                    }
    #
    # liste des tables enfants
    __listenfants__ = ()
    __listeclefs__ = ("zone", "numero", "bis", "fi_ordre")
    __vraiparent__ = "industrie"
    __listeparents__ = ("industrie",)
    #
    # liste des seuls champs que l'on veut pouvoir modifier
    __listechamps__ = ("zone", "numero", "bis", "fi_ordre", "fi_type", "fi_percussion", "fi_mode", "fi_localisation", "fi_anciennete", "fi_relation")
    #
    # liste des champs dans leur ordre de saisie
    __ordrechamps__ = ("zone", "numero", "bis", "fi_ordre", "fi_type",  "fi_percussion", "fi_mode",  "fi_localisation", "fi_anciennete", "fi_relation")
    __orderby__ = " ORDER BY zone, numero, bis ASC;"
    #
    # liste des formulaires supplementaires
    __formsupp__ = ()

    def __init__(self, parent, nomtable=None):
        self.__tablename__ = nomtable
        archeodata.Data.__init__(self, parent)

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

    def fi_ordre_verify(self, fieldname, value):
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
        self.__doc__.td(align="center", colspan="8")
        self.__doc__.insert_text("FRACTURES")
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.td()
        self.__doc__.insert_text(" ")
        self.__doc__.pop()
        afficheclefs.display_zone(self, enreg, penreg)

    def numero_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_numero(self, enreg, penreg)

    def bis_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_bis(self, enreg, penreg)

    def fi_ordre_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_x_ordre(self, "fi_ordre", 1, 15, enreg, penreg)
        self.__doc__.pop()

################################### En entrée #########################
    def fi_type_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_liste(self, "fi_type", "type", enreg, penreg, " ", dontchange=0)

    def fi_percussion_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "fi_percussion", "percussion", enreg, penreg, "", dontchange=0)

    def fi_mode_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "fi_mode", "mode", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

#######################
    def fi_localisation_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "fi_localisation", "localisation", 10, 20, " ", enreg, penreg)

    def fi_anciennete_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "fi_anciennete", "anciennete", 3, 20, "", enreg, penreg)

    def fi_relation_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "fi_relation", "relation", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

##############################################################################################################################
#                                               METHODES
##############################################################################################################################
    def modifier(self):
        """Met a jour l'fracture courant"""
        self.__db__.query(self.make_update_query(self.__listeclefs__))
        return 0

    def supprimer(self):
        # s'il existe des figures ou des photos sur cette industrie on refuse la suppression
        # on efface la fracture
        self.delete_records(self.__listeclefs__)
        return 0

    def creer(self):
        # si l' fracture existe, on refuse de le creer
        if self.exist(self.__listeclefs__):
            primarykeys = {"zone": None, "numero": None, "bis": None, "fi_ordre": None}
            return (-1, primarykeys)
        else:
            # sinon si son parent n'existe pas, on refuse
            if not self.exist(("zone", "numero", "bis"), table="industrie"):
                primarykeys = {"zone": None, "numero": None, "bis": None}
                return (-2, primarykeys)
            # sinon si son parent existe, on le cree
            else:
                # on insère maintenant le fracture dans la base
                z = self.__form__["zone"].value
                n = self.__form__["numero"].value
                b = self.__form__["bis"].value
                o = self.__form__["fi_ordre"].value
                self.__db__.query(self.make_insert_query({}))
                primarykeys = {"zone": z, "numero": n, "bis": b, "fi_ordre": o}
                return (0, primarykeys)
