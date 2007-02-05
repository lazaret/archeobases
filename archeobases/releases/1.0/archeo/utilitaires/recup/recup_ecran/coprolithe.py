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

import os
import string
import archeoconf
import archeodata
import afficheclefs
import re


class Coprolithe(archeodata.Data) :
        #
        # le nom de la table
        __tablename__ = "coprolithe"
        __new_record__ = "Nouveau"
        __color__ = archeoconf.bas_bgcolor
        #
        # tous les champs de la table proprietaire
        __champs__ = { 
                        "zone"              : { "type" : "text", "default" : "", "mandatory" : 1 , "longueur" : 0, "memory" : 1}, \
                        "numero"            : { "type" : "int", "default" : 0, "mandatory" : 1 , "longueur" : 6, "memory" : 1}, \
                        "bis"               : { "type" : "text", "default" : "", "mandatory" : 1 , "longueur" : 0, "memory" : 1}, \
                        "c_longueur"        : { "type" : "int", "default" : 0, "mandatory" : 0 , "longueur" : 3}, \
                        "c_largeur"         : { "type" : "int", "default" : 0, "mandatory" : 0 , "longueur" : 3}, \
                        "c_epaisseur"       : { "type" : "int", "default" : 0, "mandatory" : 0 , "longueur" : 3}, \
                        "c_poids"           : { "type" : "int", "default" : 0, "mandatory" : 0 , "longueur" : 5}, \
                        "c_famille"          : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 20, "memory" : 1 }, \
                        "c_ordre"           : { "type" : "text", "default" : "", "mandatory" : 0, "longueur": 25 , "memory" : 1 }, \
                        "c_genre"           : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 15, "memory" : 1 }, \
                        "c_association"   : { "type" : "int", "default" : "", "mandatory" : 0, "longueur" : 4}, \
                        "c_fragmentation"   : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 4}, \
                        "c_sediment"        : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0}, \
                        "c_couleur"         : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0}, \
                        "c_motif"           : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0}, \
                        "c_motnat"          : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0}, \
                        "c_motcou"          : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0}, \
                        "c_forme"           : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0}, \
                        "c_vol"             : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0}, \
                        "c_volext"          : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0}, \
                        "c_retrecissement"  : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0}, \
                        "c_nombre"          : { "type" : "int", "default" : "0", "mandatory" : 0, "longueur" : 0}, \
                        "c_extremite"       : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0}, \
                        "c_ext1"            : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0}, \
                        "c_ext2"            : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0}, \
                        "c_alteration"      : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0}, \
                        "c_altnat"          : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0}, \
                        "c_inclusion"       : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0}, \
                        "c_incl1"           : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0}, \
                        "c_incl2"           : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0}, \
                        "c_incl3"           : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0}, \
                        "c_element"         : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0}, \
                        "c_granulometrie"   : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0}, \
                        "c_liant"           : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0}, \
                        "c_consistance"     : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0}, \
                        "c_parasito"        : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0}, \
                        "c_palyno"          : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0}, \
                        "c_lame"            : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0}, \
                        "c_autre"           : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0}, \
                        "c_mif"             : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0}, \
                        "c_macroreste"      : { "type" : "text", "default" : "", "mandatory" : 0, "longueur" : 0}, \
                        }
        #
        # liste des tables enfants
        __listenfants__   = []
        __listeparents__  = ["carnet"]
        __listeclefs__    = ["zone", "numero", "bis"]
        __vraiparent__    = "carnet"
        
        
        #
        # liste des seuls champs que l'on veut pouvoir modifier
        __listechamps__ = ["zone", "numero", "bis","c_association","c_fragmentation","c_sediment","c_couleur","c_motif","c_motnat","c_motcou","c_forme","c_vol","c_volext","c_retrecissement","c_nombre","c_extremite","c_ext1","c_ext2","c_alteration","c_altnat","c_inclusion","c_incl1","c_incl2","c_incl3","c_element","c_granulometrie","c_liant","c_consistance","c_ordre","c_famille","c_genre","c_parasito","c_palyno","c_lame","c_autre","c_mif","c_macroreste","c_longueur","c_largeur","c_epaisseur","c_poids"]

        # liste des champs de saisie que l'on souhaite controler
        __controle_saisie__ =["ordre","c_famille","c_genre"]
        #
        # liste des champs dans leur ordre de saisie
        __ordrechamps__ = ["zone", "numero", "bis", "c_association","couche","c_longueur","c_largeur","c_epaisseur","c_poids","c_fragmentation","c_sediment","c_couleur","c_motif","c_motnat","c_motcou","c_forme","c_vol","c_volext","c_retrecissement","c_nombre","c_extremite","c_ext1","c_ext2","c_alteration","c_altnat","c_inclusion","c_incl1","c_incl2","c_incl3","c_element","c_granulometrie","c_liant","c_consistance","c_ordre","c_famille","c_genre","c_parasito","c_palyno","c_lame","c_autre","c_mif","c_macroreste"]

        __orderby__ = " ORDER BY zone, numero, bis ASC;"

        #
        # liste des formulaires supplementaires
        __formsupp__ = [ "photocoprolithe"]

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
                #si le champ doit etre controle alors on verifie si la valeur
                #existe bien dans la liste des valeurs possibles
                if fieldname in self.__controle_saisie__:        
                        if value == None:
                                return 0
                        #else:        
                         #       return -1
                        else:        
                                query = "SELECT * FROM controle_" + fieldname + ";"
                                res = self.__db__.query(query)
                                res = res.dictresult()
                                ok = 0
                                if len(res):
                                        for ctrl in res:
                                                if value == ctrl[fieldname]:
                                                        ok = 1
                                        if not ok:                
                                                return -1
                                        else:
                                                return 0
                                else:
                                        if  (value != None) and (len(value) > self.__champs__[fieldname]["longueur"]) :
                                                return -1       # erreur
                                        else :          
                                     
                                                return 0
                        
                else:      
                        #si la longueur de la valeur issue du formulaire est > a la longueur
                        #definie dans l'attribut longueur des champs
                        if  (value != None) and (len(value) > self.__champs__[fieldname]["longueur"]) :
                               return -1       # erreur
                        else :          
                               return 0
                                                                    
        def champ_verify_old(self, fieldname, value) :
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
                afficheclefs.display_zone(self, enreg, penreg)

        def numero_base_to_form(self, enreg, penreg = None) :
                afficheclefs.display_numero(self, enreg, penreg, 1)

        def bis_base_to_form(self, enreg, penreg = None) :
                afficheclefs.display_bis(self, enreg, penreg)
                self.__doc__.pop()

