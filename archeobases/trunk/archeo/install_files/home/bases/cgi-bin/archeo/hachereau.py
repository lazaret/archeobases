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


class Hachereau(archeodata.Data):
    #
    # le nom de la table
    __tablename__ = "hachereau"
    __new_record__ = "Nouveau"
    __color__ = archeoconf.bas1_bgcolor
    #
    # tous les champs de la table proprietaire
    __champs__ =    {
                    "zone"         : {"type": "text", "default": "", "mandatory": 1, "longueur": 0, "memory": 1},
                    "numero"       : {"type": "decimal", "default": 0, "mandatory": 1, "longueur": 6, "memory": 1},
                    "bis"          : {"type": "text", "default": "", "mandatory": 1, "longueur": 0, "memory": 1},
                    "h_forme"      : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "h_type"       : {"type": "text", "default": "", "mandatory": 0, "longueur": 15},
                    "h_base"       : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "h_surface"    : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "h_enlevement" : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "h_amenagement_bord" : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "h_distale"    : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "h_biseau"     : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "h_bord"       : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "h_meplat"     : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "h_extension"  : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "h_symetrie"   : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "h_facture"    : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "h_bilaterale" : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "h_bifaciale"  : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "h_arete"      : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "h_retouche"   : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "h_long1" : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_long2" : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_long3" : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_l1" : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_l1a": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_l2" : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_l3" : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_l4" : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_l5" : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_e1" : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_e2" : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_poids": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_ind1": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_ind2": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_ind3": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_ind4": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_ind5": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_ind6": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_ind7": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_ind8": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_ind9": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_ind10": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_ind11": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_ind12": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_ind13": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_ind14": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_ind15": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_ind16": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hc"  : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hd"  : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_he"  : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hb1a": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hb1b": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hb1" : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hb2a": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hb2b": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hb2" : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hde1": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hde2": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hg1" : {"type": "text", "default": "", "mandatory": 0, "longueur": 5},
                    "h_hg2" : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hh"  : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hi"  : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hj"  : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hk"  : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hla1": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hlb1": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hl1" : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hla2": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hlb2": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hl2" : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hm"  : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hs"  : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hng" : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hnd" : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_ho"  : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hp"  : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hq"  : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hr"  : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hu"  : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hx"  : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hya1": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hya2": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hya" : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hyb1": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hyb2": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hyb" : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hy"  : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hyax": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hybx": {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hyx" : {"type": "decimal", "mandatory": 0, "longueur": 5},
                    "h_hf"  : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    }
    #
    # liste des tables enfants
    __listenfants__ = ()
    __listeparents__ = ("carnet", "industrie")
    __listeclefs__ = ("zone", "numero", "bis")
    __vraiparent__ = "industrie"
    #
    # liste des seuls champs que l'on veut pouvoir modifier
    __listechamps__ = ("zone", "numero", "bis", "h_type", "h_base", "h_surface", "h_enlevement", "h_amenagement_bord", "h_distale", "h_biseau",  "h_bord", "h_meplat", "h_extension", "h_symetrie", "h_facture", "h_bifaciale", "h_bilaterale",  "h_arete", "h_retouche", "h_long1", "h_long2", "h_long3", "h_l1", "h_l1a", "h_l2", "h_l3", "h_l4", "h_l5", "h_e1", "h_e2", "h_poids", "h_ind1", "h_ind2", "h_ind3", "h_ind4", "h_ind5", "h_ind6", "h_ind7", "h_ind8", "h_ind9", "h_ind10", "h_ind11", "h_ind12", "h_ind13", "h_ind14", "h_ind15", "h_ind16", "h_hc", "h_hd", "h_he", "h_hb1a", "h_hb1b", "h_hb1", "h_hb2a", "h_hb2b", "h_hb2", "h_hde1", "h_hde2", "h_hg1", "h_hg2", "h_hh", "h_hi", "h_hj", "h_hk", "h_hla1", "h_hlb1", "h_hl1", "h_hla2", "h_hlb2", "h_hl2", "h_hm", "h_hs", "h_hng", "h_hnd", "h_ho", "h_hp", "h_hq", "h_hr", "h_hu", "h_hx", "h_hya1", "h_hya2", "h_hya", "h_hyb1", "h_hyb2", "h_hyb", "h_hy", "h_hyax", "h_hybx", "h_hyx", "h_hf")
    #
    # liste des champs dans leur ordre de saisie
    __ordrechamps__ = ("zone", "numero", "bis", "h_type", "h_base", "h_surface", "h_enlevement", "h_amenagement_bord", "h_distale", "h_biseau",  "h_bord", "h_meplat", "h_extension", "h_symetrie", "h_facture", "h_bifaciale", "h_bilaterale",  "h_arete", "h_retouche", "h_long1", "h_long2", "h_long3", "h_l1", "h_l1a", "h_l2", "h_l3", "h_l4", "h_l5", "h_e1", "h_e2", "h_poids", "h_ind1", "h_ind2", "h_ind3", "h_ind4", "h_ind5", "h_ind6", "h_ind7", "h_ind8", "h_ind9", "h_ind10", "h_ind11", "h_ind12", "h_ind13", "h_ind14", "h_ind15", "h_ind16", "h_hc", "h_hd", "h_he", "h_hb1a", "h_hb1b", "h_hb1", "h_hb2a", "h_hb2b", "h_hb2", "h_hde1", "h_hde2", "h_hg1", "h_hg2", "h_hh", "h_hi", "h_hj", "h_hk", "h_hla1", "h_hlb1", "h_hl1", "h_hla2", "h_hlb2", "h_hl2", "h_hm", "h_hs", "h_hng", "h_hnd", "h_ho", "h_hp", "h_hq", "h_hr", "h_hu", "h_hx", "h_hya1", "h_hya2", "h_hya", "h_hyb1", "h_hyb2", "h_hyb", "h_hy", "h_hyax", "h_hybx", "h_hyx", "h_hf")
    __orderby__ = " ORDER BY zone, numero, bis ASC;"
    #
    # liste des formulaires supplementaires
    __formsupp__ = ("",)

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
        afficheclefs.display_numero(self, enreg, penreg)

    def bis_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_bis(self, enreg, penreg)
        self.__doc__.pop()

