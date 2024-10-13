from app.exts import _DB

collection = _DB().users

def add_user(user_to_be_added):
    collection.insert_one(user_to_be_added)

def update_user(_iid, set):
    collection.update_one({"user_id": _iid}, {"$set": set})

def get_user(user):
    return collection.find_one({'email': user})

def get_user_by_id(id):
    return collection.find_one({'user_id': id}, {'_id': False})

def get_user_by_token(token):
    return collection.find_one({'access_token': token}, {'_id': False})

