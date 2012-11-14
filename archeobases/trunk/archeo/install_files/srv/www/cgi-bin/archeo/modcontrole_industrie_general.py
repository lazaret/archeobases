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
page.button(name="controle_industrie", value="Industrie", onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_industrie") + '"')
page.button(name="controle_eclat", value="Eclat", onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_eclat") + '"')
page.button(name="controle_bord", value="Bord", onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_bord") + '"')
page.button(name="controle_outil", value="Outil", onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_outil") + '"')
page.button(name="controle_galet_amenage", value="G.Aménagé", onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_galet_amenage") + '"')
page.button(name="controle_enlevement_galet_amenage", value="Enlevement des GA", onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_enlevement_galet_amenage") + '"')
page.pop()
page.push()
page.tr()
page.td(align="center")
page.br()
page.button(name="controle_nucleus", value="Nucléus", onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_nucleus") + '"')
page.button(name="controle_enlevement_galet_nucleus", value="Enlevement des nucléus", onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_enlevement_nucleus") + '"')
page.button(name="controle_biface", value="Biface", onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_biface") + '"')
page.button(name="controle_hachereau", value="Hachereau", onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_hachereau") + '"')
page.button(name="controle_retouche", value="Retouche", onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_retouche") + '"')
page.button(name="controle_fracture_industrie", value="Fracture", onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_fracture_industrie") + '"')
page.button(name="controle_stigmate", value="Stigmate", onclick='parent.bas.location="' + archeoconf.script_location("modcontrole_stigmate") + '"')
page.pop()
page.output()

