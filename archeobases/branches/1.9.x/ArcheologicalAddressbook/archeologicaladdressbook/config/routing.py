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
    mapper = Mapper(directory=config['pylons.paths']['controllers'],
                 always_scan=config['debug'])
    mapper.minimization = False
    mapper.explicit = False

    # The ErrorController route (handles 404/500 error pages); it should
    # likely stay at the top, ensuring it can always be resolved
    mapper.connect('/error/{action}', controller='error')
    mapper.connect('/error/{action}/{id}', controller='error')

    # CUSTOM ROUTES HERE

    # FormAlechemy `DbmadminController` controller routes
    mapper.connect('fa_static', '/dbadmin/_static/{path_info:.*}', controller='dbadmin', action='static')
    mapper.connect('dbadmin', '/dbadmin', controller='dbadmin', action='models')
    mapper.connect('formatted_admin', '/dbadmin.json', controller='dbadmin', action='models', format='json')
    mapper.resource('model', 'models', path_prefix='/dbadmin/{model_name}', controller='dbadmin')

    # Default `index` action for controllers
    mapper.connect('/{controller}', action='index')
    mapper.connect('/{controller}/', action='index')

    # `Root` controller actions (index, login, logout, etc...)
    mapper.connect('/', controller='root', action='index')
    mapper.connect('/{action}', controller='root')

    # Default controller/action routes
    mapper.connect(None, '/{controller}/{action}')
    mapper.connect(None, '/{controller}/{action}/{id}')

    return mapper
