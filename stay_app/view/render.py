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

#======================== HOTEL ============================


@app.route('/hotel', methods=['GET'])
def hotel():
    API_URL = app.config['API_URL']
    return render_template('hotel/b2c_hotels/hotel.html')


@app.route('/hotel/list', methods=['GET'])
def hotel_list():
    return render_template('hotel/b2c_hotels/hotel_list.html')


@app.route('/hotel/<hotel_id>', methods=['GET'])
def hotel_detail(hotel_id):
    return render_template('hotel/b2c_hotels/hotel_detail.html')


@app.route('/admin/hotel', methods=['GET'])
def admin():
    return render_template('hotel/b2c_hotels/admin_hotel.html')

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



