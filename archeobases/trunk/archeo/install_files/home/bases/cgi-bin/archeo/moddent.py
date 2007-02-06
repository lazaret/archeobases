#! /usr/bin/python
# -*- coding: utf-8 -*-
#
# archeo - (c) 1999      Jerome ALET <alet@unice.fr>
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
#
# $Id: moddent.py,v 1.3 2001/07/17 14:02:28 rachel Exp $
#
# $Log: moddent.py,v $
# Revision 1.3  2001/07/17 14:02:28  rachel
# modif des ecrans existants
#
# Revision 1.2  2001/07/05 15:29:25  rachel
# plein de modifs
#
# Revision 1.1  2001/05/29 15:22:52  rachel
# ajout de trois ecran :mesure des os, mesure des dent, microfaune
#
# Revision 1.2  2001/03/20 19:59:46  jerome
# Ajout des tags CVS Id et Log
#
#
#

import archeoconf
import dent
#import cgi
#cgi.test()
dent.Dent("bas").traite_saisie(["zone", "numero", "bis", "d_serie", "d_type"])
