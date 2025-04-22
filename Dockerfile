#FROM --platform=linux/amd64 python:3.9-slim as build
FROM python:3.9-slim 


WORKDIR /app

COPY requirements.txt .

# Mettre à jour pip
RUN pip install --no-cache-dir --upgrade pip

RUN pip install --no-cache-dir -r requirements.txt

# Installer Flask en mode développement
RUN pip install --no-cache-dir flask[debug]

COPY . .

EXPOSE 9999

CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0", "--port=9999"]