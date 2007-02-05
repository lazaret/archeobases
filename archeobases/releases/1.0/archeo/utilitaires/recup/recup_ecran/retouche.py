#! /usr/bin/python
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
# $Id: retouche.py,v 1.14 2002/07/08 16:32:56 rachel Exp $
#
# $Log: retouche.py,v $
# Revision 1.14  2002/07/08 16:32:56  rachel
# Dernieres modifs
#
# Revision 1.13  2001/11/16 14:03:28  rachel
# *** empty log message ***
#
# Revision 1.12  2001/07/10 13:45:49  rachel
# pleins de modifs: nouveau+1 ok, lien vers enfants ok
#
# Revision 1.11  2001/07/05 15:29:33  rachel
# plein de modifs
#
# Revision 1.10  2001/04/05 09:44:34  rachel
# remise en place des modfis pour le +1 qui fonctionne.
# de plus les listes et le champ numeros sont bien en dontchange =0 lors de nouveau comptage ou bien recherche.
# il doit falloir que je generalise pour que cela s'applique a tous les chmaps.
# il faut aussi que je fasse les modifs pour les liens ainsi que popur les chmaps a memoriser.
#
# Revision 1.9  2001/03/20 19:59:52  jerome
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

class Retouche(archeodata.Data) :
        

        #
        # le nom de la table
        __tablename__ = "retouche"
        __new_record__ = "Nouvelle"
        __color__ = archeoconf.bas2_bgcolor
        #
        # tous les champs de la table proprietaire
        __champs__ = { 
                        "zone"          : { "type" : "text", "default" : "", "mandatory" : 1 , "longueur" : 0, "memory" : 1}, \
                        "numero"        : { "type" : "decimal", "default" : 0, "mandatory" : 1 ,"longueur" : 6, "memory" : 1}, \
                        "bis"           : { "type" : "text", "default" : "", "mandatory" : 1 ,"longueur" : 0, "memory" : 1}, \
                        "r_ordre"       : { "type" : "decimal", "default" : 1, "mandatory" : 1 ,"longueur" : 2}, \
                        "r_type"        : { "type" : "text", "default" : "", "mandatory" : 0 ,"longueur" : 0}, \
                        "r_obliquite"   : { "type" : "text", "default" : "", "mandatory" : 0 ,"longueur" : 0}, \
                        "r_denticulation"   : { "type" : "text", "default" : "", "mandatory" : 0 ,"longueur" : 0}, \
                        "r_cas"         : { "type" : "text", "default" : "", "mandatory" : 0 ,"longueur" : 0}, \
                        "r_utilisation" : { "type" : "text", "default" : "", "mandatory" : 0 ,"longueur" : 0}, \
                        "r_dimension"   : { "type" : "text", "default" : "", "mandatory" : 0 ,"longueur" : 0}, \
                        "r_association" : { "type" : "text", "default" : "", "mandatory" : 0 ,"longueur" : 0}, \
                        "r_superposition": { "type" : "text", "default" : "", "mandatory" : 0 ,"longueur" : 0}, \
                        "r_extremite"   : { "type" : "text", "default" : "", "mandatory" : 0 ,"longueur" : 0}, \
                        "r_bord"        : { "type" : "text", "default" : "", "mandatory" : 0 ,"longueur" : 0}, \
                        "r_extension"   : { "type" : "decimal", "mandatory" : 0 ,"longueur" : 3}, \
                        "r_frequence"   : { "type" : "text", "default" : "", "mandatory" : 0 ,"longueur" : 0}, \
                        "r_ecrasement"  : { "type" : "text", "default" : "", "mandatory" : 0 ,"longueur" : 0}, \
                        "r_lustrage"    : { "type" : "text", "default" : "", "mandatory" : 0 ,"longueur" : 0}, \
                        "r_biseau"      : { "type" : "text", "default" : "", "mandatory" : 0 ,"longueur" : 0}, \
                        "r_strie"       : { "type" : "text", "default" : "", "mandatory" : 0 ,"longueur" : 0}, \
                        "r_origine"     : { "type" : "text", "default" : "", "mandatory" : 0 ,"longueur" : 0}, \
                        "r_destination" : { "type" : "text", "default" : "", "mandatory" : 0 ,"longueur" : 0}, \
                        "r_sens"        : { "type" : "text", "default" : 
"", "mandatory" : 0 ,"longueur" : 0}, \
                        "r_tranchant"   : { "type" : "text", "default" : "" , "mandatory" : 0 ,"longueur" : 0}, \
                        "r_relation"    : { "type" : "text", "default" : "" , "mandatory" : 0 ,"longueur" : 0}, \
                      }
        #
        # liste des tables enfants
        __listenfants__ = []
        __listeclefs__ = ["zone", "numero", "bis", "r_ordre"]
        __vraiparent__ = "industrie"
        __listparents__ = ["industrie"]
        
        
        #
        # liste des seuls champs que l'on veut pouvoir modifier
        __listechamps__ = ["zone", "numero", "bis", "r_ordre","r_type", "r_obliquite", "r_denticulation", "r_cas",  "r_dimension", "r_association", "r_superposition", "r_extremite", "r_bord", "r_extension", "r_frequence", "r_ecrasement", "r_lustrage", "r_utilisation", "r_strie", "r_origine", "r_destination", "r_sens", "r_tranchant", "r_relation"] 

        #
        # liste des champs dans leur ordre de saisie
        __ordrechamps__ = ["zone", "numero", "bis", "r_ordre","r_type", "r_obliquite", "r_denticulation", "r_cas",  "r_dimension", "r_association", "r_superposition", "r_extremite", "r_bord", "r_extension", "r_frequence", "r_ecrasement", "r_lustrage", "r_utilisation", "r_strie", "r_origine", "r_destination", "r_sens", "r_tranchant", "r_relation" ]

        __orderby__ = " ORDER BY zone, numero, bis ASC;"

        #
        # liste des formulaires supplementaires
        __formsupp__ = []

        def __init__(self, parent, nomtable = None) :
                self.__tablename__ = nomtable
                archeodata.Data.__init__(self, parent)

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

        def r_ordre_verify(self, fieldname, value) :
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
                self.__doc__.td(align="center", colspan="8")
                self.__doc__.insert_text("RETOUCHES IRREGULIERES")
                self.__doc__.push()
                self.__doc__.tr()
                self.__doc__.td()
                self.__doc__.insert_text(" ")
                self.__doc__.pop()
                afficheclefs.display_zone( self, enreg, penreg)

        def numero_base_to_form(self, enreg, penreg = None) :
                afficheclefs.display_numero(self, enreg, penreg)

        def bis_base_to_form(self, enreg, penreg = None) :
                afficheclefs.display_bis( self, enreg, penreg)

        def r_ordre_base_to_form(self, enreg, penreg = None) :
                afficheclefs.display_x_ordre(self, "r_ordre", 1, 15, enreg, penreg)
                self.__doc__.pop()


