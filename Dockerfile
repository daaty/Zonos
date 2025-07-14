FROM python:3.10-slim
RUN pip install --upgrade pip && pip install uv

RUN apt update && \
    apt install -y espeak-ng && \
    apt install -y build-essential && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . ./

RUN uv pip install --system -e .
## Dependências opcionais removidas para evitar erro de build em ambiente sem GPU
EXPOSE 7860

CMD ["python", "gradio_interface.py"]
