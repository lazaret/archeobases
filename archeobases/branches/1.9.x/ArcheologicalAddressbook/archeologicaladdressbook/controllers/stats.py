# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" Stats controler for the application."""

import logging

from pylons import request, response, session, tmpl_context as c, url
from pylons.controllers.util import abort, redirect
from pylons.i18n.translation import _
from repoze.what.predicates import has_permission

from archeologicaladdressbook.lib.base import BaseController, render
from archeologicaladdressbook.lib.auth import protect_action


log = logging.getLogger(__name__)


class StatsController(BaseController):
    """ Statistics Controller."""

    @protect_action(has_permission('edit', msg=_('Authentification required')))
    def index(self):
        """ Display basic countings on records."""
        #TODO maybe move this stats in the database with procedures
        c.person_count = 100
        c.address_count = 100
        return render('/stats/index_stats.mako')
