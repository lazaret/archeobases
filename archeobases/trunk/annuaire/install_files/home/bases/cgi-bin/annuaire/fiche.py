#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Annuaire - (c) 2000-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
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
import annuaireconf
import annuairedata
import afficheclefs
import re
import adresse


class Fiche(annuairedata.Data) :
        #
        # le nom de la table
        __tablename__ = "fiche"
        __new_record__ = "Nouvelle"
        __color__ = annuaireconf.bas1_bgcolor
        #
        # tous les champs de la table proprietaire
        __champs__ = {
                        "identifiant"    : { "type" : "int", "default" : 0, "mandatory" : 1 , "longueur" : 6, "memory" : 1}, \
                        "type_entree" : { "type" : "text", "default" : "",  "mandatory" : 1 , "longueur" : 0 , "memory" : 1 }, \
                        "type_personne"  : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "civilite"       : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "titre"          : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 20, "memory" : 0 }, \
                        "nom"            : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 30, "memory" : 0 }, \
                        "prenom"         : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 20, "memory" : 0 }, \
                        "nationalite"    : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 20, "memory" : 0 }, \
                        "date_naissance" : { "type" : "date", "mandatory" : 0 , "longueur" : 10}, \
                        "fonction"       : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 50, "memory" : 0 }, \
                        "specialite"     : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 50, "memory" : 0 }, \
                        "commentaire"    : { "type" : "text", "default" : "", "mandatory" : 0, "longueur": 0},
                        "association"    : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "numero_adherent": { "type" : "int", "mandatory" : 0 , "longueur" : 6 }, \
                        "cotisation"     : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "chantier"       : { "type" : "text", "default" : "", "mandatory" : 0, "longueur": 0},
                        "modif_fiche"   : { "type" : "date", "mandatory" : 0 , "longueur" : 10}, \
                        }
        #
        # liste des tables enfants
        __listenfants__   = []
        #__listeparents__  = ["entree"]
        __listeclefs__    = ["identifiant"]
        __vraiparent__    = "fiche"


        #
        # liste des seuls champs que l'on veut pouvoir modifier
        __listechamps__ = ["identifiant", "type_entree", "type_personne","civilite", "titre", "nom", "prenom", "nationalite", "date_naissance", "fonction", "specialite", "commentaire", "association", "numero_adherent", "cotisation", "chantier"]

        #
        # liste des champs dans leur ordre de saisie
        __ordrechamps__ = ["identifiant", "type_entree", "type_personne", "civilite", "titre", "nom", "prenom", "nationalite", "date_naissance", "fonction", "specialite", "commentaire", "association", "numero_adherent", "cotisation", "chantier","modif_fiche"]
        __orderby__ = " ORDER BY identifiant ASC;"

        #
        # liste des formulaires supplementaires
        __formsupp__ = ["adresse","photofiche"]

        def identifiant_verify(self, fieldname, value) :
                if (value == '') or self.champ_verify(fieldname, value) :
                        return -1
                else :
                        return 0
        def champ_verify(self, fieldname, value) :
                # si la longueur de la valeur issue du formulaire est > a la longueur
                # definie dans l'attribut longueur des champs
                if  (value != None) and (len(value) > (self.__champs__[fieldname]["longueur"])*2) :
                        return -1       # erreur
                else :
                        return 0

        def __init__(self, parent) :
                for champ in self.__champs__.keys() :
                        if self.__champs__[champ]["longueur"] :
                                if not hasattr(self, "%s_verify" % champ) :
                                        setattr(self, "%s_verify" % champ, self.champ_verify)
                annuairedata.Data.__init__(self, parent)


