from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello from version 1 of my Docker portfolio project!"

@app.route("/health")
def health():
    return {"status": "ok", "app": "docker-mini-project"}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)