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

import os
import re
import string
import urllib

import database
import afficheclefs
import collectionconf
import collectiondata


## Biblio class -
#

class Biblio(collectiondata.Data) :
        #
        # le nom de la table
        __tablename__ = "biblio"
        __new_record__ = "Nouvelle"
        __color__ = collectionconf.bas1_bgcolor
        #
        # tous les champs de la table proprietaire
        __champs__ = {
                        "identifiant"     : { "type" : "text", "default" : 0,   "mandatory" : 1 , "longueur" : 20, "memory" : 1}, \
                        "b_type_biblio"   : { "type" : "text", "default" : "",  "mandatory" : 1 , "longueur" : 0 , "memory" : 1 }, \
                        "b_indice"        : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 15}, \
                        "b_titre_ouvrage" : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 200}, \
                        "b_auteur"        : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 300}, \
                        "b_titre_article" : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 300}, \
                        "b_titre_periodique" : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 100}, \
                        "b_pages"         : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 12}, \
                        "b_maison_edition": { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 60}, \
                        "b_ville_edition"   : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 15}, \
                        "b_dir_pub"       : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 100}, \
                        "b_annee"         : { "type" : "int", "mandatory" : 0 , "longueur" : 4}, \
                        "b_mois"          : { "type" : "text", "defaut" : "",  "mandatory" : 0 , "longueur" : 30}, \
                        "b_nombre_volume" : { "type" : "int", "mandatory" : 0 , "longueur" : 3}, \
                        "b_numero"        : { "type" : "int", "mandatory" : 0 , "longueur" : 4}, \
                        "b_volume"        : { "type" : "int", "mandatory" : 0 , "longueur" : 4}, \
                        "b_tome"          : { "type" : "int", "mandatory" : 0 , "longueur" : 3}, \
                        "b_serie"         : { "type" : "text", "mandatory" : 0 , "longueur" : 2}, \
                        "b_fascicule"     : { "type" : "int",  "mandatory" : 0 , "longueur" : 3}, \
                        "b_langue_document" : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 0}, \
                        "b_langue_resume" : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 30}, \
                        "b_etablissement" : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 100}, \
                        "b_description"   : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 500}, \
                        "b_isbn"          : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 15}, \
                        "b_issn"          : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 15}, \
                        "b_resume"        : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 500}, \
                        "b_mots_clefs"    : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 300}, \
                        "b_url"           : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 100}, \
                        "b_nombre_ex_supp": { "type" : "int",  "mandatory" : 0 , "longueur" : 2}, \
                        "b_modif_biblio"  : { "type" : "date", "mandatory" : 0 , "longueur" : 10}, \
                        "b_saisie"        : { "type" : "date", "mandatory" : 0 , "longueur" : 10}, \
                        }
        #
        # liste des tables enfants
        __listenfants__   = []
        #__listeparents__  = [""]
        __listeclefs__    = ["identifiant"]
        __vraiparent__    = "biblio"


        #
        # liste des seuls champs que l'on veut pouvoir modifier
        __listechamps__ = ["identifiant", "b_type_biblio","b_indice","b_titre_ouvrage","b_auteur", \
                                "b_titre_article","b_titre_periodique", \
                                "b_pages","b_maison_edition","b_ville_edition","b_dir_pub", \
                                "b_annee","b_mois","b_nombre_volume","b_numero","b_volume", \
                                "b_tome","b_serie","b_fascicule","b_langue_document","b_langue_resume", \
                                "b_etablissement","b_description","b_isbn","b_issn","b_resume", \
                                "b_mots_clefs","b_url","b_nombre_ex_supp"]

        # liste des champs dans leur ordre de saisie
        __ordrechamps__ = ["identifiant", "b_type_biblio","b_indice","b_titre_ouvrage","b_auteur", \
                                "b_titre_article","b_titre_periodique", \
                                "b_pages","b_maison_edition","b_ville_edition","b_dir_pub", \
                                "b_annee","b_mois","b_nombre_volume","b_numero","b_volume", \
                                "b_tome","b_serie","b_fascicule","b_langue_document","b_langue_resume", \
                                "b_etablissement","b_description","b_isbn","b_issn","b_resume", \
                                "b_mots_clefs","b_url","b_nombre_ex_supp","b_modif_biblio","b_saisie","liens"]

        __orderby__ = " ORDER BY identifiant ASC;"

        #
        # liste des formulaires supplementaires
        __formsupp__ = ["association"]

        def identifiant_verify(self, fieldname, value) :
                if (value == '') or self.champ_verify(fieldname, value) :
                        return -1
                else :
                        return 0

        def champ_verify(self, fieldname, value) :
                # si la longueur de la valeur issue du formulaire est > a la longueur
                # definie dans l'attribut longueur des champs
                if  (value != None) and (len(value) > (self.__champs__[fieldname]["longueur"]*2)) :
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
                #self.__doc__.pop()
                afficheclefs.display_identifiant(self, enreg, penreg, 1)
                self.__doc__.pop()

