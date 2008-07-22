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
import face
import afficheclefs


class Roche(begodata.Data):
    #
    # le nom de la table
    __tablename__ = "roche"
    __new_record__ = "Nouvelle"
    #
    # tous les champs de la table roche
    __champs__ = { \
                "zone"        :{"type": "decimal", "default": 0,   "mandatory": 1},
                "groupe"      :{"type": "decimal", "default": 0,   "mandatory": 1},
                "roche"       :{"type": "text",    "default": "",  "mandatory": 1},
                "nom"         :{"type": "text",    "default": "",  "mandatory": 0},
                "x"           :{"type": "decimal", "default": 0,   "mandatory": 0},
                "y"           :{"type": "decimal", "default": 0,   "mandatory": 0},
                "z"           :{"type": "decimal", "default": 0,   "mandatory": 0},
                "longueur"    :{"type": "decimal", "default": "0", "mandatory": 0},
                "largeur"     :{"type": "decimal", "default": "0", "mandatory": 0},
                "epaisseur"   :{"type": "decimal", "default": "",  "mandatory": 0},
                "nature"      :{"type": "text",    "default": "",  "mandatory": 0},
                "type"        :{"type": "text",    "default": "",  "mandatory": 0},
                "orientation" :{"type": "text",    "default": "",  "mandatory": 0},
                "contexte"    :{"type": "text",    "default": "",  "mandatory": 0},
                "publication" :{"type": "bool",    "default": "f", "mandatory": 0},
                "nb"          :{"type": "text",    "default": "",  "mandatory": 0},
                "remarquable" :{"type": "bool",    "default": "f", "mandatory": 0},
                }
    #
    # liste des tables enfants
    __listenfants__ = ("face", "figure", "historique", "association")
    __listeparents__  = ("zone",)
    __listeclefs__ = ("zone", "groupe", "roche")
    __vraiparent__ = "zone"
    #
    # liste des seuls champs que l'on veut pouvoir modifier
    __listechamps__ = ("zone", "groupe", "roche", "nom", "x", "y", "z", "longueur", "largeur", "epaisseur", "nature", "type", "orientation", "remarquable", "contexte", "publication")
    #
    # liste des champs dans leur ordre de saisie
    __ordrechamps__ = ("zone", "groupe", "roche", "nom", "x", "y", "z", "longueur", "largeur", "epaisseur", "nature", "type", "orientation", "remarquable", "contexte", "publication", "nb")
    __orderby__ = " ORDER BY zone, groupe, roche ASC;"
    #
    # liste des formulaires supplementaires
    __formsupp__ = ("photoroches", "faces")

    def zone_verify(self, value):
        if value == '':
            return -1
        else:
            return 0

    def groupe_verify(self, value):
        if value == '':
            return -1
        else:
            return 0

    def zone_base_to_form(self, enreg, penreg=None):
        """ Affiche et saisie de la liste de la zone."""
        self.__doc__.push()
        self.__doc__.tr()
        afficheclefs.display_zone(self, enreg, penreg)

    def groupe_base_to_form(self, enreg, penreg=None):
        """ Affiche et saisie de la liste du groupe."""
        afficheclefs.display_groupe(self, enreg, penreg)

    def roche_base_to_form(self, enreg, penreg=None):
        """ Affiche et saisie de la liste de la roche."""
        afficheclefs.display_roche(self, enreg, penreg)
        self.__doc__.pop()
        afficheclefs.ajoute_ligne(self, "100%", "1", "8", "5")

    def nom_base_to_form(self, enreg, penreg=None):
        """ Affiche et saisie de la liste du nom de la roche."""
        self.__doc__.push()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("Nom :", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle", colspan="3")
        self.__doc__.font(size=begoconf.font_size)
        if enreg != None:
            self.__doc__.text(name="nom", size="60", maxlength="60", value=enreg["nom"])
        else:
            self.__doc__.text(name="nom", size="60", maxlength="60", value="")
        self.__doc__.pop()
        self.__doc__.pop()

    def x_base_to_form(self, enreg, penreg=None):
        """ Affiche et saisie de la liste de la coordonée x."""
        self.__doc__.push()
        self.__doc__.tr(align="right")
        self.__doc__.push()
        self.__doc__.td(align="right", valign="center")
        self.__doc__.u()
        self.__doc__.font("Coordonnées Lambert III :", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.td()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("x:", size=begoconf.font_size)
        self.__doc__.font(size=begoconf.font_size)
        if enreg != None:
            self.__doc__.text(name="x", value=enreg["x"], size=10, maxlength=10)
        else :
            self.__doc__.text(name="x", size="10", maxlength="10", value="")
        self.__doc__.pop()

    def y_base_to_form(self, enreg, penreg=None):
        """ Affiche et saisie de la liste de la coordonée y."""
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font(size=begoconf.font_size)
        self.__doc__.insert_text("y :")
        if enreg != None:
            self.__doc__.text(name="y", value=enreg["y"], size=10, maxlength=10)
        else:
            self.__doc__.text(name="y", size="10", maxlength="10", value="")
        self.__doc__.pop()

    def z_base_to_form(self, enreg, penreg=None):
        """ Affiche et saisie de la liste de l'altitude (z)."""
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.insert_text("z :")
        self.__doc__.font(size=begoconf.font_size)
        if enreg != None:
            self.__doc__.text(name="z", value=enreg["z"], size=7, maxlength=7)
        else:
            self.__doc__.text(name="z", size="7", maxlength="7", value="")
        self.__doc__.pop()
        self.__doc__.pop()

    def longueur_base_to_form(self, enreg, penreg=None):
        """ Affiche et saisie de la liste de la longueur."""
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle")
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.u()
        self.__doc__.font("Dimensions de la roche :", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("Longueur en cm :", size=begoconf.font_size)
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font(size=begoconf.font_size)
        if enreg != None:
            self.__doc__.text(name="longueur", value=enreg["longueur"], size=6, maxlength=6)
        else:
            self.__doc__.text(name="longueur", size="6", maxlength="6", value="")
        self.__doc__.pop()

    def largeur_base_to_form(self, enreg, penreg=None):
        """ Affiche et saisie de la liste de la largeur."""
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("Largeur en cm :", size=begoconf.font_size)
        self.__doc__.font(size=begoconf.font_size)
        if enreg != None:
            self.__doc__.text(name="largeur", value=enreg["largeur"], size=6, maxlength=6)
        else:
            self.__doc__.text(name="largeur", size="6", maxlength="6", value="")
        self.__doc__.pop()

    def epaisseur_base_to_form(self, enreg, penreg=None):
        """ Affiche et saisie de la liste de l'épaisseur."""
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("Epaisseur :", size=begoconf.font_size)
        self.__doc__.font(size=begoconf.font_size)
        if enreg != None:
            self.__doc__.text(name="epaisseur", value=enreg["epaisseur"], size=6, maxlength=6)
        else:
            self.__doc__.text(name="epaisseur", size="6", maxlength="6", value="")
        self.__doc__.pop()
        self.__doc__.pop()
        self.__doc__.pop()
        self.__doc__.pop()

    def nature_base_to_form(self, enreg, penreg=None):
        """ Affiche et saisie de la liste de al nature."""
        self.__doc__.push()
        self.__doc__.tr(align="right")
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("Nature :", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.td(align="left", valign="middle")
        self.__doc__.font(size=begoconf.font_size)
        listenature = {"S Schiste": "S", "SG Schiste G.": "SG", "G Grès": "G", "GS Grès S.": "GS"}
        afficheclefs.liste_deroulante(self.__doc__, "nature", listenature, enreg)
        self.__doc__.pop()

    def type_base_to_form(self, enreg, penreg=None):
        """ Affiche et saisie du type."""
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("Type :", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.td(align="left", valign="middle")
        self.__doc__.font(size=begoconf.font_size)
        listetype = {"B Bloc": "B", "PB Petit Bloc": "PB", "P Paroi": "P", "D Dalle": "D"}
        afficheclefs.liste_deroulante(self.__doc__, "type", listetype, enreg)
        self.__doc__.pop()

    def orientation_base_to_form(self, enreg, penreg=None):
        """ Affiche et saisie de la liste de l'orientation."""
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("Orientation :", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.td(align="left", valign="middle")
        self.__doc__.font(size=begoconf.font_size)
        listeorientation = {"NS": "NS", "EW": "EW", "NESW": "NESW", "NWSE": "NWSE"}
        afficheclefs.liste_deroulante(self.__doc__, "orientation", listeorientation, enreg)

    def remarquable_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.td()
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td()
        self.__doc__.pop()
        self.__doc__.td(valign="middle", align="left")
        self.__doc__.font(size=begoconf.font_size)
        if enreg != None:
            if enreg["remarquable"] == 't':
                self.__doc__.checkbox_checked(name="remarquable")
            else:
                self.__doc__.checkbox(name="remarquable") # 'f' ou vide
        else:
            self.__doc__.checkbox(name="remarquable")         # 'f' est la valeur par defaut
        self.__doc__.insert_text("Remarquable")

    def contexte_base_to_form(self, enreg, penreg=None):
        """ Affiche et saisie du contexte environemental."""
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font("Contexte :", size=begoconf.font_size)
        self.__doc__.pop()
        self.__doc__.td(align="left", valign="middle")
        self.__doc__.font(size=begoconf.font_size)
        listecontexte = {"L Lac": "L", "T Torrent": "T", "S Sommet": "S", "TB TourBière": "TB", "C Conque": "C", "CL CoL": "CL"}
        afficheclefs.liste_deroulante(self.__doc__, "contexte", listecontexte, enreg)

    def publication_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.td()
        self.__doc__.pop()
        self.__doc__.push()
        self.__doc__.td()
        self.__doc__.pop()
        self.__doc__.td(valign="middle", align="left")
        self.__doc__.font(size=begoconf.font_size)
        if enreg != None:
            if enreg["publication"] == 't':
                self.__doc__.checkbox_checked(name="publication")
            else:
                self.__doc__.checkbox(name="publication") # 'f' ou vide
        else:
            self.__doc__.checkbox(name="publication")         # 'f' est la valeur par defaut
        self.__doc__.insert_text("Publiée")
        self.__doc__.pop()
        self.__doc__.pop()

#############################################################################################################################
#                                               CHAMPS EN SORTIE UNIQUEMENT
##############################################################################################################################
    def nb_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            self.__doc__.br()
            self.__doc__.push()
            self.__doc__.tr()
            self.__doc__.push()
            self.__doc__.td()
            self.__doc__.pop()
            self.__doc__.push()
            self.__doc__.td(align="right", valign="middle", colspan="3")
            self.__doc__.td(align="left", valign="middle")
            self.__doc__.font(size=begoconf.font_size)
            self.__doc__.push()
            self.__doc__.table(border="2", cellspading="0", cellspacing="0", bgcolor=begoconf.basform_bgcolorright, align="center")
            self.__doc__.font(size=begoconf.font_size)
            self.__doc__.push()
            self.__doc__.caption()
            self.__doc__.font(size=begoconf.font_size)
            self.__doc__.insert_text("Totaux")
            self.__doc__.pop()
            self.__doc__.push()
            self.__doc__.td(clign="center", colspan="3")
            self.__doc__.font(size=begoconf.font_size)
            self.__doc__.insert_text("Nombre de faces gravées : ")
            nb = self.__db__.query("SELECT COUNT(*) FROM face WHERE zone = " + self.__db__.quote(enreg["zone"], "decimal") + " AND groupe = " + self.__db__.quote(enreg["groupe"], "decimal") + " AND roche = " + self.__db__.quote(enreg["roche"], "text") + ";")
            nb = nb.dictresult()
            nb = nb[0]["count"]
            self.__doc__.insert_text(`nb`)
            self.__doc__.pop()
            self.__doc__.push()
            self.__doc__.td(colspan="2")
            self.__doc__.font(size=begoconf.font_size)
            self.__doc__.insert_text("Nombre de gravures : ")
            nb = self.__db__.query("SELECT count(*)  FROM figure WHERE zone = " + self.__db__.quote(enreg["zone"], "decimal") + " AND groupe = " + self.__db__.quote(enreg["groupe"], "decimal")  + " AND roche = " + self.__db__.quote(enreg["roche"], "text") + ";")
            nb = nb.dictresult()
            nb = nb[0]["count"]
            self.__doc__.insert_text(`nb`)
            self.__doc__.pop()
            self.__doc__.pop()
            self.__doc__.pop()
            self.__doc__.pop()

##############################################################################################################################
#                                               PHOTOS
##############################################################################################################################
    def liste_photoroches(self, enreg):
        """ Affiche la liste des photos et le bouton d'ajout de photos."""
        resp = self.__db__.query("SELECT * FROM photoroche WHERE zone = " + self.__db__.quote(enreg["zone"], "decimal") + " AND groupe = " + self.__db__.quote(enreg["groupe"], "decimal") + " AND roche = " + self.__db__.quote(enreg["roche"], "text") + " ORDER BY idphoto ASC;")
        resp = resp.dictresult()
        lg = len(resp)
        if lg:
            self.__doc__.push()
            self.__doc__.div(align="center")
            if lg > 1:
                s = "s"
            else :
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
                self.__doc__.table(border=1, cellpadding=5, cellspacing=5)
                self.__doc__.tr()
                self.__doc__.push()
                self.__doc__.td()
                self.__doc__.table(border=0, cellpadding=0, cellspacing=0)
                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.td(valign="middle", align="center")
                photo_url = begoconf.images_location + "Z" + `enreg["zone"]` + "/G" + `enreg["groupe"]` + "/R" + enreg["roche"] + "/" + `photo["idphoto"]`
                self.__doc__.a(href=photo_url + ".jpeg")
                xmax, ymax = begoconf.get_imagesize(begoconf.image_fullname("Z" + `enreg["zone"]` + os.sep + "G" + `enreg["groupe"]` + os.sep + "R" + enreg["roche"] + os.sep + `photo["idphoto"]` + "s.jpeg"))
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
                self.__doc__.hidden(name="zone",  value=photo["zone"])
                self.__doc__.hidden(name="groupe", value=photo["groupe"])
                self.__doc__.hidden(name="roche", value=photo["roche"])
                self.__doc__.submit(name="action", value="Modifier")
                self.__doc__.p()
                self.__doc__.submit(name="action", value="Supprimer")
                self.__doc__.p()
                self.__doc__.submit(name="action", value="Nouvelle")
                self.__doc__.pop()
            self.__doc__.pop()
        else:
            self.__doc__.push()
            self.__doc__.form(method="POST", action=begoconf.script_location("modphoto"))
            self.__doc__.hidden(name="zone", value=enreg["zone"])
            self.__doc__.hidden(name="groupe", value=enreg["groupe"])
            self.__doc__.hidden(name="roche", value=enreg["roche"])
            self.__doc__.submit(name="action", value="Nouvelle") # bouton ajouter une photo
            self.__doc__.pop()
            self.__doc__.font("aucune photo", color="red", size=begoconf.font_size)

    def menu_photoroches(self, enreg, color, function):
        if enreg != None:
            self.__doc__.push()
            self.__doc__.tr()
            self.__doc__.td(bgcolor=color, colspan="2")
            self.__doc__.font(size=begoconf.font_size)
            self.__doc__.div(align="center")
            function(enreg)
            self.__doc__.pop()

    def photoroches(self, enreg, penreg=None):
        self.menu_photoroches(enreg, begoconf.basform_bgcolormiddle, self.liste_photoroches)

#############################################################################################################################
#                                       LIEN AVEC L'ECRAN FACE
#############################################################################################################################
    def faces(self, enreg, penreg=None):
        if enreg != None:
            self.__doc__.push()
            self.__doc__.tr()
            self.__doc__.td(bgcolor=begoconf.basform_bgcolormiddle, colspan="2")
            self.__doc__.font(size=begoconf.font_size)
            penreg = {"zone": enreg["zone"], "groupe": enreg["groupe"], "roche": enreg["roche"]}
            face.Face(self).traite_saisie(("zone", "groupe", "roche", "face"), parent=self.__tablename__, penreg=penreg)
            self.__doc__.pop()

##############################################################################################################################
#                                               METHODES
##############################################################################################################################

    def modifier(self):
        """Met a jour la roche courante"""
        self.__db__.query(self.make_update_query(self.__listeclefs__))
        return 0

    def supprimer(self) :
        """ S'il existe des faces ou des photos  sur cette roche on refuse la suppression."""
        if self.exist(self.__listeclefs__, table="face") or self.exist(self.__listeclefs__, table="photoroche") :
            return -1
        else:
            z = "Z" + self.__form__["zone"].value
            g = "G" + self.__form__["groupe"].value
            r = "R" + self.__form__["roche"].value
            rz = begoconf.image_fullname(z)
            rg = begoconf.image_fullname(z + os.sep + g)
            rr = begoconf.image_fullname(z + os.sep + g + os.sep + r)
            try:
                if os.path.isdir(rr) :
                    os.rmdir(rr)
            except:
                begoconf.fatalerror_message("Impossible de supprimer le repertoire [%s]" % rr)
            # ces repertoires ne sont pas forcement vides, alors on essaie de les supprimer
            # mais si on ne reussit pas ce n'est pas grave
            try:
                if os.path.isdir(rg) :
                    os.rmdir(rg)
                if os.path.isdir(rz) :
                    os.rmdir(rz)
            except:
                pass
            # on efface la roche
            self.delete_records(self.__listeclefs__)
            return 0

    def creer(self):
        """ Si la roche n'existe pas déjà alors on la crée, sinon on refuse."""
        if self.exist(self.__listeclefs__):
            primarykeys = {"zone": None, "groupe": None, "roche": None}
            return (-1, primarykeys)
        else:
            # on insère maintenant la roche dans la base
            #sauf si la zone correspondante n'existe pas
            if not self.exist(("zone",), table ="zone") :
                primarykeys = {"zone": None, "groupe": None, "roche": None}
                return (-2, primarykeys)
            else:
                z = self.__form__["zone"].value
                g = self.__form__["groupe"].value
                r = self.__form__["roche"].value
                self.__db__.query(self.make_insert_query({ }))
                primarykeys = {"zone": z, "groupe": g, "roche": r}
                return (0, primarykeys)

