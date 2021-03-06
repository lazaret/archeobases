"""SQLAlchemy Metadata and Session object"""

from sqlalchemy.orm import scoped_session, sessionmaker
from sqlalchemy.ext.declarative import declarative_base


__all__ = ['Session', 'engine', 'metadata', 'DeclarativeBase']

# SQLAlchemy database engine. Updated by model.init_model()
engine = None

# SQLAlchemy session manager. Updated by model.init_model()
Session = scoped_session(sessionmaker())

# Global metadata. If you have multiple databases with overlapping table
# names, you'll need a metadata for each database
DeclarativeBase = declarative_base()
metadata = DeclarativeBase.metadata
