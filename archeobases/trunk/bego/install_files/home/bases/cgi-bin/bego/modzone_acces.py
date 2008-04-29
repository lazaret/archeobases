#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Mont Bego - (c) 1999-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#


import cgi
import string
import urllib
import begoconf
import afficheclefs


def liste_multiple(doc, nom, valeurs, param) :
        doc.push()
        doc.select_multiple(name = nom, size = 4 )
        for a in valeurs :
                doc.option(a[param], value = a[param])
        doc.pop()

def liste(database, doc, form, param) :
        (z) = recupere_champs(database, form)
        #
        #
        where = " WHERE zone = %s" % (z)
        # liste des acces faisant partie de la zone
        qassoc = "SELECT " + param + " FROM " + param + ", zone_"+ param  + where + " AND " + param + ".id" + param + " = zone_" + param + ".id" + param
        #
        # liste des figures n'en faisant pas partie
        # on pourrait aussi toutes les selectionner et faire le test par programme.
        qautres = "SELECT " + param + " FROM " + param + " WHERE " + param + " NOT IN (" + qassoc

        #
        # on recupere les deux listes
        presents = database.query(qassoc + ";").dictresult()
        absents = database.query(qautres + ");").dictresult()

        doc.form(method = "POST", action = doc.script_name())

        doc.push()
        doc.tr()
        doc.td(colspan=3, align="center", valign="center")
	doc.table( bgcolor = begoconf.basform_bgcolorleft)
        doc.push()
	doc.td()
        doc.pop()
        dico = afficheclefs.form_to_enreg(form)
        afficheclefs.display_zone(doc, dico, alignement="center")
        doc.pop()

        doc.push()
        doc.tr()
        doc.td(valign = "middle", align="center", colspan=3)
        doc.hidden(name="param", value=param)
        doc.submit(name = "action",  value = "Fin Modif")
        doc.pop()

	doc.push()
        doc.tr()
	doc.push()
        doc.td(align="center", valign="center")
        doc.insert_text("Liste " + string.capitalize(param) + " hors de la zone")
        doc.br()
	zp = "zone_" + param + "_absents"
        liste_multiple(doc, zp, absents, param)
        doc.pop()

        doc.push()
        doc.td(align = "center", valign = "middle")
        doc.submit(name = "action",  value = "Ajouter -->")
        doc.br()
        doc.submit(name = "action",  value = "<-- Enlever")
        doc.pop()

	doc.push()
        doc.td(align = "center", valign = "middle")
        doc.insert_text("Liste " + string.capitalize(param) + " dans la zone")
        doc.br()
        zp = "zone_" + param + "_presents"
        liste_multiple(doc, zp, presents, param)
        doc.pop()
	doc.pop()

def menu_zone(database, doc, form, param) :
        doc.push()
        doc.div(align="center")
        doc.table(border=5, bgcolor = begoconf.basform_bgcolorleft, cellspacing = 5, cellspading = 5 )
        doc.tr()
        doc.td(bgcolor = begoconf.basform_bgcolormiddle, colspan = "2")
        doc.font(size = begoconf.font_size)
        doc.div(align = "center")
        liste(database, doc, form, param)
        doc.pop()

def recupere_champs(database, form) :
        zone = database.quote(form["zone"].value, "decimal")
        return (zone)

def enlever(database, form, liste, param) :
        z = recupere_champs(database, form)
        where = "WHERE zone = " + z
        query = "DELETE FROM zone_" + param + " " + where + " AND "
        for a in liste :
                id = "(SELECT id" + param + " FROM " + param + "  WHERE " + param + "= %s)" % (database.quote(a,"text"))
                query = query + "id" + param + " = " + id + " OR "
        query = query[:-4] + ";"
        return database.query(query)

def recupere_id(database, form, ac, param) :
        query = "SELECT id" + param + " FROM " + param + " WHERE " + param + "=%s" %(database.quote(ac,"text"))
        return (database.query(query).dictresult()[0]["id" + param])

def ajouter(database, form, liste, param) :
        z = recupere_champs(database, form)
        # on fait une transaction pour que si l'un des insert echoue on fasse comme si tous ont
        # echoué
        # je ne sais pas si c'est vraiment utile ou pas.
        query = "BEGIN TRANSACTION;\n"
        for a in liste :
                ac = recupere_id(database, form, a, param)
                query = query + "INSERT INTO zone_" + param + " (zone,id" + param +") VALUES (" + `z` +"," + `ac` + ");\n"
        query = query + "COMMIT TRANSACTION;"
        return database.query(query)

def recupere_liste(nomliste) :
        liste = []
        if type(form[nomliste]) == type([]) : # plusieurs acces sélectionnés
                for a in form[nomliste] :
                        liste.append(a.value)
        else :
                liste.append(form[nomliste].value)
        return liste

doc = begoconf.Bas("Modification d'une zone", "Modification d'une zone")
db = begoconf.BegoDataBase(username = "bego")
form = cgi.FieldStorage()
if form.has_key("action") :
        if form.has_key("param") :
                param = form["param"].value
                dico = {"param": param, "action": "Modifier", "zone": form["zone"].value}
                urlretour = "?" + urllib.urlencode(dico)
                if form["action"].value == "<-- Enlever" :
                        if form.has_key("zone_" + param + "_presents") :
                                enlever(db, form, recupere_liste("zone_" + param + "_presents"), param)
                        else :
                                begoconf.log_message("aucun " + param + " a supprimer de la zone", level = "info")
                        doc.set_redirect(begoconf.script_location("modzone_acces") + urlretour)
                elif form["action"].value == "Ajouter -->" :
                        if form.has_key("zone_" + param + "_absents") :
                                ajouter(db, form, recupere_liste("zone_" + param + "_absents"), param)
                        else :
                                begoconf.log_message("Rien a rajouter", level = "info")
                        doc.set_redirect(begoconf.script_location("modzone_acces") + urlretour)
                elif form["action"].value == "Modifier" :
                        menu_zone(db, doc, form, param)
                elif form["action"].value == "Fin Modif":
                        doc.set_redirect(begoconf.script_location("modzone") + urlretour)
                else :
                        begoconf.log_message("%s: Action %s non reconnue" % (doc.script_name(), form["action"].value), level = "info")
                        doc.set_redirect(begoconf.script_location("modzone") + urlretour)
else :
        cgi.test()

doc.output()
