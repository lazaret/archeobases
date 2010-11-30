# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" `Search` controller for the application."""

import logging

from pylons import request
#from pylons import response
#from pylons import session
from pylons import tmpl_context as c
#from pylons import url
#from pylons.controllers.util import abort
#from pylons.controllers.util import redirect
from pylons.i18n.translation import _
from repoze.what.predicates import has_permission

from archeologicaladdressbook.lib.base import BaseController
from archeologicaladdressbook.lib.base import render
#from archeologicaladdressbook.lib.helpers import flash_message
from archeologicaladdressbook.lib.helpers import paginate
from archeologicaladdressbook.lib.auth import ProtectController

from archeologicaladdressbook.model import Session
from archeologicaladdressbook.model import Person

log = logging.getLogger(__name__)


@ProtectController(has_permission('view', msg=_("Authentification required")))
class SearchController(BaseController):
    """ `Search` Controller."""

    def index(self):
        """ Render the search index template."""
        return render('/search/index.mako')

    def quick_search(self):
        """ Search on `Persons` based on `last_name` and `first_name` only."""
        last_name = request.params.get('last_name', '')
        first_name = request.params.get('first_name', '')
        # query contruction
        query = Session.query(Person)
        if last_name:
            query = query.filter(Person.last_name.ilike(last_name))
        if first_name:
            query = query.filter(Person.first_name.ilike(first_name))
        c.page = paginate.Page(query, page=id, items_per_page=20)
        return render('/persons/list.mako')


# or_ search reminder for future more complete search feature
#
# from sqlalchemy.sql import and_, or_
#
# query = Session.query(Person). \
#              filter(or_(Person.last_name.ilike(last_name)), \
#              (Person.first_name.ilike(first_name)))
