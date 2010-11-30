# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" Helper functions

Consists of functions to typically be used within templates, but also
available to Controllers. This module is available to templates as 'h'.

"""

from pylons import url
from webhelpers.html.tags import *
from webhelpers.html.tags import ModelTags
from webhelpers.html.tools import *
from webhelpers import paginate
from webhelpers.pylonslib.secure_form import secure_form
from webhelpers.pylonslib import Flash as _Flash


flash_message = _Flash()
