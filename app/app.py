from flask import Flask
import os
import psycopg2

app = Flask(__name__)

@app.route("/")
def home():
    return "Flask + Docker + GHCR + Terraform + Render"

@app.route("/health")
def health():
    return {"status": "Tout est ok ou pas"}

@app.route("/info")
def info():
    return {
        "app": "Flask Render",
        "student": "Vala Julien",
        "version": "v1"
    }

@app.route("/env")
def env():
    return {"env": os.getenv("ENV")}

@app.route("/db")
def db():
    try:
        conn = psycopg2.connect(os.getenv("DATABASE_URL"))
        cur = conn.cursor()
        cur.execute("SELECT version();")
        version = cur.fetchone()
        cur.close()
        conn.close()
        return {"database": "connected", "version": version[0]}
    except Exception as e:
        return {"database": "error", "message": str(e)}

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 10000))
    app.run(host="0.0.0.0", port=port)
