#! /usr/bin/env python
# -*- coding: UTF-8 -*-
#
# Collection - (c) 2000-2007 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#

import os

def getLanguagePreference() :
    """Returns the preferred language."""
    languages = os.environ.get("HTTP_ACCEPT_LANGUAGE", "")
    langs = [l.strip().split(';')[0] for l in languages.split(",")]
    return "%s_%s" % (langs[0], langs[0].upper())

def getCharsetPreference() :
    """Returns the preferred charset."""
    charsets = os.environ.get("HTTP_ACCEPT_CHARSET", "UTF-8")
    charsets = [l.strip().split(';')[0] for l in charsets.split(",")]
    return charsets[0]
