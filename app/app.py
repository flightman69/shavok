from flask import Flask, jsonify, render_template, request

app = Flask(__name__)

@app.route('/status', methods=['GET'])
def hello_world():
    return jsonify({"status": "api is up and running"})

@app.route('/echo', methods=['POST'])
def echo():
    data = request.json
    if not data:
        return jsonify({"error": "No data provided"}), 400
    return jsonify(
        {"status_code": 200,
         "echo": data}
    )
@app.route('/')
def home():
    return render_template("index.html")

@app.route('/greet/<name>', methods=['GET'])
def greet(name):
    return jsonify({"message":f"hello {name}"})

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
