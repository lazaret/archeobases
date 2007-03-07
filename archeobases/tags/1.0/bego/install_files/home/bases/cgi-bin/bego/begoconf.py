7# Fichier de configuration de BEGO
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
# $Id: begoconf.py,v 1.3 2000/11/09 15:56:52 rachel Exp $
#
# $Log: begoconf.py,v $
# Revision 1.3  2000/11/09 15:56:52  rachel
# modif pour le chemin du mogrify
#
# Revision 1.2  2000/11/09 08:41:58  jerome
# Il y avait un mauvais chemin pour les images
#
# Revision 1.1.1.1  2000/11/06 08:33:17  jerome
# Reintroduction dans CVS apres modifs
#
# Revision 1.16  2000/09/11 21:04:37  jerome
# Ajout du stockage de l'image originale en .tiff
# Finitions du prog de récupération des images de Graziella
#
# Revision 1.15  2000/05/30 07:38:59  rachel
# modif de l'ecran de saisie modzone_acces pour qu'il ressemble a l'ecran
# modfigassoc
# zone.py: rien
# ---------------------------------------------------------------------
#
# Revision 1.14  2000/05/29 16:52:20  jerome
# Correction des quelques petits bugs concernant l'ordre des figures lors
# des suppressions.
#
# Revision 1.13  2000/05/29 15:09:41  rachel
# cation pour permettre un ordre des figures dans les associations.
# le menu est modifie pour permettre l'affichage de l'album et de la presentation en up
#
# Revision 1.12  2000/05/28 17:01:13  jerome
# Mise en place des liens parents/enfants et suppression (par test uniquement,
# le code reste en place) de l'affichage complet tel qu'il existait avant
#
# Revision 1.11  2000/05/27 13:58:57  jerome
# Intégration du message de Log
#
#

import string

#### Début de la partie configurable ####

#
# nom de l'application
app_name     = "bego"
author_name  = "Rachel VAUDRON"
author_email = "rachel@cleo.unice.fr"
username     = "alet"
superusers   = [ "superbego" ]

#
# commandes popur changer la taille des images

mogrify_normale  = '/usr/bin/mogrify -format tiff -quality 100'
mogrify_Grande  = '/usr/bin/mogrify -format jpeg -interlace Plane -geometry "1280>x1280>" -quality 75'
mogrify_Moyenne = '/usr/bin/mogrify -format jpeg -interlace Plane -geometry "640>x640>" -quality 50'
mogrify_Petite  = '/usr/bin/mogrify -format jpeg -interlace Plane -geometry "320>x320>" -quality 50'
mogrify_small   = '/usr/bin/mogrify -format jpeg -interlace Plane -geometry "160>x160>" -quality 50'

#
# Message de copyright
copyright_msg       = string.upper(app_name) + " &copy; 2000 " + author_name
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
menu_bgcolor   = "#FFFFFF"      # blanc
gauche_bgcolor = "#FFFFFF"      # E1DCD6" 
bas_bgcolor    = "#FFFFFF"      #E1DCD6"      

#
# Images de fond des trois parties de l'écran ou None
menu_background   = "#FFFFFF"   #haut.jpg" #"fond10.jpg"#rach1clairhuile2.jpg"
gauche_background = "#FFFFFF"   #haut.jpg" #rach1clairhuile2.jpg"
bas_background    = "#FFFFFF"   #bas.jpg" #"fond10.jpg"#bas.jpg"

#
# couleurs de fond des formulaires de chaque partie de l'écran
menuform_bgcolor      = "#CCCAE5"       #violet
basform_bgcolorleft   = "#E1DCD6"       #partie centrale du formulaire
basform_bgcolorright  = "#DFDFDF"       #CCCAE5" #gris menu_droite
basform_bgcolormiddle = "#DDDDDD"       #gris 
basform_bgcolorbottom = "#CCCCCC"
basform_bgcolorcenter = "#CCCCCC"       #vert "#EDFOA4" # jaune

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
        if os.environ.has_key("REMOTE_USER") :
                message = "[%s] [%s] [%s] %s\n" % (heurecourante(), level, os.environ["REMOTE_USER"], msg)
        else :
                message = "[%s] [%s] %s\n" % (time.asctime(time.localtime(time.time())), level, msg)
        sys.stderr.write(message)
        sys.stderr.flush()
        return message

#
# Fonction de sortie des messages d'erreur fatale
def fatalerror_message(msg) :
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
class BegoDataBase(database.DataBase) :
        def __init__(self, username = "bego", debuglevel = 0) :
                database.DataBase.__init__(self, database = "bego", username = username, debuglevel = debuglevel)

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
                self.img(src = decor_location("logobego.gif"), alt="Mont Bego", border=0)
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

