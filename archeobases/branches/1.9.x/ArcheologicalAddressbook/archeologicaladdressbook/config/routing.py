# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" Routes configuration.

The more specific and detailed routes should be defined first so they
may take precedent over the more generic routes. For more information
refer to the routes manual at http://routes.groovie.org/docs/

"""
from routes import Mapper


def make_map(config):
    """ Create, configure and return the routes Mapper."""
    map = Mapper(directory=config['pylons.paths']['controllers'],
                 always_scan=config['debug'])
    map.minimization = False

    # The ErrorController route (handles 404/500 error pages); it should
    # likely stay at the top, ensuring it can always be resolved
    map.connect('/error/{action}', controller='error')
    map.connect('/error/{action}/{id}', controller='error')

    # CUSTOM ROUTES HERE

    # Map /ormadmin url to FA's OrmadminController
    map.connect('fa_static', '/dbadmin/_static/{path_info:.*}', controller='dbadmin', action='static')
    map.connect('dbadmin', '/dbadmin', controller='dbadmin', action='models')
    map.connect('formatted_admin', '/dbadmin.json', controller='dbadmin', action='models', format='json')
    map.resource('model', 'models', path_prefix='/dbadmin/{model_name}', controller='dbadmin')

    map.connect('/{controller}/{action}')
    map.connect('/{controller}/{action}/{id}')

    return map
