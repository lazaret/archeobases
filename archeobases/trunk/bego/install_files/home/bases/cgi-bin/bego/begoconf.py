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
author_name  = "Rachel Vaudron & Bertrand Lecervoisier"
author_email = "root@lazaret.unice.fr"
username     = "alet"
superusers   = [ "superbego" ]

#
# mode debug
debug = False

#
# commandes popur changer la taille des images

mogrify_normale  = '/usr/bin/mogrify -format tiff -quality 100'
mogrify_Grande  = '/usr/bin/mogrify -format jpeg -interlace Plane -geometry "1280>x1280>" -quality 75'
mogrify_Moyenne = '/usr/bin/mogrify -format jpeg -interlace Plane -geometry "640>x640>" -quality 50'
mogrify_Petite  = '/usr/bin/mogrify -format jpeg -interlace Plane -geometry "320>x320>" -quality 50'
mogrify_small   = '/usr/bin/mogrify -format jpeg -interlace Plane -geometry "160>x160>" -quality 50'

#
# Message de copyright
copyright_msg       = string.upper(app_name) + " &copy; 2000-2008 " + author_name
copyright_link      = "mailto:" + author_email
copyright_font_size = "-3"


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
bas1_bgcolor   = "#B8AF80"
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
import pg
import jahtml
import database
import Image

utilisateur_courant = os.environ.get("REMOTE_USER", None)

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
# Fonction qui renvoie l'heure courante sous forme texte
def heurecourante() :
        return time.asctime(time.localtime(time.time()))

#
# Fonction de sortie des messages d'erreur non fatale
def log_message(msg, level = "error") :
    """ Affiche un message de log si le mode debug est activé ou si le message est de type 'error' """
    if debug or level =="error" :
        message = "[%s] [%s] %s\n" % (level, utilisateur_courant, msg)
        sys.stderr.write(message)
        sys.stderr.flush()
        return message

#
# Fonction de sortie des messages d'erreur fatale
def fatalerror_message(msg) :
        log_message(msg, "error")
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
# fonction qui insere le message de copyright
def copyright(doc) :
        doc.hr_noshade(width='66%')
        doc.div(align = "center")
        doc.font(size = copyright_font_size)
        doc.a(copyright_msg, href = copyright_link)

#
# Classes spécifiques

# Definition de la base de donnée
class BegoDataBase(database.DataBase) :
        def __init__(self, username = "bego", debuglevel = debug) :
            database.DataBase.__init__(self, database = "Mont_Bégo", username = username, debuglevel = debuglevel) # changer "Mont_bego" pour changer le nom de la base de donnée

        def fatal_message(self, msg) :
                fatalerror_message(msg)


class Main(jahtml.CGI_document) :
        def __init__(self, titre) :
                jahtml.CGI_document.__init__(self)
                self.default_header(titre)

        def dessine_cadre(self, menu, bas) :
                ruser = self.remote_user()
                if (ruser == None) or (ruser == "visiteur") :
                        self.set_redirect(script_location("bas"))
                else :
                        self.frameset(rows="200,*", border="0")
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
                self.img(src = decor_location("logo_bego.png"), alt="Mont Bego", border=0)
                self.pop()

class Bas(jahtml.CGI_document) :
        def __init__(self, titre, soustitre = "") :
                jahtml.CGI_document.__init__(self)
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

