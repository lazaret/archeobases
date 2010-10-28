# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" Converters functions.

Consist of functions to convert text to typically be used with FormEncode
schemas.
"""

def lower_string(value):
    """ Return the lowercase of `value` (and strip spaces)."""
    return value.lower().strip()


def upper_string(value):
    """ Return the lowercase of `value` string (and strip spaces)."""
    return value.upper().strip()


def capitalize_string(value):
    """ Capitalize the first letter of the `value` string (and strip spaces)."""
    return value.capitalize().strip()


def title_string(value):
    """ Capitalize the first letter of all words of the `value` string (and strip spaces)."""
    return value.title().strip()


def strip_string(value):
    """ Revove leading and trailling spaces."""
    return value.strip()