################################### En entrée ###########################
        def identifiant_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.push()
                self.__doc__.td()
                self.__doc__.insert_text(" ")
                self.__doc__.pop()
                afficheclefs.display_identifiant(self, enreg, penreg, 1)


        def type_entree_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste(self, "type_entree", "type_entree", enreg, penreg, "", dontchange = 0)
                self.__doc__.pop()

        def type_personne_base_to_form(self, enreg, penreg = None) :
                afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
                self.__doc__.push()
                afficheclefs.champ_liste( self, "type_personne", "Type Personne", enreg, penreg, " ", dontchange = 0)
                self.__doc__.pop()

        def civilite_base_to_form(self, enreg, penreg = None) :
                afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
                self.__doc__.push()
                afficheclefs.champ_liste( self, "civilite", "Civilite", enreg, penreg, " ", dontchange = 0)

        def titre_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "titre", "Titre", 20, 20, "", enreg, penreg)
                self.__doc__.pop()

        def nom_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "nom", "Nom", 30, 30, " ", enreg, penreg)

        def prenom_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "prenom", "Prenom", 20, 20, "", enreg, penreg)
                self.__doc__.pop()

        def nationalite_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "nationalite", "Nationalite", 20, 20, " ", enreg, penreg)

        def date_naissance_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "date_naissance", "Date Naissance", 20, 20, "", enreg, penreg)
                self.__doc__.pop()

        def fonction_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "fonction", "Fonction", 50, 50, " ", enreg, penreg)
                self.__doc__.pop()

        def specialite_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "specialite", "Specialite", 50, 50, " ", enreg, penreg)
                self.__doc__.pop()

        def commentaire_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie_area(self, "commentaire", "Commentaire", 3, 80, 5, " ", enreg, penreg)
                self.__doc__.pop()

        def association_base_to_form(self, enreg, penreg = None) :
                afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
                self.__doc__.push()
                afficheclefs.champ_liste( self, "association", "Association", enreg, penreg, " ", dontchange = 0)
                self.__doc__.pop()

        def numero_adherent_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "numero_adherent", "numero adherent", 6, 6, " ", enreg, penreg)

        def cotisation_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "cotisation", "cotisation", enreg, penreg, "", dontchange = 0)
                self.__doc__.pop()


        def chantier_base_to_form(self, enreg, penreg = None) :
                afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
                self.__doc__.push()
                afficheclefs.champ_saisie_area(self, "chantier", "chantier", 3, 80, 7, " ", enreg, penreg)
                self.__doc__.pop()

        def modif_fiche_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                if enreg != None:
                        afficheclefs.champ_saisie(self,"modif_fiche", "MAJ", 10, 20, " ", enreg, penreg)
                self.__doc__.pop()

###############################################################################
#                                       ADRESSES
###############################################################################

        def adresse(self, enreg, penreg = None) :
                if enreg != None :
                        self.__doc__.push()
                        self.__doc__.tr()
                        self.__doc__.td(bgcolor = annuaireconf.basform_bgcolorcenter, colspan = "2")
                        self.__doc__.font(size = annuaireconf.font_size)
                        penreg = { "identifiant": enreg["identifiant"] }
                        adresse.Adresse(self).traite_saisie(["identifiant","ordre"], parent = self.__tablename__, penreg = penreg)
                        self.__doc__.pop()


