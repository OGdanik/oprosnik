from flask_login import UserMixin
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship

db = SQLAlchemy()

class accounts(UserMixin, db.Model):
    id = db.Column(db.Integer, primary_key=True)
    login = db.Column(db.String(100))
    password = db.Column(db.String(100))
    fio = db.Column(db.String(100))
    age = db.Column(db.Integer)
    id_pol = db.Column(db.Integer, ForeignKey('pol.id'))
    pol = relationship('pol')

class pol(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100))

class tematiki(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100))
    id_accounts = db.Column(db.Integer, ForeignKey('accounts.id'))
    accounts = relationship('accounts')

class oprosi(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100))
    id_accounts = db.Column(db.Integer, ForeignKey('accounts.id'))
    id_tematiki = db.Column(db.Integer, ForeignKey('tematiki.id'))
    accounts = relationship('accounts')
    tematiki = relationship('tematiki')

class voprosi(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    text = db.Column(db.String(100))
    id_opros = db.Column(db.Integer, ForeignKey('oprosi.id'))
    opros = relationship('oprosi')

class otveti(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    text = db.Column(db.String(100))
    count_otvetov = db.Column(db.Integer)
    id_vopros = db.Column(db.Integer, ForeignKey('voprosi.id'))
    voprosi = relationship('voprosi')