FROM python:3.12-alpine

RUN apk add --no-cache ffmpeg

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV HOST=0.0.0.0 \
    PORT=8899 \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

EXPOSE 8899
CMD ["gunicorn", "--bind", "0.0.0.0:8899", "app:app"]
