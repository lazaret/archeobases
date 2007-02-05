#! /usr/bin/python
# -*- coding: UTF-8 -*-
#
# Collection - (c) 2006 Rachel VAUDRON <rachel@lazaret.unice.fr>
#
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2.0
# or, at your option, any higher version.
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#
#
# $Id: main.py,v 1.3 2001/07/05 15:29:16 rachel Exp $
#
# $Log: main.py,v $
# Revision 1.3  2001/07/05 15:29:16  rachel
# plein de modifs
#
# Revision 1.2  2001/03/20 19:59:37  jerome
# Ajout des tags CVS Id et Log
#
#
#

import collectionconf

page = collectionconf.Main("Menu Principal")
page.dessine_cadre(collectionconf.script_location("menu"), collectionconf.script_location("bas"))

page.output()
