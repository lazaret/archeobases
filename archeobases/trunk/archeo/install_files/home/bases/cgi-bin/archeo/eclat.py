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
import bord


class Eclat(archeodata.Data):
    #
    # le nom de la table
    __tablename__ = "eclat"
    __new_record__ = "Nouvel"
    __color__ = archeoconf.bas1_bgcolor
    #
    # tous les champs de la table proprietaire
    __champs__ =    {
                    "zone"             : {"type": "text", "default": "", "mandatory": 1, "longueur": 0, "memory": 1}, \
                    "numero"           : {"type": "decimal", "default": 0, "mandatory": 1, "longueur": 6 , "memory": 1}, \
                    "bis"              : {"type": "text", "default": "", "mandatory": 1 , "longueur": 0, "memory": 1}, \
                    "e_code"           : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "e_debitage"       : {"type": "text", "default": "", "mandatory": 0, "longueur": 0}, \
                    "e_type"           : {"type": "text", "default": "", "mandatory": 0, "longueur": 0}, \
                    "e_section_long"   : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "e_section_trans"  : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "e_contour"        : {"type": "text", "default": "", "mandatory": 0, "longueur": 0}, \
                    "e_enlevement"     : {"type": "text", "default": "", "mandatory": 0, "longueur": 0}, \
                    "e_bulbe"          : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "e_talon"          : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "e_cone"           : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "e_onde"           : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "e_epi"            : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "e_strie"          : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "e_parasite"       : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "e_secondaire"     : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "e_charniere"      : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "e_carene"         : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "e_type"           : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "e_longm"          : {"type": "decimal", "mandatory": 0 , "longueur": 3}, \
                    "e_largm"          : {"type": "decimal", "mandatory": 0 , "longueur": 3}, \
                    "e_fa"             : {"type": "decimal", "mandatory": 0 , "longueur": 3}, \
                    "e_fb"             : {"type": "decimal", "mandatory": 0 , "longueur": 3}, \
                    "e_fc"             : {"type": "decimal", "mandatory": 0 , "longueur": 3}, \
                    "e_fd"             : {"type": "decimal", "mandatory": 0 , "longueur": 3}, \
                    "e_fe"             : {"type": "decimal", "mandatory": 0 , "longueur": 3}, \
                    "e_ff"             : {"type": "decimal", "mandatory": 0 , "longueur": 3}, \
                    "e_ta"             : {"type": "decimal", "mandatory": 0 , "longueur": 3}, \
                    "e_tb"             : {"type": "decimal", "mandatory": 0 , "longueur": 3}, \
                    "e_tc"             : {"type": "decimal", "mandatory": 0 , "longueur": 3}, \
                    "e_td"             : {"type": "decimal", "mandatory": 0 , "longueur": 3}, \
                    "e_te"             : {"type": "decimal", "mandatory": 0 , "longueur": 3}, \
                    "e_tf"             : {"type": "decimal", "mandatory": 0 , "longueur": 3}, \
                    "e_ti"             : {"type": "decimal", "mandatory": 0 , "longueur": 3}, \
                    "e_tg"             : {"type": "decimal", "mandatory": 0 , "longueur": 3}, \
                    "e_thc"            : {"type": "decimal", "mandatory": 0 , "longueur": 3}, \
                    }
    #
    # liste des tables enfants
    __listenfants__  = []
    __listeparents__ = ["carnet", "industrie"]
    __listeclefs__   = ["zone", "numero", "bis"]
    __vraiparent__   = "industrie"
    #
    # liste des seuls champs que l'on veut pouvoir modifier
    __listechamps__ = ["zone", "numero", "bis", "e_code", "e_debitage", "e_type", "e_section_long", "e_section_trans", "e_contour", "e_enlevement", "e_bulbe", "e_talon", "e_cone", "e_onde", "e_epi", "e_strie", "e_parasite", "e_secondaire", "e_charniere", "e_carene", "e_longm", "e_largm", "e_fa", "e_fb", "e_fc", "e_fd", "e_fe", "e_ff", "e_ta", "e_tb", "e_tc", "e_td", "e_te", "e_tf", "e_ti", "e_tg", "e_thc"]
    #
    # liste des champs dans leur ordre de saisie
    __ordrechamps__ = ["zone", "numero", "bis", "e_code", "e_debitage", "e_type", "e_section_long", "e_section_trans", "e_contour", "e_enlevement", "e_talon", "e_bulbe", "e_cone", "e_onde", "e_epi", "e_strie", "e_parasite", "e_secondaire", "e_charniere", "e_carene", "e_longm", "e_largm", "e_fa", "e_fb", "e_fc", "e_fd", "e_fe", "e_ff", "e_ta", "e_tb", "e_tc", "e_td", "e_te", "e_tf", "e_ti", "e_tg", "e_thc"]
    __orderby__ = " ORDER BY zone, numero, bis ASC;"
    #
    # liste des formulaires supplementaires
    __formsupp__ = [ "bords" ]

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
        afficheclefs.display_numero(self, enreg, penreg, 1)

    def bis_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_bis(self, enreg, penreg)
        self.__doc__.pop()

