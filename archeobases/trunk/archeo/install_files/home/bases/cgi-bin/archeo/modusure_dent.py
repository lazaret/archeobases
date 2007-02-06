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
# $Id: modusure_dent.py,v 1.1 2002/09/17 08:19:23 rachel Exp $
#
# $Log: modusure_dent.py,v $
# Revision 1.1  2002/09/17 08:19:23  rachel
# ajout a cvs de plusieurs fichiers connexes a usure_dent
# ----------------------------------------------------------------------
#
# Revision 1.1  2001/07/17 14:05:17  rachel
# ajout des ecrans fractures de la faune et de l'industrie et de l'ecran usure_dent
#
# Revision 1.2  2001/07/05 15:29:29  rachel
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
import usure_dent
#cgi.test()
usure_dent.Usure_Dent("bas").traite_saisie(["zone", "numero", "bis", "ud_serie"])
