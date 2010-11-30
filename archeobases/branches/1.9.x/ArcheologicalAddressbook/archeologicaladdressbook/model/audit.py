# -*- coding: utf-8 -*-
#
# Copyright 2010 LDLP (Laboratoire Départemental de Prehistoire du Lazaret)
# http://lazaret.unice.fr/opensource/ - opensource@lazaret.unice.fr
#
# This file is part of ArcheologicalAdressbook and is released under
# the GNU Affero General Public License 3 or any later version.
# See LICENSE.txt or <http://www.gnu.org/licenses/agpl.html>
#
""" """

import datetime

from sqlalchemy import Column
from sqlalchemy.orm.interfaces import MapperExtension
#from  sqlalchemy.orm.mapper import Mapper
from sqlalchemy.types import DateTime
from sqlalchemy.types import Integer
from sqlalchemy.types import PickleType
from sqlalchemy.types import Unicode

from archeologicaladdressbook.model.meta import Base
from archeologicaladdressbook.model.meta import Session


from pylons import tmpl_context as c  # TODO: try to get rif of this


class Audit(Base):
    """ """
    __tablename__ = "audit"
    audit_id = Column(Integer, autoincrement=True, primary_key=True)
    modelname = Column(Unicode)
    type = Column(Unicode(6))  # INSERT UPDATE DELETE
    user = Column(Unicode(16), default='unknown')
    timestamp = Column(DateTime, default=datetime.datetime.now)
#    tableid = Column(Integer, nullable=False)
    values = Column(PickleType)

    # Special methods
    def __repr__(self):
        return ('<Audit: auditid=%r, timestamp=%r>' % (
                self.audit_id, self.timestamp)).encode('utf-8')

    def __unicode__(self):
        return '%s %s' % (self.audit_id, self.timestamp)


class AuditChanges(MapperExtension):

#    def _toto(self, type=None):
#        audit = Audit()
#        audit.modelname = instance.__class__.__name__
#        audit.type = type
#        audit.user = c.userid
#        #
#        Session.add(audit)
#

    def after_insert(self, mapper, connection, instance):
        audit = Audit()
        audit.modelname = instance.__class__.__name__  # model name
        audit.type = 'INSERT'
        audit.user = c.userid
        #audit.tableid = instance.person_id
        audit.values = {}
        for column_name in instance.__table__.columns.keys():
            audit.values[column_name] = getattr(instance, column_name)
        Session.add(audit)

    def after_update(self, mapper, connection, instance):
        audit = Audit()
        audit.modelname = instance.__class__.__name__  # model name
        audit.type = 'UPDATE'
        audit.user = c.userid
#        audit.tableid = instance.person_id
        Session.add(audit)

    def after_delete(self, mapper, connection, instance):
        audit = Audit()
        audit.modelname = instance.__class__.__name__  # model name
        audit.type = 'DELETE'
        audit.user = c.userid
#        audit.tableid = instance.person_id
        Session.add(audit)
