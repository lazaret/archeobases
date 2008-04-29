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
import enlevement_galet
import retouche
import stigmate
import fracture_industrie


class Galet_amenage(archeodata.Data) :
        #
        # le nom de la table
        __tablename__ = "galet_amenage"
        __new_record__ = "Nouveau"
        __color__ = archeoconf.bas1_bgcolor

        #
        # tous les champs de la table proprietaire
        __champs__ = { 
                        "zone"          : { "type" : "text", "default" : "", "mandatory" : 1 , "longueur" : 0, "memory" : 1}, \
                        "numero"        : { "type" : "decimal", "default" : 0, "mandatory" : 1 , "longueur" : 6, "memory" : 1}, \
                        "bis"           : { "type" : "text", "default" : "", "mandatory" : 1 , "longueur" : 0, "memory" : 1}, \
                        "ga_ordre"      : { "type" : "int", "default" : 0, "mandatory" : 1 , "longueur" : 2, "memory" : 1}, \
                        "ga_type"       : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "ga_facture"    : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "ga_qualite"    : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "ga_nba"        : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_nbb"        : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_nbp"        : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_forme"      : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "ga_arete"      : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "ga_obliquite"  : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "ga_orientation": { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "ga_retouche"   : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "ga_relation"   : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 7}, \
                        "ga_cha"        : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chb"        : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chc"        : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chd"        : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_che"        : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chde"       : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chf"        : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 0}, \
                        "ga_chg"        : { "type" : "text", "default" : "", "mandatory" : 0 , "longueur" : 75}, \
                        "ga_chh"        : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chi"        : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chj"        : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chk"        : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chna"       : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chnb"       : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chl"        : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chm"        : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_cho"        : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chp"        : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chq"        : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chqq"       : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chr"        : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chrg"       : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chrd"       : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chrr"       : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chs"        : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_cht"        : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chu"        : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chw1"       : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chw2"       : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chv1"       : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chv2"       : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chv3"       : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chx"        : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chxx"       : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chy"        : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chyy"       : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chz1"       : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chz2"       : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chz3"       : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        "ga_chz4"       : { "type" : "decimal", "mandatory" : 0 , "longueur" : 3}, \
                        
                }
        #
        # liste des tables enfants
        __listenfants__ = []
        __listeparents__ = ["carnet", "industrie"]
        __listeclefs__ = ["zone", "numero", "bis"]
        __vraiparent__ = "industrie"
        
        
        #
        # liste des seuls champs que l'on veut pouvoir modifier
        __listechamps__ = ["zone", "numero", "bis","ga_ordre", "ga_type", "ga_facture", "ga_qualite","ga_nba", "ga_nbb", "ga_nbp", "ga_forme", "ga_arete", "ga_orientation", "ga_obliquite","ga_retouche", "ga_relation", "ga_cha", "ga_chb", "ga_chc", "ga_chd", "ga_che", "ga_chde", "ga_chf","ga_chg" ,"ga_chh",  "ga_chi", "ga_chj", "ga_chk", "ga_chna", "ga_chnb", "ga_chl", "ga_chm", "ga_cho", "ga_chp", "ga_chq" , "ga_chqq", "ga_chr", "ga_chrg", "ga_chrd", "ga_chrr", "ga_chs", "ga_cht", "ga_chu", "ga_chw1", "ga_chw2", "ga_chv1" , "ga_chv2", "ga_chv3", "ga_chx", "ga_chxx","ga_chy",  "ga_chyy", "ga_chz1", "ga_chz2", "ga_chz3", "ga_chz4"]


        #
        # liste des champs dans leur ordre de saisie
        __ordrechamps__ = ["zone", "numero", "bis","ga_ordre","ga_type", "ga_facture", "ga_qualite", "ga_nba", "ga_nbb", "ga_nbp","ga_forme", "ga_arete", "ga_orientation", "ga_obliquite","ga_retouche", "ga_relation", "ga_cha", "ga_chb", "ga_chc", "ga_chd", "ga_che", "ga_chde", "ga_chf","ga_chg" ,"ga_chh",  "ga_chi", "ga_chj", "ga_chk", "ga_chna", "ga_chnb", "ga_chl", "ga_chm", "ga_cho", "ga_chp", "ga_chq" , "ga_chqq", "ga_chr", "ga_chrg", "ga_chrd", "ga_chrr", "ga_chs", "ga_cht", "ga_chu", "ga_chw1", "ga_chw2", "ga_chv1" , "ga_chv2", "ga_chv3", "ga_chx", "ga_chxx","ga_chy",  "ga_chyy", "ga_chz1", "ga_chz2", "ga_chz3", "ga_chz4"]


        __orderby__ = " ORDER BY zone, numero, bis ASC;"

        #
        # liste des formulaires supplementaires
        __formsupp__ = ["enlevements"]

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

        def ga_ordre_verify(self, fieldname, value) :
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
                afficheclefs.display_numero(self, enreg, penreg, 0)

        def bis_base_to_form(self, enreg, penreg = None) :
                afficheclefs.display_bis( self, enreg, penreg)

        def ga_ordre_base_to_form(self, enreg, penreg = None) :
                afficheclefs.display_x_ordre(self, "ga_ordre", 0, 15, enreg, penreg)
                self.__doc__.pop()