################################### En entrée ##############################################
    def e_code_base_to_form(self, enreg, penreg=None):
        afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
        self.__doc__.push()
        afficheclefs.champ_liste(self, "e_code", "code", enreg, penreg, " ", dontchange=0)
        self.__doc__.pop()

    def e_debitage_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_liste(self, "e_debitage", "débitage", enreg, penreg, " ", dontchange=0)

    def e_type_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "e_type", "type", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

    def e_section_long_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_liste(self, "e_section_long", "section_long", enreg, penreg, " ", dontchange=0)

    def e_section_trans_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "e_section_trans", "section_trans", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

    def e_contour_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_liste(self, "e_contour", "contour", enreg, penreg, " ", dontchange=0)

    def e_enlevement_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "e_enlevement", "enlèvement", enreg, penreg, "", dontchange=0)

    def e_talon_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "e_talon", "talon", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

    def e_bulbe_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_liste(self, "e_bulbe", "bulbe", enreg, penreg, " ", dontchange=0)

    def e_cone_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "e_cone", "cône", enreg, penreg, "", dontchange=0)

    def e_onde_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "e_onde", "onde", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

    def e_epi_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_liste(self, "e_epi", "epi", enreg, penreg, " ", dontchange=0)

    def e_strie_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "e_strie", "strie", enreg, penreg, "", dontchange=0)

    def e_parasite_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "e_parasite", "parasite", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

    def e_secondaire_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_liste(self, "e_secondaire", "secondaire", enreg, penreg, " ", dontchange=0)

    def e_charniere_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "e_charniere", "charnière", enreg, penreg, "", dontchange=0)

    def e_carene_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "e_carene", "carène", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

    def e_longm_base_to_form(self, enreg, penreg=None):
        afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "e_longm", "Lm", 3, 20, "Archéométrie", enreg, penreg)

    def e_largm_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "e_largm", "lm", 3, 20, "", enreg, penreg)
        self.__doc__.pop()

    def e_fa_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "e_fa", "Fa", 3, 20, " ", enreg, penreg)

    def e_fb_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "e_fb", "Fb", 3, 20, "", enreg, penreg)

    def e_fc_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "e_fc", "Fc", 3, 20, "", enreg, penreg)
        self.__doc__.pop()

    def e_fd_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "e_fd", "Fd", 3, 20, " ", enreg, penreg)

    def e_fe_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "e_fe", "Fe", 3, 20, "", enreg, penreg)

    def e_ff_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "e_ff", "Ff", 3, 20, "", enreg, penreg)
        self.__doc__.pop()

    def e_ta_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "e_ta", "Ta", 3, 20, " ", enreg, penreg)

    def e_tb_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "e_tb", "Tb", 3, 20, "", enreg, penreg)

    def e_tc_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "e_tc", "Tc", 3, 20, "", enreg, penreg)
        self.__doc__.pop()

    def e_td_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "e_td", "Td", 3, 20, " ", enreg, penreg)

    def e_te_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "e_te", "Te", 3, 20, "", enreg, penreg)

    def e_tf_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "e_tf", "Tf", 3, 20, "", enreg, penreg)
        self.__doc__.pop()

    def e_ti_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "e_ti", "Ti", 3, 20, " ", enreg, penreg)

    def e_tg_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "e_tg", "Tg", 3, 20, "", enreg, penreg)

    def e_thc_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "e_thc", "Thc", 3, 20, "", enreg, penreg)
        self.__doc__.pop()

#########################################################################
#                     LIEN AVEC L'ECRAN FIGURE
#########################################################################
    def enlevements(self, enreg, penreg=None):
        if enreg != None:
            self.__doc__.push()
            self.__doc__.tr()
            self.__doc__.td(bgcolor=archeoconf.basform_bgcolorcenter, colspan="2")
            self.__doc__.font(size=archeoconf.font_size)
            penreg = {"zone": enreg["zone"], "numero": enreg["numero"], "bis": enreg["bis"]}
            enlevement_nucleus.Enlevement_Nucleus(self).traite_saisie(["zone", "numero", "bis", "en_ordre"], parent=self.__tablename__, penreg=penreg)
            self.__doc__.pop()

###############################################################################
#                                       BORDS
###############################################################################
    def bords(self, enreg, penreg=None):
        if enreg != None:
            self.__doc__.push()
            self.__doc__.tr()
            self.__doc__.td(bgcolor=archeoconf.basform_bgcolorcenter, colspan="2")
            self.__doc__.font(size=archeoconf.font_size)
            penreg = {"zone": enreg["zone"], "numero": enreg["numero"], "bis": enreg["bis"]}
            bord.Bord(self).traite_saisie(["zone", "numero", "bis"], parent=self.__tablename__, penreg=penreg)
            self.__doc__.pop()

#########################################################################
#                             METHODES
#########################################################################
    def modifier(self):
        """Met a jour l'eclat courante"""
        self.__db__.query(self.make_update_query(["zone", "numero", "bis"]))
        return 0

    def supprimer(self):
        self.delete_records(["zone", "numero", "bis"])
        return 0

    def creer(self):
        # si l'eclat n'existe pas déjà alors on la crée, sinon on refuse
        if self.exist(["zone", "numero", "bis"]):
            primarykeys = {"zone": None, "numero": None, "bis": None}
            return (-1, primarykeys)
        else:
            # on insère maintenant l'eclat dans la base
            # sauf si la bis n'existe pas.
            if not self.exist(["zone", "numero", "bis"], table="industrie"):
                primarykeys = {"zone": None, "numero": None, "bis": None}
                return (-2, primarykeys)
            else:
                # on insère maintenant la industrie dans la base
                z = self.__form__["zone"].value
                n = self.__form__["numero"].value
                b = self.__form__["bis"].value
                self.__db__.query(self.make_insert_query({}))
                primarykeys = {"zone": z, "numero": n, "bis": b}
                return (0, primarykeys)
