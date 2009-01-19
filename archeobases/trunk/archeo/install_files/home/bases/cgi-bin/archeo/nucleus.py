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
import re
import enlevement_nucleus


class Nucleus(archeodata.Data):
    #
    # le nom de la table
    __tablename__ = "nucleus"
    __new_record__ = "Nouveau"
    __color__ = archeoconf.bas1_bgcolor
    #
    # tous les champs de la table proprietaire
    __champs__ =    {
                    "zone"         : {"type": "text", "default": "", "mandatory": 1, "longueur": 0, "memory": 1},
                    "numero"       : {"type": "decimal", "default": 0, "mandatory": 1, "longueur": 6, "memory": 1},
                    "bis"          : {"type": "text", "default": "", "mandatory": 1, "longueur": 0, "memory": 1},
                    "n_ordre"      : {"type": "int", "default": 0, "mandatory": 1, "longueur": 2, "memory": 1},
                    "n_type"       : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "n_nbplan"     : {"type": "decimal", "mandatory": 0, "longueur": 3},
                    "n_nba"        : {"type": "decimal", "mandatory": 0, "longueur": 3},
                    "n_nbb"        : {"type": "decimal", "mandatory": 0, "longueur": 3},
                    "n_nbp"        : {"type": "decimal", "default": 0, "mandatory": 0, "longueur": 3},
                    "n_orientation": {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "n_dirtotal"   : {"type": "decimal", "mandatory": 0, "longueur": 3},
                    "n_dirfacea"   : {"type": "decimal", "mandatory": 0, "longueur": 3},
                    "n_dirfaceb"   : {"type": "decimal", "mandatory": 0, "longueur": 3},
                    "n_dirprofil"  : {"type": "decimal", "mandatory": 0, "longueur": 3},
                    "n_formule"    : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "n_rotation"   : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "n_cortotal"   : {"type": "decimal", "mandatory": 0, "longueur": 0},
                    "n_corfacea"   : {"type": "decimal", "mandatory": 0, "longueur": 3},
                    "n_corfaceb"   : {"type": "decimal", "mandatory": 0, "longueur": 3},
                    "n_corprofil"  : {"type": "decimal","mandatory": 0, "longueur": 3},
                    "n_epuisement" : {"type": "int", "default": 0, "mandatory": 0, "longueur": 0},
                    }
    #
    # liste des tables enfants
    __listenfants__ = ()
    __listeparents__ = ("carnet", "industrie")
    __listeclefs__ = ("zone", "numero", "bis", "n_ordre")
    __vraiparent__ = "industrie"
    #
    # liste des seuls champs que l'on veut pouvoir modifier
    __listechamps__ = ("zone", "numero", "bis", "n_ordre", "n_type", "n_nbplan", "n_nba", "n_nbb", "n_nbp", "n_orientation", "n_cortotal", "n_corfacea", "n_corfaceb", "n_corprofil", "n_dirtotal", "n_dirfacea", "n_dirfaceb", "n_dirprofil", "n_formule", "n_rotation", "n_epuisement")
    #
    # liste des champs dans leur ordre de saisie
    __ordrechamps__ =  ("zone", "numero", "bis", "n_ordre", "n_type", "n_nbplan", "i_matiere", "n_formule", "n_rotation", "n_nba", "n_nbb", "n_nbp", "n_epuisement", "n_cortotal", "n_corfacea", "n_corfaceb", "n_corprofil", "n_dirtotal", "n_dirfacea", "n_dirfaceb", "n_dirprofil")
    __orderby__ = " ORDER BY zone, numero, bis, n_ordre ASC;"
    #
    # liste des formulaires supplementaires
    __formsupp__ = ("enlevements",)

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
        self.__doc__.push()
        self.__doc__.td()
        self.__doc__.insert_text(" ")
        self.__doc__.pop()
        afficheclefs.display_zone(self, enreg, penreg)

    def numero_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_numero(self, enreg, penreg)

    def bis_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_bis(self, enreg, penreg)

    def n_ordre_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_x_ordre(self, "n_ordre", 0, 31, enreg, penreg)
        self.__doc__.pop()

################################### En entrée ##############################################
    def n_type_base_to_form(self, enreg, penreg=None):
        afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
        self.__doc__.push()
        afficheclefs.champ_liste(self, "n_type", "type", enreg, penreg, " ", dontchange=0)

    def n_nbplan_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "n_nbplan", "nb plan", 2, 20, "", enreg, penreg)
        self.__doc__.pop()

    def i_matiere_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            self.__doc__.push()
            liste_clefs = ("zone", "numero", "bis")
            self.champ_liste_table("industrie", liste_clefs, "i_matiere", "matière", enreg, penreg, " ", dontchange=1)
            self.__doc__.pop()

