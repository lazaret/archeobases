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
import string
import urllib
import begoconf
import begodata
import afficheclefs


class Association(begodata.Data):
    """ Classe d'écran de saisie et de consultation des associations"""
    # le nom de la table
    __tablename__ = "association"
    __new_record__ = "Nouvelle"
    #
    # tous les champs de la table proprietaire
    __champs__ = {
                "zone"        : {"type": "decimal", "default": 0,  "mandatory": 1},
                "groupe"      : {"type": "decimal", "default": 0,  "mandatory": 1},
                "roche"       : {"type": "text",    "default": "", "mandatory": 1},
                "face"        : {"type": "text",    "default": "", "mandatory": 1},
                "association" : {"type": "decimal", "default": "", "mandatory": 1},
                "type"        : {"type": "text",    "default": "", "mandatory": 0},
                "disposition" : {"type": "text",    "default": "", "mandatory": 0}
                }

    __listeparents__  = ("zone", "roche", "face")
    __listeclefs__ = ("zone", "groupe", "roche", "face", "association")
    __vraiparent__ = "face"
    #
    # liste des seuls champs que l'on veut pouvoir modifier
    __listechamps__ = ("zone", "groupe", "roche", "face", "association", "type", "disposition")
    #
    # liste des champs dans leur ordre de saisie
    __ordrechamps__ = ("zone", "groupe", "roche", "face", "association", "type", "disposition")
    __orderby__ = " ORDER BY zone, groupe, roche, face, association ASC;"
    #
    # liste des formulaires supplementaires
    __formsupp__ = ("figassoc", "photoassociation")

    def zone_base_to_form(self, enreg, penreg=None):
        """ Affiche la zone à l'aide de display_zone."""
        self.__doc__.push()
        self.__doc__.tr()
        afficheclefs.display_zone(self, enreg, penreg)

    def groupe_base_to_form(self, enreg, penreg=None):
        """ Affiche le groupe à l'aide de display_groupe."""
        afficheclefs.display_groupe(self, enreg, penreg)

    def roche_base_to_form(self, enreg, penreg=None):
        """ Affiche la roche à l'aide de display_roche."""
        afficheclefs.display_roche(self, enreg, penreg)

    def face_base_to_form(self, enreg, penreg=None):
        """ Affiche la face à l'aide de display_face."""
        afficheclefs.display_face(self, enreg, penreg)

    def association_base_to_form(self, enreg, penreg=None):
        """ Affiche l'association à l'aide de display_association."""
        afficheclefs.display_association(self.__doc__, enreg, penreg)
        self.__doc__.pop()
        afficheclefs.ajoute_ligne(self, "100%", "1", "8", "6")

    def type_base_to_form(self, enreg, penreg=None):
        """ Affiche une liste déroulante des types d'association."""
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle", colspan="2")
        self.__doc__.font("Type d'association :", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.td(align="left", valign="middle", colspan="2")
        self.__doc__.font(size=begoconf.font_size)
        liste = {"H Historique": "H", "P Protohistorique": "P", "M Mixte": "M"}
        afficheclefs.liste_deroulante(self.__doc__, "disposition", liste, enreg)
        self.__doc__.pop()

    def disposition_base_to_form(self, enreg, penreg = None):
        """ Affiche une liste déroulante des dispositions de gravures."""
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle", colspan="2")
        self.__doc__.font("Disposition des gravures les unes par rapport aux autres :", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.td(align="left", valign="middle", colspan="2")
        self.__doc__.font(size=begoconf.font_size)
        liste = {"L en Ligne": "L", "F en File": "F", "D en Diagonale": "D", "T en Triangle": "T", "R en Rectangle": "R",
            "CE en CErcle": "CE", "P Perpendiculaires": "P", "CO COnvergentes": "CO", "O Opposées": "O", "E Emboîtées": "E",
            "I l'une Inscrite dans l'autre": "I", "S Superposées": "S", "SF Superposées en File": "SP",
            "SL Superposées en Ligne": "SL", "Y reliées entre elles": "Y", "H une gravure encadrée par deux autres": "H",
            "X une gravure encadrée par plusieurs autres": "X"}
        afficheclefs.liste_deroulante(self.__doc__, "disposition", liste, enreg)
        self.__doc__.pop()

#######################################################################################################################
#                                               LISTE FIGURES
#######################################################################################################################
    def liste_figures_assoc(self, enreg):
        z = self.__db__.quote(enreg["zone"], "decimal")
        g = self.__db__.quote(enreg["groupe"], "decimal")
        r = self.__db__.quote(enreg["roche"], "text")
        f = self.__db__.quote(enreg["face"], "text")
        a = self.__db__.quote(enreg["association"], "decimal")
        #
        where = "WHERE figure.figure=figassoc.figure AND figure.zone = %s AND figure.groupe = %s AND figure.roche = %s AND figure.face = %s AND association = %s" % (z, g, r, f, a)
        #
        # liste des figures faisant partie de l'association
        query = "SELECT figure.figure, identite, style, sens, ordre FROM figure, figassoc " + where + " ORDER BY ordre;"
        #
        # on recupere la liste des figures de l'association
        res = self.__db__.query(query).dictresult()
        self.__doc__.push()
        self.__doc__.form(method="POST", action=begoconf.script_location("modfigassoc"))
        self.__doc__.hidden(name="zone", value=enreg["zone"])
        self.__doc__.hidden(name="groupe", value=enreg["groupe"])
        self.__doc__.hidden(name="roche", value=enreg["roche"])
        self.__doc__.hidden(name="face", value=enreg["face"])
        self.__doc__.hidden(name="association", value=enreg["association"])
        if len(res):
            champs = ("figure", "identite", "style", "sens", "ordre")
            self.__doc__.push()
            self.__doc__.table(border=1)
            self.__doc__.caption("Liste des figures de l'Association")
            self.__doc__.push()
            self.__doc__.tr()
            for c in champs:
                self.__doc__.th(string.capitalize(c), align="center", valign="middle", bgcolor=begoconf.basform_bgcolorbottom)
            self.__doc__.pop()
            for figure in res:
                self.__doc__.push()
                self.__doc__.tr()
                for c in champs:
                    val = figure[c]
                    if not val:
                        val = "&nbsp;"
                    self.__doc__.push()
                    self.__doc__.td(align="center", valign="middle")
                    if c == "figure":
                        dico = {"action": "Chercher", "zone": enreg["zone"], "groupe": enreg["groupe"], "roche": enreg["roche"], "face": enreg["face"], "figure": val}
                        self.__doc__.a(val, href=begoconf.script_location("modfigure") + '?' + urllib.urlencode(dico))
                    else:
                        self.__doc__.insert_text(val)
                    self.__doc__.pop()
                self.__doc__.pop()
            self.__doc__.pop()
        else:
            self.__doc__.push()
            self.__doc__.p()
            self.__doc__.font("Aucune figure dans cette association", color="red")
            self.__doc__.pop()
        self.__doc__.submit(name="action", value="Modifier")
        self.__doc__.pop()

    def figassoc(self, enreg, penreg=None):
        """ Modifie le tableau et affiche la liste des figures à l'aide de liste_figures_assoc."""
        if enreg != None:
            self.__doc__.push()
            self.__doc__.tr()
            self.__doc__.td(bgcolor=begoconf.basform_bgcolormiddle, colspan="2")
            self.__doc__.font(size=begoconf.font_size)
            self.__doc__.div(align="center")
            self.liste_figures_assoc(enreg)
            self.__doc__.pop()

############################################################################################################################
#                                                       PHOTOS
############################################################################################################################
    def liste_photoassociation(self, enreg):
        """ Affiche la liste des photos et le bouton d'ajout de photos."""
        resp = self.__db__.query("SELECT * FROM photoassociation WHERE zone = " + self.__db__.quote(enreg["zone"], "decimal") + " AND groupe = " + self.__db__.quote(enreg["groupe"], "decimal") + " AND roche = " + self.__db__.quote(enreg["roche"], "text") + " AND face = " + self.__db__.quote(enreg["face"], "text") + " AND association = " + self.__db__.quote(enreg["association"], "decimal")  + " ORDER BY idphoto ASC;")
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
            self.__doc__.table(border="0", cellpadding="0", cellspacing="0")
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
                photo_url = begoconf.images_location + "Z" + `enreg["zone"]` + "/G" + `enreg["groupe"]` + "/R" + enreg["roche"] + "/F" + enreg["face"] + "/A" + `enreg["association"]` + "/" + `photo["idphoto"]`
                self.__doc__.a(href=photo_url + ".jpg")
                xmax, ymax = begoconf.get_imagesize(begoconf.image_fullname("Z" + `enreg["zone"]` + os.sep + "G" + `enreg["groupe"]` + os.sep + "R" + enreg["roche"] + os.sep + "F" +  enreg["face"] + os.sep + "A"+` enreg["association"]` + os.sep + `photo["idphoto"]` + "s.jpg"))
                self.__doc__.img(src=photo_url + "s.jpg", width=xmax, height=ymax)
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
                self.__doc__.hidden(name="association", value=photo["association"])
                self.__doc__.submit(name="action", value="Modifier")
                self.__doc__.br()
                self.__doc__.submit(name="action", value="Supprimer")
                self.__doc__.br()
                self.__doc__.submit(name="action", value="Nouvelle")
                self.__doc__.pop()
            self.__doc__.pop()
        else:
            self.__doc__.push()
            self.__doc__.form(method="POST", action=begoconf.script_location("modphoto"))
            self.__doc__.hidden(name="zone", value=enreg["zone"])
            self.__doc__.hidden(name="groupe", value=enreg["groupe"])
            self.__doc__.hidden(name="roche", value=enreg["roche"])
            self.__doc__.hidden(name="face", value=enreg["face"])
            self.__doc__.hidden(name="association", value=enreg["association"])
            self.__doc__.submit(name="action", value="Nouvelle")
            self.__doc__.pop()
            self.__doc__.font("aucune photo", color="red", size=begoconf.font_size)

    def menu_photoassociation(self, enreg, color, function):
        if enreg != None:
            self.__doc__.push()
            self.__doc__.tr()
            self.__doc__.td(bgcolor=color, colspan="2")
            self.__doc__.font(size=begoconf.font_size)
            self.__doc__.div(align="center")
            function(enreg)
            self.__doc__.pop()

    def photoassociation(self, enreg, penreg=None):
        self.menu_photoassociation(enreg, begoconf.basform_bgcolormiddle, self.liste_photoassociation)

############################################################################################################################
#                                               PRINCIPAL
############################################################################################################################
    def modifier(self):
        """Met a jour l'association courante"""
        self.__db__.query(self.make_update_query(self.__listeclefs__))
        return 0

    def supprimer(self):
        """ Supprime l'association sauf s'il existe des photos ou des figures associees
        alors on refuse la suppression"""
        if self.exist(self.__listeclefs__, table="photoassociation") or self.exist(self.__listeclefs__, table="figassoc"):
            return -1
        else:
            z = "Z" + self.__form__["zone"].value
            g = "G" + self.__form__["groupe"].value
            r = "R" + self.__form__["roche"].value
            f = "F" + self.__form__["face"].value
            a = "A" + self.__form__["association"].value
            rr = begoconf.image_fullname(z + os.sep + g + os.sep + r + os.sep + f + os.sep + a)
            try:
                if os.path.isdir(rr):
                    os.rmdir(rr)
            except:
                begoconf.fatalerror_message("Impossible de supprimer le repertoire [%s]" % rr)
            # on efface la association
            self.delete_records(self.__listeclefs__)
            return 0

    def creer(self):
        """ Crée l'association si elle n'existe pas, sinon erreur"""
        if self.exist(self.__listeclefs__):
            primarykeys = {"zone": None, "groupe": None, "roche": None, "face": None, "association": None}
            return (-1, primarykeys)
        else:
            # on insère maintenant l'association dans la base
            # sauf si la face n'existe pas.
            if not self.exist(("zone", "groupe", "roche", "face"), table="face"):
                primarykeys = {"zone": None, "groupe": None, "roche": None, "face": None, "association": None}
                return (-2, primarykeys)
            else:
                z = self.__form__["zone"].value
                g = self.__form__["groupe"].value
                r = self.__form__["roche"].value
                f = self.__form__["face"].value
                a = self.__form__["association"].value
                self.__db__.query(self.make_insert_query({ }))
                primarykeys = { "zone": z, "groupe": g, "roche": r, "face": f, "association": a }
                return (0, primarykeys)
