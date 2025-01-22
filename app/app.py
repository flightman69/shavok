from flask import Flask

app = Flask(__name__)

@app.route('/api', methods=['GET'])
def hello_world():
    return "Hello from gorak"

@app.route('/')
def home():
    return "home be chillin"

@app.route('/random')
def random():
    return "Random shit go"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
