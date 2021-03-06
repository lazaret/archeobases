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

import os
import archeoconf
import archeodata
import afficheclefs
import retouche
import stigmate
import fracture_industrie


class Industrie(archeodata.Data):
    #
    # le nom de la table
    __tablename__ = "industrie"
    __new_record__ = "Nouvelle"
    __color__ = archeoconf.bas1_bgcolor
    #
    # tous les champs de la table proprietaire
    __champs__ =    {
                    "zone"              : {"type": "text", "default": "", "mandatory": 1, "longueur": 0, "memory": 1},
                    "numero"            : {"type": "int", "default": 0, "mandatory": 1, "longueur": 6, "memory": 1},
                    "bis"               : {"type": "text", "default": "", "mandatory": 1, "longueur": 0, "memory": 1},
                    "i_oa"              : {"type": "int", "default": 0, "mandatory": 0, "longueur": 3},
                    "i_ob"              : {"type": "int", "default": 0, "mandatory": 0, "longueur": 3},
                    "i_oc"              : {"type": "int", "default": 0, "mandatory": 0, "longueur": 3},
                    "i_poids"           : {"type": "int", "default": 0, "mandatory": 0, "longueur": 5},
                    "i_forme_galet"     : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "i_support_originel": {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "i_matiere"         : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "i_objet"           : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "i_patine"          : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "i_dpatine"         : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "i_alteration"      : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "i_encroutement"    : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "i_pmycellium"      : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "i_eolisation"      : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "i_lustrage"        : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "i_roulage"         : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "i_action"          : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "i_desilicification": {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "i_support"         : {"type": "text", "default": "", "mandatory": 0, "longueur": 5},
                    "i_observation"     : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "i_saisie"          : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "i_responsable"     : {"type": "text", "default": "", "mandatory": 0, "longueur": 15, "memory": 1},
                    }
    #
    # liste des tables enfants
    __listenfants__   = ("eclat", "outil", "galet_amenage", "nucleus", "biface", "hachereau")
    __listeparents__  = ("carnet",)
    __listeclefs__    = ("zone", "numero", "bis")
    __vraiparent__    = "carnet"
    #
    # liste des seuls champs que l'on veut pouvoir modifier
    __listechamps__ = ("zone", "numero", "bis", "i_poids", "i_matiere", "i_support", "i_objet", "i_patine", "i_dpatine", "i_alteration", "i_encroutement", "i_pmycellium", "i_eolisation", "i_lustrage", "i_roulage", "i_action", "i_desilicification", "i_oa", "i_ob", "i_oc", "i_forme_galet", "i_support_originel", "i_observation", "i_responsable")
    #
    # liste des champs dans leur ordre de saisie
    __ordrechamps__ = ("zone", "numero", "bis", "nature", "x", "y", "zrelatif", "zabsolu", "zreference", "ensemble", "niveau", "sol", "couche", "orientation", "pendage", "vers", "longueur", "largeur", "epaisseur", "oa", "ob", "oc", "i_poids", "i_forme_galet", "i_support_originel", "i_objet", "i_matiere", "i_support", "i_patine", "i_dpatine", "i_alteration", "i_desilicification", "i_encroutement", "i_pmycellium", "i_action", "i_eolisation", "i_lustrage", "i_roulage","i_observation", "i_saisie", "i_responsable", "composite")
    __orderby__ = " ORDER BY zone, numero, bis ASC;"
    #
    # liste des formulaires supplementaires
    __formsupp__ = ("retouches", "fracture_industries", "stigmates", "photoindustrie")

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

############################### En sortie ###################################
    def nature_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        if enreg != None:
            afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
            liste_clefs = ("zone", "numero", "bis")
            self.champ_liste_table("carnet", liste_clefs, "nature", "nature", enreg, penreg, "Rappel des données du carnet", dontchange=None)

    def x_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            liste_clefs = ("zone", "numero", "bis")
            self.champ_saisie_table("carnet",  liste_clefs, "x", "x", 3, 20, "", enreg, penreg)

    def y_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            liste_clefs = ("zone", "numero", "bis")
            self.champ_saisie_table("carnet",  liste_clefs, "y", "y", 3, 20, "", enreg, penreg)
        self.__doc__.pop()

    def zrelatif_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        if enreg != None:
            liste_clefs = ("zone", "numero", "bis")
            self.champ_saisie_table("carnet",  liste_clefs, "zrelatif", "zrela", 3, 20, "", enreg, penreg)

    def zabsolu_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            liste_clefs = ("zone", "numero", "bis")
            self.champ_saisie_table("carnet",  liste_clefs, "zabsolu", "zabs", 3, 20, "", enreg, penreg)

    def zreference_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            liste_clefs = ("zone", "numero", "bis")
            self.champ_saisie_table("carnet",  liste_clefs, "zreference", "zref", 3, 20, "", enreg, penreg)
        self.__doc__.pop()

    def ensemble_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        if enreg != None:
            liste_clefs = ("zone", "numero", "bis")
            self.champ_liste_table("carnet", liste_clefs, "ensemble", "ensemble", enreg, penreg, " ", dontchange=1)

    def niveau_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            liste_clefs = ("zone", "numero", "bis")
            self.champ_liste_table("carnet", liste_clefs, "niveau", "niveau", enreg, penreg, "", dontchange=None)
        self.__doc__.pop()

    def sol_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        if enreg != None:
            liste_clefs = ("zone", "numero", "bis")
            self.champ_liste_table("carnet", liste_clefs, "sol", "sol", enreg, penreg, " ", dontchange=None)

    def couche_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            liste_clefs = ("zone", "numero", "bis")
            self.champ_nsaisie_table("carnet",  liste_clefs, "couche", "couche", 3, 20, "", 1, enreg, penreg)

    def orientation_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            liste_clefs = ("zone", "numero", "bis")
            self.champ_liste_table("carnet", liste_clefs, "orientation", "orientation", enreg, penreg, "", dontchange=None)
        self.__doc__.pop()

    def pendage_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        if enreg != None:
            liste_clefs = ("zone", "numero", "bis")
            self.champ_liste_table("carnet", liste_clefs, "pendage", "pendage", enreg, penreg, " ", dontchange=None)

    def vers_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            liste_clefs = ("zone", "numero", "bis")
            self.champ_liste_table("carnet", liste_clefs, "vers", "vers", enreg, penreg, "", dontchange=None)
        self.__doc__.pop()

    def longueur_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        if enreg != None:
            afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
            liste_clefs = ("zone", "numero", "bis")
            self.champ_saisie_table("carnet", liste_clefs, "longueur", "L", 6, 20, "Dimensions", enreg, penreg)

    def largeur_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            liste_clefs = ("zone", "numero", "bis")
            self.champ_saisie_table("carnet", liste_clefs, "largeur", "l", 6, 20, "", enreg, penreg)

    def epaisseur_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            liste_clefs = ("zone", "numero", "bis")
            self.champ_saisie_table("carnet", liste_clefs, "epaisseur", "e", 6, 20, "", enreg, penreg)
        self.__doc__.pop()

    def saisie_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            liste_clefs = ("zone", "numero", "bis")
            self.__doc__.push()
            self.__doc__.tr()
            self.__doc__.td()
            self.__doc__.insert_text("Saisi le")
            self.__doc__.font(size=archeoconf.font_size)
            self.__doc__.insert_text("Saisi le")
            self.__doc__.text(name="i_saisie", value=enreg["i_saisie"], size=3, maxlength=20)
            self.__doc__.pop()

################################### En entrée ###########################
    def oa_base_to_form(self, enreg, penreg=None):
        afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "i_oa", "Oa", 6, 20, " ", enreg, penreg)

    def ob_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "i_ob", "Ob", 6, 20, "", enreg, penreg)

    def oc_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "i_oc", "Oc", 6, 20, "", enreg, penreg)
        self.__doc__.pop()

    def i_poids_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "i_poids", "poids", 6, 20, " ", enreg, penreg)

    def i_forme_galet_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "i_forme_galet", "forme gal", enreg, penreg, "", dontchange=0)

    def i_support_originel_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "i_support_originel", "support orig.", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

    def i_objet_base_to_form(self, enreg, penreg=None):
        afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
        self.__doc__.push()
        afficheclefs.champ_liste(self, "i_objet", "objet", enreg, penreg, "Généralités", dontchange=0)

    def i_matiere_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "i_matiere", "matière", enreg, penreg, "", dontchange=0)

    def i_support_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "i_support", "support", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

    def i_patine_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_liste(self, "i_patine", "patine", enreg, penreg, " ", dontchange=0)

    def i_dpatine_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "i_dpatine", "dpatine", enreg, penreg, "", dontchange=0)

    def i_alteration_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "i_alteration", "alteration", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

    def i_desilicification_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_liste(self, "i_desilicification", "desilicification", enreg, penreg, " ", dontchange=0)

    def i_encroutement_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "i_encroutement", "encroutement", enreg, penreg, "", dontchange=0)

    def i_pmycellium_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "i_pmycellium", "pmycellium", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

    def i_action_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_liste(self, "i_action", "action thermique", enreg, penreg, " ", dontchange=0)

    def i_eolisation_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "i_eolisation", "eolisation", enreg, penreg, "", dontchange=0)

    def i_lustrage_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "i_lustrage", "lustrage", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()