############################### En sortie ###################################
        def  couche_base_to_form(self, enreg, penreg = None) :
                if enreg != None:
                        liste_clefs = ["zone", "numero", "bis"]
                        self.champ_nsaisie_table("carnet",  liste_clefs, "couche", "couche", 1, 20, "", 1, enreg, penreg)
                self.__doc__.pop()

################################### En entrée ###########################
        def c_association_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_nsaisie(self, "c_association", "association", 4, 20, " ", 1, enreg, penreg)

        ############### 
        def c_fragmentation_base_to_form(self, enreg, penreg = None) :
                afficheclefs.ajoute_ligne(self, "100%", "1", "10", "4")
                self.__doc__.push()
                afficheclefs.champ_nsaisie(self, "c_fragmentation", "fragmentation", 4, 20, "Morphologie", 1, enreg, penreg)
                
        def c_sediment_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_nliste( self, "c_sediment", "sédiment", enreg, penreg, "", "1",dontchange = 0)
                
        def c_couleur_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_nliste( self, "c_couleur", "couleur", enreg, penreg, "", "1",dontchange = 0)
                self.__doc__.pop()
                
         #######
        def c_motif_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_nliste( self, "c_motif", "motif", enreg, penreg, " ", "1",dontchange = 0)
                
        def c_motnat_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_nliste( self, "c_motnat", "motnat", enreg, penreg, "", "1",dontchange = 0)
                
        def c_motcou_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_nliste( self, "c_motcou", "motcou", enreg, penreg, "", "1",dontchange = 0)
                self.__doc__.pop()
                
       #######
        def c_longueur_base_to_form(self, enreg, penreg = None) :
                afficheclefs.ajoute_ligne(self, "100%", "1", "10", "7") 
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "c_longueur", "L", 3, 20, "Dimensions", enreg, penreg)

        def c_largeur_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "c_largeur", "l", 3, 20, "", enreg, penreg)
                self.__doc__.pop()
       #######

        def c_epaisseur_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_saisie(self, "c_epaisseur", "e", 3, 20, " ", enreg, penreg)
                
        def c_poids_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "c_poids", "p", 5, 20, "", enreg, penreg)
                self.__doc__.pop()
               
         #######
        def c_forme_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_nsaisie(self, "c_forme", "forme", 4, 20, " ", 1, enreg, penreg)
                
        def c_vol_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_nliste( self, "c_vol", "vol", enreg, penreg, "", "1",dontchange = 0)
                
        def c_volext_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_nliste( self, "c_volext", "volext", enreg, penreg, "", "1",dontchange = 0)
                self.__doc__.pop()
         #######
        def c_retrecissement_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_nsaisie(self, "c_retrecissement", "rétrécissement", 4, 20, " ", 1, enreg, penreg)
                
        def c_nombre_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_saisie(self, "c_nombre", "nombre", 3, 20, "", enreg, penreg)
                self.__doc__.pop()
                
          #######
        def c_extremite_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_nsaisie(self, "c_extremite", "extrémité", 4, 20, " ", 1, enreg, penreg)
                
        def c_ext1_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_nliste( self, "c_ext1", "ext1", enreg, penreg, "", "1",dontchange = 0)
                
        def c_ext2_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_nliste( self, "c_ext2", "ext2", enreg, penreg, "", "1",dontchange = 0)
                self.__doc__.pop()
         #######
        def c_alteration_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
		afficheclefs.champ_nliste( self, "c_alteration", "alteration", enreg, penreg, " ", 
"1",dontchange = 0)
                
        def c_altnat_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_nliste( self, "c_altnat", "nature", enreg, penreg, "", "1",dontchange = 
0)
                self.__doc__.pop()
         #######
        def c_inclusion_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_nsaisie(self, "c_inclusion", "inclusion", 4, 20, " ", 1, enreg, penreg)
                
        def c_incl1_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_nliste( self, "c_incl1", "incl1", enreg, penreg, "", "1",dontchange = 0)
                self.__doc__.pop()
         #######
        def c_incl2_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_nsaisie(self, "c_incl2", "incl2", 4, 20, " ", 1, enreg, penreg)
                
        def c_incl3_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_nliste( self, "c_incl3", "incl3", enreg, penreg, "", "1",dontchange = 0)
                self.__doc__.pop()
                
         #######
        def c_element_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_nsaisie(self, "c_element", "élément", 4, 20, " ", 1, enreg, penreg)
                
        def c_granulometrie_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_nliste( self, "c_granulometrie", "granulométrie", enreg, penreg, "", "1",dontchange = 0)
                self.__doc__.pop()
         #######
        def c_liant_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_nsaisie(self, "c_liant", "liant", 4, 20, " ", 1, enreg, penreg)
                
        def c_consistance_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_nliste( self, "c_consistance", "consistance", enreg, penreg, "", "1",dontchange = 0)
                self.__doc__.pop()
       #######
        def c_ordre_base_to_form(self, enreg, penreg = None) :
                afficheclefs.ajoute_ligne(self, "100%", "1", "10", "7")
                self.__doc__.push()
                afficheclefs.champ_nsaisie(self, "c_ordre", "ordre", 20, 35, "Détermination", 1, enreg, penreg)
        def c_famille_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_nsaisie(self, "c_famille", "famille", 20, 35, "", 1, enreg, penreg)
        def c_genre_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_nsaisie(self, "c_genre", "genre", 20, 35, "", 1, enreg, penreg)

                self.__doc__.pop()

         #######
        def c_parasito_base_to_form(self, enreg, penreg = None) :
                afficheclefs.ajoute_ligne(self, "100%", "1", "10", "7")
                self.__doc__.push()
                afficheclefs.champ_nsaisie(self, "c_parasito", "parasito", 4, 20, "Etudes", 1, enreg, penreg)
                
        def c_palyno_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_nliste( self, "c_palyno", "palyno", enreg, penreg, "", "1",dontchange = 0)
                
        def c_lame_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_nliste( self, "c_lame", "lames minces", enreg, penreg, "", "1",dontchange = 0)
                self.__doc__.pop()
         #######
        def c_autre_base_to_form(self, enreg, penreg = None) :
                self.__doc__.push()
                afficheclefs.champ_nsaisie(self, "c_autre", "autres", 4, 20, " ", 1, enreg, penreg)
        
        def c_mif_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_nliste( self, "c_mif", "mif", enreg, penreg, "", "1",dontchange = 0)
                
        def c_macroreste_base_to_form(self, enreg, penreg = None) :
                afficheclefs.champ_nliste( self, "c_macroreste", "macrorestes", enreg, penreg, "", "1",dontchange = 0)
                self.__doc__.pop()
        
