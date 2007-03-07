#! /usr/bin/python
#
# Archeo - (c) 1999      Jerome ALET <alet@unice.fr>
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
# $Id: modcontrole_general.py,v 1.4 2002/01/10 21:32:39 jerome Exp $
#
# $Log: modcontrole_general.py,v $
# Revision 1.4  2002/01/10 21:32:39  jerome
# Debuggage de pas mal de merdouilles
#
# Revision 1.3  2001/07/05 15:29:22  rachel
# plein de modifs
#
# Revision 1.2  2001/03/20 19:59:42  jerome
# Ajout des tags CVS Id et Log
#
#
#
import os
import cgi
import urllib
import archeoconf
import afficheclefs
import archeodata

#cgi.test()

#def liste_multiple(doc, nom, valeurs, param) :
#        doc.push()
#        doc.select_multiple(name = nom, size = 4 )
#        for a in valeurs :
#                doc.option(a[param], value = a[param])
#        doc.pop()

def enlever(database, form, liste, param) :
        query = "DELETE FROM controle_" + param + " WHERE "
        #string.split(liste)
        for a in liste :
                query = query + param + " = %s OR " % (database.quote(a,"text"))
        query = query[:-4] + ";"        
        return database.query(query)

def recupere_liste(nomliste) :
        liste = []
        if type(form[nomliste]) == type([]) : # plusieurs options sélectionnées 
                for a in form[nomliste] :                    
                        liste.append(a.value)
        else :
                liste.append(form[nomliste].value)
        return liste

def ajouter(database, form, param) :
        query   = "INSERT INTO controle_" + param + " (" + param + ",description) VALUES ('" + form["modif_param"].value + "','" + form["modif_description"].value + "');" 
        return database.query(query)

def ajouter_param(database, form, param) :
        query   = "INSERT INTO controle_" + param + " (" + param + ") VALUES ('" + form["modif_param"].value + "');" 
        return database.query(query)


doc = archeoconf.Bas("Modification des paramètres", "Modification d'une zone")
db = archeoconf.ArcheoDataBase()
form = cgi.FieldStorage()

if form.has_key("param") :
        param = form["param"].value
else :
        modif_param = None

if form["action"].value == "ENLEVER" :
        if param and form.has_key(param):
                enlever(db, form, recupere_liste(param), param)
        else :
                archeoconf.log_message("aucun " + param + " a supprimer ", level = "info")
        dico = { "champ" : param }
        doc.set_redirect(archeoconf.script_location("controle_general") + "?" + urllib.urlencode(dico))

elif form["action"].value == "AJOUTER" :
        if form.has_key("modif_param") :
                if param :
                        if form.has_key("modif_description"):
                                ajouter(db, form, param)
                        else:
                                ajouter_param(db, form, param)
                dico = { "champ" : param }
                doc.set_redirect(archeoconf.script_location("controle_general") + "?" + urllib.urlencode(dico))
                archeoconf.log_message("Rien a rajouter", level = "info")
#                doc.set_redirect(archeoconf.script_location("controle_general"))
        else :
                #ajouter(db, form, param)
                archeoconf.log_message("Rien a rajouter", level = "info")
                #doc.set_redirect(archeoconf.script_location("controle_general"))
                dico = { "champ" : param }
                doc.set_redirect(archeoconf.script_location("controle_general") + "?" + urllib.
urlencode(dico))

else :
        archeoconf.fatalerror_message("Aucune action à effectuer !")

doc.output()



