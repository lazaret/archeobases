#! /usr/local/bin/python
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
# $Id: menu.py,v 1.1.1.1 2000/11/06 08:33:17 jerome Exp $
#
# $Log: menu.py,v $
# Revision 1.1.1.1  2000/11/06 08:33:17  jerome
# Reintroduction dans CVS apres modifs
#
# Revision 1.7  2000/05/29 15:09:42  rachel
# cation pour permettre un ordre des figures dans les associations.
# le menu est modifie pour permettre l'affichage de l'album et de la presentation en up
#
# Revision 1.6  2000/05/27 13:58:59  jerome
# Intégration du message de Log
#
#

import begoconf

def petit_logo(page, logo, lien) :
        if logo != None :
                page.push()
                page.td()
                page.a(href = lien, target = "_top")
                page.img(src = begoconf.decor_location(logo), border = "0")
                page.pop()

page = begoconf.Menu("Menu")

page.div(align="center")
page.table(border="0")
page.tr()

petit_logo(page, begoconf.petit_logo_gauche, begoconf.petit_logo_gauche_link)

page.push()
page.td()
page.table(border= "0")# , bgcolor = begoconf.menu_bgcolor)
page.form(method="POST")
page.push()
page.tr()
page.td()
page.button(name="menu", value="Zones",        onclick='parent.bas.location="' + begoconf.script_location("modzone")        + '"')
page.button(name="menu", value="Roches",       onclick='parent.bas.location="' + begoconf.script_location("modroche")       + '"')
page.button(name="menu", value="Faces",        onclick='parent.bas.location="' + begoconf.script_location("modface")        + '"')
page.button(name="menu", value="Figures protohistoriques",      onclick='parent.bas.location="' + begoconf.script_location("modfigure")      + '"')
page.button(name="menu", value="Gravures historiques",      onclick='parent.bas.location="' + begoconf.script_location("modhistorique")      + '"')
page.button(name="menu", value="Associations", onclick='parent.bas.location="' + begoconf.script_location("modassociation") + '"')
page.pop()
page.tr()
page.td(align = "center")
if page.remote_user() in begoconf.superusers :
        page.button(name="menu", value="Parametres", onclick='parent.bas.location="' + begoconf.script_location("parametre") + '"')
        page.button(name="menu", value="SQL",        onclick='parent.bas.location="' + begoconf.script_location("requetes")   + '"')

#page.a("Album", href =  begoconf.album_location , target = "top")
page.a("Présentation", href =  begoconf.help_general_location , target = "top")
#page.button(name="menu", value="Album", onclick='parent.location="' + begoconf.album_location + '"')
#page.button(name="menu", value="Aide", onclick='parent.location="' + begoconf.help_general_location + '"')

page.pop()

petit_logo(page, begoconf.petit_logo_bas, begoconf.petit_logo_bas_link)

page.output()








