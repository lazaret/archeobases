#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Collection - (c) 2006-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
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
import collectionconf
import collectiondata
import afficheclefs
import urllib


class Carte(collectiondata.Data):
    #
    # le nom de la table
    __tablename__ = "carte"
    __new_record__ = "Nouveau"
    __color__ = collectionconf.bas1_bgcolor
    #
    # tous les champs de la table proprietaire
    __champs__ = {
                "identifiant"          : {"type": "text", "default": 0,  "mandatory": 1, "longueur": 20,  "memory": 1},
                "m_type_materiel"      : {"type": "text", "default": "CARTE", "mandatory": 1, "longueur": 0, "memory": 1},
                "m_type_support"       : {"type": "text", "default": "", "mandatory": 0, "longueur": 0 ,  "memory": 0},
                "m_etagere"            : {"type": "text", "default": "", "mandatory": 0, "longueur": 4 ,  "memory": 0},
                "m_pays"               : {"type": "text", "default": "", "mandatory": 0, "longueur": 40,  "memory": 0},
                "m_date_decouverte"    : {"type": "text", "default": "", "mandatory": 0, "longueur": 4,   "memory": 0},
                "m_dimension"          : {"type": "text", "default": "", "mandatory": 0, "longueur": 15,  "memory": 0},
                "m_echelle"            : {"type": "text", "default": "", "mandatory": 0, "longueur": 10,  "memory": 0},
                "m_observations"       : {"type": "text", "default": "", "mandatory": 0, "longueur": 500, "memory": 0},
                "m_mots_clefs"         : {"type": "text", "default": "", "mandatory": 0, "longueur": 150, "memory": 0},
                "m_nombre_exemplaires" : {"type": "int",  "mandatory": 0, "longueur": 2, "memory": 0},
                "m_date_modif"         : {"type": "date", "default": "", "mandatory": 0, "longueur": 0,   "memory": 0},
                "m_saisie"             : {"type": "date", "mandatory": 0, "longueur": 10},
                }
    #
    # liste des tables enfants
    __listenfants__   = ()
    __listeclefs__    = ("identifiant",)
    __vraiparent__    = "carte"
    # liste des seuls champs que l'on veut pouvoir modifier
    __listechamps__ = ("identifiant", "m_type_materiel", "m_type_support", "m_etagere",
                       "m_pays", "m_date_decouverte",
                       "m_dimension", "m_echelle", "m_observations",
                       "m_mots_clefs", "m_nombre_exemplaires", "m_date_modif")
    # liste des champs dans leur ordre de saisie
    __ordrechamps__ = ("identifiant", "m_type_materiel", "m_type_support", "m_etagere",
                       "m_pays", "m_date_decouverte",
                       "m_dimension", "m_echelle", "m_observations",
                       "m_mots_clefs", "m_nombre_exemplaires", "m_date_modif", "m_saisie", "liens")
    __orderby__ = " ORDER BY identifiant ASC;"
    #
    # liste des formulaires supplementaires
    __formsupp__ = ()

    def identifiant_verify(self, fieldname, value):
        if (value == '') or self.champ_verify(fieldname, value):
            return -1
        else:
            return 0

    def champ_verify(self, fieldname, value):
        # si la longueur de la valeur issue du formulaire est > a la longueur
        # definie dans l'attribut longueur des champs
        if  (value != None) and (len(value) > (self.__champs__[fieldname]["longueur"])*2):
            return -1       # erreur
        else:
            return 0

    def __init__(self, parent):
        for champ in self.__champs__.keys():
            if self.__champs__[champ]["longueur"]:
                if not hasattr(self, "%s_verify" % champ):
                    setattr(self, "%s_verify" % champ, self.champ_verify)
        collectiondata.Data.__init__(self, parent)

################################### En entrée ###########################
    def identifiant_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        self.__doc__.tr()
        self.__doc__.push()
        self.__doc__.td()
        self.__doc__.insert_text(" ")
        afficheclefs.display_identifiant(self, enreg, penreg, 1)
        self.__doc__.pop()

