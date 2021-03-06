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


def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        # if request.cookies.get("hash"):
        #     if 'hash' in session:
        #         if session["hash"] != request.cookies.get("hash"):
        #             session.clear()
        #             return redirect(str(app.config["PARTNER_DOMAIN_URL"]) + '/login.php', code=302)
        #     else:
        #         php_url = str(app.config["PARTNER_API_URL"]) + "/api/v1/partner.php"
        #         AES.key_size = 128
        #         iv = "DEFGHTABCIESPQXO"
        #         key = "pqrstuvwxyz$abcdefghijAB12345678"
        #         crypt_object = AES.new(key=key, mode=AES.MODE_CBC, IV=iv)
        #         decoded = binascii.unhexlify(
        #             str(request.cookies["hash"]))  # your ecrypted and encoded text goes here
        #         decrypted = crypt_object.decrypt(decoded)
        #         unpad = lambda s: s[:-ord(s[len(s) - 1:])]
        #         mobile = unpad(decrypted).decode('utf-8')
        #         partner_data = requests.get(url=php_url, params={"mobile": mobile}).json()
        #         if partner_data.get("error"):
        #             return redirect(str(app.config["PARTNER_DOMAIN_URL"]) + '/login.php', code=302)
        #         else:
        #             session["partner_data"] = partner_data
        #             session["hash"] = str(request.cookies["hash"])
        # else:
        #     return redirect(str(app.config["PARTNER_DOMAIN_URL"]) + '/login.php', code=302)
        return f(*args, **kwargs)
    return decorated_function


#================= Admin hotels ==========================
@app.route('/admin/hotel', methods=['GET'])
def admin():
    # if request.cookies.get("hash2"):
    #     php_url = str(app.config["ADMIN_API_URL"]) + "/api/v1/admin.php"
    #     AES.key_size = 128
    #     iv = "DEFGHTABCIESPQXO"
    #     key = "pqrstuvwxyz$abcdefghijAB12345678"
    #     crypt_object = AES.new(key=key, mode=AES.MODE_CBC, IV=iv)
    #     decoded = binascii.unhexlify(str(request.cookies["hash2"]))  # your ecrypted and encoded text goes here
    #     decrypted = crypt_object.decrypt(decoded)
    #     unpad = lambda s: s[:-ord(s[len(s) - 1:])]
    #     username = unpad(decrypted).decode('utf-8')
    #     admin_data = requests.get(url=php_url, params={"username": username}).json()
    #     if admin_data.get("error"):
    #         return redirect(str(app.config["ADMIN_DOMAIN_URL"]), code=302)
    #     else:
    #         session["partner_data"] = admin_data
    # return render_template('hotel/admin/admin_hotel.html', name=admin_data["name"])
    return render_template('hotel/admin/admin_hotel.html')
    # else:
    #     return redirect(str(app.config["ADMIN_DOMAIN_URL"]), code=302)


@app.route('/admin/update', methods=['GET'])
def admin_hotel_update():
    return render_template('hotel/admin/hotel_update.html')


@app.route('/admin/deals', methods=['GET'])
def admin_hotel_deals():
    return render_template('hotel/admin/deals.html')

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





#================= Booking hotels ==========================


@app.route('/hotel/booking', methods=['GET'])
@login_required
def booking():
    if 'partner_data' in session:
        partner_data = session["partner_data"]
        if partner_data["status"] == 'Approved':
            return render_template('hotel/booking/booking.html', partner_data=partner_data)
        else:
            return "YOU ARE NOT APPROVED FOR BOOKING  <br><a href =" + str(app.config["DOMAIN_URL"]) + "/lta-registration.php'></b>" + \
           "click here  FOR THE APPROVAL </b></a>"
    else:
        return redirect(str(app.config["PARTNER_DOMAIN_URL"]) + '/login.php', code=302)


#================= B2B hotels ==========================


