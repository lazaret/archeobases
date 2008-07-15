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


class Trace(archeodata.Data):
    #
    # le nom de la table
    __tablename__ = "trace"
    __new_record__ = "Nouvelle"
    __color__ = archeoconf.bas1_bgcolor
    #
    # tous les champs de la table proprietaire
    __champs__ =    {
                    "zone"          : {"type": "text", "default": "", "mandatory": 1, "longueur": 0, "memory": 1}, \
                    "numero"        : {"type": "decimal", "default": 0, "mandatory": 1, "longueur": 6,"memory": 1}, \
                    "bis"           : {"type": "text","default": "",  "mandatory": 1, "longueur": 0, "memory": 1}, \
                    "t_ensemble"    : {"type": "text", "default": "1", "mandatory": 1 , "longueur": 2, "memory": 1}, \
                    "t_nature"      : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "t_nombre"      : {"type": "decimal", "default": 0, "mandatory": 0, "longueur": 2}, \
                    "t_agent"       : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "t_phenomene"   : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "t_localisation": {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "t_position"    : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "t_locmusc"     : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "t_longueur"    : {"type": "int", "default": 0, "mandatory": 0 , "longueur": 3}, \
                    "t_classe"      : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "t_largeur"     : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "t_profondeur"  : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "t_section"     : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "t_diametre"    : {"type": "int", "default": 0, "mandatory": 0 , "longueur": 3}, \
                    "t_dstrie"      : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "t_trace"       : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "t_direction"   : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "t_sens"        : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "t_description" : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "t_allure"      : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "t_dessin"      : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "t_replique"    : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                    "t_photo"       : {"type": "text", "default": "", "mandatory": 0 , "longueur": 0}, \
                   }
    #
    # liste des tables enfants
    __listenfants__ = []
    __listeparents__ = ["carnet", "faune"]
    __listeclefs__ = ["zone", "numero", "bis", "t_ensemble"]
    __vraiparent__ = "faune"
    #
    # liste des seuls champs que l'on veut pouvoir modifier
    __listechamps__ = ["zone", "numero", "bis", "t_ensemble", "t_nature", "t_nombre", "t_agent", "t_phenomene", "t_localisation", "t_position", "t_locmusc", "t_longueur", "t_classe", "t_largeur", "t_profondeur", "t_section", "t_diametre", "t_dstrie", "t_trace", "t_allure", "t_direction", "t_sens", "t_dessin", "t_photo", "t_replique", "t_description"]

    #
    # liste des champs dans leur ordre de saisie
    __ordrechamps__ =  ["zone", "numero", "bis", "t_ensemble", "f_typos1", "f_typos2", "f_typos3", "f_typos4", "f_typos5", "t_nature", "t_nombre", "t_agent", "t_phenomene", "t_localisation", "t_position", "t_locmusc", "t_longueur", "t_classe", "t_largeur", "t_profondeur", "t_section", "t_diametre", "t_dstrie", "t_trace", "t_allure", "t_direction", "t_sens", "t_dessin", "t_photo", "t_replique", "t_description"]
    __orderby__ = " ORDER BY zone, numero, bis, t_ensemble ASC;"
    #
    # liste des formulaires supplementaires
    __formsupp__ = ["phototrace"]

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

    def t_ensemble_verify(self, fieldname, value):
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

    def t_ensemble_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_ensemble(self, "t_ensemble", enreg, penreg)
        self.__doc__.pop()

############################### En sortie ###################################
    def f_typos1_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
            liste_clefs = ["zone", "numero", "bis"]
            self.__doc__.push()
            self.__doc__.tr()
            self.__doc__.push()
            self.__doc__.td()
            self.__doc__.u()
            self.__doc__.font(size=archeoconf.font_size)
            self.__doc__.insert_text("Nature de l'os")
            self.__doc__.pop()
            self.__doc__.push()
            self.__doc__.td(colspan=4, align="center")
            self.__doc__.font(size=archeoconf.font_size)

    def f_typos2_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            liste_clefs = ["zone", "numero", "bis"]
            self.champ_saisie_table_simple("faune",  liste_clefs, "f_typos2", 3, 20, "", enreg, penreg)

    def f_typos3_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            liste_clefs = ["zone", "numero", "bis"]
            self.champ_saisie_table_simple("faune",  liste_clefs, "f_typos3", 3, 20, "", enreg, penreg)

    def f_typos4_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            liste_clefs = ["zone", "numero", "bis"]
            self.champ_saisie_table_simple("faune",  liste_clefs, "f_typos4", 3, 20, "", enreg, penreg)

    def f_typos5_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            liste_clefs = ["zone", "numero", "bis"]
            self.champ_saisie_table_simple("faune",  liste_clefs, "f_typos5", 3, 20, "", enreg, penreg)
            self.__doc__.pop()
            self.__doc__.pop()

################################### En entrée ########################################
    def t_nature_base_to_form(self, enreg, penreg=None):
        afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
        self.__doc__.push()
        afficheclefs.champ_liste(self, "t_nature", "Nature des traces", enreg, penreg, " ", dontchange=0)

    def t_nombre_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "t_nombre", "nombre", 2, 20, "", enreg, penreg)
        self.__doc__.pop()

    def t_agent_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_liste(self, "t_agent", "agent", enreg, penreg, "Origine", dontchange=0)

    def t_phenomene_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "t_phenomene", "phénomène", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

    def t_localisation_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "t_localisation", "localisation", 15, 25, "Localisation", enreg, penreg)

    def t_position_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "t_position", "position", 4, 14, "", enreg, penreg)

    def t_locmusc_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "t_locmusc", "locmusc", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

    def t_longueur_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "t_longueur", "longueur", 3, 20, "Dimensions", enreg, penreg)
    def t_classe_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "t_classe", "classe", enreg, penreg, "", dontchange=0)
    def t_largeur_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "t_largeur", "largeur", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

    def t_profondeur_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_liste(self, "t_profondeur", "profondeur", enreg, penreg, " ", dontchange=0)

    def t_section_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "t_section", "section", enreg, penreg, "", dontchange=0)

    def t_diametre_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "t_diametre", "diamètre", 3, 20, "", enreg, penreg)
        self.__doc__.pop()

    def t_dstrie_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_liste(self, "t_dstrie", "dstries", enreg, penreg, "Morphologie", dontchange=0)

    def t_trace_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "t_trace", "tracé", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

    def t_allure_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_liste(self, "t_allure", "allure", enreg, penreg, "orientation", dontchange=0)

    def t_direction_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "t_direction", "direction", enreg, penreg, "", dontchange=0)

    def t_sens_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "t_sens", "sens", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

    def t_dessin_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_liste(self, "t_dessin", "dessin", enreg, penreg, "renseignements", dontchange=0)

    def t_photo_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "t_photo", "photo", enreg, penreg, "", dontchange=0)

    def t_replique_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "t_replique", "réplique", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

    def t_description_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie_area(self, "t_description", "description", 2, 50, 7, " ", enreg, penreg)
        self.__doc__.pop()

