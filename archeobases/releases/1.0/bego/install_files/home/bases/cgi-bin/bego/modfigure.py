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
# $Id: modfigure.py,v 1.1.1.1 2000/11/06 08:33:18 jerome Exp $
#
# $Log: modfigure.py,v $
# Revision 1.1.1.1  2000/11/06 08:33:18  jerome
# Reintroduction dans CVS apres modifs
#
# Revision 1.2  2000/05/27 13:59:01  jerome
# Intégration du message de Log
#
#

import begoconf
import figure

figure.Figure("bas").traite_saisie(["zone", "groupe", "roche", "face", "figure"], parent = begoconf.getparent())