################################### En entr�e ##############################################
        def r_type_base_to_form(self, enreg, penreg = None) :
                #afficheclefs.ajoute_ligne(self, "100%", "1", "10", "5")
                self.__doc__.push()
                afficheclefs.champ_liste( self, "r_type", "type", enreg, penreg, "Decsription", dontchange = 0)

        def r_obliquite_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "r_obliquite", "obliquite", enreg, penreg, "", dontchange = 0)

        def r_denticulation_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "r_denticulation", "denticulation", enreg, penreg, "", dontchange = 0)
                self.__doc__.pop()
#################"        
        def r_cas_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_liste( self, "r_cas", "cas", enreg, penreg, " ", dontchange = 0)

        def r_dimension_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "r_dimension", "dimension", enreg, penreg, "", dontchange = 0)
                self.__doc__.pop()
#######################
        def r_association_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_liste( self, "r_association", "association", enreg, penreg, " ", dontchange = 0)
 
        def r_superposition_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "r_superposition", "superposition", enreg, penreg, "", dontchange = 0)

        def r_extremite_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "r_extremite", "extremite", enreg, penreg, "", dontchange = 0)
                self.__doc__.pop()
#########################
        def r_bord_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_liste( self, "r_bord", "bord", enreg, penreg, " ", dontchange = 0)

        def r_extension_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "r_extension", "extension", 3, 20, "", enreg, penreg)

        def r_frequence_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "r_frequence", "frequence", enreg, penreg, "", dontchange = 0)
                self.__doc__.pop()
#######################""

        def r_ecrasement_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_liste( self, "r_ecrasement", "ecrasement", enreg, penreg, " ", dontchange = 0)
 
        def r_lustrage_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "r_lustrage", "lustrage", enreg, penreg, "", dontchange = 0)

        def r_utilisation_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "r_utilisation", "utilisation", enreg, penreg, "", dontchange = 0)
                self.__doc__.pop()
#######################""

        def r_strie_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_liste( self, "r_strie", "strie", enreg, penreg, " ", dontchange = 0)
 
        def r_origine_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "r_origine", "origine", enreg, penreg, "", dontchange = 0)

        def r_destination_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_liste( self, "r_destination", "destination", enreg, penreg, "", dontchange = 0)
                self.__doc__.pop()

########################

        def r_sens_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_liste( self, "r_sens", "sens", enreg, penreg, " ", dontchange = 0)

        def r_tranchant_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "r_tranchant", "tranchant", 7, 20, "", enreg, penreg)

        def r_relation_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "r_relation", "relation", 6, 20, "", enreg, penreg)
                self.__doc__.pop()


##############################################################################################################################
#                                               METHODES
##############################################################################################################################

        def modifier(self) :
                """Met a jour l'retouche courant"""
                self.__db__.query(self.make_update_query(["zone", "numero", "bis", "r_ordre"]))
                return 0

        def supprimer(self) :

                        # on efface l' retouche
                self.delete_records(["zone", "numero", "bis", "r_ordre"])
                return 0

        def creer(self) :
                # si la retouche existe, on refuse de le creer
                if self.exist(["zone", "numero", "bis", "r_ordre"]) :
                        primarykeys = { "zone" : None, "numero" : None, "bis": None, "r_ordre": None}
                        return (-1, primarykeys)
                else :
                        # sinon si son parent n'existe pas, on refuse
                        if not self.exist(["zone", "numero", "bis"], table = "industrie") :
                                primarykeys = { "zone" : None, "numero" : None, "bis": None}
                                return (-2, primarykeys)
                        # sinon si son parent existe, on le cree
                        else :
                                # on ins�re maintenant le retouche dans la base
                                z = self.__form__["zone"].value
                                n = self.__form__["numero"].value
                                b = self.__form__["bis"].value
                                o = self.__form__["r_ordre"].value
                                self.__db__.query(self.make_insert_query({ }))
                                primarykeys = { "zone" : z, "numero" : n, "bis" : b, "r_ordre" : o}
                                return (0, primarykeys)
