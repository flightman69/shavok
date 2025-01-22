from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/status', methods=['GET'])
def hello_world():
    return jsonify({"status": "api is up and running"})

@app.route('/')
def home():
    return "this is home"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
