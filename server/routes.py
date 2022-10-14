from fastapi import APIRouter, Depends

from database import SessionLocal


router = APIRouter()


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


@router.get("/test")
def testCreate():
    return {"Test": "Testing User routes"}