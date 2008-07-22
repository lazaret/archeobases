#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Mont Bego - (c) 1999-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
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
import begoconf
import begodata
import afficheclefs


class Historique(begodata.Data):
    #
    # le nom de la table
    __tablename__ = "historique"
    __new_record__ = "Nouvelle"
    #
    # tous les champs de la table proprietaire
    __champs__ = {
                "zone"          :{"type": "decimal", "default": 0,  "mandatory": 1},
                "groupe"        :{"type": "decimal", "default": 0,  "mandatory": 1},
                "roche"         :{"type": "text",    "default": "", "mandatory": 1},
                "face"          :{"type": "text",    "default": "", "mandatory": 1},
                "historique"    :{"type": "text",    "default": "", "mandatory": 1},
                "motif"         :{"type": "text",    "default": "", "mandatory": 0},
                "type"          :{"type": "text",    "default": "", "mandatory": 0},
                "origine"       :{"type": "text",    "default": "", "mandatory": 0},
                "realisation"   :{"type": "text",    "default": "", "mandatory": 0},
                "date"          :{"type": "date",    "default": "", "mandatory": 0},
                "longueur"      :{"type": "decimal", "default": 0,  "mandatory": 0},
                "largeur"       :{"type": "decimal", "default": 0,  "mandatory": 0},
                "qualite"       :{"type": "text",    "default": "", "mandatory": 0},
                "style"         :{"type": "text",    "default": "", "mandatory": 0},
                "description"   :{"type": "text",    "default": "", "mandatory": 0},
                "superposition" :{"type": "text",    "default": "", "mandatory": 0},
                }
    #
    # liste des seuls champs que l'on veut pouvoir modifier
    __listechamps__ = ("zone", "groupe", "roche", "face", "historique", "motif", "type", "origine", "realisation", "superposition", "date", "longueur", "largeur", "qualite", "style", "description")
    __listeparents__  = ("zone", "roche", "face")
    __listeclefs__ = ("zone", "groupe", "roche", "face", "historique")
    __vraiparent__ = "face"
    #
    # liste des champs dans leur ordre de saisie
    __ordrechamps__ =  ("zone", "groupe", "roche", "face", "historique", "motif", "date", "type", "origine", "realisation", "superposition", "longueur", "largeur", "qualite", "style", "description")
    __orderby__ = " ORDER BY zone, groupe, roche, face, historique ASC;"
    #
    # liste des formulaires supplementaires
    __formsupp__ = ("photohistorique",)

    def zone_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.tr()
        afficheclefs.display_zone(self, enreg, penreg)

    def groupe_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_groupe(self, enreg, penreg)

    def roche_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_roche(self, enreg, penreg)

    def face_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_face(self, enreg, penreg)

    def historique_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_historique(self.__doc__, enreg, penreg)
        self.__doc__.pop()
        afficheclefs.ajoute_ligne(self, "100%", "1", "8", "6")

    def motif_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td()
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle", colspan="2")
        self.__doc__.font("Motif:", size=begoconf.font_size)
        self.__doc__.font(size=begoconf.font_size)
        if enreg != None:
            self.__doc__.text(name="motif", value=enreg["motif"], size=15, maxlength=15)
        else:
            self.__doc__.text(name="motif", size="15", maxlength="15", value="")
        self.__doc__.pop()

    def date_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle", colspan="2")
        self.__doc__.font("Date inscrite/Date estimée:", size=begoconf.font_size)
        self.__doc__.font(size=begoconf.font_size)
        if enreg != None:
            self.__doc__.text(name="date", size="10", maxlength="10", value=enreg["date"])
        else:
            self.__doc__.text(name="date", size="10", maxlength="10", value="")
        self.__doc__.pop()
        self.__doc__.pop()

    def type_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td()
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle", colspan="2")
        self.__doc__.font("Type :", size=begoconf.font_size)
        liste = {"S Schématique": "S", "L de Lettré": "L", "M Militaire": "M", "R Religieux": "R", "P Pastoral": "P", "T Touristique": "T"}
        afficheclefs.liste_deroulante(self.__doc__, "type", liste, enreg)
        self.__doc__.pop()

    def origine_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle", colspan="2")
        self.__doc__.font(size=begoconf.font_size)
        self.__doc__.insert_text("Origine:")
        self.__doc__.font(size=begoconf.font_size)
        liste = {"S Schématique": "S", "L de Lettré": "L", "M Militaire": "M", "R Religieux": "R", "P Pastoral": "P", "T Touristique": "T"}
        afficheclefs.liste_deroulante(self.__doc__, "origine", liste, enreg)
        self.__doc__.pop()
        self.__doc__.pop()

    def realisation_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td()
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle", colspan="2")
        self.__doc__.font(size=begoconf.font_size)
        self.__doc__.insert_text("Réalisation :")
        self.__doc__.font(size=begoconf.font_size)
        liste = {"IS Incision Simple": "IS", "M Martellé": "M", "IZ Incision en Zig-zag": "IZ", "BU BUrinée": "BU", "BO BOuchardée": "BO"}
        afficheclefs.liste_deroulante(self.__doc__, "ralisation", liste, enreg)
        self.__doc__.pop()

    def superposition_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle", colspan="2")
        self.__doc__.font(size=begoconf.font_size)
        self.__doc__.insert_text("Superposition :")
        self.__doc__.font(size=begoconf.font_size)
        liste = {"P sur gravure Protohistorique": "F", "H sur gravure Historique": "H"}
        afficheclefs.liste_deroulante(self.__doc__, "origine", liste, enreg)
        self.__doc__.pop()
        self.__doc__.pop()

    def longueur_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.u()
        self.__doc__.font("Dimensions :", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("L en cm : ", size=begoconf.font_size)
        self.__doc__.font(size=begoconf.font_size)
        if enreg != None :
            self.__doc__.text(name="longueur", value=enreg["longueur"], size=6, maxlength=6)
        else :
            self.__doc__.text(name="longueur", size="6", maxlength="6", value="")
        self.__doc__.pop()

    def largeur_base_to_form(self, enreg, penreg = None) :
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("l en cm: ", size=begoconf.font_size)
        self.__doc__.font(size=begoconf.font_size)
        if enreg != None :
            self.__doc__.text(name="largeur", value=enreg["largeur"], size=6, maxlength=6)
        else:
            self.__doc__.text(name="largeur", size="6", maxlength="6", value="")
        self.__doc__.pop()
        self.__doc__.pop()

    def qualite_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.td()
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.u()
        self.__doc__.font("Aspect général : ", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("Qualité : ", size=begoconf.font_size)
        self.__doc__.font(size=begoconf.font_size)
        liste = {"A": "A", "B": "B", "C": "C", "D" :"D"}
        afficheclefs.liste_deroulante(self.__doc__, "qualité", liste, enreg)
        self.__doc__.pop()

    def style_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("Style:", size=begoconf.font_size)
        self.__doc__.font(size=begoconf.font_size)
        liste = {"E Elaboré": "E", "Peu Elabore": "PE", "P Primaire": "P", "C Confus": "C"}
        afficheclefs.liste_deroulante(self.__doc__, "style", liste, enreg)
        self.__doc__.pop()
        self.__doc__.pop()

    def description_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td()
        self.__doc__.font(size=begoconf.font_size)
        self.__doc__.u()
        self.__doc__.insert_text("Description détaillée")
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(valign="middle", align="left", colspan = "3")
        self.__doc__.font(size=begoconf.font_size)
        self.__doc__.textarea(name="description", rows="4", cols="50", wrap="physical")
        if enreg != None :
            self.__doc__.insert_text(enreg["description"])
        else :
            self.__doc__.insert_text("")
        self.__doc__.pop()
        self.__doc__.pop()

##################################################################################################################
#                                               PHOTOS
##################################################################################################################
    def liste_photohistorique(self, enreg):
        """ Affiche la liste des photos et le bouton d'ajout de photos."""
        resp = self.__db__.query("SELECT * FROM photohistorique WHERE zone = " + self.__db__.quote(enreg["zone"], "decimal") + " AND groupe = " + self.__db__.quote(enreg["groupe"], "decimal") + " AND roche = " + self.__db__.quote(enreg["roche"], "text") + " AND face = " + self.__db__.quote(enreg["face"], "text") + " AND historique = " + self.__db__.quote(enreg["historique"], "text")  + " ORDER BY idphoto ASC;")
        resp = resp.dictresult()
        lg = len(resp)
        if lg:
            self.__doc__.push()
            self.__doc__.div(align="center")
            if lg > 1:
                s = "s"
            else:
                s = ""
            self.__doc__.font(`lg` + " photographie :" + s, color="red")
            self.__doc__.pop()
            self.__doc__.push()
            self.__doc__.table(border = "0", cellpadding = "0", cellspacing = "0")
            for photo in resp:
                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.td()
                self.__doc__.form(method="POST", action=begoconf.script_location("modphoto"))
                self.__doc__.table(border=5, cellpadding=5, cellspacing=5)
                self.__doc__.tr()
                self.__doc__.push()
                self.__doc__.td()
                self.__doc__.table(border=0, cellpadding=0, cellspacing=0)
                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.td(valign="middle", align="center")
                photo_url = begoconf.images_location + "Z" + `enreg["zone"]` + "/G" + `enreg["groupe"]` + "/R" + enreg["roche"] + "/F" + enreg["face"] + "/H" + enreg["historique"] + "/" + `photo["idphoto"]`
                self.__doc__.a(href=photo_url + ".jpeg")
                xmax, ymax = begoconf.get_imagesize(begoconf.image_fullname("Z" + `enreg["zone"]` + os.sep + "G" + `enreg["groupe"]` + os.sep + "R" +  enreg["roche"] + os.sep + "F" + enreg["face"] + os.sep + "H" + enreg["historique"] + os.sep + `photo["idphoto"]` + "s.jpeg"))
                self.__doc__.img(src=photo_url + "s.jpeg", width=xmax, height=ymax)
                self.__doc__.pop()
                self.__doc__.tr()
                self.__doc__.td(valign="middle", align="center")
                self.__doc__.font(size=begoconf.font_size)
                self.__doc__.textarea(name="legende", rows="4", cols="50", wrap="physical")
                self.__doc__.insert_text(photo["legende"])
                self.__doc__.pop()
                self.__doc__.td(bgcolor=begoconf.basform_bgcolorright, valign="middle", align="center")
                self.__doc__.font(size=begoconf.font_size)
                self.__doc__.hidden(name="idphoto", value=photo["idphoto"])
                self.__doc__.hidden(name="zone", value=photo["zone"])
                self.__doc__.hidden(name="groupe", value=photo["groupe"])
                self.__doc__.hidden(name="roche", value=photo["roche"])
                self.__doc__.hidden(name="face", value=photo["face"])
                self.__doc__.hidden(name="historique", value=photo["historique"])
                self.__doc__.submit(name="action", value="Modifier")
                self.__doc__.br()
                self.__doc__.submit(name="action", value="Supprimer")
                self.__doc__.br()
                self.__doc__.submit(name="action", value="Nouvelle")
                self.__doc__.pop()
            self.__doc__.pop()
        else:
            self.__doc__.push()
            self.__doc__.form(method= "POST", action=begoconf.script_location("modphoto"))
            self.__doc__.hidden(name= "zone", value=enreg["zone"])
            self.__doc__.hidden(name= "groupe", value=enreg["groupe"])
            self.__doc__.hidden(name= "roche", value=enreg["roche"])
            self.__doc__.hidden(name= "face", value=enreg["face"])
            self.__doc__.hidden(name= "historique", value=enreg["historique"])
            self.__doc__.submit(name= "action", value="Nouvelle")
            self.__doc__.pop()
            self.__doc__.font("aucune photo", color="red", size=begoconf.font_size)

    def menu_photohistorique(self, enreg, color, function):
        if enreg != None:
            self.__doc__.push()
            self.__doc__.tr()
            self.__doc__.td(bgcolor=color, colspan="2")
            self.__doc__.font(size=begoconf.font_size)
            self.__doc__.div(align="center")
            function(enreg)
            self.__doc__.pop()

    def photohistorique(self, enreg, penreg=None):
        self.menu_photohistorique(enreg, begoconf.basform_bgcolormiddle, self.liste_photohistorique)

    def modifier(self):
        """Met a jour l'historique courante"""
        self.__db__.query(self.make_update_query(self.__listeclefs__))
        return 0

    def supprimer(self):
        """ s'il existe des photos sur cette face on refuse la suppression"""
        if self.exist(self.__listeclefs__, table="photohistorique"):
            return -1
        else:
            z = "Z" + self.__form__["zone"].value
            g = "G" + self.__form__["groupe"].value
            r = "R" + self.__form__["roche"].value
            f = "F" + self.__form__["face"].value
            h = "H" + self.__form__["historique"].value
            rr = begoconf.image_fullname(z + os.sep + g + os.sep + r + os.sep + f + os.sep + h)
            try:
                if os.path.isdir(rr):
                    os.rmdir(rr)
            except:
                begoconf.fatalerror_message("Impossible de supprimer le repertoire [%s]" % rr)
            # on efface la gravure historique
            self.delete_records(self.__listeclefs__)
            return 0

    def creer(self):
        """ si la face n'existe pas déjà alors on la crée, sinon on refuse"""
        if self.exist(self.__listeclefs__):
            primarykeys = {"zone": None, "groupe": None, "roche": None, "face": None, "historique": None}
            return (-1, primarykeys)
        else:
            # on insère maintenant la historique dans la base
            # sauf si la face n'existe pas.
            if not self.exist(("zone", "groupe", "roche", "face"), table="face"):
                primarykeys = {"zone": None, "groupe": None, "roche": None, "face": None, "historique": None}
                return (-2, primarykeys)
            else:
                # on insère maintenant la historique dans la base
                z = self.__form__["zone"].value
                g = self.__form__["groupe"].value
                r = self.__form__["roche"].value
                f = self.__form__["face"].value
                h = self.__form__["historique"].value
                self.__db__.query(self.make_insert_query({ }))
                primarykeys = {"zone": z, "groupe": g, "roche": r, "face": f, "historique": h }
                return (0, primarykeys)

