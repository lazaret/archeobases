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
# $Id: modfracture.py,v 1.4 2001/11/09 08:32:37 rachel Exp $
#
# $Log: modfracture.py,v $
# Revision 1.4  2001/11/09 08:32:37  rachel
# tout plein de modifs pdt que CVS ne fonctionnait pas
#
# Revision 1.3  2001/03/20 19:59:46  jerome
# Ajout des tags CVS Id et Log
#
#
#

import archeoconf
import fracture

fracture.Fracture("bas").traite_parametre(["zone", "numero", "bis", "f_ordre"], parent = archeoconf.getparent())
