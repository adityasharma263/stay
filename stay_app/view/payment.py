import logging, traceback
import hashlib
import requests
import urllib
import json
from stay_app import app
from flask import render_template, request, make_response, jsonify, abort, redirect, session, url_for
from random import randint


@app.route('/payment', methods=['POST'])
def payment():
    if request.method == 'POST':
        booking_details = request.json
        print("\n\n\n\n================",booking_details,"\n\n===========")
        data = {}
        txnid = get_transaction_id()
        hash_ = generate_hash(txnid, booking_details)
        data["amount"] = float(booking_details["total_booking_amount"])
        data["productinfo"] = "Message showing product details."
        data["key"] = str(app.config["KEY"])
        data["txnid"] = txnid
        data["hash"] = hash_
        data["firstname"] = booking_details["company_name"]
        data["email"] = booking_details["business_email"]
        data["phone"] = booking_details["business_contact_no"]
        data["service_provider"] = "payu_paisa"
        data["furl"] = str(app.config["DOMAIN_URL"]) + "/payment/fail"
        data["surl"] = str(app.config["DOMAIN_URL"]) + "/payment/success"
        data['action'] = str(app.config["PayU_API_URL"])
        return render_template("hotel/payment/form.html", data=data)


# generate the hash
def generate_hash(txnid, booking_details):
    try:
        # get keys and SALT from dashboard once account is created.
        # hashSequence = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10"
        hash_string = get_hash_string(txnid, booking_details)
        generated_hash = hashlib.sha512(hash_string.encode('utf-8')).hexdigest().lower()
        return generated_hash
    except Exception as e:
        # log the error here.
        logging.getLogger("error_logger").error(traceback.format_exc())
        return None


# create hash string using all the fields
def get_hash_string(txnid, booking_details):
    hash_string = str(app.config["KEY"])+"|"+txnid + "|" + str(
        float(booking_details["total_booking_amount"])) + "|" + "Message showing product details." + "|"
    hash_string += str(booking_details["company_name"]) + "|" + str(booking_details["business_email"]) + "|"
    hash_string += "||||||||||" + str(app.config["SALT"])
    return hash_string


# generate a random transaction Id.
def get_transaction_id():
    hash_object = hashlib.sha256(str(randint(0, 9999)).encode("utf-8"))
    # take approprite length
    txnid = hash_object.hexdigest().lower()[0:32]
    return txnid


# no csrf token require to go to Success page.
# This page displays the success/confirmation message to user indicating the completion of transaction.
@app.route('/payment/success', methods=['GET'])
def payment_success():
    data = {}
    return render_template("hotel/payment/success.html", data=data)


# no csrf token require to go to Failure page. This page displays the message and reason of failure.
@app.route('/hotel/payment/fail', methods=['GET'])
def payment_failure():
    data = {}
    return render_template("hotel/payment/failure.html", data=data)