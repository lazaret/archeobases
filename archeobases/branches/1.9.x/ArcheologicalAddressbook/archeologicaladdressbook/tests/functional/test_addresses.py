from archeologicaladdressbook.tests import *

class TestAddressesController(TestController):

    def test_index(self):
        response = self.app.get(url(controller='addresses', action='index'))
        # Test response...
