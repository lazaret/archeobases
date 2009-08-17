
import sqlalchemy as sa
from sqlalchemy import Column, ForeignKey, Table, PrimaryKeyConstraint
from sqlalchemy.types import *
from sqlalchemy.orm import relation
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.databases.postgres import PGArray
from sqlalchemy import orm


#from archeologicalcollection.model import meta
from os import urandom
from hashlib import sha1
import datetime



#SQLAlchemy object-relational configuration involves the usage of Table, mapper(), and class objects 
#to define the three areas of configuration. Declarative moves these three types of configuration underneath 
#the individual mapped class. 
# the declarative_base() produces a new base class from which all mapped classes inherit from. 
# This decarative base is called here : Model
Model = declarative_base()

# ---------------------------the collection tables Inheritance ----------------------------------_____
class Collection(Model):
   #collection table model
   __tablename__ = "collection"
	
   # primary_key of the table
   id = Column('id', Integer, primary_key=True)
   
   # numero inventory collection (scientific code)
   id_inv = Column("id-inv",Unicode(15), nullable=False)
   #object name
  # name = Column("name",Unicode(20), nullable=False)
   donor_name = Column("donor_name",Unicode(20))
   #recording organisation
   rec_organis = Column("rec_organis",Unicode(20))
   #acquisition method
   acq_method = Column("acq_method",Unicode(20))
   #acquisition date 
   acq_date = Column("acq_date",Date)
   #cost price
   price = Column("price",Integer)
   #scientific opinion 
   sc_opinion = Column("sc_opinion",Unicode(20))
   # registration date
   regist_date= Column("regist_date",Date)
   observ = Column("observ",UnicodeText)
   keywords = Column("keywords",UnicodeText)
   #copies_number
   copies_nb=Column("copies_nb",Integer)
   
    #---------------------- mapping inheritence tables of collection objects-------------------------
   type = Column('type',String(50),nullable=False)
   __mapper_args__ = {'polymorphic_on': type,
                      'polymorphic_identity': 'Collection'}
					  
   #-----------------------relationship between the table of shelves and the table of the collection object-------------------------				  
   # column of foreign key which is the primary key of the shelf					  
   shelf_id = Column('shelf_id', Integer, ForeignKey('shelf.id'))
   # many-to-one relation between objects of collection and the shelf 			  
   shelf = relation('Shelf', backref='collections')
   
   #-----------------------relationship between the table of the system of the collection and the table of the collection object-------------------------
   # column of foreign key which is the primary key of the collection system					  
   #collection_system_id = Column('collection_system_id', Integer, ForeignKey('collection_system.id'))
   # many-to-one relation between objects of collection and the shelf 			  
   #collection_system = relation('Collection_system', backref='collections')
	
class Archeological_object(Collection):
   # archeologicalobject table model  
   __tablename__ ="archeologicalobject"
   #__mapper_args__ = {'polymorphic_identity': 'Archeological_object'}
  
   # numerical identifiant of the classe 
   id = Column("id",Integer,ForeignKey('collection.id'), primary_key=True)
     
   #  numero inventory collection according to the standard encoding of the Museum of france (scientific code) 
   n_invent = Column('n_invent',Unicode(10) ,nullable=False)
    
   #geological period
   geolog_period = Column('geolog_period',Unicode(30))
   #cultural period 
   cult_period = Column('cult_period',Unicode(30))
   #absolute date
   abs_date = Column('abs_date',Unicode(10))
   #dating method
   dat_method = Column('dat_method',Unicode(20))
   markers = Column('markers',Unicode(20))
   width = Column('width',Integer)
   length = Column('length',Integer)
   thickness = Column('thickness',Integer)
   material = Column('material',Unicode(25))
   #conservation State
   conserv_state = Column('conserv_state',Unicode(20))
   #original Molding
   orig_Molding= Column('orig_Molding',Unicode(30))
   #molding Date
   mold_date = Column('mold_date',Date)
   #acquisition Molding Date
   acq_Mold_date= Column('acq_Mold_date',Date)
   #original Deposit
   orig_Deposit = Column('orig_Deposit',Unicode(30))
   type = Column('type',String(50),nullable=False)
   __mapper_args__ = {
                 'polymorphic_on': type,
                 'polymorphic_identity': 'Archeological_object'
				 }
   # the column of the foreign key which is the primary key of the archeological site			  
   archeological_site_id = Column('archeological_site_id', Integer, ForeignKey('archeological_site.id'))
   # many-to-one relation between archeological objects of collection and the archeological site			  
   archeological_site = relation('Archeological_site', backref='archeologicalobjects')
				 
