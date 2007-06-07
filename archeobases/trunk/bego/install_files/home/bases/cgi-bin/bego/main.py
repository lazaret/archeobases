#! /usr/bin/env python
# -*- coding: utf-8 -*-
#
# montbego - (c) 1999	   Jerome ALET <alet@unice.fr>
#		 1999-2000 Rachel VAUDRON <rachel@cleo.unice.fr>
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2.0
# or, at your option, any higher version.
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#
# $Id: main.py,v 1.2 2000/11/15 10:30:55 jerome Exp $
#
# $Log: main.py,v $
# Revision 1.2  2000/11/15 10:30:55  jerome
# Rien
#
# Revision 1.1.1.1  2000/11/06 08:33:17	 jerome
# Reintroduction dans CVS apres modifs
#
# Revision 1.2	2000/05/27 13:58:59  jerome
# Integration du message de Log
#
#

import begoconf

page = begoconf.Main("Menu Principal")

page.dessine_cadre(begoconf.script_location("menu"), begoconf.script_location("bas"))

page.output()
