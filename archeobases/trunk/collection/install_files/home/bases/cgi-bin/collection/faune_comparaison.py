#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Collection - (c) 2006-2007 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#


# modifier m_numero_individu en m_individu
# ajouter m_ville, m_groupe, m_nom_scientifique, m_holotype_espece


import os
import string
import collectionconf
import collectiondata
import afficheclefs
import re
import urllib

class Faune_comparaison(collectiondata.Data) :
        #
        # le nom de la table
        __tablename__ = "faune_comparaison"
        __new_record__ = "Nouveau"
        __color__ = collectionconf.bas1_bgcolor
        #
        # tous les champs de la table proprietaire
        __champs__ = {
                        "identifiant"           : { "type" : "text", "default" : 0,   "mandatory" : 1 , "longueur" : 20, "memory" : 1}, \
                        "m_type_materiel"       : { "type" : "text", "default" : "FAUNE_COMPARAISON",  "mandatory" : 1 , "longueur" : 0 , "memory" : 1 }, \
                        "m_numero_individu"     : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 40 , "memory" : 0 }, \
                        "m_classe"              : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 40 , "memory" : 0 }, \
                        "m_ordre"               : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 40 , "memory" : 0 }, \
                        "m_famille"             : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 40 , "memory" : 0 }, \
                        "m_genre"               : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 40 , "memory" : 0 }, \
                        "m_espece"              : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 40 , "memory" : 0 }, \
                        "m_nom_commun"          : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 40 , "memory" : 0 }, \
                        "m_nom_site"            : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 40 , "memory" : 0 }, \
                        "m_pays"                : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 20 , "memory" : 0 }, \
                        "m_age_individu"        : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 40 , "memory" : 0 }, \
                        "m_sexe_individu"       : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 0 , "memory" : 0 }, \
                        "m_donnees_individu"    : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 40 , "memory" : 0 }, \
                        "m_representation_squel": { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 0 , "memory" : 0 }, \
                        "m_description_anatomique": { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 300 , "memory" : 0 }, \
                        "m_observations_anatomique": { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 300 , "memory" : 0 }, \
                        "m_nature"              : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 0 , "memory" : 0 }, \
                        "m_age_absolu"          : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 40 , "memory" : 0 }, \
                        "m_numero_inventaire"   : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 40 , "memory" : 0 }, \
                        "m_donnateur"           : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 40 , "memory" : 0 }, \
                        "m_date_acquisition"    : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 4 , "memory" : 0 }, \
                        "m_mots_clefs"          : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 40 , "memory" : 0 }, \
                        "m_nombre_exemplaires"  : { "type" : "int",  "mandatory" : 0 , "longueur" : 6 , "memory" : 0 }, \
                        "m_batiment"            : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 0 , "memory" : 0 }, \
                        "m_piece"               : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 0 , "memory" : 0 }, \
                        "m_meuble"              : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 20 , "memory" : 0 }, \
                        "m_etagere"             : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 20 , "memory" : 0 }, \
                        "m_date_modif"          : { "type" : "date", "default" : "",  "mandatory" : 0 , "longueur" : 0 , "memory" : 0 }, \
                        "m_saisie"        : { "type" : "date", "mandatory" : 0 , "longueur" : 10}, \
                        }
        #
        # liste des tables enfants
        __listenfants__   = []
        __listeclefs__    = ["identifiant"]
        __vraiparent__    = "faune_comparaison"

        #
        # liste des seuls champs que l'on veut pouvoir modifier
        __listechamps__ = ["identifiant","m_type_materiel","m_numero_individu", \
                           "m_classe","m_ordre","m_famille","m_genre","m_espece","m_nom_commun", \
                           "m_nom_site","m_pays","m_age_individu", \
                           "m_sexe_individu","m_donnees_individu", \
                           "m_representation_squel","m_description_anatomique","m_observations_anatomique", \
                           "m_nature","m_age_absolu","m_numero_inventaire","m_donnateur","m_date_acquisition", \
                           "m_mots_clefs","m_nombre_exemplaires","m_batiment","m_piece","m_meuble","m_etagere", \
                           "m_date_modif"]
        #
        # liste des champs dans leur ordre de saisie
        __ordrechamps__ = ["identifiant","m_type_materiel","m_numero_individu", \
                           "m_classe","m_ordre","m_famille","m_genre","m_espece","m_nom_commun", \
                           "m_nom_site","m_pays","m_age_individu","m_sexe_individu","m_donnees_individu", \
                           "m_representation_squel","m_description_anatomique","m_observations_anatomique", \
                           "m_nature","m_age_absolu","m_numero_inventaire","m_donnateur","m_date_acquisition", \
                           "m_mots_clefs","m_nombre_exemplaires","m_batiment","m_piece","m_meuble","m_etagere", \
                           "m_date_modif","m_saisie","liens"]

        __orderby__ = " ORDER BY identifiant ASC;"

        #
        # liste des formulaires supplementaires
        __formsupp__ = []#"photomateriel"]

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
                collectiondata.Data.__init__(self, parent)

