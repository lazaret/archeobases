# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" Data used for testing the `Excavation` model of the application."""

import datetime


class ExcavationData:
    """ Data used for testing the `Excavation` model."""

    class ExcavationSite1:
        """ Test values for an excavation site."""
        site_name = u'Excavation Site One'
        start_date = datetime.date(2000, 12, 1)
        end_date = datetime.date(2000, 12, 31)
        appreciation = u'Good Job'


class OrphanExcavationData:
    """ Data used for testing the orphans constraint on the `Excavation` model."""

    class ExcavationSite2:
        """ Ophan test values for an excavation site."""
        site_name = u'Excavation Site Two'
        start_date = datetime.date(2001, 12, 1)
        end_date = datetime.date(2001, 12, 31)
        appreciation = u'Good Work'
