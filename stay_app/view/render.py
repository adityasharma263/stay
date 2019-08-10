#-*- coding: utf-8 -*-
__author__ = 'aditya'


from stay_app import app
from flask import render_template, request, make_response, jsonify, abort, redirect, session, Response
import requests
from Crypto.Cipher import AES
import base64
import binascii

import datetime
import json


# @app.route('/', methods=['GET'])
# def home():
#     if request.method == 'GET':
#         resp = requests.get("http://business.thetravelsquare.in/")
#         excluded_headers = ['content-encoding', 'content-length', 'transfer-encoding', 'connection']
#         headers = [(name, value) for (name, value) in resp.raw.headers.items() if name.lower() not in excluded_headers]
#         response = Response(resp.content, resp.status_code, headers)
#     return response
#
# @app.route('/login', methods=['GET', 'POST'])
# def login_php():
#     if request.method == 'GET':
#         resp = requests.get("http://business.thetravelsquare.in/login.php")
#         excluded_headers = ['content-encoding', 'content-length', 'transfer-encoding', 'connection']
#         headers = [(name, value) for (name, value) in resp.raw.headers.items() if name.lower() not in excluded_headers]
#         response = Response(resp.content, resp.status_code, headers)
#         return response
#     elif request.method == 'POST':
#         print(request.form.to_dict())




# @app.route('/payment', methods=['GET','POST'])
# def payment():
#     if request.method == 'GET':
#         return render_template('hotel/form.html')
#     elif request.method == 'POST':
#         post_data = request.form.to_dict()
#         # res = requests.post('http://127.0.0.1:5000/api/v1/team', json=post_data)
#         print(post_data, "response")
#         # post_data = res.json()
#         return render_template('hotel/form.html', response=post_data)


#======================== HOTEL ============================

#
# @app.route('/hotel', methods=['GET'])
# def hotel():
#     return render_template('hotel/b2c_hotels/hotel.html')
#
#
# @app.route('/hotel/list', methods=['GET'])
# def hotel_list():
#     return render_template('hotel/b2c_hotels/hotel_list.html')
#
#
# @app.route('/hotel/<hotel_id>', methods=['GET'])
# def hotel_detail(hotel_id):
#     hotel_api_url = str(app.config["API_URL"]) + "api/v1/hotel"
#     hotel_data = requests.get(url=hotel_api_url, params={"id": hotel_id}).json()
#     if len(hotel_data["result"]["hotel"]) > 0:
#         hotel_data = hotel_data["result"]["hotel"][0]
#     else:
#         hotel_data = {}
#     return render_template('hotel/b2c_hotels/hotel_detail.html', hotel_data=hotel_data)

#================= Admin hotels ==========================


@app.route('/admin/hotel', methods=['GET'])
def admin():
    return render_template('hotel/admin/admin_hotel.html')

@app.route('/admin/update', methods=['GET'])
def admin_hotel_update():
    return render_template('hotel/admin/hotel_update.html')

@app.route('/admin/deals', methods=['GET'])
def admin_hotel_deals():
    return render_template('hotel/admin/deals.html')


#================= Booking hotels ==========================

@app.route('/hotel/booking', methods=['GET'])
def Business_booking():
    API_URL = app.config['API_URL']
    return render_template('hotel/booking/booking.html')


#================= B2B hotels ==========================


@app.route('/', methods=['GET'])
def business():
    return render_template('hotel/b2b_hotels/index.html')


@app.route('/hotel', methods=['GET'])
def business_hotel():
    print(request.url_root,request.cookies, "cooookies")
    if request.cookies.get("hash"):
        php_url = "http://bussiness.thetravelsquare.in/api/product/read_one.php"
        AES.key_size = 128
        iv = "DEFGHTABCIESPQXO"
        key = "pqrstuvwxyz$abcdefghijAB12345678"
        crypt_object = AES.new(key=key, mode=AES.MODE_CBC, IV=iv)
        decoded = binascii.unhexlify(str(request.cookies["hash"]))  # your ecrypted and encoded text goes here
        decrypted = crypt_object.decrypt(decoded)
        unpad = lambda s: s[:-ord(s[len(s) - 1:])]
        mobile = unpad(decrypted).decode('utf-8')
        hotel_data = requests.get(url=php_url, params={"mobile": mobile}).json()
        print(hotel_data)
        return render_template('hotel/b2b_hotels/hotel.html')
    else:
        return "You are not logged in <br><a href = 'http://thetravelsquare.in/crm/login.php'></b>" + \
               "click here to log in</b></a>"



