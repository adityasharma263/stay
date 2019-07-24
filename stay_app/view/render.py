#-*- coding: utf-8 -*-
__author__ = 'aditya'

from stay_app import app
from flask import render_template, request, make_response, jsonify, abort, redirect
import requests
import datetime
import json


@app.route('/', methods=['GET'])
def home():
    return render_template('index.html')


@app.errorhandler(400)
def page_not_found():
    return render_template("404.html"), 400


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



@app.route('/hotel', methods=['GET'])
def hotel():
    # API_URL = app.config['API_URL']
    return render_template('hotel/b2c_hotels/hotel.html')


@app.route('/hotel/list', methods=['GET'])
def hotel_list():
    return render_template('hotel/b2c_hotels/hotel_list.html')


@app.route('/hotel/<hotel_id>', methods=['GET'])
def hotel_detail(hotel_id):
    hotel_api_url = str(app.config["API_URL"]) + "api/v1/hotel"
    hotel_data = requests.get(url=hotel_api_url, params={"id": hotel_id}).json()
    if len(hotel_data["result"]["hotel"]) > 0:
        hotel_data = hotel_data["result"]["hotel"][0]
    else:
        hotel_data = {}
    return render_template('hotel/b2c_hotels/hotel_detail.html', hotel_data=hotel_data)


@app.route('/admin/hotel', methods=['GET'])
def admin():
    return render_template('hotel/b2c_hotels/admin_hotel.html')


#================= B2B hotels ==========================


@app.route('/business/hotel', methods=['GET'])
def Business_hotel():
    API_URL = app.config['API_URL']
    return render_template('hotel/b2b_hotels/hotel.html')


@app.route('/business/hotel/list', methods=['GET'])
def Business_hotel_list():
    args = request.args.to_dict()
    hotel_api_url = str(app.config["API_URL"]) + "api/v1/hotel"
    hotel_data = requests.get(url=hotel_api_url, params=args).json()
    if len(hotel_data["result"]["hotel"]) > 0:
        hotel_data = hotel_data["result"]["hotel"]
    else:
        hotel_data = []
    return render_template('hotel/b2b_hotels/hotel_list.html', hotel_data=hotel_data)



@app.route('/business/hotel/<hotel_id>', methods=['GET'])
def Business_hotel_detail(hotel_id):
    hotel_api_url = str(app.config["API_URL"]) + "api/v1/hotel"
    hotel_data = requests.get(url=hotel_api_url, params={"id": hotel_id}).json()
    if len(hotel_data["result"]["hotel"]) > 0:
        hotel_data = hotel_data["result"]["hotel"][0]
    else:
        hotel_data = {}
    return render_template('hotel/b2b_hotels/hotel_detail.html', hotel_data=hotel_data)


@app.route('/business/hotel/cart/<deals>', methods=['GET'])
def Business_hotel_booking(deals):
    for deal_id in deals:
        hotel_api_url = str(app.config["API_URL"]) + "api/v1/hotel"
        hotel_data = requests.get(url=hotel_api_url, params={"id": deal_id}).json()
        if len(hotel_data["result"]["hotel"]) > 0:
            hotel_data = hotel_data["result"]["hotel"]
        else:
            hotel_data = []
    return render_template('hotel/b2b_hotels/cart.html', deal_data=hotel_data)

    


@app.route('/business/admin/hotel', methods=['GET'])
def Business_admin():
    return render_template('hotel/b2b_hotels/admin_hotel.html')

    
@app.route('/about', methods=['GET'])
def Business_about():
    return render_template('hotel/footer_pages/about.html')


@app.route('/contact-us', methods=['GET'])
def Business_contact_us():
    return render_template('hotel/footer_pages/contact-us.html')


@app.route('/customer-care', methods=['GET'])
def Business_customer_care():
    return render_template('hotel/footer_pages/customer-care.html')


@app.route('/jobs', methods=['GET'])
def Business_jobs():
    return render_template('hotel/footer_pages/job-and-internship-application-form.html')


@app.route('/legal', methods=['GET'])
def Business_legal():
    return render_template('hotel/footer_pages/legal.html')


@app.route('/partner-care', methods=['GET'])
def Business_partner_care():
    return render_template('hotel/footer_pages/partner-care.html')


@app.route('/press-release', methods=['GET'])
def Business_press_release():
    return render_template('hotel/footer_pages/press-release.html')


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



