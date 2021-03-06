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


class Usure_Dent(archeodata.Data):
    #
    # le nom de la table
    __tablename__ = "usure_dent"
    __new_record__ = "Nouvelle"
    __color__ = archeoconf.bas1_bgcolor
    #
    # tous les champs de la table proprietaire
    __champs__ =    {
                    "zone"            : {"type": "text", "default": "", "mandatory": 1, "longueur": 0, "memory": 1},
                    "numero"          : {"type": "decimal", "default": 0, "mandatory": 1, "longueur": 6,"memory": 1},
                    "bis"             : {"type": "text","default": "",  "mandatory": 1, "longueur": 0, "memory": 1},
                    "ud_serie"        : {"type": "text", "default": "", "mandatory": 1, "longueur": 1},
                    "ud_type"         : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "ud_lateralite"   : {"type": "text", "default": 0, "mandatory": 0, "longueur": 2},
                    "ud_usure"        : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "ud_fragmentation": {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    }
    #
    # liste des tables enfants
    __listenfants__ = ()
    __listeparents__ = ("carnet", "faune")
    __listeclefs__ = ("zone", "numero", "bis", "ud_serie")
    __vraiparent__ = "faune"
    #
    # liste des seuls champs que l'on veut pouvoir modifier
    __listechamps__ = ("zone", "numero", "bis", "ud_serie", "ud_type", "ud_lateralite", "ud_usure", "ud_fragmentation")
    #
    # liste des champs dans leur ordre de saisie
    __ordrechamps__ = ("zone", "numero", "bis", "ud_serie", "ud_type", "ud_lateralite", "ud_usure", "ud_fragmentation")
    __orderby__ = " ORDER BY zone, numero, bis, ud_serie ASC;"
    #
    # liste des formulaires supplementaires
    __formsupp__ = ("photousure_dent",)

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

    def ud_serie_verify(self, fieldname, value):
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
        afficheclefs.display_zone(self, enreg, penreg)

    def numero_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_numero(self, enreg, penreg)

    def bis_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_bis(self, enreg, penreg)

    def ud_serie_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_x_serie(self, "ud_serie", "30", enreg, penreg)
        self.__doc__.pop()

    def ud_type_base_to_form(self, enreg, penreg=None):
        afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "ud_type", "type", 3, 20, " ", enreg, penreg)

    def ud_lateralite_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "ud_lateralite", "lateralité", 1, 20, "", enreg, penreg)
        self.__doc__.pop()

    def ud_usure_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "ud_usure", "usure", 2, 20, " ",enreg, penreg)

    def ud_fragmentation_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "ud_fragmentation", "fragmentation", 4, 20, "", enreg, penreg)
        self.__doc__.pop()

##############################################################################################################################
#                                               METHODES
##############################################################################################################################
    def modifier(self):
        """Met a jour la micro courante"""
        self.__db__.query(self.make_update_query(self.__listeclefs__))
        return 0

    def supprimer(self):
        self.delete_records(self.__listeclefs__)
        return 0

    def creer(self):
        # si la usure_dent n'existe pas déjà alors on la crée, sinon on refuse
        if self.exist(self.__listeclefs__):
            primarykeys = {"zone": None, "numero": None, "bis": None, "o_ordre": None, "ud_serie": None}
            return (-1, primarykeys)
        else:
            # on insère maintenant la usure_dent dans la base
            # sauf si la faune n'existe pas.
            if not self.exist(("zone", "numero", "bis"), table="faune"):
                primarykeys = {"zone": None, "numero": None, "bis": None}
                return (-2, primarykeys)
            else:
                # on insère maintenant la usure_dent dans la base
                z = self.__form__["zone"].value
                n = self.__form__["numero"].value
                b = self.__form__["bis"].value
                e = self.__form__["ud_serie"].value
                self.__db__.query(self.make_insert_query({}))
                primarykeys = {"zone": z, "numero": n, "bis": b, "ud_serie": e}
                return (0, primarykeys)

