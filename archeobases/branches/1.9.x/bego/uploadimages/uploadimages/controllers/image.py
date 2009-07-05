# -*- coding: utf-8 -*-
"""Image controler. Images files are saved in the filesystem and
metadatas are stored in the database."""

import hashlib
import Image
import imghdr
import logging
import mimetypes
import shutil
import os

from pylons import config, request, response, session, tmpl_context as c
from pylons.controllers.util import abort, redirect_to
from routes import url_for

from uploadimages.lib.base import BaseController, render

import uploadimages.model as model


log = logging.getLogger(__name__)


class ImageController(BaseController):
    """ """
    def index(self):
        # Return a rendered template
        #return render('/image.mako')
        # or, return a response
        return 'Hello World'

    def upload(self):
        # Return the upload form template
        return render("/upload.mako")

    def save_image(self, id=None):
        """ Save the image to the filesystem with filename and directory
        hashing. Save the image metadatas to database."""
        uploads_dir = config["app_conf"]["uploads_dir"]
        image = request.POST["image"]
        # check uloaded file type
        image_type = imghdr.what(image.filename, image.value)
        if not image_type:
            return "error : bad file type"
        elif not image_type in ("jpeg", "tiff", "png"):
            return "error : bad image type"
        # define image extension
        if image_type == "jpeg":
            ext = ".jpg"
        if image_type == "tiff":
            ext = ".tif"
        if image_type == "png":
            ext = ".png"
        # hash path calulation
        hash = hashlib.sha1(image.value).hexdigest()
        hash_path = os.path.join(hash[0], hash[1], hash[2:])
        hash_path = os.path.normpath(hash_path)
        path = os.path.join(uploads_dir, hash_path)
        path = os.path.normpath(path) # normalisation for windows
        # create folder if necessary and check for duplicate image
        if not os.path.isdir(os.path.dirname(path)):
            os.makedirs(os.path.dirname(path))
        if os.path.isfile(path + ext):
            return "error : file already exist"
        # save the image on filesystem
        permanent_file = open(path + ext, "wb")
        shutil.copyfileobj(image.file, permanent_file)
        image.file.close()
        permanent_file.close()
        # create and save image thumbnail
        im = Image.open(path + ext)
        im.thumbnail((170, 255), Image.ANTIALIAS)
        im.save(path + "_thumb.jpg", "JPEG", optimize=1, quality=90)
        # save image metadatas to database
        image_q = model.meta.Session.query(model.Image) ### peut etre inutile
        record = image_q.filter_by(id=id).first() ### peut etre inutile
        if not record: ### peut etre inutile
            # if the record did not exist yet
            record = model.Image()
        record.image_path = hash_path + ext
        record.thumb_path = hash_path + "_thumb.jpg"
        record.description = request.POST["description"]
        model.meta.Session.save_or_update(record)
        model.meta.Session.commit()
        return redirect_to(url_for(action="view_image", id=record.id))
        ### enregistrer les tiff en png ?

    def view_image(self, id=None):
        image_q = model.meta.Session.query(model.Image)
        c.record = image_q.filter_by(id=id).first()
        if c.record:
            return render("image.mako")
        else:
            abort(404)
