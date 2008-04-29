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
import string
import archeoconf
import archeodata
import faune
import afficheclefs


class Carnet(archeodata.Data) :
        #
        # le nom de la table
        __tablename__ = "carnet"
        __new_record__ = "Nouveau"
        __color__ = archeoconf.bas1_bgcolor
        #
        # tous les champs de la table carnet
        __champs__ = { \
                        "zone"        : { "type" : "text", "default" : "",  "mandatory" : 1 , "longueur" : 0, "memory" : 1 , "compter" : 1}, \
                        "numero"      : { "type" : "int", "default" : 0,   "mandatory" : 1 , "longueur" : 6, "memory" : 1 }, \
                        "bis"         : { "type" : "text", "default" : "",  "mandatory" : 1 , "longueur" : 0, "memory" : 1 }, \
                        "locus"       : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 0     }, \
                        "localite"    : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 0     }, \
                        "carre"       : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 0 }, \
                        "souscarre"   : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 0 }, \
                        "ensemble"    : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 0 }, \
                        "niveau"      : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 0 }, \
                        "sol"         : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 0 }, \
                        "couche"      : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 6, "memory" : 1 }, \
                        "foyer"       : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 0 }, \
                        "nature"      : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 0 , "memory" : 1 }, \
                        "nofouille"   : { "type" : "int", "mandatory" : 0 , "longueur" : 4 }, \
                        "nomusee"     : { "type" : "int", "mandatory" : 0 , "longueur" : 7 }, \
                        "nosopi"      : { "type" : "int", "mandatory" : 0 , "longueur" : 7 }, \
                        "responsable_fouille": { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0, "memory" : 1 }, \
                        "x"           : { "type" : "int",   "mandatory" : 0 , "longueur" : 3 }, \
                        "y"           : { "type" : "int",   "mandatory" : 0 , "longueur" : 3 }, \
                        "zrelatif"    : { "type" : "decimal",   "mandatory" : 0 , "longueur" : 6 }, \
                        "zabsolu"     : { "type" : "decimal", "mandatory" : 0 , "longueur" : 6 }, \
                        "zreference"  : { "type" : "decimal",   "mandatory" : 0 , "longueur" : 6 , "memory" :  1 }, \
                        "latitude"    : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 10 }, \
                        "longitude"   : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 10 }, \
                        "orientation" : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 0 }, \
                        "pendage"     : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 0 }, \
                        "vers"        : { "type" : "text", "default" : "",  "mandatory" : 0 , "longueur" : 0 }, \
                        "longueur"    : { "type" : "int", "mandatory" : 0 , "longueur" : 6 }, \
                        "largeur"     : { "type" : "int", "mandatory" : 0 , "longueur" : 6 }, \
                        "epaisseur"   : { "type" : "int", "mandatory" : 0 , "longueur" : 6 }, \
                        "trouve"      : { "type" : "date","mandatory" : 0 , "longueur" : 10, "memory" : 1}, \
                        "saisie"      : { "type" : "date", "mandatory" : 0 , "longueur" : 10}, \
                    }

        #
        # liste des tables enfants
        __listenfants__ = [ "industrie", "faune"]
        __listeclefs__ = ["zone", "numero", "bis"]
        __vraiparent__ = "carnet"

        #
        # liste des seuls champs que l'on veut pouvoir modifier
        __listechamps__ = [ "zone", "numero", "bis", "locus", "localite", "carre", "souscarre", "ensemble", "niveau", "sol", "couche", "nature", "nofouille", "nomusee", "nosopi", "responsable_fouille","x", "y", "zrelatif",  "zreference", "latitude", "longitude", "orientation", "pendage", "vers", "longueur", "largeur", "epaisseur", "trouve"]

        #
        # liste des champs dans leur ordre de saisie
        __ordrechamps__ = [ "zone", "numero", "bis", "locus", "localite", "carre", "souscarre", "ensemble", "niveau", "sol", "couche", "nature", "nofouille", "nomusee", "nosopi", "responsable_fouille","x", "y", "zrelatif",  "zreference", "zabsolu", "latitude", "longitude", "orientation", "pendage", "vers", "longueur", "largeur", "epaisseur", "trouve", "saisie"]


        __orderby__ = " ORDER BY zone, numero, bis ASC;"

        __controle_saisie__ =["zone"]

        #
        # liste des formulaires supplementaires
        __formsupp__ = ["faune", "industrie" ]

        def zone_verify(self, fieldname, value) :
                if value == '' :
                        return -1
                else :
                        return 0

        def numero_verify(self, fieldname, value) :
                if (value == '') or self.champ_verify(fieldname, value) :
                        return -1
                else :
                        return 0

        def bis_verify(self, fieldname, value) :
                if value == '' :
                        return -1
                else :
                        return 0

        def champ_verify(self, fieldname, value) :
                # si la longueur de la valeur issue du formulaire est > a la longueur
                # definie dans l'attribut longueur des champs
                if  (value != None) and (len(value) > self.__champs__[fieldname]["longueur"]) :
                        return -1       # erreur
                else:
                        return 0

        def __init__(self, parent) :
                for champ in self.__champs__.keys() :
                        if self.__champs__[champ]["longueur"] :
                                if not hasattr(self, "%s_verify" % champ) :
                                        setattr(self, "%s_verify" % champ, self.champ_verify)
                archeodata.Data.__init__(self, parent)

        def zone_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.push()
                self.__doc__.td()
                self.__doc__.insert_text(" ")
                self.__doc__.pop()
                afficheclefs.display_zone(self, enreg, penreg,2)

        def numero_base_to_form(self, enreg, penreg = None) :
                afficheclefs.display_numero(self, enreg, penreg,2)
                #self.__doc__.pop()

        def bis_base_to_form(self, enreg, penreg = None) :
                afficheclefs.display_bis(self, enreg,penreg, "right",2)
                self.__doc__.pop()

        def locus_base_to_form(self, enreg, penreg = None) :
                afficheclefs.ajoute_ligne(self, "100%", "1", "10", "4")
                self.__doc__.push()
                afficheclefs.champ_liste(self, "locus", "locus", enreg, penreg, "Générique", dontchange = 0)

        def localite_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste(self, "localite", "localité", enreg, penreg, "", dontchange = 0)

        def carre_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste(self, "carre", "carré", enreg, penreg, "", dontchange = 0)
                self.__doc__.pop()

        def souscarre_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_liste(self, "souscarre", "sous-carré", enreg, penreg," ", dontchange = 0)

        def ensemble_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste(self, "ensemble", "ensemble", enreg, penreg, "", dontchange = 0)

        def niveau_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste(self, "niveau", "niveau", enreg, penreg, "", dontchange = 0)
                self.__doc__.pop()

        def sol_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_liste(self, "sol", "sol", enreg, penreg," ", dontchange = 0)

        def couche_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "couche", "couche", 6, 20, "", enreg, penreg)

        def nature_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste(self, "nature", "nature", enreg, penreg, "", dontchange = 0)
                self.__doc__.pop()

        def nofouille_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "nofouille", "n°fouille", 4, 14, " ", enreg, penreg)

        def nomusee_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "nomusee", "n°musee", 7, 17, "", enreg, penreg)

        def nosopi_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "nosopi", "n°sopi", 7, 17, "", enreg, penreg)
                self.__doc__.pop()

        def responsable_fouille_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_liste(self, "responsable_fouille", "responsable fouille", enreg, penreg, " ", dontchange = 0)
                self.__doc__.pop()


        def x_base_to_form(self, enreg, penreg = None) :
                afficheclefs.ajoute_ligne(self, "100%", "1", "10", "4")
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "x", "x", 3, 13, "Localisation", enreg, penreg)

        def y_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "y", "y", 3, 13, "", enreg, penreg)
                self.__doc__.pop()

        def zrelatif_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "zrelatif", "zrela:", 6, 20, " ", enreg, penreg)
        def zreference_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "zreference", "zref:", 6, 20, "", enreg, penreg)
