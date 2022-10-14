from fastapi import FastAPI
import uvicorn


app = FastAPI()


@app.get("/")
def testRoute():
    return {"Test route": "Hello world!"}


if '__main__' == __name__:
    uvicorn.run('main:app', host='0.0.0.0', port=8000, reload=True)