@app.route('/hotel/list', methods=['GET'])
def business_hotel_list():
    args = request.args.to_dict()
    # payload = {
    #     "name": args.get("name"),
    #     "city": args.get("city"),
    #     "ci":   args.get("ci"),
    #     "co":   args.get("co"),
    # }
    # print(payload, "payload")
    hotel_api_url = str(app.config["API_URL"]) + "api/v1/hotel"
    print(args,"render")
    hotel_data = requests.get(url=hotel_api_url, params=args).json()
    print(hotel_data,"response")
    if len(hotel_data["result"]["hotel"]) > 0:
        hotel_data = hotel_data["result"]["hotel"]
    else:
        hotel_data = []
    return render_template('hotel/b2b_hotels/hotel_list.html', hotel_data=hotel_data)


@app.route('/hotel/<hotel_id>', methods=['GET'])
def business_hotel_detail(hotel_id):
    hotel_api_url = str(app.config["API_URL"]) + "api/v1/hotel"
    hotel_data = requests.get(url=hotel_api_url, params={"id": hotel_id}).json()
    if len(hotel_data["result"]["hotel"]) > 0:
        hotel_data = hotel_data["result"]["hotel"][0]
    else:
        hotel_data = {}
    return render_template('hotel/b2b_hotels/hotel_detail.html', hotel_data=hotel_data)


# @app.route('/business/hotel/cart', methods=['GET'])
# def Business_hotel_booking():
#     args = request.args.to_dict()
#     print(args, "ddddddddddddddddddd")
#     # for deal_id in deals:
#     #     hotel_api_url = str(app.config["API_URL"]) + "api/v1/hotel"
#     #     hotel_data = requests.get(url=hotel_api_url, params={"id": deal_id}).json()
#     #     if len(hotel_data["result"]["hotel"]) > 0:
#     #         hotel_data = hotel_data["result"]["hotel"]
#     #     else:
#     #         hotel_data = []
#     return render_template('hotel/b2b_hotels/booking.html', deal_data=args)

#================= Add on Pages hotels ==========================


@app.errorhandler(400)
def page_not_found():
    return render_template("404.html"), 400


@app.route('/about', methods=['GET'])
def business_about():
    return render_template('hotel/footer_pages/about.html')


@app.route('/contact-us', methods=['GET'])
def business_contact_us():
    return render_template('hotel/footer_pages/contact-us.html')


@app.route('/customer-care', methods=['GET'])
def business_customer_care():
    return render_template('hotel/footer_pages/customer-care.html')


@app.route('/jobs', methods=['GET'])
def business_jobs():
    return render_template('hotel/footer_pages/job-and-internship-application-form.html')


@app.route('/legal', methods=['GET'])
def business_legal():
    return render_template('hotel/footer_pages/legal.html')


@app.route('/partner-care', methods=['GET'])
def business_partner_care():
    return render_template('hotel/footer_pages/partner-care.html')


@app.route('/press-release', methods=['GET'])
def business_press_release():
    return render_template('hotel/footer_pages/press-release.html')



#================= collection hotels ==========================



@app.route('/hotel/collection/bed-and-breakfast-travel-beans', methods=['GET'])
def collection1():
    return render_template('hotel/collections/bed-and-breakfast.html')  
     

@app.route('/hotel/collection/boatstays-travel-beans', methods=['GET'])
def collection2():
    return render_template('hotel/collections/boatstays.html')   


@app.route('/hotel/collection/boutique-hotels-travel-beans', methods=['GET'])
def collection3():
    return render_template('hotel/collections/boutique-hotels.html')  


@app.route('/hotel/collection/budget-hotels-travel-beans', methods=['GET'])
def collection4():
    return render_template('hotel/collections/budget-hotels.html')             


@app.route('/hotel/collection/campsite-travel-beans', methods=['GET'])
def collection5():
    return render_template('hotel/collections/campsite.html')   