#
    def i_roulage_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_liste(self, "i_roulage", "roulage", enreg, penreg, " ", dontchange=0)
        self.__doc__.pop()

    def i_observation_base_to_form(self, enreg, penreg=None):
        afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
        self.__doc__.push()
        afficheclefs.champ_saisie_area(self, "i_observation", "Observations", 3, 50, 5, "", enreg, penreg)
        self.__doc__.pop()

    def i_saisie_base_to_form(self, enreg, penreg=None):
        afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
        self.__doc__.push()
        afficheclefs.champ_nsaisie(self, "i_saisie", "Fiche saisie le", 10, 20, " ", 2, enreg, penreg)

    def i_responsable_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_nliste(self, "i_responsable", "responsable", enreg, penreg, "", 2, dontchange=0)
        self.__doc__.pop()

################# En sortie depuis la table outil sur eclat#############
    def composite_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            res = self.__db__.query("SELECT * FROM outil WHERE zone = " + self.__db__.quote(enreg["zone"], "text") + " AND numero = " + self.__db__.quote(enreg["numero"], "decimal") + " AND bis = " + self.__db__.quote(enreg["bis"], "text") + ";")
            res = res.dictresult()
            total = len(res)
            self.__doc__.push()
            afficheclefs.ajoute_ligne(self, "100%",  "1", "10", "5")
            self.__doc__.tr(align="center")
            self.__doc__.push()
            self.__doc__.td(colspan="4")
            self.__doc__.insert_text("Nombre de Composite(s):")
            self.__doc__.insert_text(total)
            self.__doc__.pop()
            if total:
                self.__doc__.tr(align="center")
                self.__doc__.insert_text("Code composite:")
                self.__doc__.insert_text("à calculer")
                self.__doc__.tr(align="center")
                self.__doc__.td(colspan="4")
                self.__doc__.table(border="5", cellspading="0", cellspacing="0", bgcolor=archeoconf.basform_bgcolorright)
                self.__doc__.th("N° Ordre")
                self.__doc__.th("Code outil")
                for enreg in res:
                    self.__doc__.push()
                    self.__doc__.tr(align="center")
                    self.__doc__.push()
                    self.__doc__.td()
                    ordre = enreg["o_ordre"]
                    code = enreg["o_code"]
                    self.__doc__.insert_text(ordre)
                    self.__doc__.pop()
                    self.__doc__.td()
                    if code != None:
                        self.__doc__.insert_text(code)
                    else:
                        self.__doc__.insert_text("&nbsp;")
                    self.__doc__.pop()
            self.__doc__.pop()

