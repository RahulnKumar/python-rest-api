import numpy as np
import onnxruntime as ort
from pydantic import BaseModel
from config import config as cfg
from fastapi import FastAPI,Request


# Define the FastAPI app
app = FastAPI(title="Hello World Fast",
              description="Hello World Fast API", version="1.0")

# Define the input request model
class InferenceRequest(BaseModel):
    numbers: list

# Load the ONNX model for inference
ort_session = ort.InferenceSession(cfg.onnx_file_path)

# Define the inference endpoint
@app.post("/inference")
def inference(request: InferenceRequest):
    numbers = request.numbers

    # Convert the input to a numpy array
    input_array = np.array(numbers).reshape(1, -1).astype(np.float32)

    # Run the ONNX model
    ort_inputs = {ort_session.get_inputs()[0].name: input_array}
    ort_output = ort_session.run(None, ort_inputs)

    # Get the maximum value and index from the predicted output
    max_value_index = np.argmax(ort_output[0])
    max_value = numbers[max_value_index]

    # Return the max value as the response
    return {"max_value": max_value}


@app.get("/")
async def hello_world():
    return {"Message": "hello-world"}

@app.post("/get_data")
async def create_item(request: Request):
    data = await request.json()
    return {"data": data}

@app.get("/health_check")
async def healthcheck():
    return {"status": "alive"}



