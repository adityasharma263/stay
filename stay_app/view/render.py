#-*- coding: utf-8 -*-
__author__ = 'aditya'


from stay_app import app
from flask import render_template, request, make_response, jsonify, abort, redirect, session, Response
import requests
from Crypto.Cipher import AES
from functools import wraps
import base64
import binascii
import datetime
import json

app.secret_key = "partner data session secret key"
dev_mode = app.config["DEV_MODE"]


def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if request.cookies.get("hash"):
            if 'hash' in session:
                if session["hash"] != request.cookies.get("hash"):
                    session.clear()
                    return redirect(str(app.config["PARTNER_DOMAIN_URL"]) + '/login.php', code=302)
            else:
                php_url = str(app.config["PARTNER_API_URL"]) + "/api/v1/partner.php"
                AES.key_size = 128
                iv = "DEFGHTABCIESPQXO"
                key = "pqrstuvwxyz$abcdefghijAB12345678"
                crypt_object = AES.new(key=key, mode=AES.MODE_CBC, IV=iv)
                decoded = binascii.unhexlify(
                    str(request.cookies["hash"]))  # your ecrypted and encoded text goes here
                decrypted = crypt_object.decrypt(decoded)
                unpad = lambda s: s[:-ord(s[len(s) - 1:])]
                mobile = unpad(decrypted).decode('utf-8')
                partner_data = requests.get(url=php_url, params={"mobile": mobile}).json()
                if partner_data.get("error"):
                    return redirect(str(app.config["PARTNER_DOMAIN_URL"]) + '/login.php', code=302)
                else:
                    session["partner_data"] = partner_data
                    session["hash"] = str(request.cookies["hash"])
        elif dev_mode:
            php_url = str(app.config["PARTNER_DOMAIN_URL"]) + "/api/v1/partner.php"
            partner_data = requests.get(url=php_url, params={"mobile": str(app.config["PARTNER_MOBILE"])}).json()
            if partner_data.get("error"):
                return redirect(str(app.config["PARTNER_DOMAIN_URL"]) + '/login.php', code=302)
            else:
                session["partner_data"] = partner_data
        else:
            return redirect(str(app.config["PARTNER_DOMAIN_URL"]) + '/login.php', code=302)
        return f(*args, **kwargs)
    return decorated_function


def admin_login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if request.cookies.get("hash2"):
            if 'hash2' in session:
                if session["hash2"] != request.cookies.get("hash2"):
                    session.clear()
                    return redirect(str(app.config["ADMIN_DOMAIN_URL"]), code=302)
            else:
                php_url = str(app.config["ADMIN_API_URL"]) + "/api/v1/admin.php"
                AES.key_size = 128
                iv = "DEFGHTABCIESPQXO"
                key = "pqrstuvwxyz$abcdefghijAB12345678"
                crypt_object = AES.new(key=key, mode=AES.MODE_CBC, IV=iv)
                decoded = binascii.unhexlify(str(request.cookies["hash2"]))  # your ecrypted and encoded text goes here
                decrypted = crypt_object.decrypt(decoded)
                unpad = lambda s: s[:-ord(s[len(s) - 1:])]
                username = unpad(decrypted).decode('utf-8')
                admin_data = requests.get(url=php_url, params={"username": username}).json()
                if admin_data.get("error"):
                    return redirect(str(app.config["ADMIN_DOMAIN_URL"]), code=302)
                else:
                    session["admin_data"] = admin_data
                    session["hash2"] = str(request.cookies["hash2"])
        elif dev_mode:
            php_url = str(app.config["ADMIN_DOMAIN_URL"]) + "/api/v1/admin.php"
            admin_data = requests.get(url=php_url, params={"username": str(app.config["ADMIN_USERNAME"])}).json()
            if admin_data.get("error"):
                return redirect(str(app.config["ADMIN_DOMAIN_URL"]), code=302)
            else:
                session["admin_data"] = admin_data
        else:
            return redirect(str(app.config["ADMIN_DOMAIN_URL"]), code=302)
        return f(*args, **kwargs)
    return decorated_function


#================= Admin hotels ==========================