################################### En entrée ###########################
        def identifiant_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.push()
                self.__doc__.td()
                self.__doc__.insert_text(" ")
                afficheclefs.display_identifiant(self, enreg, penreg, 1)
                self.__doc__.pop()

################################### En entrée ###########################
        ##################### PARTIE SUPPORT
        def m_type_materiel_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
                afficheclefs.champ_liste( self, "m_type_materiel", "Type de matériel", enreg, penreg, " ", dontchange = 0)
                self.__doc__.pop()

        def m_numero_individu_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "m_numero_individu", "Numéro Individu", 80, 80, " ", enreg, penreg)
                self.__doc__.pop()

        def m_classe_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "m_classe", "Classe", 80, 80, " ", enreg, penreg)
                self.__doc__.pop()

        def m_ordre_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "m_ordre", "Ordre", 80, 80, " ", enreg, penreg)
                self.__doc__.pop()

        def m_famille_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "m_famille", "Famille", 80, 80, " ", enreg, penreg)
                self.__doc__.pop()

        def m_genre_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "m_genre", "Genre", 80, 80, " ", enreg, penreg)
                self.__doc__.pop()

        def m_espece_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "m_espece", "Espèce", 80, 80, " ", enreg, penreg)
                self.__doc__.pop()

        def m_nom_commun_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "m_nom_commun", "Nom vernaculaire", 80, 80, " ", enreg, penreg)
                self.__doc__.pop()

        def m_nom_site_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
                afficheclefs.champ_saisie(self, "m_nom_site", "Nom du site", 80, 80, " ", enreg, penreg)
                self.__doc__.pop()

        def m_pays_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "m_pays", "Pays", 80, 80, " ", enreg, penreg)
                self.__doc__.pop()

        def m_age_individu_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "m_age_individu", "Age Individu", 20, 20, " ", enreg, penreg)
                self.__doc__.pop()

        def m_sexe_individu_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_liste( self, "m_sexe_individu", "Sexe Individu", enreg, penreg, " ", dontchange = 0)
                self.__doc__.pop()

        def m_donnees_individu_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie_area(self, "m_donnees_individu", "Autres données", 3, 80, 5, " ", enreg, penreg)
                self.__doc__.pop()

        def m_representation_squel_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_liste( self, "m_representation_squel", "Rep. Squelette", enreg, penreg, " ", dontchange = 0)
                self.__doc__.pop()

        def m_description_anatomique_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie_area(self, "m_description_anatomique", "Desc. Anatomique", 3, 80, 5, " ", enreg, penreg)
                self.__doc__.pop()

        def m_observations_anatomique_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie_area(self, "m_observations_anatomique", "Obs. Anatomique", 3, 80, 5, " ", enreg, penreg)
                self.__doc__.pop()

        def m_nature_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_liste( self, "m_nature", "Nature", enreg, penreg, " ", dontchange = 0)
                self.__doc__.pop()

        def m_age_absolu_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "m_age_absolu", "Âge absolu", 80, 80, " ", enreg, penreg)
                self.__doc__.pop()

        def m_numero_inventaire_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "m_numer_inventaire", "Numéro d'inventaire", 80, 80, " ", enreg, penreg)
                self.__doc__.pop()

        def m_donnateur_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "m_donnateur", "Donnateur", 80, 80, " ", enreg, penreg)
                self.__doc__.pop()

        def m_date_acquisition_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "m_date_acquisition", "Date d'acquisition", 80, 80, " ", enreg, penreg)
                self.__doc__.pop()

        def m_nombre_exemplaires_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "m_nombre_exemplaires", "Nombre d'exemplaires", 6, 6, " ", enreg, penreg)
                self.__doc__.pop()



        ######### PARTIE LOCALISATION
        def m_batiment_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
                afficheclefs.champ_liste( self, "m_batiment", "Batiment", enreg, penreg, "LOCALISATION", dontchange = 0)
                self.__doc__.pop()

        def m_piece_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_liste( self, "m_piece", "Pièce", enreg, penreg, " ", dontchange = 0)
                self.__doc__.pop()

        def m_meuble_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "m_meuble", "Meuble", 80, 80, " ", enreg, penreg)
                self.__doc__.pop()

        def m_etagere_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "m_etagere", "Étagère", 80, 80, " ", enreg, penreg)
                self.__doc__.pop()

        def m_mots_clefs_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie_area(self, "m_mots_clefs", "Mots clefs", 3, 80, 5, " ", enreg, penreg)
                self.__doc__.pop()


        def m_date_modif_base_to_form(self, enreg, penreg = None) :
                if enreg != None:
                        self.__doc__.push()
                        afficheclefs.champ_saisie(self,"m_date_modif", "Fiche modifiée le", 10, 20, " ", enreg, penreg)
                        self.__doc__.pop()

        def m_saisie_base_to_form(self, enreg, penreg = None) :
                if enreg != None:
                        self.__doc__.push()
                        afficheclefs.champ_saisie(self,"m_saisie", "Fiche saisie le", 10, 20, " ", enreg, penreg)
                        self.__doc__.pop()


        def liens_base_to_form(self, enreg, penreg = None) :
                if enreg != None:
                        dico = { "action" : "Chercher" }
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
                        self.__doc__.td(clign = "center", colspan="3")
                        self.__doc__.font(size=collectionconf.font_size)
                        self.__doc__.insert_text("Objets lies: ")
                        self.__doc__.pop()
                        for k in range(0,len(valeur)):
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
                                self.__doc__.td(clign = "center", colspan="3")
                                self.__doc__.font(size=collectionconf.font_size)
                                #self.__doc__.insert_text(valeur[k]['identifiant_2'])
                                #valeur['identifiant_2'] = enreg['identifiant']
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

                                if link :
                                        self.__doc__.a(valeur[k]['identifiant_2'], href = link)
                                self.__doc__.pop()
                                self.__doc__.pop()

                self.__doc__.pop()
