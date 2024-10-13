from flask import Flask
from flask_restx import Api
from flask.logging import default_handler
from flask_jwt_extended import JWTManager
from flask_cors import CORS
from tornado.httpserver import HTTPServer
from tornado.wsgi import WSGIContainer
from app.exts import _DB
from app.resources.query import query_namespace
from app.resources.account import account_namespace
from app.resources.pages import page_namespace

def create_app():
    app = Flask(__name__)

    app.logger.removeHandler(default_handler)
    app.config.from_object('config.DevelopmentConfig')

    JWTManager(app)
    CORS(app)

    api = Api(app, title='Xeera API', version='2.0', doc='/')
    api.add_namespace(query_namespace, path='/query')
    api.add_namespace(account_namespace, path='/account')
    api.add_namespace(page_namespace, path='/page')

    server = HTTPServer(WSGIContainer(app))
    return server

def configure_database(app):

    @app.before_first_request
    def initialize_database():
        _DB.create_all()

    @app.teardown_request
    def shutdown_session(exception=None):
        _DB.session.remove()
