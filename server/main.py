from fastapi import FastAPI
import uvicorn

from routes import router as _user_routes
import database as _db
import models as _models


app = FastAPI()

# Create Sqlite DB and table, if not existed
_models.Base.metadata.create_all(bind=_db.engine)


@app.get("/")
def testRoute():
    return {"Test route": "Hello world!"}


# Include router from routes.py
app.include_router(_user_routes, prefix="/users")


if '__main__' == __name__:
    uvicorn.run('main:app', host='0.0.0.0', port=8000, reload=True)