#########################################################################
#                                PHOTOS
#########################################################################
        def liste_photofiche(self, enreg) :
                resp = self.__db__.query("SELECT * FROM photofiche WHERE identifiant = " + self.__db__.quote(enreg["identifiant"], "int")  + " ORDER BY idphoto ASC;")
                resp = resp.dictresult()
                lg = len(resp)
                if lg :
                        self.__doc__.push()
                        self.__doc__.div(align = "center")
                        if lg > 1 :
                                s = "s"
                        else :
                                s = ""
                        self.__doc__.font(`lg` + " photo" + s, color = "red")
                        self.__doc__.pop()

                        self.__doc__.push()
                        self.__doc__.table(border = "0", cellpadding = "0", cellspacing = "0")
                        for photo in resp :
                                self.__doc__.push()
                                self.__doc__.tr()
                                self.__doc__.td()
                                self.__doc__.form(method = "POST", action =  annuaireconf.script_location("modphotofiche"))
                                self.__doc__.table(border = 5, cellpadding = 5, cellspacing = 5)
                                self.__doc__.tr()

                                self.__doc__.push()
                                self.__doc__.td()
                                self.__doc__.table(border = 0, cellpadding = 0, cellspacing = 0)

                                self.__doc__.push()
                                self.__doc__.tr()
                                self.__doc__.td(valign = "middle", align = "center")
                                photo_url = annuaireconf.images_location + "F" + enreg["idenitifiant"]  + `photo["idphoto"]`
                                self.__doc__.a(href = photo_url + ".jpeg")
                                xmax,ymax = annuaireconf.get_imagesize(annuaireconf.image_fullname( "I" + `enreg["identifiant"]` +  os.sep + `photo["idphoto"]` + "s.jpeg"))
                                self.__doc__.img(src = photo_url + "s.jpeg", width=xmax, height=ymax)
                                self.__doc__.br()
                                self.__doc__.a("original", href = photo_url + ".tiff")
                                self.__doc__.pop()

                                self.__doc__.tr()
                                self.__doc__.td(valign="middle", align="center")
                                self.__doc__.font(size=annuaireconf.font_size)
                                self.__doc__.textarea(name = "legende", rows="4", cols="50", wrap="physical")
                                if photo["legende"] == None:
                                        self.__doc__.insert_text("&nbsp;")
                                else :
                                        self.__doc__.insert_text(photo["legende"])
                                self.__doc__.pop()

                                self.__doc__.td(bgcolor = annuaireconf.basform_bgcolorright, valign= "middle", align = "center")
                                self.__doc__.font(size = annuaireconf.font_size)
                                self.__doc__.hidden(name = "idphoto", value = photo["idphoto"])
                                self.__doc__.hidden(name = "identifiant",  value = photo["identifiant"])
                                self.__doc__.hidden(name = "referer", value = self.__doc__.script_name())
                                self.__doc__.submit(name = "action",  value = "Modifier")
                                self.__doc__.br()
                                self.__doc__.submit(name = "action",  value = "Supprimer")
                                self.__doc__.br()
                                self.__doc__.submit(name = "action",  value = "Nouvelle")

                                self.__doc__.pop()
                        self.__doc__.pop()
                else :
                        self.__doc__.push()
                        self.__doc__.form(method = "POST", action = annuaireconf.script_location("modphotofiche"))
                        self.__doc__.hidden(name = "identifiant", value = enreg["identifiant"])
                        self.__doc__.submit(name = "action", value = "Nouvelle image")
                        self.__doc__.pop()
                        self.__doc__.font("aucune image", color = "red", size = annuaireconf.font_size)

        def menu_photofiche(self, enreg, color, function) :
                if enreg != None :
                        self.__doc__.push()
                        self.__doc__.tr()
                        self.__doc__.td(bgcolor = color, colspan = "2")
                        self.__doc__.font(size = annuaireconf.font_size)
                        self.__doc__.div(align = "center")
                        function(enreg)
                        self.__doc__.pop()

        def photofiche(self, enreg, penreg = None) :
                self.menu_photofiche(enreg, annuaireconf.basform_bgcolormiddle, self.liste_photofiche)


###############################################################################
#                                METHODES
##############################################################################

        def modifier(self) :
                """Met a jour la fiche courante"""
                self.__db__.query(self.make_update_query(["identifiant"]))
                i = self.__form__["identifiant"].value
                update_date = "UPDATE fiche SET modif_fiche='now' WHERE identifiant=" + i  + ";"
                self.__db__.query(update_date)
                return 0

        def supprimer(self) :
               # s'il existe des figures ou des photos sur cette fiche on refuse la suppression
                if self.exist(["identifiant"], table = "adresse") or self.exist(["identifiant"], table = "photofiche") :
                        return -1
                else :
                        i = "I" + self.__form__["identifiant"].value
                        rr = annuaireconf.image_fullname(i)
                        try :
                                if os.path.isdir(rr) :
                                        os.rmdir(rr)
                        except :
                                annuaireconf.fatalerror_message("Impossible de supprimer le répertoire [%s]" % rr)

                        # on efface l' fiche
                        self.delete_records(["identifiant"])
                        return 0

        def creer(self) :
                # si la fiche n'existe pas deja alors on la cree, sinon on refuse
                if self.exist(["identifiant"], table = "fiche") :
                        primarykeys = { "identifiant": None}
                        return (-1, primarykeys)
                else :
                        # on insere maintenant la fiche dans la base
                        # sauf si la fiche n'existe pas.
                        # on insere maintenant la fiche dans la base
                        i = self.__form__["identifiant"].value
                        self.__db__.query(self.make_insert_query({ }))
                        primarykeys = { "identifiant" : i}
                        update_date = "UPDATE fiche SET modif_fiche='now' WHERE identifiant=" + i  + ";"
                        self.__db__.query(update_date)
                        return (0, primarykeys)




