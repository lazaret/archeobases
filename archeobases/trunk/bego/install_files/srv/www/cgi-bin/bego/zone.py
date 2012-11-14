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


class Zone(begodata.Data):
    # le nom de la table
    __tablename__ = "zone"
    __new_record__ = "Nouvelle"
    #
    # tous les champs de la table proprietaire
    __champs__ = {
                "secteur"     :{"type": "text",    "default": "", "mandatory": 0},
                "zone"        :{"type": "decimal", "default": 0,  "mandatory": 1},
                "groupes"     :{"type": "decimal", "default": 0,  "mandatory": 0},
                "remarquable" :{"type": "text",    "default": "", "mandatory": 0},
                }
    #
    # liste des seuls champs que l'on veut pouvoir modifier
    __listechamps__ = ("secteur", "zone", "groupes")
    #
    # liste des tables enfants
    __listenfants__ = ("roche", "face", "figure", "historique", "association")
    __listeclefs__ = ("zone",)
    #
    # liste des champs dans leur ordre de saisie
    __ordrechamps__ = ("secteur", "zone", "groupes", "remarquable")
    __orderby__ = " ORDER BY zone ASC;"
    __vraiparent__ = None
    #
    # liste des formulaires supplementaires
    __formsupp__ = ("zone_param",)

    def zone_verify(self, value):
        if value == '':
            return -1
        else:
            return 0

    def secteur_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td(align="right", valign="middle")
        self.__doc__.font(size=begoconf.font_size)
        self.__doc__.insert_text("Secteur")
        secteurs = ("Merveilles", "Fontanalba", "Vallaurette", "Valmasque", "Sainte Marie", "Vei del Bouc", "Sabion")
        listesecteurs = {}
        for s in secteurs:
            listesecteurs[s] = s
        afficheclefs.liste_deroulante(self.__doc__, "secteur", listesecteurs, enreg)
        self.__doc__.pop()

    def zone_base_to_form(self, enreg, penreg=None):
        afficheclefs.display_zone(self, enreg, penreg)
        self.__doc__.pop()

    def groupes_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td(align="left", valign="middle", border="2")
        self.__doc__.font(size=begoconf.font_size)
        self.__doc__.insert_text("Nombre de groupes : ")
        listegroupes = {}
        for i in range(0, 11):
            listegroupes[i] = i
        if penreg and penreg.has_key("groupes"):
            afficheclefs.liste_deroulante(self.__doc__, "groupes", listegroupes, penreg, dontchange=0)
        else:
            afficheclefs.liste_deroulante(self.__doc__, "groupes", listegroupes, enreg, dontchange=0)
        self.__doc__.pop()
        self.__doc__.pop()

    def remarquable_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            z = self.__db__.quote(enreg["zone"], "decimal")
            query = "SELECT groupe,roche FROM roche WHERE zone = %s and remarquable = 't' ;" % (z)
            res = self.__db__.query(query).dictresult()
            self.__doc__.tr()
            self.__doc__.td(colspan=2)
            if len(res):
                champs = ("groupe", "roche")
                self.__doc__.push()
                self.__doc__.table(border=1, width="100%")
                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.caption("Liste des roches remarquables")
                self.__doc__.push()
                self.__doc__.tr()
                for c in champs:
                    self.__doc__.th(string.capitalize(c), align="center", valign="middle", bgcolor=begoconf.basform_bgcolorbottom)
                self.__doc__.pop()
                for roche in res:
                    self.__doc__.push()
                    self.__doc__.tr()
                    for c in champs:
                        val = roche[c]
                        self.__doc__.push()
                        self.__doc__.td(align="center", valign="middle")
                        if c == "roche" :
                            dico = {"action": "Chercher", "zone": enreg["zone"], "roche": val}
                            self.__doc__.a(val, href=begoconf.script_location("modroche") + '?' + urllib.urlencode(dico))
                        else :
                            self.__doc__.insert_text(val)
                        self.__doc__.pop()
                    self.__doc__.pop()
                self.__doc__.pop()
                self.__doc__.pop()
            else:
                self.__doc__.push()
                self.__doc__.table(border=0, width="100%")
                self.__doc__.tr()
                self.__doc__.td(align="center")
                self.__doc__.font(color="red", size=begoconf.font_size)
                self.__doc__.insert_text("Aucune roche remarquable")
                self.__doc__.pop()