@app.route('/', methods=['GET'])
def business():
    # if 'hash' in session:
    #     return redirect(str(app.config["PARTNER_DOMAIN_URL"]), code=302)
    # else:
    return render_template('hotel/b2b_hotels/index.html')


@app.route('/hotel', methods=['GET'])
@login_required
def business_hotel():
    partner_data = "adnan"
    return render_template('hotel/b2b_hotels/hotel.html', name=partner_data)


@app.route('/hotel/list', methods=['GET'])
@login_required
def business_hotel_list():
    partner_data = "adnan"
    args = request.args.to_dict()
    hotel_api_url = str(app.config["API_URL"]) + "/api/v1/hotel"
    print(hotel_api_url, args)
    hotel_data = requests.get(url=hotel_api_url, params=args)
    print(hotel_data, hotel_data.status_code)
    hotel_data = hotel_data.json()
    if len(hotel_data["result"]["hotel"]) > 0:
        hotel_data = hotel_data["result"]["hotel"]
    else:
        hotel_data = []
    return render_template('hotel/b2b_hotels/hotel_list.html', hotel_data=hotel_data, name=partner_data)


@app.route('/hotel/<string:slug>', methods=['GET'])
@login_required
def business_hotel_detail(slug):
    # if 'partner_data' in session:
    #     partner_data = "name"
    #     hotel_api_url = str(app.config["API_URL"]) + "/api/v1/hotel"
    #     hotel_data = requests.get(url=hotel_api_url, params={"id": hotel_id}).json()
    #     print("data= ",hotel_data)
    #     if len(hotel_data["result"]["hotel"]) > 0:
    #         hotel_data = hotel_data["result"]["hotel"][0]
    #         print("data= ", hotel_data)
        # else:
        #     hotel_data = {}
        # # print("in the last1 = ", hotel_data)
        # return render_template('hotel/b2b_hotels/hotel_detail.html', hotel_data=hotel_data, name=partner_data)
    # else:
    hotel_api_url = str(app.config["API_URL"]) + "/api/v1/hotel"
    hotel_data = requests.get(url=hotel_api_url, params={"slug": slug}).json()
    if len(hotel_data["result"]["hotel"]) > 0:
        hotel_data = hotel_data["result"]["hotel"][0]
        print("data= ", hotel_data)
    # hotel_data = {}
    # print("in the last = ", hotel_id)
    # return render_template('hotel/b2b_hotels/hotel_detail.html', hotel_data=hotel_data)
    # else:
    #     return redirect(str(app.config["PARTNER_DOMAIN_URL"]) + '/login.php', code=302)



#================= Destination Pages ==========================

# @app.route('/destinations/maldives')
# def destinations_maldive():
#     return render_template('/hotel/b2b_hotels/destinations/maldives.html')

# @app.route('/destinations/bali')
# def destinations_bali():
#     return render_template('/hotel/b2b_hotels/destinations/bali.html')

# @app.route('/destinations/bangkok')
# def destinations_bangkok():
#     return render_template('/hotel/b2b_hotels/destinations/bangkok.html')

# @app.route('/destinations/dubai')
# def destinations_dubai():
#     return render_template('/hotel/b2b_hotels/destinations/dubai.html')

# @app.route('/destinations/goa')
# def destinations_goa():
#     return render_template('/hotel/b2b_hotels/destinations/goa.html')

# @app.route('/destinations/krabi')
# def destinations_krabi():
#     return render_template('/hotel/b2b_hotels/destinations/krabi.html')

# @app.route('/destinations/ladakh')
# def destinations_ladakh():
#     return render_template('/hotel/b2b_hotels/destinations/ladakh.html')

# @app.route('/destinations/london')
# def destinations_london():
#     return render_template('/hotel/b2b_hotels/destinations/london.html')

# @app.route('/destinations/newyork')
# def destinations_newyork():
#     return render_template('/hotel/b2b_hotels/destinations/maldives.html')

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



