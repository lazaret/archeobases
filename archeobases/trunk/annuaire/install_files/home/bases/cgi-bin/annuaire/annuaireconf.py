#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Collection - (c) 2000-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#


import string

#### Debut de la partie configurable ####

#
# nom de l'application
author_name  = "Rachel Vaudron & Bertrand Lecervoisier"
author_email = "root@lazaret.unice.fr"

#
# commandes popur changer la taille des images
mogrify_normale  = '/usr/bin/mogrify -format tiff -quality 100'
mogrify_Grande  = '/usr/bin/mogrify -format jpeg -interlace Plane -geometry "1280>x1280>" -quality 75'
mogrify_Moyenne = '/usr/bin/mogrify -format jpeg -interlace Plane -geometry "640>x640>" -quality 50'
mogrify_Petite  = '/usr/bin/mogrify -format jpeg -interlace Plane -geometry "320>x320>" -quality 50'
mogrify_small   = '/usr/bin/mogrify -format jpeg -interlace Plane -geometry "160>x160>" -quality 50'

#
# Message de copyright
copyright_msg       = "ANNUAIRE &copy; 2008 " + author_name
copyright_link      = "mailto:" + author_email
copyright_font_size = "-3"

#
# Couleurs de fond des trois parties de l'ecran ou None
menu_bgcolor   = "#EAEAEA"
gauche_bgcolor = "#EAEAEA"
bas_bgcolor    = "#EAEAEA"
bas1_bgcolor   = "#A3B3C4"
bas2_bgcolor   = "#FFF8CE"
bas3_bgcolor   = "#F3EEEE"
bas4_bgcolor   = "#E1DCD6"
lien_parent_bgcolor = "#FF0000"
lien_enfant_bgcolor = "#3333FF"

#
# Images de fond des trois parties de l'ecran ou None
menu_background   = "#FFFFFF"
gauche_background = "#FFFFFF"
bas_background    = "#FFFFFF"

#
# couleurs de fond des formulaires de chaque partie de l'ecran
menuform_bgcolor      = "#96ADC4"
basform_bgcolorleft   = "#FFFFCC"
basform_bgcolorright  = "#DFDFDF"
basform_bgcolormiddle = "#DDDDDD"
basform_bgcolorbottom = "#CCCCCC"
basform_bgcolorcenter = "#CCCCCC"

#
# Logos
petit_logo_bas    = None
petit_logo_gauche = None
gros_logo         = None

# Liens sur les logos
petit_logo_bas_link    = None
petit_logo_gauche_link = None
gros_logo_link         = None

#
# taille de la police par defaut
font_size = -1

#### Fin de la partie configurable ####

#
# Rien ne devrait être modifie après cette ligne
import sys
import os
import time
import jahtml
import database
import Image

utilisateur_courant = os.environ.get("REMOTE_USER", None)

#
# fonction qui insere le message de copyright
def copyright(doc) :
        doc.hr_noshade(width='66%')
        doc.div(align = "center")
        doc.font(size = copyright_font_size)
        doc.a(copyright_msg, href = copyright_link)
#
# Fonction qui renvoie l'heure courante sous forme texte
def heurecourante() :
        return time.asctime(time.localtime(time.time()))

#
# Fonction de sortie des messages d'erreur non fatale
def log_message(msg, level = "error") :
        message = "[%s] [%s] [%s] %s\n" % (heurecourante(), level, utilisateur_courant, msg)
        sys.stderr.write(message)
        sys.stderr.flush()
        return message

#
# Fonction de sortie des messages d'erreur fatale
def fatalerror_message(msg) :
        log_message(msg)
        page = jahtml.CGI_document()
        page.default_header("ERREUR")
        page.body(bgcolor = "white")
        page.p("[%s]" % heurecourante(), align = "center")
        page.push()
        page.p(align = "left")
        page.font(msg, color = "red", size = "+2")
        page.pop()
        page.p(align="center")
        page.font(size="+2")
        page.insert_text("Imprimez et archivez cette page.")
        page.br()
        page.insert_text("Contactez d'urgence l'")
        page.a("Administrateur", href="mailto:" + author_email)
        page.insert_text(" !!!")
        copyright(page)
        page.output()
        sys.exit(0)

def getConfig() :
        fconfig = open("/etc/annuaire.conf")
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

def getBase() :
        if not cookies.has_key("annuairechoisi") :
                doc = jahtml.CGI_document()
                doc.set_redirect("/cgi-bin/annuaire.py")
                doc.output()
                sys.exit(0)
        else :
                return cookies["annuairechoisi"]
base_courante = getBase()

if base_courante not in config["bases"].keys() :
        fatalerror_message("Base temporairement inaccessible : travaux en cours...")

