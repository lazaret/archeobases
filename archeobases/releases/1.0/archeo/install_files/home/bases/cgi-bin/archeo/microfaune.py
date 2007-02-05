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
# $Id: microfaune.py,v 1.6 2001/11/09 08:32:36 rachel Exp $
#
# $Log: microfaune.py,v $
# Revision 1.6  2001/11/09 08:32:36  rachel
# tout plein de modifs pdt que CVS ne fonctionnait pas
#
# Revision 1.5  2001/07/18 15:07:19  rachel
# plein de modifs
#
# Revision 1.4  2001/07/17 14:02:26  rachel
# modif des ecrans existants
#
# Revision 1.3  2001/07/05 15:29:16  rachel
# plein de modifs
#
# Revision 1.2  2001/06/01 08:28:16  rachel
# petites modifs pour entre autres permettre de verouiler les champs de la clef. Le nouveau+1 fonctionne pour le carnet mais il pose pb pour les autres ecrans ou les champs ne sont pas memorise(essais faits sur faune)
#
# Revision 1.1  2001/05/29 15:22:50  rachel
# ajout de trois ecran :mesure des os, mesure des dent, microfaune
#
# Revision 1.10  2001/04/05 09:44:33  rachel
# remise en place des modfis pour le +1 qui fonctionne.
# de plus les listes et le champ numeros sont bien en dontchange =0 lors de nouveau comptage ou bien recherche.
# il doit falloir que je generalise pour que cela s'applique a tous les chmaps.
# il faut aussi que je fasse les modifs pour les liens ainsi que popur les chmaps a memoriser.
#
# Revision 1.9  2001/03/20 19:59:50  jerome
# Ajout des tags CVS Id et Log
#
#
#
import faune
import string
import archeoconf
import archeodata
import afficheclefs
import re