@app.route('/admin/hotel', methods=['GET'])
@admin_login_required
def admin():
    if 'admin_data' in session:
        admin_data = session["admin_data"]
        return render_template('hotel/admin/admin_hotel.html', name=admin_data["name"])
    else:
        return redirect(str(app.config["ADMIN_DOMAIN_URL"]), code=302)


@app.route('/admin/home', methods=["GET"])
@admin_login_required
def admin_home():
    if 'admin_data' in session:
        admin_data = session["admin_data"]
        return render_template("hotel/admin/dashboard.html", name=admin_data["name"])
    else:
        return redirect(str(app.config["ADMIN_DOMAIN_URL"]), code=302)


@app.route('/admin/update', methods=['GET'])
@admin_login_required
def admin_hotel_update():
    if 'admin_data' in session:
        admin_data = session["admin_data"]
        return render_template("hotel/admin/hotel_update.html", name=admin_data["name"])
    else:
        return redirect(str(app.config["ADMIN_DOMAIN_URL"]), code=302)


@app.route('/admin/deals', methods=['GET'])
@admin_login_required
def admin_hotel_deals():
    if 'admin_data' in session:
        admin_data = session["admin_data"]
        return render_template("hotel/admin/deals.html", name=admin_data["name"])
    else:
        return redirect(str(app.config["ADMIN_DOMAIN_URL"]), code=302)


@app.route('/admin/hotel/search', methods=["POST"])
def admin_hotel_search():
    hotel_search_api = str(app.config["API_URL"]) + "/api/v1/hotel/search"
    search = request.json
    search_data = requests.post(hotel_search_api, json=search)
    return jsonify(search_data.json())


@app.route("/admin/hotel/deal", methods=["GET"])
@admin_login_required
def admin_deal_id():
    if True or 'admin_data' in session:
        admin_data = session["admin_data"]
        hotel_id = request.args.get('id')
        args = request.args.to_dict()
        if not hotel_id:
            args = {"id": 1}
        hotel_data = requests.get(url=str(app.config["API_URL"]) + "/api/v1/hotel/terminal", params=args)
        hotel_data = hotel_data.json()["result"]
        return render_template("hotel/admin/deals-dashboard.html", hotel_data=hotel_data, name=admin_data["name"])
        return render_template("hotel/admin/deals-dashboard.html", hotel_data=hotel_data)
    else:
        return redirect(str(app.config["ADMIN_DOMAIN_URL"]), code=302)


@app.route("/admin/hotel/terminal", methods=["GET"])
@admin_login_required
def admin_terminal():
    if True or 'admin_data' in session:
        admin_data = session["admin_data"]
        return render_template("hotel/admin/admin_hotel_terminal.html", name=admin_data["name"])
        return render_template("hotel/admin/admin_hotel_terminal.html")
    else:
        return redirect(str(app.config["ADMIN_DOMAIN_URL"]), code=302)


#================= Booking hotels ==========================


@app.route('/hotel/booking', methods=['GET', 'POST'])
# @login_required
def booking():
    if True or 'partner_data' in session:
        # partner_data = session["partner_data"]
        if request.method == 'GET':
            if True or partner_data["status"] == 'Approved':
                # return render_template('hotel/booking/booking.html', partner_data=partner_data)
                return render_template('hotel/booking/booking.html')
            else:
                return "YOU ARE NOT APPROVED FOR BOOKING  <br><a href =" + str(app.config["BUSINESS_DOMAIN_URL"]) + "/lta-registration.php'></b>" + \
               "click here  FOR THE APPROVAL </b></a>"
        else:
            booking_details = request.json
            booking_details['status'] = 'P'
            for deal in booking_details["deals"]:
                deal_data = requests.get(url=str(app.config["API_URL"]) + '/api/v1/deal', params={"id": deal['deal_id']})
                deal_data = deal_data.json()["result"]["deal"][0]
                for key, value in deal_data.items():
                    if key in ['base_price', 'commission_in_percentage', 'final_price', 'margin_price',
                               'partner_id', 'ts_exclusive', 'room_id']:
                        deal[key] = value
            booking_details["partner_id"] = partner_data['id']
            booking_details["booking_no"] = "ts"
            booking_details["product_info"] = "rooms"
            booking_details["gst_no"] = partner_data['gst_no']
            booking_details["business_email"] = partner_data['business_email']
            booking_details["office_address"] = partner_data['office_address']
            booking_details["company_name"] = partner_data['company_name']
            booking_response = requests.post(str(app.config["API_URL"]) + '/api/v1/booking', json=booking_details)
            response = requests.post(str(app.config["API_URL"]) + '/payment', json=booking_response.json())
            return response.text
    else:
        return redirect(str(app.config["PARTNER_DOMAIN_URL"]) + '/login.php', code=302)


