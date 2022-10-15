from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session

import database as _db
import schemas as _schemas
import services as _services


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