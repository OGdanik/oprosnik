from flask import Flask
from flask_login import LoginManager
from flask_migrate import Migrate
from .models import db

def create_app():
    app = Flask(__name__)

    app.config['SECRET_KEY'] = 'k$)04$ul47h_83ozb#2wkvpadqtwjo_-a0-m4**oe)d)u*(1c7'
    app.config['SQLALCHEMY_DATABASE_URI'] = "postgresql://postgres:123@localhost:5432/oprosnik"
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    db.init_app(app)
    migrate = Migrate(app, db)
    
    login_manager = LoginManager()
    login_manager.login_view = 'auth.login'
    login_manager.init_app(app)

    from .models import accounts
    @login_manager.user_loader
    def load_user(user_id):
        return accounts.query.get(int(user_id))

    from .auth import auth as auth_blueprint
    app.register_blueprint(auth_blueprint)

    from .main import main as main_blueprint
    app.register_blueprint(main_blueprint)

    return app