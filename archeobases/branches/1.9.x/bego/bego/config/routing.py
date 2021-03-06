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
    map.connect('/{controller}/{action}/')
    map.connect('/{controller}/{action}/{id}')
    map.connect('/{controller}/{action}/{id}/')

    # Sub-index pages controler
    map.connect('/{controller}.html', action='index')
    map.connect('/{controller}', action='index')
    map.connect('/{controller}/', action='index')

    # Root controler action (index, login, logout, etc...)
    map.connect('/', controller='root', action='index')
    map.connect('/{action}.html', controller='root')
    map.connect('/{action}', controller='root')
    map.connect('/{action}/', controller='root')

    # Display image with filename controler
    map.connect('/image/display/{id}/{filename}', controller='image', action='display')

    return map
