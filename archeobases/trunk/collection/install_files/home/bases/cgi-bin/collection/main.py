#! /usr/bin/python
# -*- coding: UTF-8 -*-
#
# Collection - (c) 2000-2007 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#

import collectionconf

page = collectionconf.Main("Menu Principal")
page.dessine_cadre(collectionconf.script_location("menu"), collectionconf.script_location("bas"))

page.output()
