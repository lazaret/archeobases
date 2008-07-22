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


class Dent(archeodata.Data):
    #
    # le nom de la table
    __tablename__ = "dent"
    __new_record__ = "Nouvelle"
    __color__ = archeoconf.bas1_bgcolor
    #
    # tous les champs de la table proprietaire
    __champs__ =    {
                    "zone"   : {"type": "text", "default": "", "mandatory": 1, "longueur": 0, "memory": 1},
                    "numero" : {"type": "decimal", "default": 0, "mandatory": 1, "longueur": 6, "memory": 1},
                    "bis"    : {"type": "text", "default": "", "mandatory": 1, "longueur": 0, "memory": 1},
                    "d_serie": {"type": "text", "default": "1", "mandatory": 1, "longueur": 2},
                    "d_type" : {"type": "text", "default": "", "mandatory": 1, "longueur": 0},
                    "d_m1"   : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "d_m2"   : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "d_m3"   : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "d_m4"   : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "d_m5"   : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "d_m6"   : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "d_m7"   : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "d_m8"   : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "d_m9"   : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "d_m10"  : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "d_m11"  : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "d_m12"  : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "d_m13"  : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "d_m14"  : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "d_m15"  : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "d_m16"  : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "d_m17"  : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "d_m18"  : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "d_m19"  : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "d_m20"  : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "d_m21"  : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "d_m22"  : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "d_m23"  : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "d_m24"  : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "d_m25"  : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "d_m26"  : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "d_m27"  : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "d_m28"  : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "d_m29"  : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "d_m30"  : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    }
    #
    # liste des tables enfants
    __listenfants__ = ()
    __listeparents__ = ("carnet", "faune")
    __listeclefs__ = ("zone", "numero", "bis", "d_serie", "d_type")
    __vraiparent__ = "faune"
    #
    # liste des seuls champs que l'on veut pouvoir modifier
    __listechamps__ = ("zone", "numero", "bis", "d_serie", "d_type", "d_m1", "d_m2", "d_m3", "d_m4", "d_m5", "d_m6", "d_m7", "d_m8", "d_m9", "d_m10", "d_m11", "d_m12", "d_m13", "d_m14", "d_m15", "d_m16", "d_m17", "d_m18", "d_m19", "d_m20", "d_m21", "d_m22", "d_m23", "d_m24", "d_m25", "d_m26", "d_m27", "d_m28", "d_m29", "d_m30")
    #
    # liste des champs dans leur ordre de saisie
    __ordrechamps__ = ("zone", "numero", "bis", "d_serie", "d_type", "f_famille", "f_genre", "f_espece", "d_m1", "d_m2", "d_m3", "d_m4", "d_m5", "d_m6", "d_m7", "d_m8", "d_m9", "d_m10", "d_m11", "d_m12", "d_m13", "d_m14", "d_m15", "d_m16", "d_m17", "d_m18", "d_m19", "d_m20", "d_m21", "d_m22", "d_m23", "d_m24", "d_m25", "d_m26", "d_m27", "d_m28", "d_m29", "d_m30")
    __orderby__ = " ORDER BY zone, numero, bis, d_serie, d_type ASC;"
    #
    # liste des formulaires supplementaires
    __formsupp__ = ()

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

    def d_serie_verify(self, fieldname, value):
        if value == '':
            return -1
        else:
            return 0

    def d_type_verify(self, fieldname, value):
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

    def d_serie_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_x_serie(self, "d_serie", "10", enreg, penreg)

    def d_type_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_type(self, "d_type", enreg, penreg)
        self.__doc__.pop()

############################### En sortie ###################################
    def f_famille_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            afficheclefs.ajoute_ligne(self, "100%", "1", "10", "10")
            liste_clefs = ("zone", "numero", "bis")
            self.champ_nsaisie_table("faune", liste_clefs, "f_famille", "famille", 3, 20, "", 2, enreg, penreg)

    def f_genre_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            liste_clefs = ("zone", "numero", "bis")
            self.champ_nsaisie_table("faune", liste_clefs, "f_genre", "genre", 3, 20, "", 2, enreg, penreg)

    def f_espece_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            liste_clefs = ("zone", "numero", "bis")
            self.champ_nsaisie_table("faune", liste_clefs, "f_espece", "espece", 3, 20, "", 2, enreg, penreg)

