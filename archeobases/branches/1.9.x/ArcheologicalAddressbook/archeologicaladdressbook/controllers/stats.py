import logging

from pylons import request, response, session, tmpl_context as c, url
from pylons.controllers.util import abort, redirect

from archeologicaladdressbook.lib.base import BaseController, render

log = logging.getLogger(__name__)

class StatsController(BaseController):
    """ """

    def index(self):
        """ Display basic countings on records """
        #TODO maybe move this stats in the database with procedures
        c.person_count = 100
        c.address_count = 100
        return render('/stats/index_stats.mako')
