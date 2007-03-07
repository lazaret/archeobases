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
# $Id: modfracture_industrie.py,v 1.1 2001/07/17 14:05:17 rachel Exp $
#
# $Log: modfracture_industrie.py,v $
# Revision 1.1  2001/07/17 14:05:17  rachel
# ajout des ecrans fractures de la faune et de l'industrie et de l'ecran trace
#
# Revision 1.3  2001/03/20 19:59:46  jerome
# Ajout des tags CVS Id et Log
#
#
#

import archeoconf
import fracture_industrie

fracture_industrie.Fracture_Industrie("bas").traite_parametre(["zone", "numero", "bis", "fi_ordre"], parent = archeoconf.getparent())