################################### En entrée 
        def ga_type_base_to_form(self, enreg, penreg = None) :
                afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
                self.__doc__.push()
                self.__doc__.push()
                afficheclefs.champ_liste( self, "ga_type", "type", enreg, penreg, "Description", dontchange = 0)
        
        def ga_facture_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "ga_facture", "facture", enreg, penreg, "", dontchange = 0)
        
        def ga_qualite_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "ga_qualite", "qualite", enreg, penreg, "", dontchange = 0)
                self.__doc__.pop()
########################
        def ga_nba_base_to_form(self, enreg, penreg = None) :
                afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "ga_nba", "nb A", 3, 20, "Nb enlèvements", enreg, penreg)
        
        def ga_nbb_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_nbb", "nb B", 3, 20, "", enreg, penreg)
        
        def ga_nbp_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_nbp", "nb P", 3, 20, "", enreg, penreg)
                self.__doc__.pop()
                
##################
        def ga_forme_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_liste( self, "ga_forme", "forme", enreg, penreg, " ", dontchange = 0)

        def ga_arete_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "ga_arete", "arête", enreg, penreg, "", dontchange = 0)

        def ga_orientation_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "ga_orientation", "orientation", enreg, penreg, "", dontchange = 0)
                self.__doc__.pop()

########################
        def ga_obliquite_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_liste( self, "ga_obliquite", "obliquité", enreg, penreg, " ", dontchange = 0)

        def ga_retouche_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "ga_retouche", "retouches", enreg, penreg, "", dontchange = 0)

        def ga_relation_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_relation", "relation", 5, 20, "", enreg, penreg)
                self.__doc__.pop()
                
###################
        def ga_cha_base_to_form(self, enreg, penreg = None) :
                afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "ga_cha", "CHa", 3, 20, "Dimension", enreg, penreg)

        def ga_chb_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_chb", "CHb", 3, 20, "", enreg, penreg)

        def ga_chc_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_chc", "CHc", 3, 20, "", enreg, penreg)
                self.__doc__.pop()
##
        def ga_chd_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "ga_chd", "CHd", 3, 20, "Nb enlevements", enreg, penreg)
        def ga_che_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_che", "CHe", 3, 20, "", enreg, penreg)

        def ga_chde_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_chde", "CHde", 3, 20, "", enreg, penreg)

        def ga_chf_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie( self, "ga_chf", "CHf", 3,20,"",enreg, penreg)
                self.__doc__.pop()
##
        def ga_chg_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie_area(self, "ga_chg", "CHg", 2, 35, 3, "Formule", enreg, penreg)
                self.__doc__.pop()
##
        def ga_chh_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "ga_chh", "CHh", 3, 20, "Profil du tanchant", enreg, penreg)

        def ga_chi_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_chi", "CHi", 3, 20, "", enreg, penreg)

        def ga_chj_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_chj", "CHj", 3, 20, "", enreg, penreg)

        def ga_chk_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_chk", "CHk", 3, 20, "", enreg, penreg)
                self.__doc__.pop()
#
        def ga_chna_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "ga_chna", "CHnA", 3, 20, " ", enreg, penreg)

        def ga_chnb_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_chnb", "CHnB", 3, 20, "", enreg, penreg)

        def ga_chl_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_chl", "CHl", 3, 20, "", enreg, penreg)

        def ga_chm_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_chm", "CHm", 3, 20, "", enreg, penreg)
                self.__doc__.pop()