#########################################################################
#                                PHOTOS
#########################################################################
    def liste_phototrace(self, enreg):
        resp = self.__db__.query("SELECT * FROM phototrace WHERE zone = " + self.__db__.quote(enreg["zone"], "text") + " AND numero = " + self.__db__.quote(enreg["numero"], "decimal") + " AND bis = " + self.__db__.quote(enreg["bis"], "text")+ " AND t_ensemble = " + self.__db__.quote(enreg["t_ensemble"], "text")  + " ORDER BY idphoto ASC;")
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
                self.__doc__.form(method="POST", action=archeoconf.script_location("modphototrace"))
                self.__doc__.table(border=5, cellpadding=5, cellspacing=5)
                self.__doc__.tr()
                self.__doc__.push()
                self.__doc__.td()
                self.__doc__.table(border=0, cellpadding=0, cellspacing=0)
                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.td(valign="middle", align="center")
                photo_url = archeoconf.images_location + "Z" + enreg["zone"] + "/N" + `enreg["numero"]` + "/B" + enreg["bis"] + "/T" + enreg["t_ensemble"]  + "/" + `photo["idphoto"]`
                self.__doc__.a(href=photo_url + ".jpeg")
                xmax, ymax = archeoconf.get_imagesize(archeoconf.image_fullname("Z" + enreg["zone"] + os.sep + "N" + `enreg["numero"]` + os.sep + "B" +  enreg["bis"]+ "T" +  enreg["t_ensemble"] +  os.sep + `photo["idphoto"]` + "s.jpeg"))
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
                self.__doc__.hidden(name="t_ensemble", value=photo["t_ensemble"])
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
            self.__doc__.form(method="POST", action=archeoconf.script_location("modphototrace"))
            self.__doc__.hidden(name="zone", value=enreg["zone"])
            self.__doc__.hidden(name="numero", value=enreg["numero"])
            self.__doc__.hidden(name="bis", value=enreg["bis"])
            self.__doc__.hidden(name="t_ensemble", value=enreg["bis"])
            self.__doc__.submit(name="action", value="Nouvelle image")
            self.__doc__.pop()
            self.__doc__.font("aucune image", color="red", size=archeoconf.font_size)

    def menu_phototrace(self, enreg, color, function):
        if enreg != None:
            self.__doc__.push()
            self.__doc__.tr()
            self.__doc__.td(bgcolor=color, colspan="2")
            self.__doc__.font(size=archeoconf.font_size)
            self.__doc__.div(align="center")
            function(enreg)
            self.__doc__.pop()

    def phototrace(self, enreg, penreg=None):
        self.menu_phototrace(enreg, archeoconf.basform_bgcolormiddle, self.liste_phototrace)

