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


class Nonos(archeodata.Data):
    #
    # le nom de la table
    __tablename__ = "os"
    __new_record__ = "Nouvel"
    __color__ = archeoconf.bas1_bgcolor
    #
    # tous les champs de la table proprietaire
    __champs__ =    {
                    "zone"         : {"type": "text", "default": "", "mandatory": 1, "longueur": 0, "memory": 1},
                    "numero"       : {"type": "decimal", "default": 0, "mandatory": 1, "longueur": 6,"memory": 1},
                    "bis"          : {"type": "text", "default": "", "mandatory": 1, "longueur": 0, "memory": 1},
                    "o_serie"      : {"type": "text", "default": "1", "mandatory": 1,"longueur": 2, "memory": 1},
                    "o_type"       : {"type": "text", "default": "", "mandatory": 1, "longueur": 3},
                    "o_m1"         : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m2"         : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m3"         : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m4"         : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m5"         : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m6"         : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m7"         : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m8"         : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m9"         : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m10"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m11"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m12"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m13"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m14"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m15"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m16"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m17"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m18"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m19"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m20"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m21"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m22"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m23"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m24"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m25"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m26"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m27"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m28"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m29"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m30"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m31"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m32"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m33"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m34"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m35"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m36"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m37"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m38"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m39"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m40"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m41"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m42"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m43"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m44"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m45"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m46"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m47"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m48"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m49"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "o_m50"        : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    }
    #
    # liste des tables enfants
    __listenfants__ = ()
    __listeparents__ = ("carnet", "faune")
    __listeclefs__ = ("zone", "numero", "bis", "o_serie"]
    __vraiparent__ = "faune"
    #
    # liste des seuls champs que l'on veut pouvoir modifier
    __listechamps__ = ("zone", "numero", "bis", "o_serie", "o_type", "o_m1", "o_m2", "o_m3", "o_m4", "o_m5", "o_m6", "o_m7", "o_m8", "o_m9", "o_m10", "o_m11", "o_m12", "o_m13", "o_m14", "o_m15", "o_m16", "o_m17", "o_m18", "o_m19", "o_m20", "o_m21", "o_m22", "o_m23", "o_m24", "o_m25", "o_m26", "o_m27",  "o_m28", "o_m29", "o_m30", "o_m31", "o_m32", "o_m33", "o_m34", "o_m35", "o_m36", "o_m37", "o_m38", "o_m39", "o_m40", "o_m41", "o_m42", "o_m43", "o_m44", "o_m45", "o_m46", "o_m47", "o_m48", "o_m49", "o_m50")
    #
    # liste des champs dans leur ordre de saisie
    __ordrechamps__ = ("zone", "numero", "bis", "o_serie", "f_famille", "f_genre", "f_espece", "o_type", "o_m1", "o_m2", "o_m3", "o_m4", "o_m5", "o_m6", "o_m7", "o_m8", "o_m9", "o_m10", "o_m11", "o_m12", "o_m13", "o_m14", "o_m15", "o_m16", "o_m17", "o_m18", "o_m19", "o_m20", "o_m21", "o_m22", "o_m23", "o_m24", "o_m25", "o_m26", "o_m27", "o_m28", "o_m29", "o_m30", "o_m31", "o_m32", "o_m33", "o_m34", "o_m35", "o_m36", "o_m37", "o_m38", "o_m39", "o_m40", "o_m41", "o_m42", "o_m43", "o_m44", "o_m45", "o_m46", "o_m47", "o_m48", "o_m49", "o_m50")
    __orderby__ = " ORDER BY zone, numero, bis, o_serie ASC;"
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

    def o_serie_verify(self, fieldname, value):
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

    def o_serie_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_x_serie(self, "o_serie", "10", enreg, penreg)
        self.__doc__.pop()

############################### En sortie ###################################
    def f_famille_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            afficheclefs.ajoute_ligne(self, "100%", "1", "10", "10")
            liste_clefs = ("zone", "numero", "bis", "o_serie")
            self.champ_nsaisie_table("faune", liste_clefs, "f_famille", "famille", 3, 20, "", 2, enreg, penreg)

    def f_genre_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            liste_clefs = ("zone", "numero", "bis", "o_serie")
            self.champ_nsaisie_table("faune", liste_clefs, "f_genre", "genre", 3, 20, "", 2, enreg, penreg)

    def f_espece_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            liste_clefs = ("zone", "numero", "bis", "o_serie")
            self.champ_nsaisie_table("faune", liste_clefs, "f_espece", "espece", 3, 20, "", 2, enreg, penreg)

################################### En entrée ########################################
    def o_type_base_to_form(self, enreg, penreg=None):
        afficheclefs.ajoute_ligne(self, "100%", "1", "10", "10")
        self.__doc__.push()
        afficheclefs.champ_nsaisie(self, "o_type", "Type d'os", 10, 20, "", 2, enreg, penreg)
        self.__doc__.pop()

