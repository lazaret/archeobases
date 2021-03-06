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


import sys
import time
import string
import cgi
import urllib
import archeoconf


class PageRequete(archeoconf.Bas) :
        def ecran_requetes(self, coulfond, coultete, coulhaut, coulpartie, coulmenu, param) :
                self.push()
                self.center()
                self.table(border = "10")

                self.tr(bgcolor = coultete)
                self.td(align="center")

                self.table(border = "2")
                
                self.tr(bgcolor = coultete)
                self.td(align="center")         
                self.form(method = "POST", action = archeoconf.script_location("modcontrole_general"))
                doc.liste_general(param)
                self.pop()
       
        def liste_general(self,  param):
                self.push()
                self.table(border = "2", width = "100%")
                
                self.push()
                self.tr()
                self.th(string.capitalize(param), align = "center", valign = "middle", bgcolor = archeoconf.basform_bgcolorbottom, colspan=2)
                self.pop()
                self.tr()
                self.td(align = "center")
                
                # liste des param 
                query  = "SELECT " + param + ", description  FROM controle_" + param + ";"
                #
                # on recupere la liste des valeurs du param
                res = db.query(query).dictresult()             
                if len(res) :
                        self.select_multiple(name = param, size = 5)
                        res.sort()
                        
                        for enreg in res :
                                if enreg["description"] == None:
                                        val = enreg[param]
                                else:
                                        val = enreg[param] + " " + enreg["description"]
                                if not val :
                                       val = "&nbsp;"
                                self.option(val, value = enreg[param])
                else :        
                        self.p()
                        if param in ["zone","localite", "couche", "nature", "orientation"] : 
                                self.font("Aucune "+ param +" saisie", color = "red")
                        else:   
                                self.font("Aucun "+ param +" saisi", color = "red")
                self.pop()            

                self.br()
                self.insert_text("Nouvelle valeur: ")
                self.text(name = "modif_param", value = "", size=50, maxlength=50)
                self.br()
                self.insert_text("description: ")
                self.text(name = "modif_description", value = "", size=50, maxlength=50)
                self.br()
                self.hidden(name = "param", value = param)
                self.submit(name = "action", value = "AJOUTER")
                self.submit(name = "action", value = "ENLEVER")
                self.reset(value = "ANNULER")


form=cgi.FieldStorage()   #recupere tous les param passes par le script precedent
doc = PageRequete("Modification des contrôles", "Modification des contrôles")
db = archeoconf.ArcheoDataBase()
if form.has_key("champ") :
        param = form["champ"].value
        doc.ecran_requetes(archeoconf.bas_bgcolor,archeoconf.bas_bgcolor,archeoconf.bas_bgcolor,archeoconf.bas_bgcolor,archeoconf.bas_bgcolor, param)
else :
        s = "Contenu du formulaire:\n"
        for k in form.keys() :
                s = s + "%s = %s\n" % (k, form[k].value)
        archeoconf.fatalerror_message(s)

doc.output()