class Bibliographical_reference(Model):
   # Bibliographical references table model 
   __tablename__ ="reference"
   # primary_key of the table
   id = Column('id', Integer, primary_key=True)
   refer = sa.Column(sa.types.UnicodeText)
   #the column of the foreign key which is the primary key of the archeological object			  
   archeologicalobject_id = Column('archeologicalobject_id', Integer, ForeignKey('archeologicalobject.id'))
   # many-to-one relation between Bibliographical references  and the archeological objects		  
   archeologicalobject = relation('Archeological_object', backref='references')
	
class Document(Collection):
   # document(archeological document ) table  
   __tablename__ ="document"	
  
   
   # numerical identifiant of the classe 
   id = Column("id",Integer,ForeignKey('collection.id'), primary_key=True)
   # title of the document
   title = Column('title',Unicode(30))
   # completion date
   comp_date  = Column('comp_date',Date)
   #realization place
   real_place  = Column('real_place',Unicode(20))
   # description
   descript = Column('descript',UnicodeText)
   type = Column('type',String(50),nullable=False)
   __mapper_args__ = {
                 'polymorphic_on': type,
                 'polymorphic_identity': 'Document'
				 }
		

class User(Model):
    # user table model
   __tablename__ = "user"
   # numerical identifiant of the class
   id = Column('id', Integer, primary_key=True)
   user_name = Column('user_name', Unicode(16), unique=True, nullable=False)
   display_name = Column('display_name', Unicode(16))
   creatdate = Column('creatdate',DateTime) 
   #default=DateTime.now)
   # password stuff
   password = Column("password", Unicode(80),unique=True, nullable=False)
   
   def _set_password(self, password):
        """Encrypt password on the fly."""
        if isinstance(password, unicode):
            password_8bit = password.encode("UTF-8")
        else:
            password_8bit = password
        salt = sha1()
        salt.update(urandom(60))
        sha1_hash = sha1()
        sha1_hash.update(password_8bit + salt.hexdigest())
        hashed_password = salt.hexdigest() + sha1_hash.hexdigest()
        if not isinstance(hashed_password, unicode):
            hashed_password = hashed_password.decode("UTF-8")
        self._password = hashed_password

   def _get_password(self):
        """Return the password hashed"""
        return self._password

  # password = orm.synonym("_password", descriptor=property(_get_password, _set_password))

   def validate_password(self, password):
        """Check the password against existing credentials."""
        hashed_pass = sha1()
        hashed_pass.update(password + self.password[:40])
        return self.password[40:] == hashed_pass.hexdigest()

    	
class Daylytransactions(Model):
   # daytransactions table model
   __tablename__ = "daylytransactions"
   #this table contains all archived transactions a day 
   # numerical identifiant of the class
   id = Column('id', Integer, primary_key=True)
   day = Column('day' ,Date , nullable=False) 
   #default=Date.today)
  
		
class Transaction (Model):
		# Transaction_interne class is the AssociationObject pattern :
		# it's the association class between collection class and  user class
		# The left side of the relation references the association object via one-to-many,
		# and the association class references the right side via many-to-one 
   __tablename__ ="transaction"	
   #this table contains all transactions of the day 
   # numerical identifiant of the class
   id = Column('id', Integer, primary_key=True)
   # action numero 
   numero = Column('numero', Integer ,autoincrement=True, nullable=False)
   #action date and action time
   date  =  Column('date', DateTime, nullable=False)
   #transaction kind 
   transact_kind  = Column('type', Unicode(10) , nullable=False)
   #action type
   #action_type  = Column('action_type', PGArray(String) , nullable=False)
   #collection_id,user_id,daylytransactions_id are foreignKeys representing primarykeys of tables in relationship
   #with Transaction class
   collection_id = Column('collection_id', Integer, ForeignKey('collection.id'))
   user_id = Column('user_id', Integer, ForeignKey('user.id'))
   daylytransactions_id =Column('daylytransactions_id', Integer, ForeignKey('daylytransactions.id'))
   #maping this relationship with the three classes
   collection = relation(Collection, backref="transactions") 
   user = relation(User, backref="transactions") 
   daylytransactions = relation(Daylytransactions, backref="transactions")
      
     
class Audio_video(Document):
   __tablename__ = 'audio_video'
   # numerical identifiant of the classe 
   id = Column("id",Integer,ForeignKey('document.id'), primary_key=True)  
   duration = Column('duration',Integer)
   support  = Column('support',Unicode(10))
   publisher  = Column('publisher',Unicode(25))
   edit_date = Column('edit_date',Date)
   edit_country = Column('edit_country',Unicode(25)) 
   __mapper_args__ = {'polymorphic_identity':'Audio_video'}

