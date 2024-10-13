from flask import make_response, request, jsonify
from jinja2 import Environment, FileSystemLoader
from app.resources.errors import BadTokenError
from pymongo import MongoClient
from datetime import datetime
from functools import wraps
import timeago
import string
import socket
import random
import json
import chardet
import re
import os

def _DB():
    client = MongoClient(host='localhost',
                            port=27017,
                            username='',
                            password='')
    db = client.dbv201
    return db

def populate():
    print(os.path.dirname(os.path.abspath(__file__)))

    enc = chardet.detect(open(os.path.dirname(os.path.abspath(__file__)) + '/resources/rawdb/users-export.json', "rb").read())['encoding']
    with open(os.path.dirname(os.path.abspath(__file__)) + '/resources/rawdb/users-export.json', "r", encoding=enc) as file:
        file_data = json.load(file)
        collection = _DB().users
        if isinstance(file_data, list):
            collection.insert_many(file_data)
        else:
            collection.insert_one(file_data)

def get_ip():
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(("8.8.8.8", 80))
        return s.getsockname()[0]
    except:
        return "127.0.0.1"

def is_email(email):
    pattern = re.compile(r'([A-Za-z0-9]+[.-_])*[A-Za-z0-9]+@[A-Za-z0-9-]+(\.[A-Z|a-z]{2,})+')
    return re.fullmatch(pattern, email)

def authenticate(func):
    @wraps(func)
    def decorator(*args, **kwargs):
        req = request.get_json()
        access_token = req.get('access_token')
        refresh_token = req.get('refresh_token')
        user =  _DB().users.find_one({"access_token": access_token}, {"refresh_token": refresh_token})

        if user:
            return func(*args, **kwargs)
        else:
            raise BadTokenError
    return decorator

#def authenticate(func):
#    @wraps(func)
#    def decorator(*args, **kwargs):
#        req = request.headers
#        access_token = ''
#        refresh_token = ''
#        user = []
#        if 'access_token' in req:
#            access_token = req['access_token']
#            refresh_token = req['refresh_token']
#            user = _DB().users.find_one({"access_token": access_token})
#            if user['refresh_token'] == refresh_token:
#                return func(*args, **kwargs)
#            else:
#                raise BadTokenError
#        else:
#            raise access_denied
#    return decorator

def getTemplate(page, version):
    path = ""
    if page == "home":
        path = "main/home.asp"
    elif page == "posts":
        path = "etc/int/posts.asp"
    elif page == "suggests":
        path = "etc/int/int_posts/suggests.asp"
    elif page == "strys":
        path = "etc/int/strys.asp"
    elif page == "camera":
        path = "camera.asp"
    elif page == "users":
        path = "friends.asp"
    elif page == "messages":
        path = "messages.asp"
    elif page == "msgs":
        path = "etc/int/msgs.asp"
    elif page == "actvs":
        path = "etc/int/actv.asp"
    elif page == "discover":
        path = "discover.asp"
    elif page == "profile":
        path = "profile.asp"
    elif page == "upload":
        path = "etc/int/intn/comingsoon.asp"
    elif page == "notifications":
        path = "etc/int/notifications.asp"
    elif page == "calls":
        path = "etc/int/calls.asp"
    elif page == "search":
        path = "etc/int/search.asp"
    else:
        path = "etc/int/err_pages/403.asp"

    env = Environment(loader=FileSystemLoader("templates"))
    t = env.get_template(path)
    return t

class PageHelpers:
    def _tags(regex, text):
        tag_list = re.findall(regex, text)
        for tag in tag_list:
            return tag

    def random_str(length, st='chars'):
        strc = None
        if st == 'chars':
            strc = string.ascii_letters
        elif st == 'digits':
            strc = string.digits
        elif st == 'lowerdouble':
            strc = string.ascii_lowercase + string.digits
        result_str = ''.join(random.choice(strc) for i in range(length))
        return (result_str)

    def _time(dt):
        dtm = datetime.strptime(dt, "%d/%m/%Y")
        now = datetime.now()
        dt = timeago.format(now, dtm, 'en_short')
        dt = dt.replace('in ', '')
        if "mo" in dt:\
            dt = dtm.strftime("%d %b")
        return dt

    def _trim(text, length):
        if len(text) > length:
            text = text[0:+length]+".."
            return text
        else:
            return text

    def _look(intg, lst):
        try:
            if intg in lst:
                return True
            else:
                return False
        except:
            return False