###########################
    def n_nba_base_to_form(self, enreg, penreg=None):
        afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "n_nba", "nb A", 3, 20, "Nb enlèvements", enreg, penreg)

    def n_nbb_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "n_nbb", "nb B", 3, 20, "", enreg, penreg)

    def n_nbp_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "n_nbp", "nb P", 3, 20, "", enreg, penreg)

    def n_cortotal_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_liste(self, "n_cortotal", "cortotal", enreg, penreg, "Importance cortex", dontchange=0)

    def n_corfacea_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "n_corfacea", "corfacea", 3, 20, "", enreg, penreg)

    def n_corfaceb_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "n_corfaceb", "corfaceb", 3, 20, "", enreg, penreg)

    def n_epuisement_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "n_epuisement", "epuisement", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

    def n_corprofil_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "n_corprofil", "corprofil", 3, 20, "", enreg, penreg)
        self.__doc__.pop()

    def n_dirtotal_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "n_dirtotal", "dirtotal", 3, 20, "Nb directions", enreg, penreg)

    def n_dirfacea_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "n_dirfacea", "dirfacea", 3, 3, "", enreg, penreg)

    def n_dirfaceb_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "n_dirfaceb", "dirfaceb", 3, 20, "", enreg, penreg)

    def n_dirprofil_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "n_dirprofil", "dirprofil", 3, 20, "", enreg, penreg)
        self.__doc__.pop()

    def n_formule_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie_area(self, "n_formule", "formule", 1, 20, 4, " ", enreg, penreg)
        self.__doc__.pop()

    def n_rotation_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie_area(self, "n_rotation", "rotation", 1, 20, 4, " ", enreg, penreg)
        self.__doc__.pop()

###############################################################################
#                               ENLEVEMENTS
###############################################################################
    def enlevements(self, enreg, penreg=None):
        if enreg != None:
            self.__doc__.push()
            self.__doc__.tr()
            self.__doc__.td(bgcolor=archeoconf.basform_bgcolorcenter, colspan="2")
            self.__doc__.font(size=archeoconf.font_size)
            penreg = {"zone": enreg["zone"], "numero": enreg["numero"], "bis": enreg["bis"], "n_ordre":enreg["n_ordre"]}
            enlevement_nucleus.Enlevement_Nucleus(self).traite_saisie(("zone", "numero", "bis", "n_ordre", "en_rang"), parent=self.__tablename__, penreg = penreg)
            self.__doc__.pop()

##############################################################################################################################
#                                               METHODES
##############################################################################################################################

    def modifier(self):
        """Met a jour la industrie courante"""
        self.__db__.query(self.make_update_query(self.__listeclefs__))
        return 0

    def supprimer(self):
        if self.exist(self.__listeclefs__, table="enlevement_nucleus"):
            return -1
        else:
            # on efface le nucleus
            self.delete_records(self.__listeclefs__)
            return 0

    def creer(self):
        if self.exist(self.__listeclefs__):
            primarykeys = {"zone": None, "numero": None, "bis": None}
            return (-1, primarykeys)
        else:
            # sinon si son parent n'existe pas, on refuse ###not self.exist en principe
            if  not  self.exist(("zone", "numero", "bis"), table="industrie"):
                primarykeys = {"zone": None, "numero": None, "bis": None}
                return (-2, primarykeys)
            # sinon si son parent existe, on le cree
            else:
                # on insère maintenant le nucleus dans la base
                z = self.__form__["zone"].value
                n = self.__form__["numero"].value
                b = self.__form__["bis"].value
                o = self.__form__["n_ordre"].value
                self.__db__.query(self.make_insert_query({}))
                primarykeys = {"zone": z, "numero": n, "bis": b, "n_ordre": o}
                return (0, primarykeys)
