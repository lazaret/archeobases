#! /usr/bin/python
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
# $Id: modstigmate.py,v 1.5 2001/07/05 15:29:31 rachel Exp $
#
# $Log: modstigmate.py,v $
# Revision 1.5  2001/07/05 15:29:31  rachel
# plein de modifs
#
# Revision 1.4  2001/03/20 19:59:49  jerome
# Ajout des tags CVS Id et Log
#
#
#

import archeoconf
import stigmate

stigmate.Stigmate("bas").traite_parametre(["zone", "numero", "bis", "s_ordre"])#, parent = archeoconf.getparent())