#########################################################################
#                                PHOTOS
#########################################################################
        def liste_photocoprolithe(self, enreg) :
                resp = self.__db__.query("SELECT * FROM photocoprolithe WHERE zone = " + self.__db__.quote(enreg["zone"], "text") + " AND numero = " + self.__db__.quote(enreg["numero"], "decimal") + " AND bis = " + self.__db__.quote(enreg["bis"], "text")  + " ORDER BY idphoto ASC;")
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
                                self.__doc__.form(method = "POST", action =  archeoconf.script_location("modphotocoprolithe"))
                                self.__doc__.table(border = 5, cellpadding = 5, cellspacing = 5)
                                self.__doc__.tr()

                                self.__doc__.push()
                                self.__doc__.td()
                                self.__doc__.table(border = 0, cellpadding = 0, cellspacing = 0)

                                self.__doc__.push()
                                self.__doc__.tr()
                                self.__doc__.td(valign = "middle", align = "center")
                                photo_url = archeoconf.images_location + "Z" + enreg["zone"] + "/N" + `enreg["numero"]` + "/B" + enreg["bis"]  + "/" + `photo["idphoto"]`
                                self.__doc__.a(href = photo_url + ".jpeg")
                                xmax,ymax = archeoconf.get_imagesize(archeoconf.image_fullname("Z" + enreg["zone"] + os.sep + "N" + `enreg["numero"]` + os.sep + "B" +  enreg["bis"] +  os.sep + `photo["idphoto"]` + "s.jpeg"))
                                self.__doc__.img(src = photo_url + "s.jpeg", width=xmax, height=ymax)
                                self.__doc__.br()
                                self.__doc__.a("original", href = photo_url + ".tiff")
                                self.__doc__.pop()

                                self.__doc__.tr()
                                self.__doc__.td(valign="middle", align="center")
                                self.__doc__.font(size=archeoconf.font_size)
                                self.__doc__.textarea(name = "legende", rows="4", cols="50", wrap="physical")
                                if photo["legende"] == None:
                                        self.__doc__.insert_text("&nbsp;")
                                else :  
                                        self.__doc__.insert_text(photo["legende"])
                                self.__doc__.pop()

                                self.__doc__.td(bgcolor = archeoconf.basform_bgcolorright, valign= "middle", align = "center")
                                self.__doc__.font(size = archeoconf.font_size)
                                self.__doc__.hidden(name = "idphoto", value = photo["idphoto"])
                                self.__doc__.hidden(name = "zone",    value = photo["zone"])
                                self.__doc__.hidden(name = "numero",  value = photo["numero"])
                                self.__doc__.hidden(name = "bis",   value = photo["bis"])
                                self.__doc__.hidden(name = "refer", value = self.__doc__.script_name())
                                self.__doc__.submit(name = "action",  value = "Modifier")
                                self.__doc__.br()
                                self.__doc__.submit(name = "action",  value = "Supprimer")
                                self.__doc__.br()
                                self.__doc__.submit(name = "action",  value = "Nouvelle")

                                self.__doc__.pop()
                        self.__doc__.pop()
                else :
                        self.__doc__.push()
                        self.__doc__.form(method = "POST", action = archeoconf.script_location("modphotocoprolithe"))
                        self.__doc__.hidden(name = "zone", value = enreg["zone"])
                        self.__doc__.hidden(name = "numero", value = enreg["numero"])
                        self.__doc__.hidden(name = "bis", value = enreg["bis"])
                        self.__doc__.submit(name = "action", value = "Nouvelle image")
                        self.__doc__.pop()
                        self.__doc__.font("aucune image", color = "red", size = archeoconf.font_size)

        def menu_photocoprolithe(self, enreg, color, function) :
                if enreg != None :
                        self.__doc__.push()
                        self.__doc__.tr()
                        self.__doc__.td(bgcolor = color, colspan = "2")
                        self.__doc__.font(size = archeoconf.font_size)
                        self.__doc__.div(align = "center")
                        function(enreg)
                        self.__doc__.pop()

        def photocoprolithe(self, enreg, penreg = None) :
                self.menu_photocoprolithe(enreg, archeoconf.basform_bgcolormiddle, self.liste_photocoprolithe)


