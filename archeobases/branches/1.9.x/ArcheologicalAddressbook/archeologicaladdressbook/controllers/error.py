# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" Error controler"""

import cgi

from pylons import request, tmpl_context as c
from pylons.i18n.translation import _
from webhelpers.html.builder import literal

from archeologicaladdressbook.lib.base import BaseController, render
from archeologicaladdressbook.lib.helpers import flash_message


class ErrorController(BaseController):
    """ Generates error documents as and when they are required.

    The ErrorDocuments middleware forwards to ErrorController when error
    related status codes are returned from the application.

    This behaviour can be altered by changing the parameters to the
    ErrorDocuments middleware in your config/middleware.py file.
    """

    def document(self):
        """Render the error document."""
        resp = request.environ.get("pylons.original_response")
        code = cgi.escape(request.GET.get("code", ""))
        message = cgi.escape(request.GET.get("message", ""))
        if resp:
            message = literal(resp.status)
            code = code or cgi.escape(str(resp.status_int))
        if not code:
            raise Exception("No status code was found")
        c.code = code
        #if code == "404":
        #    message = _("404 Error. The page you try to access did not exist ! \
        #                You may try to go back to the previous page.")
        flash_message(message, "error")
        return render("error.mako")
