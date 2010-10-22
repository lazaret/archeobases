# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" The application's `Globals` object."""

from beaker.cache import CacheManager
from beaker.util import parse_cache_config_options
from pylons import config

from archeologicaladdressbook import __version__


class Globals(object):
    """ `Globals` acts as a container for objects available throughout the
    life of the application.

    """

    def __init__(self, config):
        """ One instance of `Globals` is created during application
        initialization and is available during requests via the
        `app_globals` variable.

        """
        self.cache = CacheManager(**parse_cache_config_options(config))

        self.version = __version__
        self.sitename = config.get('sitename', 'AddressBook')
