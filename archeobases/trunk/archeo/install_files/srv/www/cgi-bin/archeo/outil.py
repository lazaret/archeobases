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


class Outil(archeodata.Data):
    #
    # le nom de la table
    __tablename__ = "outil"
    __new_record__ = "Nouvel"
    __color__ = archeoconf.bas1_bgcolor
    #
    # tous les champs de la table proprietaire
    __champs__ =   {
                    "zone"          : {"type": "text", "default": "", "mandatory": 1, "longueur": 0, "memory": 1},
                    "numero"        : {"type": "decimal", "default": 0, "mandatory": 1, "longueur": 6, "memory": 1},
                    "bis"           : {"type": "text", "default": "", "mandatory": 1, "longueur": 0, "memory": 1},
                    "o_ordre"       : {"type": "int", "default": 0, "mandatory": 1, "longueur": 0, "memory": 1},
                    "o_code"        : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "o_code_comp"   : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "o_retouche"    : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "o_orientation" : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "o_origine"     : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "o_destination" : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "o_etat"        : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "o_tranchant"   : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "o_sens"        : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "o_relation"    : {"type": "text", "default": "", "mandatory": 0, "longueur": 7},
                    "o_serie"       : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "o_forme"       : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "o_chronologie" : {"type": "text", "default": "", "mandatory": 0, "longueur": 0},
                    "o_a"           : {"type": "decimal", "mandatory": 0, "longueur": "3"},
                    "o_b"           : {"type": "decimal", "mandatory": 0, "longueur": "3"},
                    "o_c"           : {"type": "decimal", "mandatory": 0, "longueur": "3"},
                    "o_d"           : {"type": "decimal", "mandatory": 0, "longueur": "3"},
                    "o_e"           : {"type": "decimal", "mandatory": 0, "longueur": "3"},
                    "o_f"           : {"type": "decimal", "mandatory": 0, "longueur": "3"},
                    "o_g"           : {"type": "decimal", "mandatory": 0, "longueur": "3"},
                    "o_h"           : {"type": "decimal", "mandatory": 0, "longueur": "3"},
                    }
    #
    # liste des tables enfants
    __listenfants__ = ()
    __listeparents__ = ("carnet", "industrie")
    __listeclefs__ = ("zone", "numero", "bis", "o_ordre")
    __vraiparent__ = "carnet"
    #
    # liste des seuls champs que l'on veut pouvoir modifier
    __listechamps__ = ("zone", "numero", "bis", "o_ordre", "o_code", "o_code_comp", "o_retouche", "o_etat", "o_serie", "o_chronologie", "o_origine", "o_destination", "o_tranchant", "o_relation", "o_sens", "o_forme", "o_orientation", "o_a", "o_b", "o_c", "o_d", "o_e", "o_f", "o_g", "o_h")
    #
    # liste des champs dans leur ordre de saisie
    __ordrechamps__ = ("zone", "numero", "bis", "o_ordre", "o_code", "o_code_comp", "o_retouche", "o_etat", "o_origine", "o_destination", "o_sens", "o_tranchant", "o_relation", "o_serie", "o_forme", "o_orientation", "o_chronologie", "o_a", "o_b", "o_c", "o_d", "o_e", "o_f", "o_g", "o_h")
    __orderby__ = " ORDER BY zone, numero, bis ASC;"
    #
    # liste des formulaires supplementaires
    __formsupp__ = ("photooutil", "outil")

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

    def o_ordre_verify(self, fieldname, value):
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
        afficheclefs.display_numero(self, enreg, penreg, 0)

    def bis_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_bis(self, enreg, penreg)

    def o_ordre_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_x_ordre(self, "o_ordre", 0, 15, enreg, penreg)
        self.__doc__.pop()

################################### En entrée ##############################################
    def o_code_base_to_form(self, enreg, penreg=None):
        afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
        self.__doc__.push()
        afficheclefs.champ_nsaisie(self, "o_code", "code simple/multiple", 20, 20," ", 2, enreg,  penreg)

    def o_code_comp_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_nsaisie(self, "o_code_comp", "composite", 15, 20, "", 1, enreg,  penreg)
        self.__doc__.pop()

    def o_retouche_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
        afficheclefs.champ_liste(self, "o_retouche", "retouche", enreg, penreg, "Description", dontchange=0)

    def o_etat_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "o_etat", "état", enreg, penreg, "", dontchange=0)

    def o_origine_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "o_origine", "origine", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

    def o_destination_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_liste(self, "o_destination", "destination", enreg, penreg, " ", dontchange=0)

    def o_sens_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "o_sens", "sens", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

    def o_tranchant_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_nsaisie(self, "o_tranchant", "tranchant", 7, 20, " ", 1,enreg,  penreg)

    def o_relation_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_relation", "relation", 5, 20, "", enreg, penreg)

    def o_serie_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "o_serie", "série", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

    def o_forme_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
        afficheclefs.champ_liste(self, "o_forme", "forme", enreg, penreg, "Caractéristiques", dontchange=0)

    def o_orientation_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "o_orientation", "orientation", enreg, penreg, "", dontchange=0)

    def o_chronologie_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_liste(self, "o_chronologie", "chronologie", enreg, penreg, "", dontchange=0)
        self.__doc__.pop()

    def o_a_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "o_a", "A", 3, 20, " ", enreg,  penreg)

    def o_b_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_b", "B", 3, 20, "", enreg,  penreg)

    def o_c_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_c", "C", 3, 20, "", enreg,  penreg)
        self.__doc__.pop()

    def o_d_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "o_d", "D", 3, 20, " ", enreg,  penreg)

    def o_e_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_e", "E", 3, 20, "", enreg,  penreg)

    def o_f_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_f", "F", 3, 20, "", enreg,  penreg)
        self.__doc__.pop()

    def o_g_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "o_g", "G", 3, 20, " ", enreg,  penreg)

    def o_h_base_to_form(self, enreg, penreg=None):
        afficheclefs.champ_saisie(self, "o_h", "H", 3, 20, "", enreg,  penreg)
        self.__doc__.pop()