################################################################################################################
#                                               LISTE ZONE_PARAM
################################################################################################################
    def liste_zone(self, enreg, param):
        # liste des param appartenant a la zone
        z = self.__db__.quote(enreg["zone"], "decimal")
        where = " WHERE zone = %s " % (z)
        query = "SELECT " + param + " FROM " + param + " WHERE id" + param + " IN ("
        qassoc = "SELECT id" + param + " FROM zone_" + param  + where
        query = query + qassoc + ");"                # on recupere la liste des param de la zone
        res = self.__db__.query(query).dictresult()
        if len(res):
            self.__doc__.push()
            self.__doc__.table(border=5, width="100%")
            self.__doc__.push()
            self.__doc__.tr()
            self.__doc__.th(string.capitalize(param), align="center", valign="middle", bgcolor=begoconf.basform_bgcolorbottom)
            self.__doc__.pop()
            for ligne in res:
                self.__doc__.push()
                self.__doc__.tr()
                val = ligne[param]
                if not val:
                    val = "&nbsp;"
                self.__doc__.td(val, align="center", valign="middle")
                self.__doc__.pop()
            self.__doc__.pop()
        else:
            self.__doc__.push()
            self.__doc__.p()
            self.__doc__.font(size=begoconf.font_size)
            if param in ("tourbiere", "moraine", "vegetation"):
                self.__doc__.font("Aucune "+ param +" dans la zone", color="red")
            else:
                self.__doc__.font("Aucun "+ param +" dans la zone", color="red")
            self.__doc__.pop()

    def zone_param(self, enreg, penreg=None):
        if enreg != None:
            liste = ("acces", "sentier", "sommet", "col", "lac", "torrent", "tourbiere", "eboulis", "moraine", "glacier", "vegetation")
            for i in liste:
                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.form(method="POST", action=begoconf.script_location("modzone_acces"))
                self.__doc__.push()
                self.__doc__.td(bgcolor=begoconf.basform_bgcolormiddle)
                self.__doc__.hidden(name="zone", value=enreg["zone"])
                self.__doc__.hidden(name="param", value=i)
                self.__doc__.font(size=begoconf.font_size)
                self.__doc__.div(align="center")
                self.liste_zone(enreg, i)
                self.__doc__.pop()
                self.__doc__.td(align="center", valign="middle", bgcolor=begoconf.basform_bgcolormiddle)
                self.__doc__.submit(name="action", value="Modifier")
                self.__doc__.pop()

############################################################################################################################
#                                               METHODES
############################################################################################################################

    def modifier(self) :
        """Met a jour la zone courante"""
        self.__db__.query(self.make_update_query(self.__listeclefs__))
        return 0

    def supprimer(self):
        # s'il existe des roches ou des photos pour cette zone on refuse la suppression
        if self.exist(self.__listeclefs__, table="roche") or self.exist(self.__listeclefs__, table="photozone") :
            return -1
        else:
            z = "Z" + self.__form__["zone"].value
            rz = begoconf.image_fullname(z)
            try :
                if os.path.isdir(rz):
                    os.rmdir(rz)
            except:
                begoconf.fatalerror_message("Impossible de supprimer le repertoire [%s]" % rz)
                # ces repertoires ne sont pas forcement vides, alors on essaie de les supprimer
                # mais si on ne réussit pas ce n'est pas grave
                try:
                    if os.path.isdir(rz):
                        os.rmdir(rz)
                except:
                    pass
                # on efface la roche
                self.delete_records(self.__listeclefs__)
                return 0

    def creer(self):
        # si la roche n'existe pas déjà alors on la crée, sinon on refuse
        if self.exist(self.__listeclefs__):
            primarykeys = {"zone" : None}
            return (-1, primarykeys)
        else:
            # on insère maintenant la roche dans la base
            z = self.__form__["zone"].value
            self.__db__.query(self.make_insert_query({ }))
            primarykeys = {"zone": z}
            return (0, primarykeys)
