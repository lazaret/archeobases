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


class Enlevement_Hachereau(archeodata.Data):
    #
    # le nom de la table
    __tablename__ = "enlevement_hachereau"
    __new_record__ = "Nouvel"
    __color__ = archeoconf.bas3_bgcolor
    #
    # tous les champs de la table proprietaire
    __champs__ = {
                "zone"           : {"type": "text", "default": "",  "mandatory": 1, "longueur": 0, "memory": 1},
                "numero"         : {"type": "int",  "default": 0,   "mandatory": 1, "longueur": 6, "memory": 1},
                "bis"            : {"type": "text", "default": "",  "mandatory": 1, "longueur": 0, "memory": 1},
                "eh_rang"        : {"type": "text", "default": "0", "mandatory": 1, "longueur": 1},
                "eh_longueur"    : {"type": "int",  "mandatory": 0, "longueur": 3},
                "eh_largeur"     : {"type": "int",  "mandatory": 0, "longueur": 3},
                "eh_obliquite"   : {"type": "int",  "mandatory": 0, "longueur": 3},
                "eh_corde"       : {"type": "int",  "mandatory": 0, "longueur": 3},
                "eh_fleche"      : {"type": "int",  "mandatory": 0, "longueur": 3},
                "eh_tranche"     : {"type": "text", "default":  "", "mandatory": 0, "longueur": 8},
                }
    #
    # liste des tables enfants
    __listenfants__ = ()
    __listeclefs__ = ("zone", "numero", "bis", "eh_rang")
    __listeparents__ = ("carnet", "hachereau")
    __vraiparent__ = "hachereau"
    #
    # liste des seuls champs que l'on veut pouvoir modifier
    __listechamps__ = ("zone", "numero", "bis", "eh_rang", "eh_longueur", "eh_largeur", "eh_obliquite", "eh_corde", "eh_fleche", "eh_tranche")
    #
    # liste des champs dans leur ordre de saisie
    __ordrechamps__ = ("zone", "numero", "bis", "eh_rang", "eh_longueur", "eh_largeur", "eh_obliquite", "eh_corde", "eh_fleche", "eh_tranche")
    __orderby__ = " ORDER BY zone, numero, bis, eh_rang ASC;"
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

    def eh_rang_verify(self, fieldname, value):
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
        self.__doc__.insert_text("ARCHEOMETRIE DES ENLEVEMENTS")
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

    def eh_rang_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_x_rang(self, "eh_rang", "45", enreg, penreg)
        self.__doc__.pop()

################################### En entrée ##############################################
    def eh_longueur_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "eh_longueur", "longueur", 3, 20, " ", enreg, penreg)

    def eh_largeur_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "eh_largeur", "largeur", 3, 20, "", enreg, penreg)

    def eh_obliquite_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "eh_obliquite", "obliquité", 3, 20, "", enreg, penreg)
        self.__doc__.pop()

########################
    def eh_corde_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "eh_corde", "corde", 3, 20, " ", enreg, penreg)

    def eh_fleche_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "eh_fleche", "fleche", 3, 20, "", enreg, penreg)

    def eh_tranche_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "eh_tranche", "n° tranche", 8, 20, "", enreg, penreg)
        self.__doc__.pop()

##############################################################################################################################
#                                               METHODES
##############################################################################################################################
    def modifier(self):
        """Met a jour l'enlevement courant"""
        self.__db__.query(self.make_update_query(self.__listeclefs__))
        return 0

    def supprimer(self):
        # on efface l' enlevement
        self.delete_records(self.__listeclefs__)
        return 0

    def creer(self):
        # si l' enlevement existe, on refuse de le creer
        if self.exist(self.__listeclefs__):
            primarykeys = {"zone": None, "numero": None, "bis": None, "eh_rang": None}
            return (-1, primarykeys)
        else:
            # sinon si son parent n'existe pas, on refuse
            if not self.exist(("zone", "numero", "bis"), table="hachereau"):
                primarykeys = {"zone": None, "numero": None, "bis": None}
                return (-2, primarykeys)
            # sinon si son parent existe, on le cree
            else:
                # on insère maintenant le enlevement dans la base
                z = self.__form__["zone"].value
                n = self.__form__["numero"].value
                b = self.__form__["bis"].value
                r = self.__form__["eh_rang"].value
                self.__db__.query(self.make_insert_query({}))
                primarykeys = {"zone": z, "numero": n, "bis": b, "eh_rang": r}
                return (0, primarykeys)
