# -*- coding: utf-8 -*-
""" data used for testing the `Excavation` model of the application."""

import datetime


class ExcavationData:
    """data used for testing the `Excavation` model"""

    class excavation_site_1:
        site_name = u'Excavation Site One'
        start_date = datetime.date(2000, 12, 1)
        end_date = datetime.date(2000, 12, 31)
        appreciation = u'Good Job'


class OrphanExcavationData:
    """data used for testing the orphans constraint on the `Excavation` model."""

    class excavation_site_2:
        site_name = u'Excavation Site Two'
        start_date = datetime.date(2001, 12, 1)
        end_date = datetime.date(2001, 12, 31)
        appreciation = u'Good Work'
