from typing import List
from fastapi import FastAPI, Form, UploadFile
from fastapi.middleware.cors import CORSMiddleware
from ml.classiffier import Classifier
from ultralytics import YOLO
from PIL import Image
import io
from uuid import uuid4
import os
from pydantic import BaseModel
import base64

yolo = None
classifier = None

app = FastAPI(title="Recognition of railway car numbers")

class CheckText(BaseModel):
    text: str

class Image64(BaseModel):
    files: List[str]

origins = [
    "*",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    # allow_methods=["GET", "POST", "OPTIONS", "DELETE", "PATCH", "PUT"],
    # allow_headers=["Content-Type", "Set-Cookie", "Access-Control-Allow-Headers", "Access-Control-Allow-Origin",
    #                "Authorization"],
    allow_methods=["*",],
    allow_headers=["*",],
)


@app.on_event("startup")
def startup_event():
    global yolo, classifier
    yolo = YOLO(os.path.join('ml', 'yolo8nano_best_model.pt'))
    classifier = Classifier()
    classifier.get_model_from_file(os.path.join('ml', 'classifier_efficient_net_95-8acc.pt'))

@app.post('/text')
def send_text(value: CheckText):
    return {'data': value}

@app.post('/get_result')
def main(files: List[UploadFile]):
    for file in files:
        session_id = uuid4()
        image = Image.open(io.BytesIO(file.file.read()))
        # image = transforms.ToTensor()(image)
        results = yolo.predict(image)
        for el in results:
            el.save_crop(f"swans/{session_id}/")
        # image = decode_image(frombuffer(file.file.read()))
    return {"data": ['bewick', 'is', 'good']}


@app.post('/get_result_64')
def main_64(file: Image64):
    images = file.files
    for file in images:
        session_id = uuid4()
        image_as_bytes = str.encode(file)  # convert string to bytes
        img_recovered = base64.b64decode(image_as_bytes)  # decode base64string
        image = Image.open(io.BytesIO(img_recovered))
        # image = transforms.ToTensor()(image)
        results = yolo.predict(image)
        print(results)
        for el in results:
            el.save_crop(f"swans\\crops")
    return {"data": [{"file_name": "fil1","pred_class": "8901"},
    {"file_name": "fil2","pred_class": "8902"},
    {"file_name": "fil3","pred_class": "8903"},
    {"file_name": "fil4","pred_class": "8901"},
    {"file_name": "fil5","pred_class": "8903"}]}
