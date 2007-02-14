#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Collection - (c) 2006-2007 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
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
import cgi
import urllib
import collectionconf
import afficheclefs
import collectiondata

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


doc = collectionconf.Bas("Modification des paramètres", "Modification d'une zone")
db = collectionconf.CollectionDataBase()
form = cgi.FieldStorage()

if form.has_key("param") :
        param = form["param"].value
else :
        modif_param = None

if form["action"].value == "ENLEVER" :
        if param and form.has_key(param):
                enlever(db, form, recupere_liste(param), param)
        else :
                collectionconf.log_message("aucun " + param + " a supprimer ", level = "info")
        dico = { "champ" : param }
        doc.set_redirect(collectionconf.script_location("controle_general") + "?" + urllib.urlencode(dico))

elif form["action"].value == "AJOUTER" :
        if form.has_key("modif_param") :
                if param :
                        if form.has_key("modif_description"):
                                ajouter(db, form, param)
                        else:
                                ajouter_param(db, form, param)
                dico = { "champ" : param }
                doc.set_redirect(collectionconf.script_location("controle_general") + "?" + urllib.urlencode(dico))
                collectionconf.log_message("Rien a rajouter", level = "info")
#                doc.set_redirect(collectionconf.script_location("controle_general"))
        else :
                #ajouter(db, form, param)
                collectionconf.log_message("Rien a rajouter", level = "info")
                #doc.set_redirect(collectionconf.script_location("controle_general"))
                dico = { "champ" : param }
                doc.set_redirect(collectionconf.script_location("controle_general") + "?" + urllib.
urlencode(dico))

else :
        collectionconf.fatalerror_message("Aucune action à effectuer !")

doc.output()



