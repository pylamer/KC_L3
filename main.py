import os
from flask import Flask, request, jsonify, make_response
import time

app = Flask(__name__)

@app.route('/')
def response():
    time.sleep(1)
    return make_response(jsonify({"response": "OK"}), 200)


