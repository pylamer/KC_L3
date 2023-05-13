from flask import Flask, jsonify, make_response
import time
import json
import requests

app = Flask(__name__)
URL_SEC_NUMBER = 'https://lab.karpov.courses/hardml-api/module-5/get_secret_number'
def get_secret_number(url):
    flag = True
    count = 1
    secret_number = None
    while flag and count < 100:
        time.sleep(0.5)
        # print(count)
        try:
            response = requests.get(URL_SEC_NUMBER).text.replace("'", '"')
            res = json.loads(response)
            secret_number = res['secret_number']
            flag = False
        except:
            count += 1

    if secret_number is None:
        return -1
    else:
        return secret_number


secret_number = get_secret_number(URL_SEC_NUMBER)
print(secret_number)

@app.route('/')
def response():
    time.sleep(1)
    return make_response(jsonify({"response": "gunicorn reply"}), 200)

@app.route('/return_secret_number')
def return_secret_number():
    time.sleep(1)
    return jsonify(secret_number=secret_number)

if __name__ == "__main__":
    app.run()

