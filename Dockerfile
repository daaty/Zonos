FROM python:3.10-slim
RUN pip install uv

RUN apt update && \
    apt install -y espeak-ng && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . ./

RUN uv pip install --system -e . && uv pip install --system -e .[compile]
EXPOSE 7860

# Se não houver GPU, pode usar uma imagem base sem CUDA, por exemplo:
# FROM python:3.10-slim

CMD ["python", "gradio_interface.py"]
