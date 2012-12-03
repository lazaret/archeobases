#! /usr/bin/env python
# -*- coding: ISO-8859-15 -*-
#
# pdfmap
# (c) 2001-2002 Jerome Alet <alet@librelogiciel.com>
# You're welcome to redistribute this software under the
# terms of the GNU General Public Licence version 2.0
# or, at your option, any higher version.
#
# You can read the complete GNU GPL in the file COPYING
# which should come along with this software, or visit
# the Free Software Foundation's WEB site http://www.fsf.org
#
# $Id: setup.py,v 1.2 2004/07/26 21:15:29 jalet Exp $

from distutils.core import setup

import pdfmap.version

setup(name = "pdfmap", version = pdfmap.version.__version__,
      license = "GNU GPL",
      description = pdfmap.version.__doc__,
      author = "Jerome Alet",
      author_email = "alet@librelogiciel.com",
      url = "http://www.librelogiciel.com/software/",
      packages = [ "pdfmap" ],
      scripts = [ "bin/pdfmap" ])

