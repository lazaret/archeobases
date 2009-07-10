# -*- coding: utf-8 -*-

import os

from pylons import config

from iw.thumbs.middleware import Thumbs


def add_thumbs(app):
    """ Add image thumbnails generation middleware to the ``app``."""

    preview = (560, 480)
    sidebox = (170, 255)

    return Thumbs(app,
                  image_dir = config['app_conf']['image_dir'],
                  cache_dir=os.path.join(config['app_conf']['cache_dir'], 'thumbs'),
                  url_regexp = '/thumbs/(?P<size>%s)(?P<path>/.*)',
                  url_parser = 'iw.thumbs.url:size_parser',
                  sizes = {'preview': preview, 'sidebox': sidebox})



