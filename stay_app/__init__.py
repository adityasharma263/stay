from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow
from .middleware import LoggerMiddleware

# Initializes Flask
app = Flask(__name__,static_url_path='', static_folder='static/')
app.wsgi_app = LoggerMiddleware(app.wsgi_app)
# initialize database
db = SQLAlchemy(app)

# Intialize Marshmallow
ma = Marshmallow(app)

# Load config
app.config.from_pyfile('../config.cfg')
# print(app.config['BROKER_URL'])
import stay_app.view
