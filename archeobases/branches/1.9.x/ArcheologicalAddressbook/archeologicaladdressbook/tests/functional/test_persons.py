from archeologicaladdressbook.tests import *

class TestPersonsController(TestController):

    def test_index(self):
        response = self.app.get(url(controller='persons', action='index'))
        # Test response...
