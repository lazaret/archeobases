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


class Enlevement_Galet(archeodata.Data):
    #
    # le nom de la table
    __tablename__ = "enlevement_galet"
    __new_record__ = "Nouvelle"
    __color__ = archeoconf.bas3_bgcolor
    #
    # tous les champs de la table proprietaire
    __champs__ =    {
                    "zone"             : {"type": "text", "default": "", "mandatory": 1, "longueur": 0, "memory": 1},
                    "numero"           : {"type": "int", "default": 0, "mandatory": 1, "longueur": 6, "memory": 1},
                    "bis"              : {"type": "text", "default": "", "mandatory": 1, "longueur": 0, "memory": 1},
                    "ga_ordre"         : {"type": "int", "default": 0, "mandatory": 1, "longueur": 0, "memory": 1},
                    "eg_rang"          : {"type": "text", "default": "", "mandatory": 1, "longueur": 1},
                    "eg_element"       : {"type": "text", "default":"", "mandatory": 0, "longueur": 5},
                    "eg_longueur_generale": {"type": "text", "default": "", "mandatory": 0, "longueur": 3},
                    "eg_profil"        : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "eg_profondeur"    : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "eg_obliquite"     : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "eg_extremite"     : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "eg_proeminence"   : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "eg_sens"          : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "eg_support"       : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "eg_localisation"  : {"type": "text", "default": "", "mandatory": 0, "longueur": 7},
                    "eg_relation"      : {"type": "text", "default": "", "mandatory": 0, "longueur": 7},
                    "eg_situation"     : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "eg_epaisseur"     : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "eg_longueur"      : {"type": "decimal", "mandatory": 0, "longueur": 3},
                    "eg_largeur"       : {"type": "decimal", "mandatory": 0, "longueur": 3},
                    "eg_obliquite_degre": {"type": "decimal", "mandatory": 0, "longueur": 3},
                    "eg_corde"         : {"type": "decimal", "mandatory": 0, "longueur": 3},
                    "eg_fleche"        : {"type": "decimal", "mandatory": 0, "longueur": 3},
                    "eg_dptimpact"     : {"type": "text", "mandatory": 0, "longueur": 3},
                    }
    #
    # liste des tables enfants
    __listenfants__ = ()
    __listeclefs__ = ("zone", "numero", "bis", "ga_ordre", "eg_rang")
    __listeparents__ = ("carnet", "galet_amenage")
    __vraiparent__ = "galet_amenage"
    #
    # liste des seuls champs que l'on veut pouvoir modifier
    __listechamps__ = ("zone", "numero", "bis", "ga_ordre", "eg_rang",  "eg_element", "eg_longueur_generale", "eg_profil", "eg_profondeur", "eg_extremite", "eg_proeminence", "eg_sens", "eg_support", "eg_localisation", "eg_relation", "eg_situation", "eg_epaisseur", "eg_longueur", "eg_largeur", "eg_obliquite_degre", "eg_corde", "eg_fleche", "eg_dptimpact")
    #
    # liste des champs dans leur ordre de saisie
    __ordrechamps__ = ("zone", "numero", "bis", "ga_ordre", "eg_rang", "eg_element", "eg_longueur_generale", "eg_profil", "eg_profondeur", "eg_extremite", "eg_proeminence", "eg_sens", "eg_support", "eg_localisation", "eg_relation", "eg_situation", "eg_longueur", "eg_largeur", "eg_epaisseur", "eg_obliquite_degre", "eg_corde", "eg_fleche", "eg_dptimpact")
    __orderby__ = " ORDER BY zone, numero, bis, ga_ordre, eg_rang ASC;"
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

    def ga_ordre_verify(self, fieldname, value):
        if value == '':
            return -1
        else:
            return 0

    def eg_rang_verify(self, fieldname, value):
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

    def ga_ordre_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_x_ordre(self, "ga_ordre", 1, 15, enreg, penreg)

    def eg_rang_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_x_rang(self, "eg_rang", "30", enreg, penreg)
        self.__doc__.pop()

################################### En entrée ##############################################
    def eg_element_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "eg_element", "element", 5, 20, " ", enreg, penreg)

    def eg_longueur_generale_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "eg_longueur_generale", "Lg générale", enreg, penreg, "", dontchange=0)

    def eg_profil_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "eg_profil", "profil", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

#######################
    def eg_profondeur_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_liste(self, "eg_profondeur", "profondeur", enreg, penreg, " ", dontchange=0)

    def eg_extremite_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "eg_extremite", "extremite", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

#################
    def eg_proeminence_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_liste(self, "eg_proeminence", "proeminence", enreg, penreg, " ", dontchange=0)

    def eg_sens_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "eg_sens", "sens", enreg, penreg, "", dontchange=0)

    def eg_support_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "eg_support", "support", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

#######################
    def eg_localisation_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "eg_localisation", "localisation", 7, 7, " ", enreg, penreg)

    def eg_relation_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "eg_relation", "relation", 5, 20, "", enreg, penreg)

    def eg_situation_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "eg_situation", "situation", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

#######################
    def eg_longueur_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "eg_longueur", "longueur", 3, 20, " ", enreg, penreg)

    def eg_largeur_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "eg_largeur", "largeur", 3, 20, "", enreg, penreg)

    def eg_epaisseur_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "eg_epaisseur", "épaisseur", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

########################
    def eg_obliquite_degre_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "eg_obliquite_degre", "obliquite °", 3, 20, " ", enreg, penreg)

    def eg_corde_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "eg_corde", "corde", 3, 20, "", enreg, penreg)
        self.__doc__.pop()

########################
    def eg_fleche_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "eg_fleche", "fleche", 3, 20, " ", enreg, penreg)

    def eg_dptimpact_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "eg_dptimpact", "dptimpact", 3, 3, "", enreg, penreg)
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
            primarykeys = {"zone": None, "numero": None, "bis": None, "ga_ordre":None, "eg_ordre": None}
            return (-1, primarykeys)
        else:
            # sinon si son parent n'existe pas, on refuse
            if not self.exist(("zone", "numero", "bis", "ga_ordre"), table="galet_amenage"):
                primarykeys = {"zone": None, "numero": None, "bis": None, "ga_ordre":None, "eg_rang":None}
                return (-2, primarykeys)
            # sinon si son parent existe, on le cree
            else:
                # on insère maintenant le enlevement dans la base
                z = self.__form__["zone"].value
                n = self.__form__["numero"].value
                b = self.__form__["bis"].value
                o = self.__form__["ga_ordre"].value
                r = self.__form__["eg_rang"].value
                self.__db__.query(self.make_insert_query({}))
                primarykeys = {"zone": z, "numero": n, "bis": b, "ga_ordre": o, "eg_rang": r}
                return (0, primarykeys)