##############
    def o_m1_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "o_m1", "M1", 5, 20, " ", enreg, penreg)

    def o_m2_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m2", "M2", 5, 20, "", enreg, penreg)

    def o_m3_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m3", "M3", 5, 20, "", enreg, penreg)

    def o_m4_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m4", "M4", 5, 20, "", enreg, penreg)

    def o_m5_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m5", "M5", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

    def o_m6_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "o_m6", "M6", 5, 20, " ", enreg, penreg)

    def o_m7_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m7", "M7", 5, 20, "", enreg, penreg)

    def o_m8_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m8", "M8", 5, 20, "", enreg, penreg)

    def o_m9_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m9", "M9", 5, 20, "", enreg, penreg)

    def o_m10_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m10", "M10", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

    def o_m11_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "o_m11", "M11", 5, 20, " ", enreg, penreg)

    def o_m12_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m12", "M12", 5, 20, "", enreg, penreg)

    def o_m13_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m13", "M13", 5, 20, "", enreg, penreg)

    def o_m14_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m14", "M14", 5, 20, "", enreg, penreg)

    def o_m15_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m15", "M15", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

    def o_m16_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "o_m16", "M16", 5, 20, " ", enreg, penreg)

    def o_m17_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m17", "M17", 5, 20, "", enreg, penreg)

    def o_m18_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m18", "M18", 5, 20, "", enreg, penreg)

    def o_m19_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m19", "M19", 5, 20, "", enreg, penreg)

    def o_m20_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m20", "M20", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

    def o_m21_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "o_m21", "M21", 5, 20, " ", enreg, penreg)

    def o_m22_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m22", "M22", 5, 20, "", enreg, penreg)

    def o_m23_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m23", "M23", 5, 20, "", enreg, penreg)

    def o_m24_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m24", "M24", 5, 20, "", enreg, penreg)

    def o_m25_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m25", "M25", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

    def o_m26_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "o_m26", "M26", 5, 20, " ", enreg, penreg)

    def o_m27_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m27", "M27", 5, 20, "", enreg, penreg)

    def o_m28_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m28", "M28", 5, 20, "", enreg, penreg)

    def o_m29_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m29", "M29", 5, 20, "", enreg, penreg)

    def o_m30_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m30", "M30", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

    def o_m31_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "o_m31", "M31", 5, 20, " ", enreg, penreg)

    def o_m32_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m32", "M32", 5, 20, "", enreg, penreg)

    def o_m33_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m33", "M33", 5, 20, "", enreg, penreg)

    def o_m34_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m34", "M34", 5, 20, "", enreg, penreg)

    def o_m35_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m35", "M35", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

    def o_m36_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "o_m36", "M36", 5, 20, " ", enreg, penreg)

    def o_m37_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m37", "M37", 5, 20, "", enreg, penreg)

    def o_m38_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m38", "M38", 5, 20, "", enreg, penreg)

    def o_m39_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m39", "M39", 5, 20, "", enreg, penreg)

    def o_m40_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m40", "M40", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

    def o_m41_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "o_m41", "M41", 5, 20, " ", enreg, penreg)

    def o_m42_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m42", "M42", 5, 20, "", enreg, penreg)

    def o_m43_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m43", "M43", 5, 20, "", enreg, penreg)

    def o_m44_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m44", "M44", 5, 20, "", enreg, penreg)

    def o_m45_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m45", "M45", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

    def o_m46_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "o_m46", "M46", 5, 20, " ", enreg, penreg)

    def o_m47_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m47", "M47", 5, 20, "", enreg, penreg)

    def o_m48_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m48", "M48", 5, 20, "", enreg, penreg)

    def o_m49_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m49", "M49", 5, 20, "", enreg, penreg)

    def o_m50_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_m50", "M50", 5, 20, "", enreg, penreg)
        self.__doc__.pop()

##############################################################################################################################
#                                               METHODES
##############################################################################################################################
    def modifier(self):
        """Met a jour la micro courante"""
        self.__db__.query(self.make_update_query(self.__listeclefs__))
        return 0

    def supprimer(self):
        # on efface la os sur éclat
        self.delete_records(self.__listeclefs__)
        return 0

    def creer(self):
        # si la os n'existe pas déjà alors on la crée, sinon on refuse
        if self.exist(self.__listeclefs__):
            primarykeys = {"zone": None, "numero": None, "bis": None, "o_ordre": None, "o_serie": None}
            return (-1, primarykeys)
        else:
            # on insère maintenant la os dans la base
            # sauf si la faune n'existe pas.
            if not self.exist(("zone", "numero", "bis"), table="faune"):
                primarykeys = {"zone": None, "numero": None, "bis": None}
                return (-2, primarykeys)
            else:
                # on insère maintenant la os dans la base
                z = self.__form__["zone"].value
                n = self.__form__["numero"].value
                b = self.__form__["bis"].value
                s = self.__form__["o_serie"].value
                self.__db__.query(self.make_insert_query({}))
                primarykeys = {"zone": z, "numero": n, "bis": b, "o_serie": s}
                return (0, primarykeys)


