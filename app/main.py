import uvicorn
import datetime
from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root():
    return {"data": datetime.datetime.now()}

@app.get("/items")
def read_item():
    return {
        "Message": "Hello world!"
            }

if __name__ == '__main__':
    uvicorn.run(app, host='127.0.0.1', port=8080, log_level='info')