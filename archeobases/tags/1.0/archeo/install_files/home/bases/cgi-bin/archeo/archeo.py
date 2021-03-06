#! /usr/bin/python 

import sys
import os
import string
import cgi
import jahtml

# ces fonctions sont dupliqu�es volontairement d'archeoconf.py
# ne pas toucher !
def getConfig() :
        fconfig = open("/etc/archeo.conf")
        exec(fconfig)
        fconfig.close()
        return { 'cgipath' : cgipath, 'docpath' : docpath, 'bases' : bases }
config = getConfig()        
        
def getCookies() :
        cooker = {}
        if os.environ.has_key("HTTP_COOKIE") :
                cookies = os.environ["HTTP_COOKIE"]
                split = map(string.strip, string.split(cookies, ";"))      
                for (name, value) in map(lambda c : string.split(c, "="), split) :
                        cooker[name] = value
        return cooker                        
cookies = getCookies()
                                
def positionne_cookie(doc) :                                
        doc.insert_text('<META HTTP-EQUIV="Set-Cookie" CONTENT="basechoisie=%s;" />' % basechoisie)
        doc.pop()
        doc.body(bgcolor="white")
        doc.push()
        doc.insert_text("Vous avez choisi de travailler sur la base")
        doc.strong(basechoisie)
        doc.pop()
        doc.push()
        doc.p("Un nom d'utilisateur et un mot de passe vont vous �tre demand�s lorsque vous cliquerez sur")
        doc.strong("Connexion !")
        doc.pop()
        doc.form(action = "archeo/main.py", method="POST")
        doc.submit(name="submit", value="Connexion !")
        
x = jahtml.CGI_document()
x.html()
x.push()
x.head()
form = cgi.FieldStorage()                                
if form.has_key("base") and (form["base"].value in config["bases"].keys()) :
        # �tape de positionnement du cookie
        # qui restera actif jusqu'� ce que l'on ferme le navigateur
        #
        basechoisie = form["base"].value
        positionne_cookie(x)
else :        
        x.title("Choix de la Base de Donn�es")
        x.pop()
        x.body(bgcolor = "white")
        basechoisie = cookies.get("basechoisie", None)
        if (not form.has_key("base")) and (basechoisie is not None) and (basechoisie in config["bases"].keys()) :
                # bon cookie d�j� positionn�, on reste sur l'application
                # voir pb de frames, on risque d'�tre en bas...
                x.set_redirect("archeo/main.py")
        else :        
                # on affiche la liste des bases et on choisit l'une d'entre elles
                x.form(action = x.script_name(), method="POST")
                x.push()
                x.p()
                x.select(name = "base")
                for base in config["bases"].keys() :
                        x.option(base, value=base)
                x.pop()        
                x.p()
                x.submit(name="submit", value="Connexion !")
                        
x.output()
