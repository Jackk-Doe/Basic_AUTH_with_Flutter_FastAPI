from fastapi import HTTPException, Depends
from sqlalchemy.orm import Session
from email_validator import validate_email, EmailNotValidError
from passlib.hash import bcrypt
from jwt import encode as jwt_encode
from jwt import decode as jwt_decode

import models as _models
import schemas as _schemas


# NOTE : This is supposed to be a secret key, using to encrypt from JWT
_JWT_SECRET = "ThisIsSecretKey"


async def get_user_by_email(email: str, db: Session) -> _models.User:
    return db.query(_models.User).filter(_models.User.email == email).first()


async def create_user(datas: _schemas.SignUpUser, db: Session) -> _models.User:
    try:
        validated = validate_email(email=datas.email)
        email = validated.email
    except EmailNotValidError:
        raise HTTPException(status_code=404, detail="Please enter a valid email")

    _hashed_password = bcrypt.hash(datas.password)
    _model_user = _models.User(email=email, username=datas.username, password=_hashed_password)

    db.add(_model_user)
    db.commit()
    db.refresh(_model_user)
    return _model_user


async def genereate_token(user: _models.User) -> str:
    _schema_user = _schemas.User.from_orm(user)
    _user_dict = _schema_user.dict()
    
    del _user_dict['date_created']
    del _user_dict['username']

    # NOTE : Combine [email] & [id] with [_JWT_SECRET] to generate JWT key
    _token = jwt_encode(_user_dict, _JWT_SECRET)
    return _token


async def get_user_via_token(token: str, db: Session) -> _models.User:
    try:
        _payload = jwt_decode(token, _JWT_SECRET, algorithms=["HS256"])
        _user = db.query(_models.User).get(_payload["id"])
    except:
        raise HTTPException(status_code=401, detail="Problem with given token")

    return _user