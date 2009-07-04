# -*- coding: utf-8 -*-

"""Routes configuration

The more specific and detailed routes should be defined first so they
may take precedent over the more generic routes. For more information
refer to the routes manual at http://routes.groovie.org/docs/
"""
from pylons import config
from routes import Mapper

def make_map():
    """Create, configure and return the routes Mapper"""
    map = Mapper(directory=config['pylons.paths']['controllers'],
                 always_scan=config['debug'])
    map.minimization = False

    # The ErrorController route (handles 404/500 error pages); it should
    # likely stay at the top, ensuring it can always be resolved
    map.connect('/error/{action}', controller='error')
    map.connect('/error/{action}/{id}', controller='error')

    # Default Pylons controler
    map.connect('/{controller}/{action}')
    map.connect('/{controller}/{action}/{id}')

    # Sub-index pages controler
    #map.connect('/{controller}.html', action='index')
    map.connect('/{controller}', action='index')
    map.connect('/{controller}/', action='index')

    # Main index page controler
    map.connect('/', controller='main', action='index')
    map.connect('/index.html', controller='main', action='index')

    # About page controler
    #map.connect('/about', controller='main', action='about')
    map.connect('/about.html', controller='main', action='about')


    return map