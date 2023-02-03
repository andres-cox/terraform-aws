import socket
from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"

@app.route("/tg1")
def demo():
    return f"<p>Target Group 1, private ip: {socket.gethostname()} URL</p>"

@app.route("/tg2")
def demo():
    return f"<p>Target Group 2, private ip: {socket.gethostname()} URL</p>"

if __name__ == "__main__":
    app.run(host="::", port="80")