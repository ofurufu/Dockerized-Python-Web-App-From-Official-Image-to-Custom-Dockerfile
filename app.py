from flask import Flask, jsonify
import os
from datetime import datetime
import redis

app = Flask(__name__)

APP_ENV = os.getenv("APP_ENV", "development")
DATA_DIR = os.getenv("DATA_DIR", "/app/data")
REDIS_HOST = os.getenv("REDIS_HOST", "redis")
REDIS_PORT = int(os.getenv("REDIS_PORT", "6379"))

redis_client = redis.Redis(host=REDIS_HOST, port=REDIS_PORT, decode_responses=True)

@app.route("/")
def home():
    return f"Hello from Docker project v4! Environment: {APP_ENV}"

@app.route("/health")
def health():
    return jsonify({
        "status": "ok",
        "version": "v4",
        "environment": APP_ENV,
        "timestamp": datetime.utcnow().isoformat() + "Z"
    })

@app.route("/write")
def write_file():
    os.makedirs(DATA_DIR, exist_ok=True)
    file_path = os.path.join(DATA_DIR, "visits.log")

    with open(file_path, "a") as f:
        f.write(f"Visit recorded at {datetime.utcnow().isoformat()}Z\n")

    return jsonify({
        "message": "Visit written successfully",
        "file": file_path
    })

@app.route("/read")
def read_file():
    file_path = os.path.join(DATA_DIR, "visits.log")

    if not os.path.exists(file_path):
        return jsonify({
            "message": "No visit log found yet",
            "file": file_path
        })

    with open(file_path, "r") as f:
        content = f.read()

    return jsonify({
        "file": file_path,
        "content": content
    })

@app.route("/visits")
def visits():
    count = redis_client.incr("visits")
    return jsonify({
        "visits": count,
        "backend": "redis"
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)