################################### En entrée ###########################
    ##################### PARTIE SUPPORT
    def m_type_materiel_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
        afficheclefs.champ_liste( self, "m_type_materiel", "Type Materiel", enreg, penreg, " ", dontchange=0)
        self.__doc__.pop()

    def m_type_support_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_liste( self, "m_type_support", "Type Support", enreg, penreg, " ", dontchange=0)
        self.__doc__.pop()

    def m_etagere_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "m_etagere", "Etagere", 4, 4, " ", enreg, penreg)
        self.__doc__.pop()

    def m_pays_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "m_pays", "Pays", 20, 20, " ", enreg, penreg)
        self.__doc__.pop()

    def m_date_decouverte_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "m_date_decouverte", "Date Edition", 4, 4, " ", enreg, penreg)
        self.__doc__.pop()

    def m_dimension_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "m_dimension", "Dimensions", 15, 15, " ", enreg, penreg)
        self.__doc__.pop()

    def m_echelle_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "m_echelle", "Echelle", 10, 10, " ", enreg, penreg)
        self.__doc__.pop()

    def m_observations_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie_area(self, "m_observations", "Observations", 2, 80, 5, " ", enreg, penreg)
        self.__doc__.pop()

    def m_mots_clefs_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie_area(self, "m_mots_clefs", "Mots Clefs", 3, 80, 5, " ", enreg, penreg)
        self.__doc__.pop()

    def m_nombre_exemplaires_base_to_form(self, enreg, penreg=None):
        self.__doc__.push()
        afficheclefs.champ_saisie(self, "m_nombre_exemplaires", "Nb Exemplaires Sup.", 6, 6, " ", enreg, penreg)
        self.__doc__.pop()

    def m_date_modif_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            self.__doc__.push()
            afficheclefs.champ_saisie(self, "m_date_modif", "Modif le", 10, 20, " ", enreg, penreg)
            self.__doc__.pop()

    def m_saisie_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            self.__doc__.push()
            afficheclefs.champ_saisie(self, "m_saisie", "Fiche saisie le", 10, 20, " ", enreg, penreg)
            self.__doc__.pop()

    def liens_base_to_form(self, enreg, penreg=None):
        if enreg != None:
            dico = { "action": "Chercher" }
            query = "(SELECT identifiant_2 FROM association"
            query = query + " WHERE identifiant_1 =" + self.__db__.quote(enreg["identifiant"], "text") + ")"
            query = query + "  UNION "
            query = query + " (SELECT identifiant_1 FROM association"
            query = query + " WHERE identifiant_2 =" + self.__db__.quote(enreg["identifiant"], "text") + ");"
            valeur = self.__db__.query(query)
            valeur = valeur.dictresult()
            self.__doc__.push()
            self.__doc__.td()
            self.__doc__.insert_text(" ")
            self.__doc__.pop()
            self.__doc__.push()
            self.__doc__.td(clign="center", colspan="3")
            self.__doc__.font(size=collectionconf.font_size)
            self.__doc__.insert_text("Objets lies: ")
            self.__doc__.pop()
            for k in range(0, len(valeur)):
                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.push()
                self.__doc__.td()
                self.__doc__.insert_text(" ")
                self.__doc__.pop()
                self.__doc__.push()
                self.__doc__.td()
                self.__doc__.insert_text(" ")
                self.__doc__.pop()
                self.__doc__.push()
                self.__doc__.td(clign="center", colspan="3")
                self.__doc__.font(size=collectionconf.font_size)
                dico['identifiant'] = valeur[k]['identifiant_2']
                #TOTO: faire requete pour connaitre le nom de la table correspondante
                query_count_biblio = "SELECT COUNT(*) FROM biblio WHERE identifiant=" \
                    + self.__db__.quote(valeur[k]['identifiant_2'],"text") + ";"
                res = self.__db__.query(query_count_biblio)
                res = res.dictresult()
                if (res[0]["count"] != 0):
                    link = collectionconf.script_location("modbiblio") + '?' + urllib.urlencode(dico)
                else:
                    link = collectionconf.script_location("modmateriel") + '?' + urllib.urlencode(dico)
                if link:
                    self.__doc__.a(valeur[k]['identifiant_2'], href=link)
                self.__doc__.pop()
                self.__doc__.pop()
        self.__doc__.pop()

