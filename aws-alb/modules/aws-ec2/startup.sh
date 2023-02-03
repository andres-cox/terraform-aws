#!/bin/bash

yum update -y

# Create python, flask script 
cat << EOF > /home/ec2-user/flask-api.py
import socket
from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"

@app.route("/tg1")
def tg1endpoint():
    return f"<p>Target Group 1, private ip: {socket.gethostname()} URL</p>"

@app.route("/tg2")
def tg2endpoint():
    return f"<p>Target Group 2, private ip: {socket.gethostname()} URL</p>"

if __name__ == "__main__":
    app.run(host="::", port="80")
EOF

# Installing flask
pip3 install flask

# Running flask-app
python3 /home/ec2-user/flask-api.py
