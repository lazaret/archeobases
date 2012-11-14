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

import os
import string
import cgi
import jahtml


# ces fonctions sont dupliquées volontairement d'archeoconf.py
# ne pas toucher !
def getConfig():
    fconfig = open("/etc/bego.conf")
    exec(fconfig)
    fconfig.close()
    return {'cgipath': cgipath, 'docpath': docpath,'bases' : bases}

config = getConfig()

def getCookies():
    cooker = {}
    if os.environ.has_key("HTTP_COOKIE"):
        cookies = os.environ["HTTP_COOKIE"]
        split = map(string.strip, string.split(cookies, ";"))
        for (name, value) in map(lambda c : string.split(c, "=", 1), split):
            cooker[name] = value
    return cooker

cookies = getCookies()

def positionne_cookie(doc):
    doc.insert_text('<META HTTP-EQUIV="Set-Cookie" CONTENT="basechoisie=%s;" />' % basechoisie)
    doc.pop()
    doc.body(bgcolor="white")
    doc.push()
    doc.insert_text("Vous avez choisi de travailler sur la base")
    doc.strong(basechoisie)
    doc.pop()
    doc.push()
    doc.p("Un nom d'utilisateur et un mot de passe vont vous être demandés lorsque vous cliquerez sur")
    doc.strong("Connexion !")
    doc.pop()
    doc.form(action="bego/main.py", method="POST")
    doc.submit(name="submit", value="Connexion !")

x = jahtml.CGI_document()
x.html()
x.push()
x.head()
form = cgi.FieldStorage()
if form.has_key("base") and (form["base"].value in config["bases"].keys()):
    # étape de positionnement du cookie
    # qui restera actif jusqu'à ce que l'on ferme le navigateur
    #
    basechoisie = form["base"].value
    positionne_cookie(x)
else:
    x.title("Choix de la Base de données")
    x.pop()
    x.body(bgcolor="white")
    basechoisie = cookies.get("basechoisie", None)
    if (not form.has_key("base")) and (basechoisie is not None) and (basechoisie in config["bases"].keys()):
        # bon cookie déjà positionné, on reste sur l'application
        # voir pb de frames, on risque d'être en bas...
        x.set_redirect("bego/main.py")
    else :
        # on affiche la liste des bases et on choisit l'une d'entre elles
        x.form(action = x.script_name(), method="POST")
        x.push()
        x.p()
        x.select(name="base")
        # on cree une liste à partir du dictionnaire 'config'
        liste_bases = config["bases"].keys()
        # on trie la liste
        liste_bases.sort()
        for base in liste_bases:
            x.option(base, value=base)
        x.pop()
        x.p()
        x.submit(name="submit", value="Connexion !")
x.output()
