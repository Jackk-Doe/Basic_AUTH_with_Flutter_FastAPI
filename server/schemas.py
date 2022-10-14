from pydantic import BaseModel
import datetime as dt


class _UserBase(BaseModel):
    email: str


class User(_UserBase):
    id: int
    username: str
    date_created: dt.datetime

    class Config:
        orm_mode = True


class UserReturn(_UserBase):
    username: str
    token: str


class SignUpUser(_UserBase):
    username: str
    password: str


class SignInUser(_UserBase):
    password: str