###############################################################################
#                                       FRACTURES
###############################################################################
    def fracture_industries(self, enreg, penreg=None):
        if enreg != None:
            self.__doc__.push()
            self.__doc__.tr()
            self.__doc__.td(bgcolor=archeoconf.basform_bgcolorcenter, colspan="2")
            self.__doc__.font(size=archeoconf.font_size)
            penreg = {"zone": enreg["zone"], "numero": enreg["numero"], "bis": enreg["bis"]}
            fracture_industrie.Fracture_Industrie(self).traite_saisie(("zone", "numero", "bis", "f_ordre"), parent=self.__tablename__, penreg=penreg)
            self.__doc__.pop()

###############################################################################
#                                       RETOUCHES
###############################################################################
    def retouches(self, enreg, penreg=None):
        if enreg != None:
            self.__doc__.push()
            self.__doc__.tr()
            self.__doc__.td(bgcolor=archeoconf.basform_bgcolorcenter, colspan="2")
            self.__doc__.font(size=archeoconf.font_size)
            penreg = {"zone": enreg["zone"], "numero": enreg["numero"], "bis": enreg["bis"]}
            retouche.Retouche(self).traite_saisie(("zone", "numero", "bis", "r_ordre"), parent=self.__tablename__, penreg=penreg)
            self.__doc__.pop()

