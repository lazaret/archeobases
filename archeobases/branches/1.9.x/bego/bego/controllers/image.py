"""Image controler"""

import hashlib
import logging
import os
import shutil

from paste.fileapp import FileApp
from pylons import config, request, response, session, tmpl_context as c
from pylons.controllers.util import abort, redirect_to
from pylons.i18n.translation import _
from routes.util import url_for

from bego.lib.base import BaseController, render
from bego.lib.helpers import flash_message
from bego import model


log = logging.getLogger(__name__)


class ImageController(BaseController):
    """Image controler

    Images files are saved into the filesystem and metadatas are stored into the database."""

    def index(self):
        """Render the main index page for images."""
        return render("/derived/image/index.mako")

    def list(self):
        """Seclect all images and display the list."""
        c.image = model.meta.Session.query(model.Image).all()
        return render("/derived/image/list.mako")

    def view(self, id=None):
        """Render a preview image and related metadatas."""
        if id is None:
            abort(404)
        image_q = model.meta.Session.query(model.Image)
        image = image_q.get(int(id))
        if image is None:
            abort(404)
        path = os.path.join(config["image_dir"], image.path)
        # check for image in filesystem and retirect to the
        # delete action to avoid database inconsistence
        if not os.path.isfile(path):
            pass
            #error = "nofile"
            #flash_message(_("This file did not exist in the filesystem."), "error")
            #return redirect_to(url_for(action="delete", id=image.id))
        # display the image preview
        c.preview_path = os.path.join("/thumbs/preview/", image.path)
        c.filename = image.filename
        c.description = image.description
        return render("derived/image/view.mako")
        ### TODO if file deleted

    def display(self, id=None, filename=None):
        """Render the full image from the filesystem."""
        if id is None or filename is None:
            abort(404)
        image_q = model.meta.Session.query(model.Image)
        image = image_q.get(int(id))
        if image is None:
            abort(404)
        path = os.path.join(config["image_dir"], image.path)
        # check for image in filesystem and retirect to the
        # delete action to avoid database inconsistence
        if not os.path.isfile(path):
            pass
            #return redirect_to(url_for(action="delete", id=image.id))
        # display the image
        app = FileApp(path)
        return app(request.environ, self.start_response)

    def new(self):
        """Render the upload image form."""
        return render("/derived/image/new.mako")

    def create(self):
        """Save the image.

        Save the image to the filesystem with filename and directory
        hashing. The image metadatas are recorded intot the database.
        """
        image_file = request.POST["image_file"]
        # check uloaded file type
        # TODO
        # hash path calulation
        sha1_hash = hashlib.sha1(image_file.value).hexdigest()
        dir1, dir2, dir3, filename = config["image_dir"], sha1_hash[0:3], sha1_hash[3:6], sha1_hash[6:]+".jpg"
        image_dir = os.path.join(dir1, dir2, dir3)
        path = os.path.join(dir2, dir3, filename)
        # create folder if necessary and check for duplicate image
        if not os.path.isdir(os.path.join(image_dir)):
            os.makedirs(os.path.join(image_dir))
        # save the image on filesystem
        permanent_file = open(os.path.join(image_dir, filename), "wb")
        shutil.copyfileobj(image_file.file, permanent_file)
        image_file.file.close()
        permanent_file.close()
        # Add a new image to the database
        image = model.Image()
        image.path = path
        image.filename = image_file.filename
        image.description = request.POST["description"]
        model.meta.Session.add(image)
        model.meta.Session.commit()
        return redirect_to(url_for(action="view", id=image.id))
        ### TODO file exist verif
        ### TODO form & file validation

    def delete(self, id=None):
        """Delete the image.""" #TODO update docstring
        if id is None:
            abort(404)
        # Delete the database record
        image_q = model.meta.Session.query(model.Image)
        image = image_q.filter_by(id=id).first()
        if image is None:
            abort(404)
        model.meta.Session.delete(image)
        model.meta.Session.commit()
        return render('/derived/image/deleted.mako')

    def update(self, id=None):
        """Redirect to the relevant action based on the submit button."""
        if "edit_button" in request.POST.keys():
            pass
            #return redirect_to(url_for(action="edit", id=rock.id))
        elif "delete_button" in request.POST.keys():
            return redirect_to(url_for(action="delete", id=id))