###############################################################################
#                                METHODES
##############################################################################

        def modifier(self) :
                """Met a jour la coprolithe courante"""
                self.__db__.query(self.make_update_query(["zone", "numero", "bis"]))
                return 0

        def supprimer(self) :
               # s'il existe des figures ou des photos sur cette coprolithe on refuse la suppression
                if self.exist(["zone", "numero", "bis"], table = "photocoprolithe") :
                        return -1
                else :
                        z = "Z" + self.__form__["zone"].value
                        n = "N" + self.__form__["numero"].value
                        b = "B" + self.__form__["bis"].value
                        rr = archeoconf.image_fullname(z + os.sep + n + os.sep + b + os.sep)
                        try :
                                if os.path.isdir(rr) :
                                        os.rmdir(rr)
                        except :
                                archeoconf.fatalerror_message("Impossible de supprimer le répertoire [%s]" % rr)

                        # on efface l' coprolithe
                        self.delete_records(["zone", "numero", "bis"])
                        return 0

        def creer(self) :
                # si la coprolithe n'existe pas déjà alors on la crée, sinon on refuse
                if self.exist(["zone", "numero", "bis"], table = "coprolithe") :
                        primarykeys = { "zone" : None, "numero" : None, "bis": None}
                        return (-1, primarykeys)
                else :
                        # on insère maintenant le coprolithe dans la base
                        # sauf si le carnet n'existe pas.
                        if not self.exist(["zone", "numero", "bis"], table = "carnet") :
                                primarykeys = { "zone" : None, "numero" : None, "bis": None}
                                return (-2, primarykeys)
                        else :
                                # on insère maintenant la coprolithe dans la base
                                z = self.__form__["zone"].value
                                n = self.__form__["numero"].value
                                b = self.__form__["bis"].value
                                requete = (self.make_insert_query({ }))
                                if requete is None :
                                        return (1, primarykeys)
                                        primarykeys = { "zone" : z, "numero" : n, "bis" : b}
                                else:
                                        self.__db__.query(requete)
                                        primarykeys = { "zone" : z, "numero" : n, "bis" : b}
                                        return (0, primarykeys)