#########################################################################
#                                PHOTOS
#########################################################################
        def liste_photomateriel(self, enreg) :
                resp = self.__db__.query("SELECT * FROM photomateriel WHERE identifiant = " + self.__db__.quote(enreg["indentifiant"], "text") + " ORDER BY idphoto ASC;")
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
                                self.__doc__.form(method = "POST", action =  collectionconf.script_location("modphotomateriel"))
                                self.__doc__.table(border = 5, cellpadding = 5, cellspacing = 5)
                                self.__doc__.tr()

                                self.__doc__.push()
                                self.__doc__.td()
                                self.__doc__.table(border = 0, cellpadding = 0, cellspacing = 0)

                                self.__doc__.push()
                                self.__doc__.tr()
                                self.__doc__.td(valign = "middle", align = "center")
                                photo_url = collectionconf.images_location + "I" + enreg["identifiant"] + "/" + `photo["idphoto"]`
                                self.__doc__.a(href = photo_url + ".jpeg")
                                xmax,ymax = collectionconf.get_imagesize(collectionconf.image_fullname("I" + enreg["identifiant"] + os.sep + `photo["idphoto"]` + "s.jpeg"))
                                self.__doc__.img(src = photo_url + "s.jpeg", width=xmax, height=ymax)
                                self.__doc__.br()
                                self.__doc__.a("original", href = photo_url + ".tiff")
                                self.__doc__.pop()

                                self.__doc__.tr()
                                self.__doc__.td(valign="middle", align="center")
                                self.__doc__.font(size=collectionconf.font_size)
                                self.__doc__.textarea(name = "legende", rows="4", cols="80", wrap="physical")
                                if photo["legende"] == None:
                                        self.__doc__.insert_text("&nbsp;")
                                else :
                                        self.__doc__.insert_text(photo["legende"])
                                self.__doc__.pop()

                                self.__doc__.td(bgcolor = collectionconf.basform_bgcolorright, valign= "middle", align = "center")
                                self.__doc__.font(size = collectionconf.font_size)
                                self.__doc__.hidden(name = "idphoto", value = photo["idphoto"])
                                self.__doc__.hidden(name = "identifiant", value = photo["identifiant"])
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
                        self.__doc__.form(method = "POST", action = collectionconf.script_location("modphotomateriel"))
                        self.__doc__.hidden(name = "identifiant", value = photo["identifiant"])
                        self.__doc__.submit(name = "action", value = "Nouvelle image")
                        self.__doc__.pop()
                        self.__doc__.font("aucune image", color = "red", size = collectionconf.font_size)

        def menu_photomateriel(self, enreg, color, function) :
                if enreg != None :
                        self.__doc__.push()
                        self.__doc__.tr()
                        self.__doc__.td(bgcolor = color, colspan = "2")
                        self.__doc__.font(size = collectionconf.font_size)
                        self.__doc__.div(align = "center")
                        function(enreg)
                        self.__doc__.pop()

        def photomateriel(self, enreg, penreg = None) :
                self.menu_photomateriel(enreg, collectionconf.basform_bgcolormiddle, self.liste_photomateriel)


