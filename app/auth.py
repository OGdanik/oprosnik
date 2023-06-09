from flask import Blueprint, render_template, redirect, url_for, request, flash
from werkzeug.security import generate_password_hash, check_password_hash
from flask_login import login_user, logout_user, login_required, current_user
from .models import accounts
from . import db

auth = Blueprint('auth', __name__)

@auth.route('/login')
def login():
    if current_user.is_authenticated:
        return redirect(url_for('main.index'))
    return render_template('login.html')

@auth.route('/logout')
@login_required
def logout():
    logout_user()
    return redirect(url_for('main.index'))

@auth.route('/signup/<string:page>')
def signup(page):
    if current_user.is_authenticated:
        return redirect(url_for('main.index'))
    return render_template('signup.html')

@auth.route('/signup/<string:page>', methods=['POST','GET'])
def signup_post(page):
    login = request.form['login']
    p1 = request.form['password1']
    p2 = request.form['password2']
    fio = request.form['fio']
    age = request.form['age']
    pol = request.form['pol']
    user = accounts.query.filter_by(login=login).first()
    if p1 != p2:
        flash('Пароли отличаются.', category='error')
        return redirect(url_for('auth.signup'))
    if user:
        flash('Такой логин уже существует.', category='error')
        return redirect(url_for('auth.signup', page=page))
    new_user = accounts(login=login, password=generate_password_hash(p1, method='sha256'), fio=fio, age=age, id_pol=pol)
    db.session.add(new_user)
    db.session.commit()
    login_user(new_user)
    return redirect('/'+page)

@auth.route('/login', methods=['POST'])
def login_post():
    page = request.form.get('next')
    if not page:
        page = 'index'
    login = request.form.get('login')
    password = request.form.get('password')
    user = accounts.query.filter_by(login=login).first()
    if not user or not check_password_hash(user.password, password):
        flash('Неверный пароль или такого пользователя не существует.')
        return redirect(url_for('auth.login'))
    login_user(user)
    return redirect(page)