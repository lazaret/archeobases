#! /usr/bin/python
# -*- coding: utf-8 -*-
#
# Archeo   - (c) 1999      Jerome ALET <alet@unice.fr>
#                1999-2000 Rachel VAUDRON <rachel@cleo.unice.fr>
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2.0
# or, at your option, any higher version.
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#
#
# $Id: enlevement.py,v 1.5 2001/07/05 15:29:12 rachel Exp $
#
# $Log: enlevement.py,v $
# Revision 1.5  2001/07/05 15:29:12  rachel
# plein de modifs
#
# Revision 1.4  2001/04/05 09:44:28  rachel
# remise en place des modfis pour le +1 qui fonctionne.
# de plus les listes et le champ numeros sont bien en dontchange =0 lors de nouveau comptage ou bien recherche.
# il doit falloir que je generalise pour que cela s'applique a tous les chmaps.
# il faut aussi que je fasse les modifs pour les liens ainsi que popur les chmaps a memoriser.
#
# Revision 1.3  2001/03/20 19:59:31  jerome
# Ajout des tags CVS Id et Log
#
#
#

import os
import string
import archeoconf
import archeodata
import afficheclefs
import re

class Enlevement(archeodata.Data) :
        #
        # le nom de la table
        __tablename__ = "enlevement"
        __new_record__ = "Nouvelle"

        #
        # tous les champs de la table proprietaire
        __champs__ = { 
                        "zone"          : { "type" : "text", "default" : "", "mandatory" : 1 }, \
                        "numero"        : { "type" : "decimal", "default" : 0, "mandatory" : 1 }, \
                        "bis"           : { "type" : "text", "default" : "", "mandatory" : 1 }, \
                        "e_ordre"       : { "type" : "decimal", "default" : 0, "mandatory" : 1 }, \
                        "e_longueur_generale" : { "type" : "text", "default" : "", "mandatory" : 0 }, \
                        "e_profil"      : { "type" : "text", "default" : "", "mandatory" : 0 }, \
                        "e_profondeur"  : { "type" : "text", "default" : "", "mandatory" : 0 }, \
                        "e_obliquite"   : { "type" : "text", "default" : "", "mandatory" : 0 }, \
                        "e_extremite"   : { "type" : "text", "default" : "", "mandatory" : 0 }, \
                        "e_proeminence" : { "type" : "text", "default" : "", "mandatory" : 0 }, \
                        "e_sens"        : { "type" : "text", "default" : "", "mandatory" : 0 }, \
                        "e_localisation": { "type" : "text", "default" : "", "mandatory" : 0 }, \
                        "e_situation"   : { "type" : "text", "default" : "", "mandatory" : 0 }, \
                        "e_longueur"    : { "type" : "decimal", "default" : 0, "mandatory" : 0 }, \
                        "e_largeur"     : { "type" : "decimal", "default" : 0, "mandatory" : 0 }, \
                        "e_obliquite_degre": { "type" : "decimal", "default" : 0, "mandatory" : 0 }, \
                        "e_corde"       : { "type" : "decimal", "default" : 0, "mandatory" : 0 }, \
                        "e_fleche"      : { "type" : "decimal", "default" : 0, "mandatory" : 0 }, \
                        "e_ptimpact"    : { "type" : "decimal", "default" : 0, "mandatory" : 0 }, \
                
                      }
        #
        # liste des tables enfants
        __listenfants__ = []
        __listeclefs__ = ["zone", "numero", "bis", "e_ordre"]
        
        __vraiparent__ = "industrie"
        
        
        #
        # liste des seuls champs que l'on veut pouvoir modifier
        __listechamps__ = ["zone", "numero", "bis", "e_ordre", "e_longueur_generale", "e_profil", "e_profondeur", "e_obliquite", "e_extremite", "e_proeminence", "e_sens","e_localisation", "e_situation", "e_longueur", "e_largeur", "e_obliquite_degre", "e_corde", "e_fleche", "e_ptimpact"]


        #
        # liste des champs dans leur ordre de saisie
        __ordrechamps__ =["zone", "numero", "bis", "e_ordre", "e_longueur_generale", "e_profil", "e_profondeur", "e_obliquite", "e_extremite", "e_proeminence", "e_sens","e_localisation", "e_situation", "e_longueur", "e_largeur", "e_obliquite_degre", "e_corde", "e_fleche", "e_ptimpact"]

        __orderby__ = " ORDER BY zone, numero, bis ASC;"

        #
        # liste des formulaires supplementaires
        __formsupp__ = []
        def zone_verify(self, value) :
                if value == '' :
                        return -1
                else :
                        return 0

        def numero_verify(self, value) :
                if value == '' :
                        return -1
                else :
                        return 0

        def bis_verify(self, value) :
                if value == '' :
                        return -1
                else :
                        return 0

        def e_ordre_verify(self, value) :
                if value == '' :
                        return -1
                else :
                        return 0

        def zone_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.push()
                self.__doc__.td()
                self.__doc__.insert_text(" ")
                self.__doc__.pop()
                afficheclefs.display_zone( self, enreg, penreg)

        def numero_base_to_form(self, enreg, penreg = None) :
                afficheclefs.display_numero(self, enreg, penreg)

        def bis_base_to_form(self, enreg, penreg = None) :
                afficheclefs.display_bis( self, enreg, penreg)

        def e_ordre_base_to_form(self, enreg, penreg = None) :
                afficheclefs.display_e_ordre(self, enreg, penreg)
                self.__doc__.pop()


