#! /usr/bin/python
# Fichier de configuration
#
# Archeo - (c)  1999 Jerome ALET
#                       2000 Rachel VAUDRON <rachel@cleo.unice.fr>
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2.0
# or, at your option, any higher version.
#
#
# $Id: archeoconf.py,v 1.19 2002/09/16 11:27:54 rachel Exp $
#
# $Log: archeoconf.py,v $
# Revision 1.19  2002/09/16 11:27:54  rachel
# modification des boutons+ajout de zabs=zref+zrela
# ----------------------------------------------------------------------
#
# Revision 1.18  2002/07/08 16:43:58  jerome
# chaine d'indentation reduite à la portion congrue
#
# Revision 1.17  2002/03/04 08:23:49  jerome
# Legere correction dans les chemins
#
# Revision 1.16  2002/03/04 00:16:48  jerome
# Ajout d'un fichier de configuration à placer dans /etc
# Ajout d'un programme préliminaire à placer dans /cgi-bin (un lien symbolique
# est parfait) : ce programme permet de choisir la base en fonction de
# /etc/archeo.conf et de positionner un cookie correspondant à cette base.
# plein de contrôles ont été ajoutés pour plus de sécurité.
#
# Revision 1.15  2002/01/14 11:15:16  rachel
# modif pour changer l'arborescence industrie->eclat->outil en ind->eclat et ind->outil
#
# Revision 1.14  2002/01/10 21:32:37  jerome
# Debuggage de pas mal de merdouilles
#
# Revision 1.13  2001/11/16 14:03:25  rachel
# *** empty log message ***
#
# Revision 1.12  2001/11/09 15:25:37  rachel
# *** empty log message ***
#
# Revision 1.11  2001/11/09 08:32:32  rachel
# tout plein de modifs pdt que CVS ne fonctionnait pas
#
# Revision 1.10  2001/07/05 15:29:08  rachel
# plein de modifs
#
# Revision 1.9  2001/03/20 19:59:26  jerome
# Ajout des tags CVS Id et Log
#
#
#

import string

#### Début de la partie configurable ####

#
# nom de l'application
author_name  = "Rachel VAUDRON"
author_email = "rachel@lazaret.unice.fr"

#
# commandes popur changer la taille des images
mogrify_normale  = '/usr/bin/mogrify -format tiff -quality 100'
mogrify_Grande  = '/usr/bin/mogrify -format jpeg -interlace Plane -geometry "1280>x1280>" -quality 75'
mogrify_Moyenne = '/usr/bin/mogrify -format jpeg -interlace Plane -geometry "640>x640>" -quality 50'
mogrify_Petite  = '/usr/bin/mogrify -format jpeg -interlace Plane -geometry "320>x320>" -quality 50'
mogrify_small   = '/usr/bin/mogrify -format jpeg -interlace Plane -geometry "160>x160>" -quality 50'

#
# Message de copyright
copyright_msg       = "ARCHEO &copy; 2000-2002 " + author_name
copyright_link      = "mailto:" + author_email
copyright_font_size = "-3"

#
# Couleurs de fond des trois parties de l'écran ou None
menu_bgcolor   = "#FFFFFF" #GRIS
gauche_bgcolor = "#E1DCD6"#"#CCCCCC" #GRIS menu carnet
bas_bgcolor    = "#E1DCD6"#"#CCCCCC" #GRIS
bas1_bgcolor   = "#B8AF80"   #"#FFFFE1" #JAUNE PALE
bas2_bgcolor   = "#CFC4BE"#"#A19B9B"    #"#CEFFF8" #BLEU CIEL"#E5FFFF"
bas3_bgcolor   = "#F3EEEE"      #"#FFEDFF"      #ROSE PALE
bas4_bgcolor   = "#E1DCD6"#"#F3EEEE"#"#A19B9B"#""#E4DFD0"#"#988D86"     #"#FFE5CB"      #COQUILLE PALE
lien_parent_bgcolor = "#FF0000" #JAUNE
lien_enfant_bgcolor = "#3333FF" #ROUGE

#
# Images de fond des trois parties de l'écran ou None
menu_background   = "#FFFFFF"#"logo_lazaret.jpg"#"spirebleue.jpg"#"spirale.jpg"
gauche_background = "logo_lazaret_grave.jpg"#"spirebleue.jpg"#"spirale.jpg"
bas_background    = "logo_lazaret_clair_moyen.jpg"#"spirebleue.jpg"#"spirale.jpg"

#
# couleurs de fond des formulaires de chaque partie de l'écran
menuform_bgcolor      = "#CCCAE5" #violet
basform_bgcolorleft   = "#FFFFCC" #jaune partie centrale du formulaire
basform_bgcolorright  = "#DFDFDF"#CCCAE5" #gris menu_droite
basform_bgcolormiddle = "#DDDDDD"#F1E560" #gris   marron-vert"#BOCCAF"#"#DAC2C7"
basform_bgcolorbottom = "#CCCCCC"
basform_bgcolorcenter = "#CCCCCC" #vert "#EDFOA4" # jaune

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

def getBase() :
        if not cookies.has_key("basechoisie") :
                doc = jahtml.CGI_document()
                doc.set_redirect("/cgi-bin/archeo.py")
                doc.output()
                sys.exit(0)
        else :
                return cookies["basechoisie"]
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
app_location      = "/cgi-bin/archeo/"
decors_location   = "/archeo/decors/"
images_location   =  "/archeo/" + base_courante + "/image/"
images_directory  =  os.path.join(config["docpath"], "archeo", base_courante, "image") + os.sep
help_location     = "/archeo/manuel/"
manuel_location   = "/archeo/manuel"
lexique_location  = "/archeo/lexique"
site_location     = "/archeo/site/" + base_courante +".html"  
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
# Classes spécifiques
class ArcheoDataBase(database.DataBase) :
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
#                self.img(src = decor_location("logo_lazaret_transparent.jpg"), alt= "Archeo", border=0)
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

