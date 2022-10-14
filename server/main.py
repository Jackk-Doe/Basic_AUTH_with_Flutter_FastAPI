from fastapi import FastAPI
import uvicorn

from database import engine
import models


app = FastAPI()

# Create Sqlite DB and table, if not existed
models.Base.metadata.create_all(bind=engine)


@app.get("/")
def testRoute():
    return {"Test route": "Hello world!"}


if '__main__' == __name__:
    uvicorn.run('main:app', host='0.0.0.0', port=8000, reload=True)