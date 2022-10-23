from fastapi import APIRouter, Depends, HTTPException
from fastapi.security import OAuth2PasswordBearer
from sqlalchemy.orm import Session

import database as _db
import schemas as _schemas
import services as _services


oauth2schema = OAuth2PasswordBearer("/username-password-signin")


router = APIRouter()


def get_db():
    db = _db.SessionLocal()
    try:
        yield db
    finally:
        db.close()


@router.get("/test")
def testCreate():
    return {"Test": "Testing User routes"}


@router.post("/signup")
async def signUp(datas: _schemas.SignUpUser, db: Session = Depends(get_db)):
    _existed_user = await _services.get_user_by_email(datas.email, db)
    if _existed_user:
        raise HTTPException(status_code=400, detail="User with this email already existed")

    _user = await _services.create_user(datas=datas, db=db)
    _token = await _services.genereate_token(user=_user)

    return _schemas.UserReturn(email=_user.email, username=_user.username, token=_token)


@router.post("/signin")
async def signIn(datas: _schemas.SignInUser, db: Session = Depends(get_db)):
    _existed_user = await _services.get_user_by_email(datas.email, db)
    if not _existed_user:
        raise HTTPException(status_code=404, detail="User with this email is not found")

    if not _existed_user.verify_password(datas.password):
        raise HTTPException(status_code=401, detail="Password not matched")

    _token = await _services.genereate_token(user=_existed_user)

    return _schemas.UserReturn(email=_existed_user.email, username=_existed_user.username, token=_token)


@router.get("/me")
async def getUserDatasViaToken(token: str = Depends(oauth2schema), db: Session = Depends(get_db)):
    _user_model = await _services.get_user_via_token(token=token, db=db)
    print(_user_model)
    return _schemas.UserReturn(email=_user_model.email, username=_user_model.username, token=token)