################################### En entrée ##############################################
    def h_type_base_to_form(self, enreg, penreg=None):
        afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "h_type", "type", 15, 20, " ", enreg, penreg)

    def h_base_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "h_base", "base réservée", enreg, penreg, "", dontchange=0)

    def h_surface_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "h_surface", "surface réservée", enreg, penreg, "", dontchange=0)

    def h_enlevement_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_liste(self, "h_enlevement", "Loc.enlevement", enreg, penreg, " ", dontchange=0)

    def h_amenagement_bord_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "h_amenagement_bord", "amenag bord", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

###########################
    def h_distale_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_liste(self, "h_distale", "amenag ext.dist", enreg, penreg, " ", dontchange=0)

    def h_biseau_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "h_biseau", "biseau terminal", enreg, penreg, "", dontchange=0)

    def h_bord_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "h_bord", "forme bords", enreg, penreg, "", dontchange=0)

    def h_meplat_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "h_meplat", "meplat latéral", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

###########################
    def h_extension_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_liste(self, "h_extension", "extension enlev", enreg, penreg, " ", dontchange=0)

    def h_symetrie_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "h_symetrie", "sym medisbilat", enreg, penreg, "", dontchange=0)

    def h_facture_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "h_facture", "facture bifac", enreg, penreg, "", dontchange=0)

    def h_bifaciale_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "h_bifaciale", "sym bifaciale", enreg, penreg, "", dontchange=0)

    def h_bilaterale_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "h_bilaterale", "sym bilat", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

###########################
    def h_arete_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_liste(self, "h_arete", "arete latérale", enreg, penreg, " ", dontchange=0)

    def h_retouche_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "h_retouche", "ret secondaire", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

###########################
    def h_long1_base_to_form(self, enreg, penreg=None):
        afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "h_long1", "L1", 5, 20, " ", enreg, penreg)

    def h_long2_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_long2", "L2", 5, 20, "", enreg, penreg)

    def h_long3_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_long3", "L3", 5, 20, "", enreg, penreg)

    def h_l1_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_l1", "l1", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

###########################
    def h_l1a_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "h_l1a", "l1a", 5, 20, " ", enreg, penreg)

    def h_l2_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_l2", "l2", 5, 20, "", enreg, penreg)

    def h_l3_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_l3", "l3", 5, 20, "", enreg, penreg)

    def h_l4_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_l4", "l4", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

###########################
    def h_l5_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "h_l5", "l5", 5, 20, " ", enreg, penreg)

    def h_e1_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_e1", "e1", 5, 20, "", enreg, penreg)

    def h_e2_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_e2", "e2", 5, 20, "", enreg, penreg)

    def h_poids_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_poids", "poids", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

###########################
    def h_ind1_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "h_ind1", "ind1", 5, 20, " ", enreg, penreg)

    def h_ind2_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_ind2", "ind2", 5, 20, "", enreg, penreg)

    def h_ind3_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_ind3", "ind3", 5, 20, "", enreg, penreg)

    def h_ind4_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_ind4", "ind4", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

###########################
    def h_ind5_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "h_ind5", "ind5", 5, 20, " ", enreg, penreg)

    def h_ind6_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_ind6", "ind6", 5, 20, "", enreg, penreg)

    def h_ind7_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_ind7", "ind7", 5, 20, "", enreg, penreg)

    def h_ind8_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_ind8", "ind8", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

###########################
    def h_ind9_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "h_ind9", "ind9", 5, 20, " ", enreg, penreg)

    def h_ind10_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_ind10", "ind10", 5, 20, "", enreg, penreg)

    def h_ind11_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_ind11", "ind11", 5, 20, "", enreg, penreg)

    def h_ind12_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_ind12", "ind12", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

