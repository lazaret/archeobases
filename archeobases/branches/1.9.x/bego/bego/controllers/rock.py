# -*- coding: utf-8 -*-

import logging
from pylons import request, response, session, tmpl_context as c
from pylons.controllers.util import abort, redirect_to
from pylons.i18n.translation import _
from routes.util import url_for

from bego.lib.base import BaseController, render
from bego.lib.helpers import flash_message
from bego import model


log = logging.getLogger(__name__)


class RockController(BaseController):
    """Rock controler who work on the `rock` table"""

    def index(self):
        #return the rock index page
        return render("/derived/rock/index.mako")

    def new(self):
        """New record form and redirect to save"""
        flash_message(_("success message"), "success")
        flash_message(_("warning message"), "warning")
        flash_message(_("error message"), "error")
        flash_message(_("notice message"), "notice")
        return render('/derived/rock/new.mako')

    def edit(self, id=None):
        """Edit existing record form and redirect to save"""
        rock_q = model.meta.Session.query(model.Rock)
        c.rock = rock_q.filter_by(id=id).first()
        if c.rock:
            return render('/derived/rock/edit.mako')
        else:
            abort(404)

    def save(self, id=None):
        """Save a record and redirect to new or edit"""
        rock_q = model.meta.Session.query(model.Rock)
        rock = rock_q.filter_by(id=id).first()
        if not rock:
            # if the record did not exist yet
            rock = model.Rock()
        rock.geo_zone = request.POST.get("geo_zone", "")
        rock.geo_group = request.POST.get("geo_group", "")
        rock.rock_number = request.POST.get("rock_number", "")
        rock.rock_name = request.POST.get("rock_name", "")
        rock.x = request.POST.get("x", "")
        rock.y = request.POST.get("y", "")
        rock.z = request.POST.get("z", "")
        rock.length = request.POST.get("length", "")
        rock.width = request.POST.get("width", "")
        rock.geo_context_torrent = request.POST.get("geo_context_torrent", "")
        rock.geo_context_lake = request.POST.get("geo_context_lake", "")
        rock.geo_context_bog = request.POST.get("geo_context_bog", "")
        rock.geo_context_pass = request.POST.get("geo_context_pass", "")
        rock.geo_context_summit = request.POST.get("geo_context_summit", "")
        rock.rock_type = request.POST.get("rock_type", "")
        rock.outcrop_type = request.POST.get("outcrop_type", "")
        rock.provision = request.POST.get("provision", "")
        rock.description = request.POST.get("description", "")
        model.meta.Session.save_or_update(rock)
        model.meta.Session.commit()
        # Issue a redirect based on the submit button
        if "new_button" in request.POST.keys():
            return redirect_to(action="new")
        elif "edit_button" in request.POST.keys():
            return redirect_to(url_for(action="edit", id=rock.id))
        elif "delete_button" in request.POST.keys():
            return redirect_to(url_for(action="delete", id=rock.id))

    def delete(self, id=None):
        """Delete a record """
        rock_q = model.meta.Session.query(model.Rock)
        rock = rock_q.filter_by(id=id).first()
        if rock:
            model.meta.Session.delete(rock)
            model.meta.Session.commit()
            return render('/derived/rock/list.mako') ###FIXME rediriger ailleurs
        else:
            abort(404)

    def list(self):
        """List the selected records"""
        c.rock = model.meta.Session.query(model.Rock).all()
        return render('/derived/rock/list.mako')




