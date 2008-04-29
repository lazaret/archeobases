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
import afficheclefs
import re
import enlevement_biface

class Biface(archeodata.Data) :
        #
        # le nom de la table
        __tablename__ = "biface"
        __new_record__ = "Nouveau"
        __color__ = archeoconf.bas1_bgcolor
        #
        # tous les champs de la table proprietaire
        __champs__ = { 
                        "zone"          : { "type" : "text", "default" : "", "mandatory" : 1 , "longueur" : 0, "memory" : 1}, \
                        "numero"        : { "type" : "decimal", "default" : 0, "mandatory" : 1 , "longueur" : 6, "memory" : 1}, \
                        "bis"           : { "type" : "text", "default" : "", "mandatory" : 1 , "longueur" : 3, "memory" : 1}, \
                        "b_forme"       : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "b_type"        : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "b_base"        : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "b_surface"     : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "b_enlevement"  : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "b_amenagement_bord"  : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "b_amenagement_distal": { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "b_distale"     : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "b_biseau"      : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "b_bord"        : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "b_meplat"      : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "b_extension"   : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "b_symetrie"    : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "b_facture"     : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "b_bilaterale"  : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "b_bifaciale"   : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "b_arete"       : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "b_retouche"    : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "b_support"     : { "type" : "text", "default" : "", "mandatory" : 0, "longueur": 5},  
                        "b_long1"  : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_long2"  : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_long3"  : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_lar1"  : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_l1a" : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_lar2"  : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_lar3"  : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_lar4"  : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_lar5"  : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_e1"  : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_e2"  : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_poids": { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_ind1": { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_ind2": { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_ind3": { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_ind4": { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_ind5": { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_ind6": { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_ind7": { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_ind8": { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_ind9": { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_ind10": { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_ind11": { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_ind12": { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_ind13": { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_ind14": { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_ind15": { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_ind16": { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bc"  : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_nt"  : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_dat1": { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0 }, \
                        "b_dat2": { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0 }, \
                        "b_dat" : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "b_bd1" : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_be1" : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bd2" : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_be2" : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_1t"  : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_2t"  : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bde1" : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bde2": { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bdet": { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_ent" : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bf"  : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_te"  : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bh1" : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bh2" : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bht" : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bi1" : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bi2" : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bit" : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bj1" : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bj2" : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bj"  : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bk1" : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bk2" : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bk"  : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bna" : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bnb" : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bla" : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_blb" : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bla1": { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_blb1": { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bl1" : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bla2": { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_blb2": { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bl2" : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bo1a": { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bo1":  { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bo1b": { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bo2a": { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bo2" : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bo2b": { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bo"  : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bo3a" : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bo3" : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bo3b" : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_p1"  : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_p2"  : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bp1" : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bp2" : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bq1" : { "type" : "decimal", "mandatory" : 0 , "longueur" : 5}, \
                        "b_bq2" : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "b_bq1a": { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "b_bq2a": { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "b_br1" : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "b_br2" : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "b_bv"  : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "b_bx"  : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "b_by"  : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "b_bep" : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "b_bu1" : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "b_bu2" : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "b_bu"  : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "b_bua": { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "b_bu1a": { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "b_bu2a": { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "b_bua"  : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "b_bg"  : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "b_ntf" : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
        }
        #
        # liste des tables enfants
        __listenfants__ = [ "outil"]
        __listeparents__ =["carnet", "industrie"]
        __listeclefs__ = ["zone", "numero", "bis"]
        __vraiparent__ = "industrie"
        
        
        #
        # liste des seuls champs que l'on veut pouvoir modifier
        __listechamps__ = ["zone", "numero", "bis","b_forme", "b_type", "b_base", "b_surface", "b_enlevement", "b_amenagement_bord", "b_amenagement_distal","b_distale", "b_biseau",  "b_bord", "b_meplat", "b_extension", "b_symetrie", "b_bilaterale", "b_facture", "b_bifaciale", "b_arete", "b_retouche", "b_support", "b_long1", "b_long2", "b_long3", "b_lar1","b_l1a","b_lar2","b_lar3", "b_lar4","b_lar5","b_e1","b_e2","b_poids","b_ind1","b_ind2","b_ind3","b_ind4","b_ind5","b_ind6","b_ind7","b_ind8","b_ind9","b_ind10","b_ind11","b_ind12","b_ind13","b_ind14","b_ind15","b_ind16","b_bc","b_nt","b_dat1","b_dat2","b_dat","b_bd1","b_be1","b_bd2","b_be2","b_1t","b_2t","b_bde1","b_bde2","b_bdet","b_ent","b_bf","b_te","b_bh1","b_bh2","b_bht","b_bi1","b_bi2","b_bit","b_bj1","b_bj2","b_bj","b_bk1","b_bk2","b_bk","b_bna","b_bnb","b_bla","b_blb","b_bla1","b_blb1","b_bl1","b_bla2","b_blb2","b_bl2","b_bo1a","b_bo1b","b_bo1","b_bo2a","b_bo2b","b_bo2","b_bo","b_bo3a","b_bo3b","b_bo3","b_p1","b_p2","b_bp1","b_bp2","b_bq1","b_bq2","b_bq1a","b_bq2a","b_br1","b_br2","b_bv","b_bx","b_by","b_bep","b_bu1","b_bu2","b_bu","b_bu1a","b_bu2a","b_bua","b_bg","b_ntf"]
        #
        # liste des champs dans leur ordre de saisie
        __ordrechamps__ =["zone", "numero", "bis","b_forme", "b_type", "b_base", "b_surface", "b_enlevement", "b_amenagement_bord", "b_amenagement_distal","b_distale", "b_biseau",  "b_bord", "b_meplat", "b_extension", "b_symetrie", "b_bilaterale", "b_facture", "b_bifaciale", "b_arete", "b_retouche", "b_support", "b_long1", "b_long2", "b_long3", "b_lar1","b_l1a","b_lar2","b_lar3", "b_lar4","b_lar5","b_e1","b_e2","b_poids","b_ind1","b_ind2","b_ind3","b_ind4","b_ind5","b_ind6","b_ind7","b_ind8","b_ind9","b_ind10","b_ind11","b_ind12","b_ind13","b_ind14","b_ind15","b_ind16","b_bc","b_nt","b_dat1","b_dat2","b_dat","b_bd1","b_be1","b_bd2","b_be2","b_1t","b_2t","b_bde1","b_bde2","b_bdet","b_ent","b_bf","b_te","b_bh1","b_bh2","b_bht","b_bi1","b_bi2","b_bit","b_bj1","b_bj2","b_bj","b_bk1","b_bk2","b_bk","b_bna","b_bnb","b_bla","b_blb","b_bla1","b_blb1","b_bl1","b_bla2","b_blb2","b_bl2","b_bo1a","b_bo1b","b_bo1","b_bo2a","b_bo2b","b_bo2","b_bo","b_bo3a","b_bo3b","b_bo3","b_p1","b_p2","b_bp1","b_bp2","b_bq1","b_bq2","b_bq1a","b_bq2a","b_br1","b_br2","b_bv","b_bx","b_by","b_bep","b_bu1","b_bu2","b_bu","b_bu1a","b_bu2a","b_bua","b_bg","b_ntf"]
        

        __orderby__ = " ORDER BY zone, numero, bis ASC;"

        #
        # liste des formulaires supplementaires
        __formsupp__ = [ "photobiface", "enlevements" ]
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
                else :          
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
                afficheclefs.display_zone( self, enreg, penreg)

        def numero_base_to_form(self, enreg, penreg = None) :
                afficheclefs.display_numero(self, enreg, penreg)

        def bis_base_to_form(self, enreg, penreg = None) :
                afficheclefs.display_bis( self, enreg, penreg)
                self.__doc__.pop()


################################### En entrée ##############################################
        def b_forme_base_to_form(self, enreg, penreg = None) :
                afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_forme","forme", 6, 20, " ", enreg, penreg)
        
        def b_type_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_type","type", 15, 20, "" , enreg, penreg)

        def b_base_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "b_base", "base réservée", enreg, penreg, "", dontchange = 0)

        def b_surface_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "b_surface", "surface réservée", enreg, penreg, "", dontchange = 0)
                self.__doc__.pop()


###########################
        def b_enlevement_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_liste( self, "b_enlevement", "Loc.enlevement", enreg, penreg, " ", dontchange = 0)

        def b_amenagement_bord_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "b_amenagement_bord", "amenag bord", enreg, penreg, "", dontchange = 0)

        def b_amenagement_distal_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "b_amenagement_distal", "amenag ext.dist", enreg, penreg, "", dontchange = 0)
        
        def b_distale_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "b_distale", "ext.distale", enreg, penreg, "", dontchange = 0)
                self.__doc__.pop()
###########################
        def b_biseau_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_liste( self, "b_biseau", "biseau terminal", enreg, penreg, " ", dontchange = 0)

        def b_bord_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "b_bord", "forme bords", enreg, penreg, "", dontchange = 0)

        def b_meplat_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "b_meplat", "meplat latéral", enreg, penreg, "", dontchange = 0)
        
        def b_extension_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "b_extension", "extension enlev", enreg, penreg, "", dontchange = 0)
                self.__doc__.pop()
###########################
        def b_symetrie_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_liste( self, "b_symetrie", "sym medisbilat", enreg, penreg, " ", dontchange = 0)

        def b_bilaterale_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "b_bilaterale", "sym bilat", enreg, penreg, "", dontchange = 0)
        
        def b_facture_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "b_facture", "facture bifac", enreg, penreg, "", dontchange = 0)

        def b_bifaciale_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "b_bifaciale", "sym bifaciale", enreg, penreg, "", dontchange = 0)
                self.__doc__.pop()
###########################
        def b_arete_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_liste( self, "b_arete", "arete latérale", enreg, penreg, " ", dontchange = 0)

        def b_retouche_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "b_retouche", "ret secondaire", enreg, penreg, "", dontchange = 0)

        def b_support_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "b_support", "support", enreg, penreg, "", dontchange = 0)
                self.__doc__.pop()
                
###########################
        def b_long1_base_to_form(self, enreg, penreg = None) :
                afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_long1","L1", 5, 20, " ", enreg, penreg)
        def b_long2_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_long2","L2", 5, 20, "", enreg, penreg)
        def b_long3_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_long3","L3", 5, 20, "", enreg, penreg)
        def b_lar1_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_lar1","l1", 5, 20, "", enreg, penreg)
                #self.__doc__.pop()
                self.__doc__.pop()

###########################
        def b_l1a_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_l1a","l1a", 5, 20, " ", enreg, penreg)
        def b_lar2_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_lar2","l2", 5, 20, "", enreg, penreg)
        def b_lar3_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_lar3","l3", 5, 20, "", enreg, penreg)
        def b_lar4_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_lar4","l4", 5, 20, "", enreg, penreg)
                self.__doc__.pop()
###########################
        def b_lar5_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_lar5","l5", 5, 20, " ", enreg, penreg)
        def b_e1_base_to_form(self, enreg, penreg = None):
                afficheclefs.champ_saisie(self, "b_e1","e1", 5, 20, "", enreg, penreg)
        def b_e2_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_e2","e2", 5, 20, "", enreg, penreg)
        def b_poids_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_poids","poids", 5, 20, "", enreg, penreg)
                self.__doc__.pop()
###########################
        def b_ind1_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_ind1","ind1", 5, 20, " ", enreg, penreg)
        def b_ind2_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_ind2","ind2", 5, 20, "", enreg, penreg)
        def b_ind3_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_ind3","ind3", 5, 20, "", enreg, penreg)
        def b_ind4_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_ind4","ind4", 5, 20, "", enreg, penreg)
                self.__doc__.pop()
###########################
        def b_ind5_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_ind5","ind5", 5, 20, " ", enreg, penreg)
        def b_ind6_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_ind6","ind6", 5, 20, "", enreg, penreg)
        def b_ind7_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_ind7","ind7", 5, 20, "", enreg, penreg)
        def b_ind8_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_ind8","ind8", 5, 20, "", enreg, penreg)
                self.__doc__.pop()
###########################
        def b_ind9_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_ind9","ind9", 5, 20, " ", enreg, penreg)
        def b_ind10_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_ind10","ind10", 5, 20, "", enreg, penreg)
        def b_ind11_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_ind11","ind11", 5, 20, "", enreg, penreg)
        def b_ind12_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_ind12","ind12", 5, 20, "", enreg, penreg)
                self.__doc__.pop()

###########################
        def b_ind13_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_ind13","ind13", 5, 20, " ", enreg, penreg)
        def b_ind14_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_ind14","ind14", 5, 20, "", enreg, penreg)
        def b_ind15_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_ind15","ind15", 5, 20, "", enreg, penreg)
        def b_ind16_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_ind16","ind16", 5, 20, "", enreg, penreg)
                self.__doc__.pop()
###########################
        def b_bc_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_bc","bc", 5, 20, " ", enreg, penreg)
        def b_nt_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_nt","nt", 5, 20, "", enreg, penreg)
                self.__doc__.pop()
###########################
        def b_dat1_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_dat1","dat1", 7, 20, " ", enreg, penreg)

        def b_dat2_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_dat2","dat2", 7, 20, "", enreg, penreg)

        def b_dat_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_dat","dat", 7, 20, "", enreg, penreg)

                self.__doc__.pop()

###########################
        def b_bd1_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_bd1","bd1", 5, 20, " ", enreg, penreg)
        def b_be1_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_be1","be1", 5, 20, "", enreg, penreg)
        def b_bd2_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bd2","bd2", 5, 20, "", enreg, penreg)
        def b_be2_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_be2","be2", 5, 20, "", enreg, penreg)
                self.__doc__.pop()

###########################
        def b_1t_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_1t","1t", 5, 20, " ", enreg, penreg)
        def b_2t_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_2t","2t", 5, 20, "", enreg, penreg)
        def b_bde1_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bde1","bde1", 5, 20, "", enreg, penreg)
        def b_bde2_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bde2","bde2", 5, 20, "", enreg, penreg)
                self.__doc__.pop()

###########################
        def b_bdet_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_bdet","bdet", 5, 20, " ", enreg, penreg)
        def b_ent_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_ent","ent", 5, 20, "", enreg, penreg)
        def b_bf_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bf","bf", 5, 20, "", enreg, penreg)
        def b_te_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_te","te", 5, 20, "", enreg, penreg)
                self.__doc__.pop()

###########################
        def b_bh1_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_bh1","bh1", 5, 20, " ", enreg, penreg)
        def b_bh2_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bh2","bh2", 5, 20, "", enreg, penreg)
        def b_bht_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bht","bht", 5, 20, "", enreg, penreg)
        def b_bi1_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bi1","bi1", 5, 20, "", enreg, penreg)
                self.__doc__.pop()

###########################
        def b_bi2_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_bi2","bi2", 5, 20, " ", enreg, penreg)
        def b_bit_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bit","bit", 5, 20, "", enreg, penreg)
        def b_bj1_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bj1","bj1", 5, 20, "", enreg, penreg)
        def b_bj2_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bj2","bj2", 5, 20, "", enreg, penreg)
                self.__doc__.pop()

###########################
        def b_bj_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_bj","bj", 5, 20, " ", enreg, penreg)
        def b_bk1_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bk1","bk1", 5, 20, "", enreg, penreg)
        def b_bk2_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bk2","bk2", 5, 20, "", enreg, penreg)
        def b_bk_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bk","bk", 5, 20, "", enreg, penreg)
                self.__doc__.pop()

###########################
        def b_bna_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_bna","bna", 5, 20, " ", enreg, penreg)
        def b_bnb_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bnb","bnb", 5, 20, "", enreg, penreg)
        def b_bla_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bla","bla", 5, 20, "", enreg, penreg)
        def b_blb_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_blb","blb", 5, 20, "", enreg, penreg)
                self.__doc__.pop()

###########################
        def b_bla1_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_bla1","bla1", 5, 20, " ", enreg, penreg)
        def b_blb1_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_blb1","blb1", 5, 20, "", enreg, penreg)
        def b_bl1_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bl1","bl1", 5, 20, "", enreg, penreg)
        def b_bla2_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bla2","bla2", 5, 20, "", enreg, penreg)
                self.__doc__.pop()

###########################
        def b_blb2_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_blb2","blb2", 5, 20, " ", enreg, penreg)
        def b_bl2_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bl2","bl2", 5, 20, "", enreg, penreg)
        def b_bo1a_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bo1a","bo1a", 5, 20, "", enreg, penreg)
        def b_bo1b_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bo1b","bo1b", 5, 20, "", enreg, penreg)
                self.__doc__.pop()
##############################
        def b_bo1_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_bo1","bo1", 5, 20, " ", enreg, penreg)
        def b_bo2a_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bo2a","bo2a", 5, 20, "", enreg, penreg)
        def b_bo2b_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bo2b","bo2b", 5, 20, "", enreg, penreg)
        def b_bo2_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bo2","bo2", 5, 20, "", enreg, penreg)
                self.__doc__.pop()
##############################
        def b_bo_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()                
                afficheclefs.champ_saisie(self, "b_bo","bo", 5, 20, " ", enreg, penreg)
        def b_bo3a_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bo3a","bo3a", 5, 20, "", enreg, penreg)
        def b_bo3b_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bo3b","bo3b", 5, 20, "", enreg, penreg)
        def b_bo3_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bo3","bo3", 5, 20, "", enreg, penreg)
                self.__doc__.pop()
###############################
        def b_p1_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()                
                afficheclefs.champ_saisie(self, "b_p1","p1", 5, 20, " ", enreg, penreg)

        def b_p2_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_p2","p2", 5, 20, "", enreg, penreg)
                self.__doc__.pop()
#############################
        def b_bp1_base_to_form(self, enreg, penreg = None) :
               self.__doc__.push() 
               afficheclefs.champ_saisie(self, "b_bp1","bp1", 5, 20, " ", enreg, penreg)
        def b_bp2_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bp2","bp2", 5, 20, "", enreg, penreg)
        def b_bq1_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bq1","bq1", 5, 20, "", enreg, penreg)
                self.__doc__.pop()

###########################
        def b_bq2_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_bq2","bq2", 5, 20, " ", enreg, penreg)
        def b_bq1a_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bq1a","bq1a", 5, 20, "", enreg, penreg)
        def b_bq2a_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bq2a","bq2a", 5, 20, "", enreg, penreg)
        def b_br1_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_br1","br1", 5, 20, "", enreg, penreg)
                self.__doc__.pop()

###########################
        def b_br2_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_br2","br2", 5, 20, " ", enreg, penreg)
        def b_bv_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bv","bv", 5, 20, "", enreg, penreg)
        def b_bx_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bx","bx", 5, 20, "", enreg, penreg)
        def b_by_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_by","by", 5, 20, "", enreg, penreg)
                self.__doc__.pop()

###########################
        def b_bep_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_bep","bep", 5, 20, " ", enreg, penreg)
        def b_bu1_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bu1","bu1", 5, 20, "", enreg, penreg)
        def b_bu2_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bu2","bu2", 5, 20, "", enreg, penreg)
        def b_bu_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bu","bu", 5, 20, "", enreg, penreg)
                self.__doc__.pop()

###########################
        def b_bu1a_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_bu1a","bu1a", 5, 20, " ", enreg, penreg)
        def b_bu2a_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bu2a","bu2a", 5, 20, "", enreg, penreg)
        def b_bua_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bua","bua", 5, 20, "", enreg, penreg)
        def b_bg_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "b_bg","bg", 5, 20, "", enreg, penreg)
                self.__doc__.pop()

###########################
        def b_bntf_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "b_bntf","bntf", 5, 20, " ", enreg, penreg)
                self.__doc__.pop()



###############################################################################
#                               ENLEVEMENTS
###############################################################################
        def enlevements(self, enreg, penreg = None) :
                if enreg != None :
                        self.__doc__.push()
                        self.__doc__.tr()
                        self.__doc__.td(bgcolor = archeoconf.basform_bgcolorcenter, colspan = "2")
                        self.__doc__.font(size = archeoconf.font_size)
                        penreg = { "zone": enreg["zone"], "numero": enreg["numero"], "bis": enreg["bis"] }
                        enlevement_biface.Enlevement_Biface(self).traite_saisie(["zone", "numero", "bis", "eb_rang"], parent = self.__tablename__, penreg = penreg)
                        self.__doc__.pop()



##############################################################################################################################
#                                       LIEN AVEC L'ECRAN FIGURE
##############################################################################################################################
        def figures(self, enreg, penreg = None) :
                if enreg != None :
                        self.__doc__.push()
                        self.__doc__.tr()
                        self.__doc__.td(bgcolor = archeoconf.basform_bgcolorcenter, colspan = "2")
                        self.__doc__.font(size = archeoconf.font_size)
                        penreg = { "zone": enreg["zone"], "groupe": enreg["groupe"], "roche": enreg["roche"], "biface": enreg["biface"] }
                        figure.Figure(self).traite_saisie(["zone", "groupe", "roche", "industrie", "figure"], parent = self.__tablename__, penreg = penreg)
                        self.__doc__.pop()

##############################################################################################################################
#                                               METHODES
##############################################################################################################################

        def modifier(self) :
                """Met a jour la industrie courante"""
                self.__db__.query(self.make_update_query(["zone", "numero", "bis"]))
                return 0

        def supprimer(self) :
                if self.exist(["zone", "numero", "bis"], table = "enlevement_biface"):
                        return -1
                else :
                        # on efface le biface
                        self.delete_records(["zone", "numero", "bis"])
                        return 0

        def creer(self) :
                if not self.exist(["zone", "numero", "bis"], table = "industrie") :
                        primarykeys = { "zone" : None, "numero" : None, "bis": None}
                        return (-2, primarykeys)
                elif self.exist(["zone", "numero", "bis"]) :
                        primarykeys = { "zone" : None, "numero" : None, "bis": None}
                        return (-1, primarykeys)
                else :
                        # on insère maintenant la industrie dans la base
                        z = self.__form__["zone"].value
                        n = self.__form__["numero"].value
                        b = self.__form__["bis"].value
                        self.__db__.query(self.make_insert_query({ }))
                        primarykeys = { "zone" : z, "numero" : n, "bis" : b}
                        return (0, primarykeys)