############# calcul zabs en sortie
        def zabsolu_base_to_form(self, enreg, penreg = None) :
                if enreg != None:
                        liste_clefs = ["zone", "numero", "bis"]
                        self.champ_saisie_table("carnet",  liste_clefs, "zabsolu", "zabs", 3, 20, "", enreg, penreg)
                self.__doc__.pop()
###########

        def latitude_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "latitude", "latitude", 10, 20, " ", enreg, penreg)
        def longitude_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "longitude", "longitude", 10, 20, "", enreg, penreg)
                self.__doc__.pop()

#########################
        def orientation_base_to_form(self, enreg, penreg = None) :
                afficheclefs.ajoute_ligne(self, "100%", "1", "10", "4")
                self.__doc__.push()
                afficheclefs.champ_liste(self, "orientation", "orientation", enreg, penreg, "Orientation", dontchange = 0)

        def pendage_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste(self, "pendage", "pendage", enreg, penreg, "", dontchange = 0)

        def vers_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste(self, "vers", "vers", enreg, penreg, "", dontchange = 0)
                self.__doc__.pop()

        def longueur_base_to_form(self, enreg, penreg = None) :
                afficheclefs.ajoute_ligne(self, "100%", "1", "10", "4")
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "longueur", "L", 6, 16, "Dimensions", enreg, penreg)

        def largeur_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "largeur", "l", 6, 16, "", enreg, penreg)

        def epaisseur_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "epaisseur", "e", 6, 16, "", enreg, penreg)
                self.__doc__.pop()

        def trouve_base_to_form(self, enreg, penreg = None) :
                afficheclefs.ajoute_ligne(self, "100%", "1", "5", "4")
                self.__doc__.push()
                afficheclefs.champ_nsaisie(self,"trouve", "objet trouvé le", 10, 20, "", 2, enreg, penreg)

        def saisie_base_to_form(self, enreg, penreg = None) :
                if enreg != None:
                        afficheclefs.champ_nsaisie(self,"saisie", "Fiche saisie le", 10, 20, "", 2,enreg, penreg)
                self.__doc__.pop()