###########################
    def h_ind13_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "h_ind13", "ind13", 5, 20, " ", enreg, penreg)

    def h_ind14_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_ind14", "ind14", 5, 20, "", enreg, penreg)

    def h_ind15_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_ind15", "ind15", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

    def h_ind16_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_ind16", "ind16", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

###########################
    def h_hc_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "h_hc", "hc", 5, 20, " ", enreg, penreg)

    def h_hd_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_hd", "hd", 5, 20, "", enreg, penreg)

    def h_he_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_he", "he", 5, 20, "", enreg, penreg)

    def h_hb1a_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_hb1a", "hb1a", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

###########################
    def h_hb1b_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "h_hb1b", "hb1b", 5, 20, " ", enreg, penreg)

    def h_hb1_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_hb1", "hb1", 5, 20, "", enreg, penreg)

    def h_hb2a_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_hb2a", "hb2a", 5, 20, "", enreg, penreg)

    def h_hb2b_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_hb2b", "hb2b", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

###########################
    def h_hb2_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "h_hb2", "hb2", 5, 20, " ", enreg, penreg)

    def h_hde1_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_hde1", "hde1", 5, 20, "", enreg, penreg)

    def h_hde2_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_hde2", "hde2", 5, 20, "", enreg, penreg)

    def h_hg1_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_hg1", "hg1", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

###########################
    def h_hg2_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "h_hg2", "hg2", 5, 20, " ", enreg, penreg)

    def h_hh_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_hh", "hh", 5, 20, "", enreg, penreg)

    def h_hi_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_hi", "hi", 5, 20, "", enreg, penreg)

    def h_hj_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_hj", "hj", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

###########################
    def h_hk_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "h_hk", "hk", 5, 20, " ", enreg, penreg)

    def h_hla1_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_hla1", "hla1", 5, 20, "", enreg, penreg)

    def h_hlb1_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_hlb1", "hlb1", 5, 20, "", enreg, penreg)

    def h_hl1_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_hl1", "hl1", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

###########################
    def h_hla2_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "h_hla2", "hla2", 5, 20, " ", enreg, penreg)

    def h_hlb2_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_hlb2", "hlb2", 5, 20, "", enreg, penreg)

    def h_hl2_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_hl2", "hl2", 5, 20, "", enreg, penreg)

    def h_hm_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_hm", "hm", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

###########################
    def h_hs_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "h_hs", "hs", 5, 20, " ", enreg, penreg)

    def h_hng_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_hng", "hng", 5, 20, "", enreg, penreg)

    def h_hnd_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_hnd", "hnd", 5, 20, "", enreg, penreg)

    def h_ho_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_ho", "ho", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

###########################
    def h_hp_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "h_hp", "hp", 5, 20, " ", enreg, penreg)

    def h_hq_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_hq", "hq", 5, 20, "", enreg, penreg)

    def h_hr_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_hr", "hr", 5, 20, "", enreg, penreg)

    def h_hu_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_hu", "hu", 5, 20, "", enreg, penreg)
        self.__doc__.pop()
###########################
    def h_hx_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "h_hx", "hx", 5, 20, " ", enreg, penreg)

    def h_hya1_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_hya1", "hya1", 5, 20, "", enreg, penreg)

    def h_hya2_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_hya2", "hya2", 5, 20, "", enreg, penreg)

    def h_hya_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_hya", "hya", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

###########################
    def h_hyb1_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "h_hyb1", "hyb1", 5, 20, " ", enreg, penreg)

    def h_hyb2_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_hyb2", "hyb2", 5, 20, "", enreg, penreg)

    def h_hyb_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_hyb", "hyb", 5, 20, "", enreg, penreg)

    def h_hy_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_hy", "hy", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

###########################
    def h_hyax_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "h_hyax", "hyax", 5, 20, " ", enreg, penreg)

    def h_hybx_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_hybx", "hybx", 5, 20, "", enreg, penreg)

    def h_hyx_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "h_hyx", "hyx", 5, 20, "", enreg, penreg)
        self.__doc__.pop()
#        self.__doc__.pop()

    def h_hf_base_to_form(self, enreg, penreg=None):
        afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
        afficheclefs.champ_saisie_area(self, "h_hf", "hf", 3, 50, 5, "", enreg, penreg)
        self.__doc__.pop()

##############################################################################################################################
#                                               METHODES
##############################################################################################################################
    def modifier(self):
        """Met a jour la industrie courante"""
        self.__db__.query(self.make_update_query(self.__listeclefs__))
        return 0

    def supprimer(self):
        # s'il existe des outil sur hachereau associe à cet éclat
        # on efface l'éclat
        self.delete_records(self.__listeclefs__)
        return 0

    def creer(self):
        # si la industrie n'existe pas déjà alors on la crée, sinon on refuse
        if self.exist(self.__listeclefs__):
            primarykeys = {"zone": None, "numero": None, "bis": None}
            return (-1, primarykeys)
        else:
            # on insère maintenant la industrie dans la base
            # sauf si la bis n'existe pas.
            if not self.exist(self.__listeclefs__, table="industrie"):
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
