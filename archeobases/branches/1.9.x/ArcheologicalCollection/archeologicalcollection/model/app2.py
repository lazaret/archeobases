import sys
import logging
from optparse import OptionParser

from sqlalchemy import create_engine
from paste.deploy import loadserver
from sqlalchemy.databases.postgres import PGArray
from rum import RumApp

from model import Model, Collection, Transaction, User, Daylytransactions, Document, Archeological_object, Audio_video, Iconographic_doc, Image, Ground_statement, Ct_scan, Ossement, Artefacts, Imprint, Anthropological_oss, Paleonthological_oss, Shelf, Furniture, Room, Building, Archeological_site, Bibliographical_reference, Group, Permission
#Collection_system

#
# A parser for command line options
#
parser = OptionParser()
parser.add_option('', '--dburl',
                  dest='url',
                  help='SQLAlchemy database uri (eg: postgres:///somedatabase)',
                  default='sqlite:///rum_demo.db')
parser.add_option('-d', '--debug',
                  dest='debug',
                  help='Turn on debug mode',
                  default=False,
                  action='store_true')

#
# Makes the app
#
def load_app(url, debug=False):
    models = [Collection, Transaction, User, Daylytransactions, Document, Archeological_object, Audio_video, Iconographic_doc, Image, Ground_statement, Ct_scan, Ossement, Artefacts, Imprint, Anthropological_oss, Paleonthological_oss, Shelf, Furniture, Room, Building, Archeological_site, Bibliographical_reference, Group, Permission]
	
    return RumApp({
        'debug': debug,
        'rum.repositoryfactory': {
            'use': 'sqlalchemy',
            'models': models,
            'sqlalchemy.url': url,
            'session.transactional': True,
        },
        'rum.viewfactory': {
            'use': 'toscawidgets',
        }
    })

#
# Main calling point
#
def main(argv=None):
    logging.basicConfig(level=logging.INFO, stream=sys.stderr)
    opts, args = parser.parse_args(argv)
    Model.metadata.create_all(bind=create_engine(opts.url))
    app = load_app(opts.url, opts.debug)
    server = loadserver('egg:Paste#http')
    try:
        server(app)
    except (KeyboardInterrupt, SystemExit):
        print "Bye!"

if __name__ == '__main__':
    sys.exit(main(sys.argv))
