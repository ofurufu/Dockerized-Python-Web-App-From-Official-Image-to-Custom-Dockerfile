FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV APP_ENV=development
ENV REDIS_HOST=redis
ENV REDIS_PORT=6379
ENV DATA_DIR=/app/data

EXPOSE 5000

CMD ["python", "app.py"]