###############################################################################
#                                       STIGMATES
###############################################################################
    def stigmates(self, enreg, penreg=None):
        if enreg != None:
            self.__doc__.push()
            self.__doc__.tr()
            self.__doc__.td(bgcolor=archeoconf.basform_bgcolorcenter, colspan="2")
            self.__doc__.font(size=archeoconf.font_size)
            penreg = {"zone": enreg["zone"], "numero": enreg["numero"], "bis": enreg["bis"]}
            stigmate.Stigmate(self).traite_saisie(("zone", "numero", "bis", "s_ordre"), parent=self.__tablename__, penreg=penreg)
            self.__doc__.pop()

#########################################################################
#                                PHOTOS
#########################################################################
    def liste_photoindustrie(self, enreg):
        resp = self.__db__.query("SELECT * FROM photoindustrie WHERE zone = " + self.__db__.quote(enreg["zone"], "text") + " AND numero = " + self.__db__.quote(enreg["numero"], "decimal") + " AND bis = " + self.__db__.quote(enreg["bis"], "text")  + " ORDER BY idphoto ASC;")
        resp = resp.dictresult()
        lg = len(resp)
        if lg:
            self.__doc__.push()
            self.__doc__.div(align="center")
            if lg > 1:
                s = "s"
            else:
                s = ""
            self.__doc__.font(`lg` + " photo" + s, color="red")
            self.__doc__.pop()
            self.__doc__.push()
            self.__doc__.table(border="0", cellpadding="0", cellspacing="0")
            for photo in resp:
                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.td()
                self.__doc__.form(method="POST", action=archeoconf.script_location("modphotoindustrie"))
                self.__doc__.table(border=5, cellpadding=5, cellspacing=5)
                self.__doc__.tr()
                self.__doc__.push()
                self.__doc__.td()
                self.__doc__.table(border=0, cellpadding=0, cellspacing=0)
                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.td(valign="middle", align="center")
                photo_url = archeoconf.images_location + "Z" + enreg["zone"] + "/N" + `enreg["numero"]` + "/B" + enreg["bis"]  + "/" + `photo["idphoto"]`
                self.__doc__.a(href=photo_url + ".jpeg")
                xmax, ymax = archeoconf.get_imagesize(archeoconf.image_fullname("Z" + enreg["zone"] + os.sep + "N" + `enreg["numero"]` + os.sep + "B" +  enreg["bis"] +  os.sep + `photo["idphoto"]` + "s.jpeg"))
                self.__doc__.img(src=photo_url + "s.jpeg", width=xmax, height=ymax)
                self.__doc__.br()
                self.__doc__.a("original", href=photo_url + ".tiff")
                self.__doc__.pop()
                self.__doc__.tr()
                self.__doc__.td(valign="middle", align="center")
                self.__doc__.font(size=archeoconf.font_size)
                self.__doc__.textarea(name="legende", rows="4", cols="50", wrap="physical")
                if photo["legende"] == None:
                    self.__doc__.insert_text("&nbsp;")
                else:
                    self.__doc__.insert_text(photo["legende"])
                self.__doc__.pop()
                self.__doc__.td(bgcolor=archeoconf.basform_bgcolorright, valign= "middle", align="center")
                self.__doc__.font(size=archeoconf.font_size)
                self.__doc__.hidden(name="idphoto", value=photo["idphoto"])
                self.__doc__.hidden(name="zone", value=photo["zone"])
                self.__doc__.hidden(name="numero", value=photo["numero"])
                self.__doc__.hidden(name="bis", value=photo["bis"])
                self.__doc__.hidden(name="referer", value=self.__doc__.script_name())
                self.__doc__.submit(name="action", value="Modifier")
                self.__doc__.br()
                self.__doc__.submit(name="action", value="Supprimer")
                self.__doc__.br()
                self.__doc__.submit(name="action", value="Nouvelle")
                self.__doc__.pop()
            self.__doc__.pop()
        else:
            self.__doc__.push()
            self.__doc__.form(method="POST", action=archeoconf.script_location("modphotoindustrie"))
            self.__doc__.hidden(name="zone", value=enreg["zone"])
            self.__doc__.hidden(name="numero", value=enreg["numero"])
            self.__doc__.hidden(name="bis", value=enreg["bis"])
            self.__doc__.submit(name="action", value="Nouvelle image")
            self.__doc__.pop()
            self.__doc__.font("aucune image", color="red", size=archeoconf.font_size)

    def menu_photoindustrie(self, enreg, color, function):
        if enreg != None:
            self.__doc__.push()
            self.__doc__.tr()
            self.__doc__.td(bgcolor=color, colspan="2")
            self.__doc__.font(size=archeoconf.font_size)
            self.__doc__.div(align="center")
            function(enreg)
            self.__doc__.pop()

    def photoindustrie(self, enreg, penreg=None):
        self.menu_photoindustrie(enreg, archeoconf.basform_bgcolormiddle, self.liste_photoindustrie)