#############################################################################################################################

#############################################################################################################################
#                                       LIEN AVEC L'ECRAN INDUSTRIE
#############################################################################################################################
        def faces(self, enreg, penreg = None) :
                if enreg != None :
                        self.__doc__.push()
                        self.__doc__.tr()
                        self.__doc__.td(bgcolor = archeoconf.basform_bgcolormiddle, colspan = "2")
                        self.__doc__.font(size = archeoconf.font_size)
                        penreg = { "zone": enreg["zone"], "groupe": enreg["groupe"], "roche": enreg["roche"] }
                        face.Face(self).traite_saisie(["zone", "groupe", "roche", "face"], parent = self.__tablename__, penreg = penreg)
                        self.__doc__.pop()

##############################################################################################################################
#                                               METHODES
##############################################################################################################################

        def modifier(self) :
                """Met a jour la roche courante"""
                self.__db__.query(self.make_update_query(["zone", "numero", "bis"]))
                update_zabs="UPDATE CARNET SET zabsolu = zrelatif+zreference WHERE zone=" + self.__db__.quote(self.__form__["zone"].value, "text") + " and numero=" + self.__form__["numero"].value + " and bis=" + self.__db__.quote(self.__form__["bis"].value,"text") + ";"
                self.__db__.query(update_zabs)
                return 0

        def supprimer(self) :
                # s'il existe des faunes ou des industries associes a cette fiche du carnet, on refuse la suppression
                if self.exist(["zone", "numero", "bis"], table = "industrie") or self.exist(["zone", "numero", "bis"], table = "faune") :
                
                        return -1
                else :
                        # on efface le carnet
                        self.delete_records(["zone", "numero", "bis"])
                        return 0

        def creer(self) :
                # si l'objet n'existe pas déjà alors on la crée, sinon on refuse
                if self.exist(["zone", "numero", "bis"]) :
                        return (-1, { "zone" : None, "numero" : None, "bis": None})
                else :
                        z = self.__form__["zone"].value
                        n = self.__form__["numero"].value
                        b = self.__form__["bis"].value
                        if self.exist_controle("zone", self.__db__.quote(z, "text"),table="carnet"):
                                requete = (self.make_insert_query({ }))
                                if requete is None :
                                        return (-1, { "zone" : None})
                                else :
                                        self.__db__.query(requete)
                                        primarykeys = { "zone" : z, "numero" : n, "bis" : b }
                                        update_zabs="UPDATE CARNET SET zabsolu = zrelatif+zreference WHERE zone=" + self.__db__.quote(self.__form__["zone"].value, "text") + " and numero=" + self.__form__["numero"].value + " and bis=" + self.__db__.quote(self.__form__["bis"].value,"text") + ";"
                                        self.__db__.query(update_zabs)
                                        return (1, primarykeys)
                        else:
                                return (-3, {"zone":None})

