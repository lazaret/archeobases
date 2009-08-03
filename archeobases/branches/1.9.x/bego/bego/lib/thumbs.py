"""Image thumbnail generation middleware.

Used to genrate on the fly image thumbnails.
"""
import os

from pylons import config

from iw.thumbs.middleware import Thumbs


def add_thumbs(app):
    """Add the image thumbnails generation middleware to the ``app``."""

    _preview = (560, 480)
    _sidebox = (170, 255)
    _url_regexp = '/thumbs/(?P<size>%s)(?P<path>/.*)'

    return Thumbs(app,
                  image_dir = config['app_conf']['image_dir'],
                  cache_dir=os.path.join(config['app_conf']['cache_dir'], 'thumbs'),
                  url_regexp = _url_regexp,
                  url_parser = "iw.thumbs.url:size_parser",
                  sizes = {'preview': _preview, 'sidebox': _sidebox})



