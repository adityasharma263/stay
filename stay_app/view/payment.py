import logging, traceback
import hashlib
import requests
from stay_app import app
from flask import render_template, request, make_response, jsonify, abort, redirect, session
from random import randint


@app.route('/payment', methods=['GET', 'POST'])
def payment():
    if request.method == 'GET':
        data = {}
        txnid = get_transaction_id()
        hash_ = generate_hash(txnid)
        hash_string = get_hash_string(txnid)
        # H88dI2ioUTxaPKh1s2uOpVPSWevcs59HcFnb7bfdk0Y =
        # use constants file to store constant values.
        # use test URL for testing
        data["action"] = 'https://sandboxsecure.payu.in/_payment'
        data["amount"] = float(1)
        data["productinfo"] = "Message showing product details."
        data["key"] = "5d8pimBA"
        data["txnid"] = txnid
        data["hash"] = hash_
        data["hash_string"] = hash_string
        data["firstname"] = "aditya"
        data["email"] = "aditya.sharma263@gmail.com"
        data["phone"] = "9650333567"
        data["service_provider"] = "payu_paisa"
        data["furl"] = "http://localhost:5000/hotel/payment/fail"
        data["surl"] = "http://localhost:5000/hotel/payment/success"
        print(data)
        return render_template("hotel/form.html", data=data)




# generate the hash
def generate_hash(txnid):
    try:
        # get keys and SALT from dashboard once account is created.
        # hashSequence = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10"
        hash_string = get_hash_string(txnid)
        generated_hash = hashlib.sha512(hash_string.encode('utf-8')).hexdigest().lower()
        return generated_hash
    except Exception as e:
        # log the error here.
        logging.getLogger("error_logger").error(traceback.format_exc())
        return None


# create hash string using all the fields
def get_hash_string(txnid):
    hash_string = "5d8pimBA" + "|" + txnid + "|" + str(
        float(1)) + "|" + "Message showing product details." + "|"
    hash_string += "aditya" + "|" + "aditya.sharma263@gmail.com" + "|"
    hash_string += "||||||||||" + "KoIgy9LgK0"
    return hash_string


# generate a random transaction Id.
def get_transaction_id():
    hash_object = hashlib.sha256(str(randint(0, 9999)).encode("utf-8"))
    # take approprite length
    txnid = hash_object.hexdigest().lower()[0:32]
    return txnid


# no csrf token require to go to Success page.
# This page displays the success/confirmation message to user indicating the completion of transaction.
@app.route('/payment/success', methods=['POST'])
def payment_success():
    data = {}
    return render_template("hotel/payment/success.html", data=data)


# no csrf token require to go to Failure page. This page displays the message and reason of failure.
@app.route('/payment/fail', methods=['POST'])
def payment_failure():
    data = {}
    return render_template("hotel/payment/failure.html", data=data)