#================= Cart hotels ==========================

@app.route('/hotel/cart', methods=['POST'])
@login_required
def cart():
    if 'partner_data' in session:
        partner_data = session["partner_data"]
        if request.method == 'post':
            cart = request.json
            cart_deal_data = requests.get(url=str(app.config["API_URL"]) + '/api/v1/cart/deal', params=cart).json()
            if cart_deal_data["result"]["cart_deal"][0]:
                id = cart_deal_data["result"]["cart_deal"][0]["id"]
                no_of_deal = int(cart_deal_data["result"]["cart_deal"][0]["no_od_deal"]) + 1
                response = requests.put(str(app.config["API_URL"]) + '/api/v1/cart/deal' + str(id), json={"no_of_deals": no_of_deal})
            else:
                cart_data = requests.get(url=str(app.config["API_URL"]) + '/api/v1/cart', params={"partner_id": partner_data["id"]}).json()
                cart['cart_id'] = cart_data["result"]["cart"][0]["id"]
                response = requests.post(str(app.config["API_URL"]) + '/api/v1/cart/deal', json=cart.json())
            return response.json()
    else:
        return redirect(str(app.config["PARTNER_DOMAIN_URL"]) + '/login.php', code=302)


# @app.route('/hotel/cart', methods=['POST'])
# @login_required
# def cart():
#     if 'partner_data' in session:
#         partner_data = session["partner_data"]
#         if request.method == 'post':
#             cart = request.json
#             cart_deal_data = requests.get(url=str(app.config["API_URL"]) + '/api/v1/cart/deal', params=cart).json()
#             if cart_deal_data["result"]["cart_deal"][0]:
#                 id = cart_deal_data["result"]["cart_deal"][0]["id"]
#                 no_of_deal = int(cart_deal_data["result"]["cart_deal"][0]["no_od_deal"]) + 1
#                 response = requests.put(str(app.config["API_URL"]) + '/api/v1/cart/deal' + str(id), json={"no_of_deals": no_of_deal})
#             else:
#                 cart_data = requests.get(url=str(app.config["API_URL"]) + '/api/v1/cart', params={"partner_id": partner_data["id"]}).json()
#                 cart['cart_id'] = cart_data["result"]["cart"][0]["id"]
#                 response = requests.post(str(app.config["API_URL"]) + '/api/v1/cart/deal', json=cart.json())
#             return response.json()
#     else:
#         return redirect(str(app.config["PARTNER_DOMAIN_URL"]) + '/login.php', code=302)


#================= B2B hotels ==========================


@app.route('/', methods=['GET'])
def business():
    return render_template('hotel/b2b_hotels/index.html')


@app.route('/hotel', methods=['GET'])
@login_required
def business_hotel():
    if 'partner_data' in session:
        partner_data = session["partner_data"]
        return render_template('hotel/b2b_hotels/hotel.html', name=partner_data["name"])
    else:
        return redirect(str(app.config["PARTNER_DOMAIN_URL"]) + '/login.php', code=302)


@app.route('/hotel/list', methods=['GET'])
@login_required
def business_hotel_list():
    if 'partner_data' in session:
        partner_data = session["partner_data"]
        return render_template('hotel/b2b_hotels/hotel_list.html', name=partner_data["name"])
        # return render_template('hotel/b2b_hotels/hotel_list.html')
    else:
        return redirect(str(app.config["PARTNER_DOMAIN_URL"]) + '/login.php', code=302)