#########################################################################
#                                PHOTOS
#########################################################################
    def liste_photomateriel(self, enreg):
        resp = self.__db__.query("SELECT * FROM photomateriel WHERE identifiant = " + self.__db__.quote(enreg["indentifiant"], "text") + " ORDER BY idphoto ASC;")
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
                self.__doc__.form(method="POST", action= collectionconf.script_location("modphotomateriel"))
                self.__doc__.table(border=5, cellpadding=5, cellspacing=5)
                self.__doc__.tr()
                self.__doc__.push()
                self.__doc__.td()
                self.__doc__.table(border=0, cellpadding=0, cellspacing=0)
                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.td(valign="middle", align="center")
                photo_url = collectionconf.images_location + "I" + enreg["identifiant"] + "/" + `photo["idphoto"]`
                self.__doc__.a(href=photo_url + ".jpeg")
                xmax, ymax = collectionconf.get_imagesize(collectionconf.image_fullname("I" + enreg["identifiant"] + os.sep + `photo["idphoto"]` + "s.jpeg"))
                self.__doc__.img(src=photo_url + "s.jpeg", width=xmax, height=ymax)
                self.__doc__.br()
                self.__doc__.a("original", href=photo_url + ".tiff")
                self.__doc__.pop()
                self.__doc__.tr()
                self.__doc__.td(valign="middle", align="center")
                self.__doc__.font(size=collectionconf.font_size)
                self.__doc__.textarea(name="legende", rows="4", cols="80", wrap="physical")
                if photo["legende"] == None:
                    self.__doc__.insert_text("&nbsp;")
                else:
                    self.__doc__.insert_text(photo["legende"])
                self.__doc__.pop()
                self.__doc__.td(bgcolor=collectionconf.basform_bgcolorright, valign= "middle", align="center")
                self.__doc__.font(size=collectionconf.font_size)
                self.__doc__.hidden(name="idphoto", value=photo["idphoto"])
                self.__doc__.hidden(name="identifiant", value=photo["identifiant"])
                self.__doc__.hidden(name="referer", value=self.__doc__.script_name())
                self.__doc__.submit(name="action", value="Modifier")
                self.__doc__.br()
                self.__doc__.submit(name="action", value="Nouvelle")
                self.__doc__.br()
                self.__doc__.submit(name="action", value="Supprimer")
                self.__doc__.pop()
            self.__doc__.pop()
        else:
            self.__doc__.push()
            self.__doc__.form(method="POST", action=collectionconf.script_location("modphotomateriel"))
            self.__doc__.hidden(name="identifiant", value=photo["identifiant"])
            self.__doc__.submit(name="action", value="Nouvelle image")
            self.__doc__.pop()
            self.__doc__.font("aucune image", color="red", size=collectionconf.font_size)

    def menu_photomateriel(self, enreg, color, function):
        if enreg != None:
            self.__doc__.push()
            self.__doc__.tr()
            self.__doc__.td(bgcolor=color, colspan="2")
            self.__doc__.font(size=collectionconf.font_size)
            self.__doc__.div(align="center")
            function(enreg)
            self.__doc__.pop()

    def photomateriel(self, enreg, penreg=None):
        self.menu_photomateriel(enreg, collectionconf.basform_bgcolormiddle, self.liste_photomateriel)

###############################################################################
#                                METHODES
##############################################################################
    def modifier(self):
        """Met a jour le carte courant"""
        self.__db__.query(self.make_update_query(self.__listeclefs__, "materiel"))
        i = self.__form__["identifiant"].value
        update_date = "UPDATE materiel SET m_date_modif='now' WHERE identifiant='" + i + "';"
        self.__db__.query(update_date)
        return 0

    def supprimer(self):
        # s'il existe des figures ou des photos sur ce carte on refuse la suppression
        i = self.__form__["identifiant"].value
        delete_association = "DELETE FROM association WHERE identifiant_1='" + i + "';"
        self.__db__.query(delete_association)
        delete_association = "DELETE FROM association WHERE identifiant_2='" + i + "';"
        self.__db__.query(delete_association)
        i = "I" + self.__form__["identifiant"].value
        rr = collectionconf.image_fullname(i)
        try:
            if os.path.isdir(rr):
                os.rmdir(rr)
        except:
            collectionconf.fatalerror_message("Impossible de supprimer le répertoire [%s]" % rr)
        # on efface le carte
        self.delete_records(self.__listeclefs__, "materiel")
        return 0

    def creer(self):
        # si le carte n'existe pas déjà alors on la crée, sinon on refuse
        if self.exist(self.__listeclefs__, table="materiel"):
            primarykeys = {"identifiant": None}
            return (-1, primarykeys)
        else:
            # on insère maintenant le carte dans la base
            i = self.__form__["identifiant"].value
            self.__db__.query(self.make_insert_query({},"materiel"))
            primarykeys = {"identifiant": i}
            update_date = "UPDATE materiel SET m_date_modif='now' WHERE identifiant='" + i + "';"
            self.__db__.query(update_date)
            return (0, primarykeys)