class Iconographic_doc(Document):	

   # archeological iconographic document table model  
   __tablename__ ='iconographic_doc'	
   # numerical identifiant of the classe 
   id = Column("id",Integer,ForeignKey('document.id'), primary_key=True)    
   dimension = Column('dimension',Unicode(10))
   type = Column('type',String(50),nullable=False)
   __mapper_args__ = {
                 'polymorphic_on': type,
                 'polymorphic_identity': 'Iconographic_doc'
				 }
 

class Ground_statement(Iconographic_doc):
   # statement of the ground table model 
   __tablename__ ="gr_statement"
   __mapper_args__ = {'polymorphic_identity': 'Ground_statement'}	  
  
   id = Column("id",Integer,ForeignKey('iconographic_doc.id'), primary_key=True)	 
   Scale = Column('scale',Numeric)
   
class Ct_scan(Iconographic_doc):
   # ct_scan table model   
   __tablename__ ="ct_Scan"	   
   __mapper_args__ = {'polymorphic_identity': 'Ct_scan'}
   id = Column("id",Integer,ForeignKey('iconographic_doc.id'), primary_key=True)
   plans_cuts_nber = Column('plans_cuts_nber',Integer)
   thickness = Column('thickness',Integer)
   cuts_nber = Column('cuts_nber',Integer)
         
   
class Image(Iconographic_doc):
   #image  table model  
   __tablename__ ='image'	
   __mapper_args__ = {'polymorphic_identity': 'Image'}
   # numerical identifiant of the class
   id = Column("id",Integer,ForeignKey('iconographic_doc.id'), primary_key=True)    
   copy_date = Column('copy_date',Date)	
   kind=Column('kind',Unicode(15))
   

class Ossement(Archeological_object):
   #ossement table model """  
   __tablename__ ='ossement'
  # __mapper_args__ = {'polymorphic_identity': 'ossement'}
  # numerical identifiant: key of the class
   id = Column("id",Integer,ForeignKey('archeologicalobject.id'), primary_key=True)
   #classObject
   classOb = sa.Column(sa.types.Unicode(30))
   order = sa.Column(sa.types.Unicode(30))
   family = sa.Column(sa.types.Unicode(30))
   kind = sa.Column(sa.types.Unicode(30))	 
   sort = sa.Column(sa.types.Unicode(30))
   #absolute_age
   absol_age = sa.Column(sa.types.Unicode(3))
   age_individ = sa.Column(sa.types.Integer)
   Sex_individ= sa.Column(sa.types.Unicode(3))
   type = Column('type',String(50),nullable=False)
   __mapper_args__ = {
                 'polymorphic_on': type,
                 'polymorphic_identity': 'Ossement'
				 }
		
	
class Anthropological_oss(Ossement):
	# anthropological_ossement table model """  
   __tablename__ ="anthropological_oss"
   __mapper_args__ = {'polymorphic_identity': 'Anthropological_oss'} 
   # numerical identifiant :key of the class  
   id = Column("id",Integer,ForeignKey('ossement.id'), primary_key=True)	
   #numero_original_fossil
   original_num = sa.Column(sa.types.Unicode(20))
   fossil_name = sa.Column(sa.types.Unicode(20))
   holotype= sa.Column(sa.types.Unicode(15))
   Synonym= sa.Column(sa.types.Unicode(20))
	
	

class Paleonthological_oss(Ossement):
	#paleonthological_ossement table model 
   __tablename__ ="paleonthological_oss"
   
   __mapper_args__ = {'polymorphic_identity': 'Paleonthological_oss'} 
   # numerical identifiant primary_key of the table
   id = Column("id",Integer,ForeignKey('ossement.id'), primary_key=True)
   #scrawny_representation
   scrawny_represent= sa.Column(sa.types.Unicode(10))
	

class Artefacts(Archeological_object):
   #artefacts table model  
   __tablename__ ="artefacts"
   __mapper_args__ = {'polymorphic_identity': 'artefacts'}
   # primary_key of the table
   id = Column("id",Integer,ForeignKey('archeologicalobject.id'), primary_key=True)
   kind = sa.Column(sa.types.Unicode(20))
		
class Imprint(Archeological_object):
	# imprint table model 
   __tablename__ ="imprint"
   __mapper_args__ = {'polymorphic_identity': 'imprint'}
   # primary_key of the table
   id = Column("id",Integer,ForeignKey('archeologicalobject.id'), primary_key=True)
   kind  = sa.Column(sa.types.Unicode(20))


#-------------------- the places of classification of collection objects  -------------------------------------
  