##############################################################################################################################
#                                               METHODES
##############################################################################################################################
    def modifier(self):
        """Met a jour la micro courante"""
        self.__db__.query(self.make_update_query(["zone", "numero", "bis", "t_ensemble"]))
        return 0

    def supprimer(self):
        # s'il existe des figures ou des photos sur cette trace on refuse la suppression
        if self.exist(["zone", "numero", "bis", "t_ensemble"], table="phototrace"):
            return -1
        else:
            z = "Z" + self.__form__["zone"].value
            n = "N" + self.__form__["numero"].value
            b = "B" + self.__form__["bis"].value
            t = "T" + self.__form__["t_ensemble"].value
            rr = archeoconf.image_fullname(z + os.sep + n + os.sep + b + os.sep + t +os.sep)
            try:
                if os.path.isdir(rr):
                    os.rmdir(rr)
            except:
                archeoconf.fatalerror_message("Impossible de supprimer le répertoire [%s]" % rr)
            # on efface la trace
            self.delete_records(["zone", "numero", "bis", "t_ensemble"])
            return 0

    def creer(self):
        # si la trace n'existe pas déjà alors on la crée, sinon on refuse
        if self.exist(["zone", "numero", "bis", "t_ensemble"]):
            primarykeys = {"zone": None, "numero": None, "bis": None, "o_ordre": None, "t_ensemble": None}
            return (-1, primarykeys)
        else:
            # on insère maintenant la trace dans la base
            # sauf si la faune n'existe pas.
            if not self.exist(["zone", "numero", "bis"], table="faune"):
                primarykeys = {"zone": None, "numero": None, "bis": None}
                return (-2, primarykeys)
            else:
                # on insère maintenant la trace dans la base
                z = self.__form__["zone"].value
                n = self.__form__["numero"].value
                b = self.__form__["bis"].value
                e = self.__form__["t_ensemble"].value
                self.__db__.query(self.make_insert_query({}))
                primarykeys = {"zone": z, "numero": n, "bis": b, "t_ensemble": e}
                return (0, primarykeys)

