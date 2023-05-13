from flask import Blueprint, render_template, json, request, url_for, redirect, flash, abort
from flask_login import login_user, logout_user, login_required, current_user
from .models import oprosi, tematiki, voprosi, otveti
from . import db
import sys

main = Blueprint('main', __name__)

@main.route('/')
@login_required
def index():
    tems = db.session.query(tematiki).all()
    return render_template('index.html', active_index='active', tems=tems)

@main.route('/', methods=['POST'])
def index_post():
    tema = request.form['tema']
    name_o = request.form['name_opros']
    new_opros = oprosi(name=name_o, id_tematiki=tema, id_accounts=current_user.id)
    db.session.add(new_opros)
    db.session.commit()
    id_o = new_opros.id
    return redirect(url_for('main.edit_opros', id_o=id_o))

@main.route('/<int:id_o>/edit')
@login_required
def edit_opros(id_o):
    opros = db.session.query(oprosi).get(id_o)
    voproses = db.session.query(voprosi).filter(voprosi.id_opros == id_o).all()
    otvets = list()
    for v in voproses:
        otvet = db.session.query(otveti).order_by(otveti.id).filter(otveti.id_vopros == v.id).all()
        otvets.append(otvet)
    if not opros:
        return abort(404)
    if (opros.id_accounts != current_user.id):
        return redirect(url_for('main.index'))
    return render_template('edit.html', opros=opros, voprosi=voproses, otvets=otvets)

@main.route('/<int:id_o>/edit', methods=['POST'])
@login_required
def edit_opros_post(id_o):
    opros = db.session.query(oprosi).get(id_o)
    if not opros:
        return abort(404)
    if (opros.id_accounts != current_user.id):
        return redirect(url_for('main.index'))
    question = request.form['question']
    otvet = request.form.getlist('otvet')
    new_vopros = voprosi(text=question, id_opros=id_o)
    db.session.add(new_vopros)
    otvets = list()
    for i in otvet:
        new_otvet = otveti(text=i, id_vopros=new_vopros.id, count_otvetov=0)
        new_otvet.voprosi = new_vopros
        otvets.append(new_otvet)
    db.session.add_all(otvets)
    db.session.commit()
    return redirect(url_for('main.edit_opros', id_o=id_o))

@main.route('/my_oprosi')
@login_required
def my_oprosi():
    opros = db.session.query(oprosi).filter(oprosi.id_accounts == current_user.id)
    return render_template('oprosi.html', active_oprosi='active', oprosi = opros)

@main.route('/add_tematika', methods=['POST'])
@login_required
def add_tematika():
    name = request.form['name_tem']
    new_tem = tematiki(name = name, id_accounts=current_user.id)
    db.session.add(new_tem)
    db.session.commit()
    return redirect(url_for('main.index'))

@main.route('/<int:id_o>')
def opros(id_o):
    opros = db.session.query(oprosi).get(id_o)
    if current_user.is_authenticated:
        if opros.id_accounts == current_user.id:
            return redirect(url_for('main.edit_opros', id_o=id_o))
    voproses = db.session.query(voprosi).filter(voprosi.id_opros == id_o).all()
    otvets = list()
    for v in voproses:
        otvet = db.session.query(otveti).order_by(otveti.id).filter(otveti.id_vopros == v.id).all()
        otvets.append(otvet)
    return render_template('opros.html', opros=opros, otvets=otvets)

@main.route('/<int:id_o>', methods=['POST'])
def opros_post(id_o):
    otvets = request.form.getlist('otveti')
    for o in otvets:
        otvet = db.session.query(otveti).get(o)
        otvet.count_otvetov = otvet.count_otvetov + 1
        db.session.add(otvet)
    db.session.commit()
    return redirect(url_for('main.opros', id_o=id_o))

@main.route('/<int:id_o>/delete')
@login_required
def delete_opros(id_o):
    opros = db.session.query(oprosi).get(id_o)
    db.session.delete(opros)
    db.session.commit()
    return redirect(url_for('main.my_oprosi'))