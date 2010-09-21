## TODO simplification or add the matt post
## matt validator from

import datetime
#from time import strptime
import formencode


class WorseDateConverter(formencode.FancyValidator):
    """
    Requires a list of valid date format strings.

    >>> wdc = WorseDateConverter(['%m-%d-%Y',  '%m/%d/%Y', '%Y-%m-%d'])
    >>> wdc.to_python('09-06-2008')
    datetime.date(2008, 9, 6)
    >>> wdc.to_python('09/06/2008')
    datetime.date(2008, 9, 6)
    >>> wdc.to_python('2008-09-06')
    datetime.date(2008, 9, 6)
    >>> wdc.to_python('2008/09/06') # slashes instead of dashes.
    Traceback (most recent call last):
        ...
    Invalid: I couldn't parse '2008/09/06' with any of my formats!
    """

    def __init__(self, dateformats):
        self.dateformats = dateformats

    def to_python(self, value, state=None):
        if value is None:
            return
        for datefmt in self.dateformats:
            try:
                return datetime.datetime.strptime(value, datefmt).date()
            except ValueError:
                pass
        else:
            msg = "I couldn't parse '%s' with any of my formats!" % value
            raise formencode.Invalid(msg, value, state)

    def from_python(self, value, state=None):
        if value is None:
            return None
        else:
            return value.strftime(self.dateformats[0])


from archeologicaladdressbook.model.person import Person
from archeologicaladdressbook.model import Session

class UniquePerson(formencode.FormValidator):

    def _to_python(self, value_dict, state):
        last_name = value_dict.get('last_name')
        first_name = value_dict.get('first_name')
        person = Session.query(Person).filter(Person.last_name==last_name).filter(Person.first_name==first_name)
        if person:
            raise formencode.Invalid(
                'That person already exists',
                value, state)
        return value_dict
