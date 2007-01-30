#!  /usr/local/bin/python
#
# montbego - (c) 1999      Jerome ALET <alet@unice.fr>
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
# $Id: parametre.py,v 1.1.1.1 2000/11/06 08:33:18 jerome Exp $
#
# $Log: parametre.py,v $
# Revision 1.1.1.1  2000/11/06 08:33:18  jerome
# Reintroduction dans CVS apres modifs
#
# Revision 1.9  2000/06/30 07:02:39  rachel
# modifs effectuees pdt un long laps de temps sans reseau ...
#
# Revision 1.8  2000/05/27 13:59:03  jerome
# Intégration du message de Log
#
#

import sys
import time
import string
import cgi
import urllib
import begoconf

class PageRequete(begoconf.Bas) :
        def ecran_requetes(self, coulfond, coultete, coulhaut, coulpartie, coulmenu, param) :
                self.push()
                self.center()
                self.table(border = "10")

                self.tr(bgcolor = coultete)
                self.td(align="center")

                self.table(border = "2")
                
                self.tr(bgcolor = coultete)
                self.td(align="center")         
                self.form(method = "POST", action = begoconf.script_location("modparametre_valid"))
                doc.liste_zone_general(param)
                self.pop()
       
        def liste_zone_general(self,  param):
                self.push()
                self.table(border = "2", width = "100%")
                
                self.push()
                self.tr()
                self.th(string.capitalize(param), align = "center", valign = "middle", bgcolor = begoconf.basform_bgcolorbottom)
                self.pop()
                self.tr()
                self.td(align = "center")
                
                # liste des param appartenant a la zone
                query  = "SELECT " + param + " FROM " + param + ";"
                #
                # on recupere la liste des param de la zone
                res = db.query(query).dictresult()             
                if len(res) :
                        self.select_multiple(name = param, size = 5)
                        res.sort()
                        for enreg in res :
                                val = enreg[param]
                                if not val :
                                        val = "&nbsp;"
                                self.option(val, value = val)
                else :        
                        self.p()
                        if param in ["tourbiere", "moraine", "vegetation"] : 
                                self.font("Aucune "+ param +" saisie", color = "red")
                        else:   
                                self.font("Aucun "+ param +" saisi", color = "red")
                self.pop()            
                self.br()
                self.insert_text("Nouveau: ")
                self.text(name = "modif", value = "", size=50, maxlength=50)
                self.br()
                self.hidden(name = "param", value = param)
                self.submit(name = "action", value = "AJOUTER")
                self.submit(name = "action", value = "ENLEVER")
                self.reset(value = "ANNULER")


form=cgi.FieldStorage()   #recupere tous les param passes par le script precedent
doc = PageRequete("Modification des Paramètres", "Modification des Paramètres")
db = begoconf.BegoDataBase(username = "bego")

for p in ['acces', 'sentier', 'sommet', 'col', 'lac', 'torrent', 'tourbiere', 'eboulis', 'moraine', 'glacier', 'vegetation'] : 
        doc.ecran_requetes("#CCCCCC","#CCFFFF","#FFFFCC","#CCCCCC","#FFFFCC", p)

doc.output()

