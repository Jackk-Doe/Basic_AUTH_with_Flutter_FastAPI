from sqlalchemy import Column, String, Integer, DateTime
import datetime as _dt
import passlib.hash as _hash

import database as _db


class User(_db.Base):
    __tablename__ = "users"
    id = Column(Integer, primary_key=True, index=True)
    email = Column(String, unique=True, index=True)
    username = Column(String)
    password = Column(String)
    data_created = Column(DateTime, default=_dt.datetime.utcnow)

    def verify_password(self, password: str):
        return _hash.bcrypt.verify(password, self.password)