##################################################################################################################
#                                               PHOTOS
##################################################################################################################
    def liste_photoindustrie(self, enreg):
        resp = self.__db__.query("SELECT * FROM photoindustrie WHERE zone = " + self.__db__.quote(enreg["zone"], "decimal") + " AND numero = " + self.__db__.quote(enreg["numero"], "decimal") + " AND bis = " + self.__db__.quote(enreg["bis"], "text") + " AND industrie = " + self.__db__.quote(enreg["industrie"], "text")  + " ORDER BY idphoto ASC;")
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
                self.__doc__.form(method="POST", action=archeoconf.script_location("modphoto"))
                self.__doc__.table(border=5, cellpadding=5, cellspacing=5)
                self.__doc__.tr()
                self.__doc__.push()
                self.__doc__.td()
                self.__doc__.table(border=0, cellpadding=0, cellspacing=0)
                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.td(valign="middle", align="center")
                photo_url = archeoconf.images_location + "Z" + `enreg["zone"]` + "/G" + `enreg["numero"]` + "/R" + enreg["bis"] + "/F" + enreg["industrie"] + "/" + `photo["idphoto"]`
                self.__doc__.a(href=photo_url + ".jpeg")
                xmax, ymax = archeoconf.get_imagesize(archeoconf.image_fullname("Z" + `enreg["zone"]` + os.sep + "G" + `enreg["numero"]` + os.sep + "R" +  enreg["bis"] + os.sep + "F" +  enreg["industrie"] + os.sep + `photo["idphoto"]` + "s.jpeg"))
                self.__doc__.img(src=photo_url + "s.jpeg", width=xmax, height=ymax)
                self.__doc__.pop()
                self.__doc__.tr()
                self.__doc__.td(valign="middle", align="center")
                self.__doc__.font(size=archeoconf.font_size)
                self.__doc__.textarea(name="legende", rows="4", cols="50", wrap="physical")
                self.__doc__.insert_text(photo["legende"])
                self.__doc__.pop()
                self.__doc__.td(bgcolor=archeoconf.basform_bgcolorright, valign= "middle", align="center")
                self.__doc__.font(size=archeoconf.font_size)
                self.__doc__.hidden(name="idphoto", value=photo["idphoto"])
                self.__doc__.hidden(name="zone", value=photo["zone"])
                self.__doc__.hidden(name="numero", value=photo["numero"])
                self.__doc__.hidden(name="bis", value=photo["bis"])
                self.__doc__.hidden(name="industrie", value=photo["industrie"])
                self.__doc__.submit(name="action", value="Modifier")
                self.__doc__.br()
                self.__doc__.submit(name="action", value="Supprimer")
                self.__doc__.br()
                self.__doc__.submit(name="action", value="Nouvelle")
                self.__doc__.pop()
            self.__doc__.pop()
        else:
            self.__doc__.push()
            self.__doc__.form(method="POST", action=archeoconf.script_location("modphoto"))
            self.__doc__.hidden(name="zone", value=enreg["zone"])
            self.__doc__.hidden(name="numero", value=enreg["numero"])
            self.__doc__.hidden(name="bis", value=enreg["bis"])
            self.__doc__.hidden(name="industrie", value=enreg["industrie"])
            self.__doc__.submit(name="action", value="Nouvelle photo")
            self.__doc__.pop()
            self.__doc__.font("aucune photo", color="red", size=archeoconf.font_size)

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

##############################################################################################################################
#                                       LIEN AVEC L'ECRAN FIGURE
##############################################################################################################################
    def figures(self, enreg, penreg=None):
        if enreg != None:
            self.__doc__.push()
            self.__doc__.tr()
            self.__doc__.td(bgcolor=archeoconf.basform_bgcolorcenter, colspan="2")
            self.__doc__.font(size=archeoconf.font_size)
            penreg = {"zone": enreg["zone"], "numero": enreg["numero"], "bis": enreg["bis"], "industrie": enreg["industrie"]}
            figure.Figure(self).traite_saisie(["zone", "numero", "bis", "industrie", "figure"], parent=self.__tablename__, penreg=penreg)
            self.__doc__.pop()

##############################################################################################################################
#                                               METHODES
##############################################################################################################################
    def modifier(self):
        """Met a jour la industrie courante"""
        self.__db__.query(self.make_update_query(self.__listeclefs__))
        return 0

    def supprimer(self):
        # on efface l'outil sur éclat
        self.delete_records(self.__listeclefs__)
        return 0

    def creer(self):
        # si l'outil n'existe pas déjà alors on la crée, sinon on refuse
        if self.exist(self.__listeclefs__):
            primarykeys = {"zone": None, "numero": None, "bis": None, "o_ordre": None}
            return (-1, primarykeys)
        else:
            # on insère maintenant l'outil dans la base
            # sauf si l'industrie n'existe pas.
            if not self.exist(("zone", "numero", "bis"), table="industrie"):
            #"eclat"):
                primarykeys = {"zone": None, "numero": None, "bis": None, "o_": None}
                return (-2, primarykeys)
            else:
                # on insère maintenant l'outil dans la base
                z = self.__form__["zone"].value
                n = self.__form__["numero"].value
                b = self.__form__["bis"].value
                o = self.__form__["o_ordre"].value
                self.__db__.query(self.make_insert_query({}))
                primarykeys = {"zone": z, "numero": n, "bis": b, "o_ordre": o}
                return (0, primarykeys)

