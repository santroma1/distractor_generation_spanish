FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-runtime
WORKDIR /workspace
COPY . .
RUN pip install -r requirements.txt