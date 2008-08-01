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

import string


#### Debut de la partie configurable ####

#
# nom de l'application
app_name     = "bego"
author_name  = "Laboratoire Départemental de Prehistoire du Lazaret"
author_email = "opensource@lazaret.unice.fr"
username     = "alet"
superusers   = ["superbego"]

#
# mode debug
debug = False

#
# commandes popur changer la taille des images
mogrify_normale = '/usr/bin/mogrify -format jpg -quality 100'
mogrify_small   = '/usr/bin/mogrify -format jpg -interlace Plane -geometry "180>x180>" -quality 50'

#
# Message de copyright
copyright_msg       = "Archeobases-Bego &copy; 2000-2008 " + author_name
copyright_link      = "mailto:" + author_email
copyright_font_size = "-3"


base_courante = app_name # ajoutée pour uniformiser requetes.py

#Liste des clefs créant un lien dans requetes.py
linkeys = ["zone", "roche", "face", "figure", "historique", "association", "coderequete"]

#
# Emplacement des programmes et données de l'application
app_location      = "/cgi-bin/" + app_name + "/"
decors_location   =  "/" + app_name + "/decors/"
images_location   = "/" + app_name + "/image/"
images_directory  = "/home/bases/" + app_name + "/image/"
help_location     = "/" +  app_name + "/help/help_sql/accueil.html"
help_general_location = "/" + app_name  + "/help/help_bego/accueil.html"
album_location    = "/devalbum/album/index.html"

#
# Couleurs de fond des trois parties de l'écran ou None
menu_bgcolor   = "#FFFFFF"
gauche_bgcolor = "#FFFFFF"
bas_bgcolor    = "#FFFFFF"

#
# Images de fond des trois parties de l'écran ou None
menu_background   = None
gauche_background = None
bas_background    = None
bas1_bgcolor   = "#E1DCD6"
bas2_bgcolor   = "#CFC4BE"
bas3_bgcolor   = "#F3EEEE"
bas4_bgcolor   = "#E1DCD6"
lien_parent_bgcolor = "#FF0000"
lien_enfant_bgcolor = "#3333FF"

#
# couleurs de fond des formulaires de chaque partie de l'écran
menuform_bgcolor      = "#CCCAE5"
basform_bgcolorleft   = "#E1DCD6"
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
# Rien ne devrait être modifié après cette ligne
import sys
import os
import time
import jahtml
import database
import Image

utilisateur_courant = os.environ.get("REMOTE_USER", None)


def script_location(script):
    """ Fonction qui renvoie l'url complete d'un script."""
    if script != None:
        return app_location + script + ".py"

def image_fullname(image):
    """ Fonction qui renvoie le nom complet d'une image."""
    if image != None:
        return images_directory + image

def image_location(image):
    """ Fonction qui renvoie l'url dans lequel sont les images."""
    if image != None:
        return images_location + image

def decor_location(image):
    """ Fonction qui renvoie l'url dans lequel sont les decors."""
    if image != None:
        return decors_location + image

def copyright(doc):
    """ Fonction qui insere le message de copyright."""
    doc.hr_noshade(width='66%')
    doc.div(align="center")
    doc.font(size=copyright_font_size)
    doc.a(copyright_msg, href=copyright_link)

def heurecourante():
    """ Fonction qui renvoie l'heure courante sous forme texte."""
    return time.asctime(time.localtime(time.time()))

def log_message(msg, level="error"):
    """ Fonction de sortie des messages d'erreur non fatale.
    Affiche un message de log si le mode debug est activé ou si le message est de type 'error'."""
    if debug or level == "error":
        message = "[%s] [%s] %s\n" % (level, utilisateur_courant, msg)
        sys.stderr.write(message)
        sys.stderr.flush()
        return message

def fatalerror_message(msg):
    """ Fonction de sortie des messages d'erreur fatale."""
    log_message(msg, "error")
    page = jahtml.CGI_document()
    page.default_header("ERREUR")
    page.body(bgcolor="white")
    page.p("[%s]" % heurecourante(), align="center")
    page.push()
    page.p(align="left")
    page.font(msg, color="red", size="+2")
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

def capstring(str):
    """ Fonction qui passe la premiere lettre en majuscule et le reste en minuscule."""
    return string.capitalize(string.lower(string.strip(str)))

def get_imagesize(filename):
    """ Fonction qui renvoie les dimensions d'une image."""
    try:
        image = Image.open(filename)
        s = image.size
        image.fp.close()
    except IOError, msg:
        log_message("Problème d'accès au fichier %s : %s" % (filename, msg))
        s = 0, 0
    return s

def getparent():
    """ Fonction qui recupere le nom simple du parent (ex: roche pour face, face pour figure...)."""
    http_referer = os.environ["HTTP_REFERER"]
    if http_referer :
        # on garde tout ce qui est apres le dernier slash, jusqu'au point d'interrogation
        inter = string.find(http_referer, '?')
        if inter != -1:
            http_referer = http_referer[string.rfind(http_referer, '/') + 1: inter]
        else:
            http_referer = http_referer[string.rfind(http_referer, '/') + 1:]
    script_name = os.environ["SCRIPT_NAME"]
    if script_name:
        script_name = script_name[string.rfind(script_name, '/') + 1:]
    if http_referer and script_name and (http_referer[:7] != 'menu.py') and (http_referer != script_name):
        p = http_referer[3:]    # on enleve le "mod" du debut du nom du script
        if p[:5] != "photo":
            p = p[:-3]              # on enleve le ".py" de la fin
            return p


#
# Classes spécifiques

class BegoDataBase(database.DataBase):
    """ Définition de la base de donnée."""
    def __init__(self, username="bego", debuglevel=debug):
        database.DataBase.__init__(self, database="Mont_Bégo", username=username, debuglevel=debuglevel)
        # changer "Mont_Bego" pour changer le nom de la base de donnée

    def fatal_message(self, msg):
        fatalerror_message(msg)


class Main(jahtml.CGI_document):
    def __init__(self, titre):
        jahtml.CGI_document.__init__(self)
        self.default_header(titre)

    def dessine_cadre(self, menu, bas):
        ruser = self.remote_user()
        if (ruser == None) or (ruser == "visiteur"):
            self.set_redirect(script_location("bas"))
        else:
            self.frameset(rows="200,*", border="0")
            self.push()
            self.frame(name="menu", src=menu, scrolling="no")
            self.pop()
            self.frame(name="bas", src=bas)


class Menu(jahtml.CGI_document):
    def __init__(self, titre):
        jahtml.CGI_document.__init__(self)
        self.default_header(titre)
        self.body(bgcolor=menu_bgcolor, background=decor_location(menu_background))
        self.push()
        self.div(align="center")
        self.img(src=decor_location("logo_bego.png"), alt="Mont Bego", border=0)
        self.pop()


class Bas(jahtml.CGI_document):
    def __init__(self, titre, soustitre=""):
        jahtml.CGI_document.__init__(self)
        self.default_header(titre)
        self.body(bgcolor=bas_bgcolor, background=decor_location(bas_background))
        if soustitre != "":
            self.push()
            self.div(align="center")
            self.b(soustitre)
            self.hr_noshade(width='66%')
            self.pop()
        self.push()

    def output(self, file = "-"):
        self.pop()
        copyright(self)
        jahtml.CGI_document.output(self, file)

