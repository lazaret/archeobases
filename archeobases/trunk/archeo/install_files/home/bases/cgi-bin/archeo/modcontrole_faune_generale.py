#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Archeo - (c) 1999-2008 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#

import archeoconf


page = archeoconf.Controle("Controles")
page.div(align="center")
page.table(border="0")
page.tr()
page.push()
page.td()
page.br()
page.br()
page.tr()
page.td()
page.table(border="0")
page.form(method="POST")
page.push()
page.tr()
page.td(align="center")
page.br()
page.br()
page.button(name="controle_faune", value="Faune", onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_faune") + '"')
page.button(name="controle_usure_dent", value="Usure des dents", onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_usure_dent") + '"')
page.button(name="controle_microfaune", value="Microfaune", onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_microfaune") + '"')
page.button(name="controle_dent", value="Mesure Dents", onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_dent") + '"')
page.button(name="controle_os", value="Mesure Os", onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_os") + '"')
page.button(name="controle_trace", value="Trace", onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_trace") + '"')
page.button(name="controle_fracture_faune", value="Fracture", onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_fracture_faune") + '"')
page.button(name="controle_coprolithe", value="Coprolithe", onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_coprolithe") + '"')
page.pop()
page.push()
page.tr()
page.td(align="center")
page.br()
page.pop()
page.output()