###############################################################################
#                                METHODES
##############################################################################

        def modifier(self) :
                """Met a jour le faune_comparaison courant"""
                self.__db__.query(self.make_update_query(["identifiant"],"materiel"))
                i = self.__form__["identifiant"].value
                update_date = "UPDATE materiel SET m_date_modif='now' WHERE identifiant='" + i + "';"
                self.__db__.query(update_date)
                return 0

        def supprimer(self) :
               # s'il existe des figures ou des photos sur ce faune_comparaison on refuse la suppression
                #if self.exist(["identifiant"], table = "l") :
                #        return -1
                #else :
                i = self.__form__["identifiant"].value
                delete_association = "DELETE FROM association WHERE identifiant_1='" + i + "';"
                self.__db__.query(delete_association)
                delete_association = "DELETE FROM association WHERE identifiant_2='" + i + "';"
                self.__db__.query(delete_association)

                i = "I" + self.__form__["identifiant"].value
                rr = collectionconf.image_fullname(i)
                try :
                        if os.path.isdir(rr) :
                                os.rmdir(rr)
                except :
                        collectionconf.fatalerror_message("Impossible de supprimer le répertoire [%s]" % rr)

                # on efface le faune_comparaison
                self.delete_records(["identifiant"],"materiel")
                return 0

        def creer(self) :
                # si le faune_comparaison n'existe pas déjà alors on la crée, sinon on refuse
                if self.exist(["identifiant"], table = "materiel") :
                        primarykeys = { "identifiant": None}
                        return (-1, primarykeys)
                else :
                        # on insère maintenant le faune_comparaison dans la base
                        i = self.__form__["identifiant"].value
                        self.__db__.query(self.make_insert_query({},"materiel"))
                        primarykeys = { "identifiant" : i}
                        update_date = "UPDATE materiel SET m_date_modif='now' WHERE identifiant='" + i + "';"
                        self.__db__.query(update_date)
                        return (0, primarykeys)
