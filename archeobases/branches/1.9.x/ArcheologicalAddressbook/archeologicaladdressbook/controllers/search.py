import logging

from pylons import request, response, session, tmpl_context as c, url
from pylons.controllers.util import abort, redirect

from archeologicaladdressbook.lib.base import BaseController, render

log = logging.getLogger(__name__)

class SearchController(BaseController):
    """ """

    def index(self):
        """ Render the index template."""
        return render('/search/index_search.mako')