#
        def ga_cho_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "ga_cho", "CHo", 3, 20, "forme du tranchant", enreg, penreg)

        def ga_chp_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_chp", "CHp", 3, 20, "", enreg, penreg)

        def ga_chq_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_chq", "CHq", 3, 20, "", enreg, penreg)

        def ga_chqq_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_chqq", "CHqq", 3, 20, "", enreg, penreg)
                self.__doc__.pop()
#
        def ga_chr_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "ga_chr", "CHr", 3, 20, " ", enreg, penreg)

        def ga_chrg_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_chrg", "CHrg", 3, 20, "", enreg, penreg)

        def ga_chrd_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_chrd", "CHrd", 3, 20, "", enreg, penreg)

        def ga_chrr_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_chrr", "CHrr", 3, 20, "", enreg, penreg)
                self.__doc__.pop()
#
        def ga_chs_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push() 
                afficheclefs.champ_saisie(self, "ga_chs", "CHs", 3, 20, " ", enreg, penreg)

        def ga_cht_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_cht", "CHt", 3, 20, "", enreg, penreg)

        def ga_chu_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_chu", "CHu", 3, 20, "", enreg, penreg)

        def ga_chw1_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_chw1", "CHw1", 3, 20, "", enreg, penreg)
                self.__doc__.pop()
#
        def ga_chw2_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "ga_chw2", "CHw2", 3, 20, " ", enreg, penreg)

        def ga_chv1_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_chv1", "CHv1", 3, 20, "", enreg, penreg)

        def ga_chv2_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_chv2", "CHv2", 3, 20, "", enreg, penreg)

        def ga_chv3_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_chv3", "CHv3", 3, 20, "", enreg, penreg)
                self.__doc__.pop()
#
        def ga_chx_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "ga_chx", "CHx", 3, 20, "Degré d'épannelage", enreg, penreg)

        def ga_chxx_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_chxx", "CHxx", 3, 20, "", enreg, penreg)

        def ga_chy_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_chy", "CHy", 3, 20, "", enreg, penreg)

        def ga_chyy_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_chyy", "CHyy", 3, 20, "", enreg, penreg)
                self.__doc__.pop()
#
        def ga_chz1_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "ga_chz1", "CHx1", 3, 20, " ", enreg, penreg)

        def ga_chz2_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_chz2", "CHx2", 3, 20, "", enreg, penreg)

        def ga_chz3_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_chz3", "CHx3", 3, 20, "", enreg, penreg)

        def ga_chz4_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "ga_chz4", "CHx4", 3, 20, "", enreg, penreg)
                self.__doc__.pop()
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
                        enlevement_galet.Enlevement_Galet(self).traite_saisie(["zone", "numero", "bis", "ga_rang", "eg_rang"], parent = self.__tablename__, penreg = penreg)
                        self.__doc__.pop()



#######################################################################################
#                                       METHODES
########################################################################################

        def modifier(self) :
                self.__db__.query(self.make_update_query(["zone", "numero", "bis","ga_ordre"]))
                return 0

        def supprimer(self) :
                if self.exist(["zone", "numero", "bis", "ga_ordre"], table = "enlevement_galet") :
                        return -1
                else :
                        # on efface le ga
                        self.delete_records(["zone", "numero", "bis", "ga_ordre"])
                        return 0

        def creer(self) :
                # si le galet n'existe pas déjà alors on la crée, sinon on refuse
                if self.exist(["zone", "numero", "bis", "ga_ordre"]) :
                        primarykeys = { "zone" : None, "numero" : None, "bis": None, "ga_ordre":None}
                        return (-1, primarykeys)
                else :
                        # on insère maintenant le galet dans la base
                        # sauf si l'industrie n'existe pas.
                        if not self.exist(["zone", "numero", "bis"], table = "industrie") :
                                primarykeys = { "zone" : None, "numero" : None, "bis": None}
                                return (-2, primarykeys)
                        else :
                                # on insère maintenant le ga dans la base
                                z = self.__form__["zone"].value
                                n = self.__form__["numero"].value
                                b = self.__form__["bis"].value
                                o = self.__form__["ga_ordre"].value
                                self.__db__.query(self.make_insert_query({ }))
                                primarykeys = { "zone" : z, "numero" : n, "bis" : b, "ga_ordre" : o}
                                return (0, primarykeys)

