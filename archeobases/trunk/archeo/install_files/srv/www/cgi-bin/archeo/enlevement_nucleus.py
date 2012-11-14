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


class Enlevement_Nucleus(archeodata.Data):
    #
    # le nom de la table
    __tablename__ = "enlevement_nucleus"
    __new_record__ = "Nouvel"
    __color__ = archeoconf.bas3_bgcolor
    #
    # tous les champs de la table proprietaire
    __champs__ =    {
                    "zone"          : {"type": "text", "default": "", "mandatory": 1, "longueur": 0, "memory": 1},
                    "numero"        : {"type": "int", "default": 0, "mandatory": 1, "longueur": 6, "memory": 1},
                    "bis"           : {"type": "text", "default": "", "mandatory": 1, "longueur": 0, "memory": 1},
                    "n_ordre"       : {"type": "int", "default": 0, "mandatory": 1, "longueur": 0, "memory": 1},
                    "en_rang"       : {"type": "text", "default": "0", "mandatory": 1, "longueur": 1},
                    "en_longueur"   : {"type": "decimal", "mandatory": 0, "longueur": 0},
                    "en_largeur"    : {"type": "decimal", "mandatory": 0, "longueur": 0},
                    "en_obliquite_degre" : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "en_corde"      : {"type": "int", "mandatory": 0, "longueur": 0},
                    "en_fleche"     : {"type": "int", "mandatory": 0, "longueur": 0},
                    "en_dptimpact"  : {"type": "text", "mandatory": 0, "longueur": 0},
                    "en_frappe"     : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "en_numero"     : {"type": "int", "mandatory": 0, "longueur": 0},
                    "en_inclinaison": {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "en_direction"  : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    }
    #
    # liste des tables enfants
    __listenfants__ = ()
    __listeclefs__ = ("zone", "numero", "bis", "n_ordre", "en_rang")
    __listeparents__ = ("carnet", "nucleus")
    __vraiparent__ = "nucleus"
    # liste des seuls champs que l'on veut pouvoir modifier
    __listechamps__ = ("zone", "numero", "bis", "n_ordre", "en_rang", "en_longueur", "en_largeur", "en_obliquite_degre", "en_corde", "en_fleche", "en_dptimpact", "en_frappe", "en_numero", "en_inclinaison", "en_direction")
    #
    # liste des champs dans leur ordre de saisie
    __ordrechamps__ =("zone", "numero", "bis", "n_ordre", "en_rang", "en_longueur", "en_largeur", "en_obliquite_degre", "en_corde",  "en_fleche", "en_dptimpact", "en_frappe", "en_numero", "en_inclinaison", "en_direction")
    __orderby__ = " ORDER BY zone, numero, bis, n_ordre, en_rang ASC;"
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

    def n_ordre_verify(self, fieldname, value):
        if value == '':
            return -1
        else:
            return 0

    def en_rang_verify(self, fieldname, value):
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

    def n_ordre_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_x_ordre(self, "n_ordre", 1, 31, enreg, penreg)

    def en_rang_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_x_rang(self, "en_rang", "30", enreg, penreg)
        self.__doc__.pop()


################################### En entrée ##############################################
    def en_longueur_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "en_longueur", "longueur", 3, 20, " ", enreg, penreg)

    def en_largeur_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "en_largeur", "largeur", 3, 20, "", enreg, penreg)
        self.__doc__.pop()

##################################
    def en_obliquite_degre_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "en_obliquite_degre", "obliquite °", 3, 20, " ", enreg, penreg)

    def en_corde_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "en_corde", "corde", 3, 20, "", enreg, penreg)

    def en_fleche_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "en_fleche", "fleche", 3, 20, "", enreg, penreg)
        self.__doc__.pop()

###############################
    def en_dptimpact_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "en_dptimpact", "ptimpact", 3, 20, " ", enreg, penreg)

    def en_frappe_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "en_frappe", "frappe", enreg, penreg, "", dontchange=0)

    def en_numero_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "en_numero", "numéro", 2, 20, "", enreg, penreg)
        self.__doc__.pop()

###############################
    def en_inclinaison_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_liste(self, "en_inclinaison", "inclinaison", enreg, penreg, " ", dontchange=0)

    def en_direction_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "en_direction", "direction", enreg, penreg, "", dontchange=0)
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
            primarykeys = {"zone": None, "numero": None, "bis": None, "en_rang": None}
            return (-1, primarykeys)
        else:
            # sinon si son parent n'existe pas, on refuse
            if not self.exist(("zone", "numero", "bis"), table="nucleus"):
                primarykeys = {"zone": None, "numero": None, "bis": None}
                return (-2, primarykeys)
            # sinon si son parent existe, on le cree
            else:
                # on insère maintenant le enlevement dans la base
                z = self.__form__["zone"].value
                n = self.__form__["numero"].value
                b = self.__form__["bis"].value
                o = self.__form__["n_ordre"].value
                r = self.__form__["en_rang"].value
                self.__db__.query(self.make_insert_query({}))
                primarykeys = {"zone": z, "numero": n, "bis": b, "n_ordre": o, "en_rang": r}
                return (0, primarykeys)