class Microfaune(archeodata.Data) :
        #
        # le nom de la table
        __tablename__ = "microfaune"
        __new_record__ = "Nouvelle"
        __color__ = archeoconf.bas_bgcolor
        #
        # tous les champs de la table proprietaire
        __champs__ = { 
                        "zone"           : { "type" : "text", "default" : "", "mandatory" : 1, "longueur" : 0 }, \
                        "numero"         : { "type" : "decimal", "default" : 0, "mandatory" : 1, "longueur" : 6 }, \
                        "bis"            : { "type" : "text", "default" : "", "mandatory" : 1 , "longueur" : 0}, \
                        "mf_serie"       : { "type" : "text", "default" : "1", "mandatory" : 1 , "longueur" : 2}, \
                        "mf_type"        : { "type" : "text", "default" : "", "mandatory" : 1 , "longueur" : 0}, \
                        "mf_m1"          : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "mf_m2"          : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "mf_m3"          : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "mf_m4"          : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "mf_m5"          : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "mf_m6"          : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "mf_m7"          : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "mf_m8"          : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "mf_m9"          : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "mf_m10"          : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "mf_m11"          : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "mf_m12"          : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "mf_m13"          : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "mf_m14"          : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "mf_m15"          : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "mf_m16"          : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "mf_m17"          : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "mf_m18"          : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "mf_m19"          : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "mf_m20"          : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "mf_m21"          : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "mf_m22"          : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "mf_m23"          : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "mf_m24"          : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "mf_m25"          : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "mf_m26"          : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "mf_m27"          : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "mf_m28"          : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "mf_m29"          : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "mf_m30"          : { "type" : "decimal", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \

                        }
        #
        # liste des tables enfants
        __listenfants__ = []
        __listeparents__ = ["carnet", "faune"] 
        __listeclefs__ = ["zone", "numero", "bis", "mf_serie", "mf_type"]
        __vraiparent__ = "faune"
        
        
        #
        # liste des seuls champs que l'on veut pouvoir modifier
        __listechamps__ = ["zone", "numero", "bis", "mf_serie", "mf_type", "mf_m1","mf_m2","mf_m3","mf_m4","mf_m5","mf_m6","mf_m7","mf_m8","mf_m9","mf_m10","mf_m11","mf_m12","mf_m13","mf_m14","mf_m15","mf_m16","mf_m17","mf_m18","mf_m19","mf_m20","mf_m21","mf_m22","mf_m23","mf_m24","mf_m25","mf_m26","mf_m27","mf_m28","mf_m29","mf_m30"]

        #
        # liste des champs dans leur ordre de saisie
        __ordrechamps__ = ["zone", "numero", "bis", "mf_serie", "mf_type", "mf_m1","mf_m2","mf_m3","mf_m4","mf_m5","mf_m6","mf_m7","mf_m8","mf_m9","mf_m10","mf_m11","mf_m12","mf_m13","mf_m14","mf_m15","mf_m16","mf_m17","mf_m18","mf_m19","mf_m20","mf_m21","mf_m22","mf_m23","mf_m24","mf_m25","mf_m26","mf_m27","mf_m28","mf_m29","mf_m30"]

        __orderby__ = " ORDER BY zone, numero, bis, mf_serie, mf_type ASC;"

        #
        # liste des formulaires supplementaires
        __formsupp__ = []

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

        def mf_serie_verify(self, fieldname, value) :
                if value == '' :
                        return -1
                else :
                        return 0

        def mf_type_verify(self, fieldname, value) :
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

        def mf_serie_base_to_form(self, enreg, penreg = None) :
                afficheclefs.display_x_serie(self, "mf_serie", "10",enreg, penreg)

        def mf_type_base_to_form(self, enreg, penreg = None) :
                afficheclefs.display_type(self, "mf_type", enreg, penreg) 
                self.__doc__.pop()

################################### En entrée ########################################
        def mf_m1_base_to_form(self, enreg, penreg = None) :
                afficheclefs.ajoute_ligne(self, "100%", "1", "10", "10")
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "mf_m1", "M1", 6, 20," ", enreg,  penreg)
        def mf_m2_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "mf_m2", "M2", 6, 20,"", enreg,  penreg)
        def mf_m3_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "mf_m3", "M3", 6, 20,"", enreg,  penreg)
        def mf_m4_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "mf_m4", "M4", 6, 20,"", enreg,  penreg)
        def mf_m5_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "mf_m5", "M5", 6, 20,"", enreg,  penreg)
                self.__doc__.pop()

        def mf_m6_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "mf_m6", "M6", 6, 20," ", enreg,  penreg)
        def mf_m7_base_to_form(self, enreg, penreg = None): 
                afficheclefs.champ_saisie(self, "mf_m7", "M7", 6, 20,"", enreg,  penreg)
        def mf_m8_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "mf_m8", "M8", 6, 20,"", enreg,  penreg)
        def mf_m9_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "mf_m9", "M9", 6, 20,"", enreg,  penreg)
        def mf_m10_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "mf_m10", "M10", 6, 20,"", enreg,  penreg)
                self.__doc__.pop()

        def mf_m11_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "mf_m11", "M11", 6, 20," ", enreg,  penreg)
        def mf_m12_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "mf_m12", "M12", 6, 20,"", enreg,  penreg)
        def mf_m13_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "mf_m13", "M13", 6, 20,"", enreg,  penreg)
        def mf_m14_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "mf_m14", "M14", 6, 20,"", enreg,  penreg)
        def mf_m15_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "mf_m15", "M15", 6, 20,"", enreg,  penreg)
                self.__doc__.pop()

        def mf_m16_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "mf_m16", "M16", 6, 20," ", enreg,  penreg)
        def mf_m17_base_to_form(self, enreg, penreg = None): 
                afficheclefs.champ_saisie(self, "mf_m17", "M17", 6, 20,"", enreg,  penreg)
        def mf_m18_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "mf_m18", "M18", 6, 20,"", enreg,  penreg)
        def mf_m19_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "mf_m19", "M19", 6, 20,"", enreg,  penreg)
        def mf_m20_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "mf_m20", "M20", 6, 20,"", enreg,  penreg)
                self.__doc__.pop()

        def mf_m21_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "mf_m21", "M21", 6, 20," ", enreg,  penreg)
        def mf_m22_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "mf_m22", "M22", 6, 20,"", enreg,  penreg)
        def mf_m23_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "mf_m23", "M23", 6, 20,"", enreg,  penreg)
        def mf_m24_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "mf_m24", "M24", 6, 20,"", enreg,  penreg)
        def mf_m25_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "mf_m25", "M25", 6, 20,"", enreg,  penreg)
                self.__doc__.pop()

        def mf_m26_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "mf_m26", "M26", 6, 20," ", enreg,  penreg)
        def mf_m27_base_to_form(self, enreg, penreg = None): 
                afficheclefs.champ_saisie(self, "mf_m27", "M27", 6, 20,"", enreg,  penreg)
        def mf_m28_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "mf_m28", "M28", 6, 20,"", enreg,  penreg)
        def mf_m29_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "mf_m29", "M29", 6, 20,"", enreg,  penreg)
        def mf_m30_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "mf_m30", "M30", 6, 20,"", enreg,  penreg)
                self.__doc__.pop()

##############################################################################################################################
#                                               METHODES
##############################################################################################################################

        def modifier(self) :
                """Met a jour la micro courante"""
                self.__db__.query(self.make_update_query(["zone", "numero", "bis", "mf_serie", "mf_type"]))
                return 0

        def supprimer(self) :
                # on efface la microfaune sur éclat
                self.delete_records(["zone", "numero", "bis", "mf_serie", "mf_type"])
                return 0

        def creer(self) :
                # si la microfaune n'existe pas déjà alors on la crée, sinon on refuse
                if self.exist(["zone", "numero", "bis", "mf_serie", "mf_type"]) :
                        primarykeys = { "zone" : None, "numero" : None, "bis": None, "o_ordre": None,"mf_serie" : None, "mf_type" : None}
                        return (-1, primarykeys)
                else :
                        # on insère maintenant la microfaune dans la base
                        # sauf si la faune n'existe pas.
                        if not self.exist(["zone", "numero", "bis"], table = "faune") :
                                primarykeys = { "zone" : None, "numero" : None, "bis": None, "mf_serie": None, "mf_type": None}
                                return (-2, primarykeys)
                        else :
                                # on insère maintenant la microfaune dans la base
                                z = self.__form__["zone"].value
                                n = self.__form__["numero"].value
                                b = self.__form__["bis"].value
                                s = self.__form__["mf_serie"].value
                                t = self.__form__["mf_type"].value
                                self.__db__.query(self.make_insert_query({ }))
                                primarykeys = { "zone" : z, "numero" : n, "bis" : b, "mf_serie" : s, "mf_type" : t }
                                return (0, primarykeys)



