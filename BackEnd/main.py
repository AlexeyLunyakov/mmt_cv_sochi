from fastapi import FastAPI, UploadFile
from fastapi.middleware.cors import CORSMiddleware
from ml.classiffier import Classifier
from ultralytics import YOLO
from PIL import Image
import io
from uuid import uuid4
import uvicorn
import os
from pydantic import BaseModel


yolo = None
classifier = None

app = FastAPI(title="Recognition of railway car numbers")

class CheckText(BaseModel):
    text: str

origins = [
    "*",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["GET", "POST", "OPTIONS", "DELETE", "PATCH", "PUT"],
    allow_headers=["Content-Type", "Set-Cookie", "Access-Control-Allow-Headers", "Access-Control-Allow-Origin",
                   "Authorization"],
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
def main(files: list[UploadFile]):
    for file in files:
        session_id = uuid4()
        image = Image.open(io.BytesIO(file.file.read()))
        # image = transforms.ToTensor()(image)
        results = yolo.predict(image)
        for el in results:
            el.save_crop(f"swans/{session_id}/")
        # image = decode_image(frombuffer(file.file.read()))
    return {"data": ['bewick', 'is', 'good']}

# if __name__ == "__main__":
#     uvicorn.run("main:app", host="0.0.0.0", port=8000, log_level="info", reload=True)