if (utilisateur_courant not in config["bases"][base_courante]["admins"]) \
   and (utilisateur_courant not in config["bases"][base_courante]["users"]) \
   and (utilisateur_courant not in config["bases"][base_courante]["visitors"]) :
        fatalerror_message("Accès non autorisé !!!")

# Quels sont les superutilisateurs de cette base ?
superusers   = config["bases"][base_courante]["admins"]

#
# Emplacement des programmes et données de l'application
app_location      = "/cgi-bin/annuaire/"
decors_location   = "/annuaire/decors/"
images_location   =  "/annuaire/" + base_courante + "/image/"
images_directory  =  os.path.join(config["docpath"], "annuaire", base_courante, "image") + os.sep
help_location     = "/annuaire/manuel/"
manuel_location   = "/annuaire/manuel"
lexique_location  = "/annuaire/lexique"
site_location     = "/annuaire/site/" + base_courante +".html"
#
# Fonction qui renvoie l'url complete d'un script
def script_location(script) :
        if script != None :
                return app_location + script + ".py"

#
# Fonction qui renvoie le nom complet d'une image
def image_fullname(image) :
        if image != None :
                return images_directory + image

#
# Fonction qui renvoie l'url dans lequel sont les images
def image_location(image) :
        if image != None :
                return images_location + image

#
# Fonction qui renvoie l'url dans lequel sont les decors
def decor_location(image) :
        if image != None :
                return decors_location + image

#
# fonction qui passe la premiere lettre en majuscules et
# le reste en minuscules
def capstring(str) :
        return string.capitalize(string.lower(string.strip(str)))

#
# fonction qui renvoie les dimensions d'une image
def get_imagesize(filename) :
        try :
                image = Image.open(filename)
                s = image.size
                image.fp.close()
        except IOError, msg:
                log_message("Problème d'accès au fichier %s : %s" % (filename, msg))
                s = 0,0
        return s

#
# fonction qui recupere le nom simple du parent (ex: roche pour face, face pour figure...)
def getparent() :
        http_referer = os.environ["HTTP_REFERER"]
        if http_referer :
                # on garde tout ce qui est apres le dernier slash, jusqu'au point d'interrogation
                inter = string.find(http_referer, '?')
                if inter != -1 :
                        http_referer = http_referer[string.rfind(http_referer, '/') + 1: inter]
                else :
                        http_referer = http_referer[string.rfind(http_referer, '/') + 1:]
        script_name = os.environ["SCRIPT_NAME"]
        if script_name :
                script_name = script_name[string.rfind(script_name, '/') + 1:]
        if http_referer and script_name and (http_referer[:7] != 'menu.py') and (http_referer != script_name) :
                p = http_referer[3:]    # on enleve le "mod" du debut du nom du script
                if p[:5] != "photo" :
                        p = p[:-3]              # on enleve le ".py" de la fin
                        return p

#
# Classes specifiques
class AnnuaireDataBase(database.DataBase) :
        def __init__(self, username = utilisateur_courant, debuglevel = 1) :
                database.DataBase.__init__(self, database = base_courante, username = username, debuglevel = debuglevel)

        def fatal_message(self, msg) :
                fatalerror_message(msg)

class Main(jahtml.CGI_document) :
        def __init__(self, titre) :
                jahtml.CGI_document.__init__(self)
                self.default_header(titre)

        def dessine_cadre(self, menu, bas) :
                ruser = utilisateur_courant
                if (ruser not in config["bases"][base_courante]["admins"]) and (ruser not in config["bases"][base_courante]["users"]) :
                        self.set_redirect(script_location("bas"))
                else :
                        self.frameset(rows="120,*", border="0")
                        self.push()
                        self.frame(name="menu", src=menu, scrolling="no")
                        self.pop()
                        self.frame(name="bas", src=bas)

class Menu(jahtml.CGI_document) :
        def __init__(self, titre) :
                jahtml.CGI_document.__init__(self)
                self.default_header(titre)
                self.body(bgcolor = menu_bgcolor, background = decor_location(menu_background))
                self.push()
                self.div(align = "center")
                self.pop()

class Controle(jahtml.CGI_document) :
        def __init__(self, titre) :
                jahtml.CGI_document.__init__(self)
                self.default_header(titre)
                self.body(bgcolor = menu_bgcolor, background = decor_location(menu_background))
                self.push()
                self.div(align = "center")
                self.pop()

class Bas(jahtml.CGI_document) :
        def __init__(self, titre, soustitre = "") :
                jahtml.CGI_document.__init__(self)
                self.set_indentstring("")
                self.default_header(titre)
                self.body(bgcolor = bas_bgcolor, background = decor_location(bas_background))
                if soustitre != "" :
                        self.push()
                        self.div(align = "center")
                        self.b(soustitre)
                        self.hr_noshade(width='66%')
                        self.pop()
                self.push()

        def output(self, file = "-") :
                self.pop()
                copyright(self)
                jahtml.CGI_document.output(self, file)

