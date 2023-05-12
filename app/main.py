from flask import Blueprint, render_template, json, request, url_for, redirect, flash, abort
from flask_login import login_user, logout_user, login_required, current_user
from .models import oprosi, tematiki
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
    if not opros:
        return abort(404)
    if (opros.id_accounts != current_user.id):
        return redirect(url_for('main.index'))
    return render_template('edit.html', opros=opros)

@main.route('/<int:id_o>/edit', methods=['POST'])
@login_required
def edit_opros_post(id_o):
    opros = db.session.query(oprosi).get(id_o)
    if not opros:
        return abort(404)
    if (opros.id_accounts != current_user.id):
        return redirect(url_for('main.index'))
    questions = request.form['question']
    otvet = request.form.getlist('otvet')
    print(questions, otvet, file=sys.stderr)
    return render_template('edit.html', opros=opros)

@main.route('/my_oprosi')
def my_oprosi():
    return render_template('oprosi.html', active_oprosi='active')