###############################################################################
#                                METHODES
##############################################################################
    def modifier(self):
        """Met a jour la industrie courante"""
        self.__db__.query(self.make_update_query(self.__listeclefs__))
        return 0

    def supprimer(self):
       # s'il existe des figures ou des photos sur cette industrie on refuse la suppression
        if self.exist(["zone", "numero", "bis"], table="galet_amenage") or self.exist(["zone", "numero", "bis"], table="eclat") or self.exist(["zone", "numero", "bis"], table="biface") or self.exist(["zone", "numero", "bis"], table="hachereau") or self.exist(["zone", "numero", "bis"], table="photoindustrie"):
            return -1
        else:
            z = "Z" + self.__form__["zone"].value
            n = "N" + self.__form__["numero"].value
            b = "B" + self.__form__["bis"].value
            rr = archeoconf.image_fullname(z + os.sep + n + os.sep + b + os.sep)
            try:
                if os.path.isdir(rr):
                    os.rmdir(rr)
            except:
                archeoconf.fatalerror_message("Impossible de supprimer le répertoire [%s]" % rr)
            # on efface l' industrie
            self.delete_records(self.__listeclefs__)
            return 0

    def creer(self):
        # si la industrie n'existe pas déjà alors on la crée, sinon on refuse
        if self.exist(self.__listeclefs__, table="industrie"):
            primarykeys = {"zone": None, "numero": None, "bis": None}
            return (-1, primarykeys)
        else:
            # on insère maintenant l'industrie dans la base
            # sauf si le carnet n'existe pas.
            if not self.exist(self.__listeclefs__, table="carnet"):
                primarykeys = {"zone": None, "numero": None, "bis": None}
                return (-2, primarykeys)
            # et sauf si ce n'est pas de l industrie
            elif nature not in ['GAL', 'GCA', 'GMA', 'IND', 'PIE']:
				primarykeys = {"zone": None, "numero": None, "bis": None}
				return (-4, primarykeys) 
            else:
                # on insère maintenant la industrie dans la base
                z = self.__form__["zone"].value
                n = self.__form__["numero"].value
                b = self.__form__["bis"].value
                self.__db__.query(self.make_insert_query({}))
                primarykeys = {"zone": z, "numero": n, "bis": b}
                return (0, primarykeys)