################################### En entrée ##############################################
        def e_longueur_generale_base_to_form(self, enreg, penreg = None) :
                afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
                self.__doc__.push()
                afficheclefs.champ_liste( self, "e_longueur_generale", "Lg générale", enreg, penreg, " ", dontchange = 0)

        def e_profil_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "e_profil", "profil", enreg, penreg, "", dontchange = 0)

        def e_profondeur_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "e_profondeur", "profondeur", enreg, penreg, "", dontchange = 0)
                self.__doc__.pop()
#################"        
        def e_obliquite_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_liste( self, "e_obliquite", "obliquite", enreg, penreg, " ", dontchange = 0)
        
        def e_extremite_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "e_extremite", "extremite", enreg, penreg, "", dontchange = 0)

        def e_proeminence_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "e_proeminence", "proeminence", enreg, penreg, "", dontchange = 0)
                self.__doc__.pop()
#######################
        def e_sens_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_liste( self, "e_sens", "sens", enreg, penreg, " ", dontchange = 0)
 
        def e_localisation_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "e_localisation", "localisation", enreg, penreg, "", dontchange = 0)

        def e_situation_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "e_situation", "situation", enreg, penreg, "", dontchange = 0)
                self.__doc__.pop()
#########################
        def e_longueur_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "e_longueur", "longueur", 3, 3, " ", enreg, penreg)

        def e_largeur_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "e_largeur", "largeur", 3, 3, "", enreg, penreg)

        def e_obliquite_degre_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "e_obliquite", "obliquite", 3, 3, "", enreg, penreg)
                self.__doc__.pop()
########################

        def e_corde_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "e_corde", "corde", 3, 3, " ", enreg, penreg)

        def e_fleche_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "e_fleche", "fleche", 3, 3, "", enreg, penreg)

        def e_ptimpact_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "e_ptimpact", "ptimpact", 3, 3, "", enreg, penreg)
                self.__doc__.pop()


##############################################################################################################################
#                                               METHODES
##############################################################################################################################

        def modifier(self) :
                """Met a jour l'enlevement courant"""
                self.__db__.query(self.make_update_query(["zone", "numero", "bis", "e_ordre"]))
                return 0

        def supprimer(self) :
                # s'il existe des figures ou des photos sur cette industrie on refuse la suppression
                        z = "Z" + self.__form__["zone"].value
                        n = "N" + self.__form__["numero"].value
                        b = "B" + self.__form__["bis"].value
                        e = "E" + self.__form__["e_ordre"].value
                        rr = archeoconf.image_fullname(z + os.sep + n + os.sep + b + os.sep + e + os.sep + i)
                        try :
                                if os.path.isdir(rr) :
                                        os.rmdir(rr)
                        except :
                                archeoconf.fatalerror_message("Impossible de supprimer le répertoire [%s]" % rr)

                        # on efface l' enlevement
                        self.delete_records(["zone", "numero", "bis", "e_ordre"])
                        return 0

        def creer(self) :
                # si l' enlevement existe, on refuse de le creer
                if self.exist(["zone", "numero", "bis", "e_ordre"]) :
                        primarykeys = { "zone" : None, "numero" : None, "bis": None, "e_ordre": None}
                        return (-1, primarykeys)
                else :
                        # sinon si son parent n'existe pas, on refuse
                        if not self.exist(["zone", "numero", "bis"], table = "galet_amenage") :
                                primarykeys = { "zone" : None, "numero" : None, "bis": None}
                                return (-2, primarykeys)
                        # sinon si son parent existe, on le cree
                        else :
                                # on insère maintenant le enlevement dans la base
                                z = self.__form__["zone"].value
                                n = self.__form__["numero"].value
                                b = self.__form__["bis"].value
                                o = self.__form__["e_ordre"].value
                                self.__db__.query(self.make_insert_query({ }))
                                primarykeys = { "zone" : z, "numero" : n, "bis" : b, "e_ordre" : o}
                                return (0, primarykeys)
