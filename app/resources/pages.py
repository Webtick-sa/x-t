from flask_restx import Resource, Namespace, fields
from app.resources.errors import UnauthorizedError, UserIsInvalidError
from app.services.user_service import get_user_by_token, get_user_by_id
from flask import request
from bson.json_util import dumps
#from app.models import PostsRec
from app.exts import _DB, authenticate, getTemplate

page_namespace = Namespace('page', description='Namespace for Pages and Templates')

page_model = page_namespace.model(
    'Pages', {
        'refresh_token': fields.String,
        'access_token': fields.String,
        'page': fields.String,
        'v': fields.String,
        'timeout': fields.Integer
	}
)

@page_namespace.route('/m')
class PagesResource(Resource):
    @page_namespace.expect(page_model)
#    @authenticate
    def post(self):
        try:
            req = request.get_json()
            token = req.get('access_token')
            version = req.get('v')
            page = req.get('page')

            print(token)
#           user = get_user_by_token(token)
#           _uid = user['user_id']
#           _uid = self.user['user_id']

            _pages = {
                "login",
                "home",
                "friends",
                "messages",
                "explore",
                "profile"
            }
            t = getTemplate(page, version)
            return t.render()

        except UserIsInvalidError:
            raise UserIsInvalidError

@page_namespace.route('/f')
class PageinnerResource(Resource):
    @page_namespace.expect(page_model)
    @authenticate
    def post(self):
        try:
            req = request.get_json()
            token = req.get('access_token')
            version = req.get('v')
            page = req.get('page')

            print(token)
            user = get_user_by_token(token)
            _uid = user['user_id']
#           _uid = self.user['user_id']

            _pages = {
                "posts",
                "stories",
                "notifications",
                "messages",
                "recomposts",
                "recomusers"
            }
            t = getTemplate(page, version)
            return t.render()

        except UserIsInvalidError:
            raise UserIsInvalidError

@page_namespace.route('/i')
class PostsResource(Resource):
    @page_namespace.expect(page_model)
    @authenticate
    def i(self):
        try:
            req = request.get_json()
            token = req.get('access_token')
            version = req.get('v')
            page = req.get('page')

            print(token)
            user = get_user_by_token(token)
            _uid = user['user_id']
#           _uid = self.user['user_id']

            _pages = {
                "postview",
                "profileview",
                "chatview",
                "storyview",
                "profile"
            }
            t = getTemplate(page, version)
            return t.render()

        except UserIsInvalidError:
            raise UserIsInvalidError