############################### En entrée #####################################
    def d_m1_base_to_form(self, enreg, penreg=None):
        afficheclefs.ajoute_ligne(self, "100%", "1", "10", "10")
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "d_m1", "M1", 5, 20, " ", enreg, penreg)

    def d_m2_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "d_m2", "M2", 5, 20, "", enreg, penreg)

    def d_m3_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "d_m3", "M3", 5, 20, "", enreg, penreg)

    def d_m4_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "d_m4", "M4", 5, 20, "", enreg, penreg)

    def d_m5_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "d_m5", "M5", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

    def d_m6_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "d_m6", "M6", 5, 20, " ", enreg, penreg)

    def d_m7_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "d_m7", "M7", 5, 20, "", enreg, penreg)

    def d_m8_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "d_m8", "M8", 5, 20, "", enreg, penreg)

    def d_m9_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "d_m9", "M9", 5, 20, "", enreg, penreg)

    def d_m10_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "d_m10", "M10", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

    def d_m11_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "d_m11", "M11", 5, 20, " ", enreg, penreg)

    def d_m12_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "d_m12", "M12", 5, 20, "", enreg, penreg)

    def d_m13_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "d_m13", "M13", 5, 20, "", enreg, penreg)

    def d_m14_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "d_m14", "M14", 5, 20, "", enreg, penreg)

    def d_m15_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "d_m15", "M15", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

    def d_m16_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "d_m16", "M16", 5, 20, " ", enreg, penreg)

    def d_m17_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "d_m17", "M17", 5, 20, "", enreg, penreg)

    def d_m18_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "d_m18", "M18", 5, 20, "", enreg, penreg)

    def d_m19_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "d_m19", "M19", 5, 20, "", enreg, penreg)

    def d_m20_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "d_m20", "M20", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

    def d_m21_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "d_m21", "M21", 5, 20, " ", enreg, penreg)

    def d_m22_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "d_m22", "M22", 5, 20, "", enreg, penreg)

    def d_m23_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "d_m23", "M23", 5, 20, "", enreg, penreg)

    def d_m24_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "d_m24", "M24", 5, 20, "", enreg, penreg)

    def d_m25_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "d_m25", "M25", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

    def d_m26_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "d_m26", "M26", 5, 20, " ", enreg, penreg)

    def d_m27_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "d_m27", "M27", 5, 20, "", enreg, penreg)

    def d_m28_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "d_m28", "M28", 5, 20, "", enreg, penreg)

    def d_m29_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "d_m29", "M29", 5, 20, "", enreg, penreg)

    def d_m30_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "d_m30", "M30", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

##############################################################################################################################
#                                               METHODES
##############################################################################################################################
    def modifier(self):
        """Met a jour la micro courante"""
        self.__db__.query(self.make_update_query(self.__listeclefs__))
        return 0

    def supprimer(self):
        # on efface la dent sur éclat
        self.delete_records(self.__listeclefs__)
        return 0

    def creer(self):
        # si la dent n'existe pas déjà alors on la crée, sinon on refuse
        if self.exist(self.__listeclefs__):
            primarykeys = {"zone": None, "numero": None, "bis": None, "o_ordre": None, "d_serie": None, "d_type": None}
            return (-1, primarykeys)
        else:
            # on insère maintenant la dent dans la base
            # sauf si la faune n'existe pas.
            if not self.exist(("zone", "numero", "bis"), table="faune"):
                primarykeys = {"zone": None, "numero": None, "bis": None, "d_serie": None, "d_type": None}
                return (-2, primarykeys)
            else:
                # on insère maintenant la dent dans la base
                z = self.__form__["zone"].value
                n = self.__form__["numero"].value
                b = self.__form__["bis"].value
                s = self.__form__["d_serie"].value
                t = self.__form__["d_type"].value
                self.__db__.query(self.make_insert_query({}))
                primarykeys = {"zone": z, "numero": n, "bis": b, "d_serie": s, "d_type": t}
                return (0, primarykeys)

