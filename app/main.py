from flask import Blueprint, render_template, json, request, url_for, redirect, flash, abort
from flask_login import login_user, logout_user, login_required, current_user

main = Blueprint('main', __name__)

@main.route('/')
def index():
    return render_template('index.html')