class Shelf(Model):
   # shelf (Shelves containing objects of collection ) table model """  
   __tablename__ ="shelf"
   # primary_key of the table
   id = Column('id', Integer, primary_key=True)
   shelf_num= sa.Column(sa.types.Integer)
   max_nber = sa.Column(sa.types.Integer)
   #the column of the foreign key which is the primary key of the furniture
   furniture_id = Column('furniture_id', Integer, ForeignKey('furniture.id'))
   # many-to-one relation between shelfs table  and the furnitures table	
   furniture= relation('Furniture', backref='shelves')
	
class Furniture(Model):
   # furniture (set of shelves) table model  
   __tablename__ ="furniture"
   # primary_key of the table
   id = Column('id', Integer, primary_key=True)
   # numero of furniture
   furniture_num= sa.Column(sa.types.Integer)
   # number of shelves
   shelves_nber = sa.Column(sa.types.Integer)
	
   room_id = Column('room_id', Integer, ForeignKey('room.id'))
	
   room= relation('Room', backref='furnitures')

class Room(Model):
   #room containing Furnitures  table model 
   __tablename__ ="room"
	# primary_key of the table
   id = Column('id', Integer, primary_key=True)
   # numero of the room
   room_num = sa.Column(sa.types.Integer)
   # numero of the room
   room_name = sa.Column(sa.types.Unicode(15))
   # numero of the floor
   floor  = sa.Column(sa.types.Integer)
   #furnitures number
   furnitures_nber = sa.Column(sa.types.Integer)
   
   building_id = Column('building_id', Integer, ForeignKey('building.id'))
   
   building= relation('Building', backref='rooms')
	
class Building (Model):
   # building  (set of rooms) table model """  
   __tablename__ ="building"
   # primary_key of the table
   id = Column('id', Integer, primary_key=True)
   building_name = sa.Column(sa.types.Unicode(15))
   #rooms_number
   rooms_nber = sa.Column(sa.types.Integer)
   #floors_number
   floors_nber = sa.Column(sa.types.Integer)

			
#---------------------------Archeological site---------------------------------------------------------

class Archeological_site (Model):
   # archeological_site table model """  
   __tablename__ ="archeological_site"
   # primary_key of the table
   id = Column('id', Integer, primary_key=True)
   site_name = sa.Column(sa.types.Unicode(30))
   site_type  = sa.Column(sa.types.Unicode(15))
   country = sa.Column(sa.types.Unicode(20))
   geopolitical_unit = sa.Column(sa.types.Unicode(30))	
   geographical_subdivision = sa.Column(sa.types.Unicode(30))
   municipality = sa.Column(sa.types.Unicode(20))
   postal_code  = sa.Column(sa.types.Unicode(5))



# ---------------------- Authentification and authorization of accees ---------------------------------------

# ------------------many-to-many relation table between groups and users-------------------------
user_group = Table("user_group",Model.metadata,
    sa.Column("user_id", sa.types.Integer, sa.ForeignKey("user.id", onupdate="CASCADE", ondelete="CASCADE")),
    sa.Column("group_id", sa.types.Integer, sa.ForeignKey("group.id", onupdate="CASCADE", ondelete="CASCADE"))
)

#---------------- many-to-many relation table between groups and permisions------------------------
group_permission = sa.Table("group_permission", Model.metadata,
    sa.Column("group_id", sa.types.Integer, sa.ForeignKey("group.id", onupdate="CASCADE", ondelete="CASCADE")),
    sa.Column("permission_id", sa.types.Integer,sa.ForeignKey("permission.id", onupdate="CASCADE", ondelete="CASCADE"))
)

class Group(Model):
   #Group definition
   __tablename__ = 'group'

   # primary_key of the table
   id = Column('id', Integer, primary_key=True)
   group_name = sa.Column(sa.types.Unicode(16), unique=True, nullable=False)
   display_name = sa.Column(sa.types.Unicode(255))
   #created = sa.Column(sa.types.DateTime, default=datetime.now)
   users = relation('User', secondary=user_group, backref="groups")


class Permission(Model):
    #A relationship that determines what each Group can do"""
    __tablename__ = "permission"

    # primary_key of the table
    id = Column('id', Integer, primary_key=True)
    permission_name = sa.Column(sa.types.Unicode(16), unique=True, nullable=False)
    description = sa.Column(sa.types.Unicode(255))
    groups = relation('Group', secondary=group_permission, backref="permissions")


#class Collection_system(Model):
   #the collection  system class which controls all  the system of the collection
  # __tablename__ = "collection_system"

   # primary_key of the table
   #id = Column('id', Integer, primary_key=True)
  
   