################################### En entrée ###########################
        def b_indice_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_indice", "Indice", 15, 15, " ", enreg, penreg)
                self.__doc__.pop()

        def b_type_biblio_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_liste( self, "b_type_biblio", "Type Biblio", enreg, penreg, " ", dontchange = 0)
                self.__doc__.pop()

        def b_titre_ouvrage_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie_area(self, "b_titre_ouvrage", "Titre Ouvrage", 2, 100, 5, " ", enreg, penreg)
                self.__doc__.pop()

        def b_auteur_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie_area(self, "b_auteur", "Auteur(s)", 3, 100, 5, " ", enreg, penreg)
                self.__doc__.pop()

        def b_titre_article_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie_area(self, "b_titre_article", "Titre de l'article", 3, 100, 5, " ", enreg, penreg)
                self.__doc__.pop()

        def b_titre_periodique_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_titre_periodique", "Titre du periodique", 100, 100, " ", enreg, penreg)
                self.__doc__.pop()

        def b_pages_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_pages", "Pages", 12, 12, " ", enreg, penreg)
                self.__doc__.pop()

        def b_maison_edition_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_maison_edition", "Maison d'édition", 60, 60, " ", enreg, penreg)
                self.__doc__.pop()

        def b_ville_edition_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_ville_edition", "Ville d'édition", 15, 15, " ", enreg, penreg)
                self.__doc__.pop()

        def b_dir_pub_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_dir_pub", "Sous dir. de", 100, 100, " ", enreg, penreg)
                self.__doc__.pop()

        def b_annee_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_annee", "Année", 4, 4, " ", enreg, penreg)
                self.__doc__.pop()

        def b_mois_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_mois", "Mois", 30, 30, " ", enreg, penreg)
                self.__doc__.pop()

        def b_nombre_volume_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_nombre_volume", "Nombre de volumes", 3, 3, " ", enreg, penreg)
                self.__doc__.pop()

        def b_numero_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_numero", "Numéro", 4, 4, " ", enreg, penreg)
                self.__doc__.pop()

        def b_volume_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_volume", "Volume", 4, 4, " ", enreg, penreg)
                self.__doc__.pop()

        def b_tome_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_tome", "Tome", 3, 3, " ", enreg, penreg)
                self.__doc__.pop()

        def b_serie_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_serie", "Série", 2, 2, " ", enreg, penreg)
                self.__doc__.pop()

        def b_fascicule_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_fascicule", "Fascicule", 3, 3, " ", enreg, penreg)
                self.__doc__.pop()

        def b_langue_document_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_liste( self, "b_langue_document", "Langue du doc.", enreg, penreg, " ", dontchange = 0)
                self.__doc__.pop()

        def b_langue_resume_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_langue_resume", "Langue du résume", 30, 30, " ", enreg, penreg)
                self.__doc__.pop()

        def b_etablissement_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_etablissement", "Établissement", 100, 100, " ", enreg, penreg)
                self.__doc__.pop()

        def b_description_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie_area(self, "b_description", "Description", 5, 100, 5, " ", enreg, penreg)
                self.__doc__.pop()

        def nb_exemplaires_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "nb_exemplaires", "Nb d'exemplaires", 50, 50, " ", enreg, penreg)
                self.__doc__.pop()

        def b_isbn_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_isbn", "ISBN", 15, 15, " ", enreg, penreg)
                self.__doc__.pop()

        def b_issn_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_issn", "ISSN", 15, 15, " ", enreg, penreg)
                self.__doc__.pop()

        def b_resume_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie_area(self, "b_resume", "Résumé", 5, 100, 5, " ", enreg, penreg)
                self.__doc__.pop()

        def b_mots_clefs_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie_area(self, "b_mots_clefs", "Mots clefs", 3, 100, 5, " ", enreg, penreg)
                self.__doc__.pop()

        def b_url_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_url", "Url", 100, 100, " ", enreg, penreg)
                self.__doc__.pop()

        def b_nombre_ex_supp_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_nombre_ex_supp", "Nb d'exemplaires suppl.", 2, 2, " ", enreg, penreg)
                self.__doc__.pop()

        def b_modif_biblio_base_to_form(self, enreg, penreg = None) :
                if enreg != None:
                        self.__doc__.push()
                        afficheclefs.champ_saisie(self,"b_modif_biblio", "Fiche modifiée le", 10, 20, " ", enreg, penreg)
                        self.__doc__.pop()

        def b_saisie_base_to_form(self, enreg, penreg = None) :
                if enreg != None:
                        self.__doc__.push()
                        afficheclefs.champ_saisie(self,"b_saisie", "Fiche saisie le", 10, 20, " ", enreg, penreg)
                        self.__doc__.pop()
                #self.__doc__.pop()
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

###############################################################################
#                                METHODES
##############################################################################

        def modifier(self) :
                """Met a jour la biblio courante"""
                self.__db__.query(self.make_update_query(["identifiant"]))
                i = self.__form__["identifiant"].value
                update_date = "UPDATE biblio SET b_modif_biblio='now' WHERE identifiant='" + i + "';"
                self.__db__.query(update_date)
                return 0

        def supprimer(self) :
               # s'il existe des figures ou des photos sur cette biblio on refuse la suppression
                i = self.__db__.quote(self.__form__["identifiant"].value,"text")
                if self.exist_association(i):
                        return -1
                else :
                        i = "I" + self.__form__["identifiant"].value
                        rr = collectionconf.image_fullname(i)
                        try :
                                if os.path.isdir(rr) :
                                        os.rmdir(rr)
                        except :
                                collectionconf.fatalerror_message("Impossible de supprimer le répertoire [%s]" % rr)

                        # on efface l' biblio
                        self.delete_records(["identifiant"])
                        return 0

        def creer(self) :
                # si la biblio n'existe pas déjà alors on la crée, sinon on refuse
                if self.exist(["identifiant"], table = "biblio") :
                        primarykeys = { "identifiant": None}
                        return (-1, primarykeys)
                else :
                        # on insère maintenant la biblio dans la base
                        i = self.__form__["identifiant"].value
                        self.__db__.query(self.make_insert_query({ }))
                        primarykeys = { "identifiant" : i}
                        update_date = "UPDATE biblio SET b_modif_biblio='now' WHERE identifiant='" + i + "';"
                        self.__db__.query(update_date)
                        return (0, primarykeys)