@app.route('/hotel/<string:slug>', methods=['GET'])
@login_required
def business_hotel_detail(slug):
    if 'partner_data' in session:
        partner_data = session["partner_data"]
        args = request.args.to_dict()
        args["slug"] = slug
        hotel_api_url = str(app.config["API_URL"]) + "/api/v1/hotel"
        hotel_data = requests.get(url=hotel_api_url, params=args).json()
        return render_template('hotel/b2b_hotels/hotel_detail.html'), hotel_data=hotel_data["result"]["hotel"],
                               name=partner_data['name'], params=args)
    else:
        return redirect(str(app.config["PARTNER_DOMAIN_URL"]) + '/login.php', code=302)


#================= Index Pages ==========================


@app.route('/agent/rishabh', methods=['GET'])
def rishabh():
    return render_template('hotel/b2b_hotels/partners-review-rishabh-jain-the-travel-square.html')

@app.route('/agent/abhinav', methods=['GET'])
def abhinav():
    return render_template('hotel/b2b_hotels/partners-review-abhinav-patil-the-travel-square.html')

@app.route('/suppliers', methods=['GET'])
def suppliers():
    return render_template('hotel/b2b_hotels/top-suppliers.html')

@app.route('/work', methods=['GET'])
def work():
    return render_template('hotel/b2b_hotels/how-do-we-work.html')

@app.route('/contact', methods=['GET'])
def contact():
    return render_template('hotel/b2b_hotels/partner-care.html')

@app.route('/testimonials')
def testimonials():
    return render_template('hotel/b2b_hotels/testimonials.html')

@app.route('/coming-soon')
def coming_soon():
    return render_template('hotel/b2b_hotels/coming-soon.html')

@app.route('/join')
def join():
    return render_template('hotel/b2b_hotels/signup.html')

@app.route('/group')
def group():
    return render_template('hotel/b2b_hotels/join-chat-forum.html')

@app.route('/onetimeverification')
def verification():
    return render_template('hotel/b2b_hotels/otp-chat-forum.html')


############################# Destination Pages ########################


@app.route('/destinations/bali')
def bali():
    return render_template('hotel/b2b_hotels/destinations/bali.html')

@app.route('/destinations/bangkok')
def bangkok():
    return render_template('hotel/b2b_hotels/destinations/bangkok.html')

@app.route('/destinations/dubai')
def dubai():
    return render_template('hotel/b2b_hotels/destinations/dubai.html')

@app.route('/destinations/goa')
def goa():
    return render_template('hotel/b2b_hotels/destinations/goa.html')

@app.route('/destinations/krabi')
def krabi():
    return render_template('hotel/b2b_hotels/destinations/krabi.html')

@app.route('/destinations/ladakh')
def ladakh():
    return render_template('hotel/b2b_hotels/destinations/ladakh.html')

@app.route('/destinations/london')
def london():
    return render_template('hotel/b2b_hotels/destinations/london.html')

@app.route('/destinations/maldives')
def maldives():
    return render_template('hotel/b2b_hotels/destinations/maldives.html')

@app.route('/destinations/new-york')
def new_york():
    return render_template('hotel/b2b_hotels/destinations/new-york.html')

@app.route('/destinations/pattaya')
def pattaya():
    return render_template('hotel/b2b_hotels/destinations/pattaya.html')

@app.route('/destinations/singapore')
def singapore():
    return render_template('hotel/b2b_hotels/destinations/singapore.html')

@app.route('/destinations/switzerland')
def switzerland():
    return render_template('hotel/b2b_hotels/destinations/switzerland.html')

@app.route('/destinations')
def destinations():
    return render_template('hotel/b2b_hotels/destinations.html')


############################## Site Map ###############################


@app.route('/site-map')
def site_map():
    return render_template('hotel/b2b_hotels/site-map.html')

@app.route('/partner-care')
def partner_care():
    return render_template('hotel/b2b_hotels/partner-care.html')

@app.route('/terms-and-conditions')
def terms_and_conditions():
    return render_template('hotel/b2b_hotels/terms-and-conditions.html')

@app.route('/privacy-policy')
def privacy_policy():
    return render_template('hotel/b2b_hotels/privacy-policy.html')


