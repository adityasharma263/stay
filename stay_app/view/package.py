# -*- coding: utf-8 -*-

from stay_app.model.hotel import PackageBooking, Packages, Cities, Experiences, Inclusions
from stay_app import app, db, cors
from sqlalchemy import func
from slugify import slugify
from flask import jsonify, request
from stay_app.schema.hotel import InclusionsSchema, PackageBookingSchema, PackageSchema, CitiesSchema, ExperiencesSchema
import datetime
import requests
import time
from itertools import cycle
import json
import decimal
import flask.json


@app.route('/api/v1/package', methods=['GET', 'POST'])
def package_api():
    if request.method == 'GET':
        args = request.args.to_dict()
        page = request.args.get('page', 1)
        per_page = request.args.get('per_page', 10)
        args.pop('page', None)
        args.pop('per_page', None)
        bookings = Packages.query.filter_by(**args).offset((page - 1) * per_page).limit(per_page).all()
        result = PackageSchema(many=True).dump(bookings)
        return jsonify({'result': {'packages': result.data}, 'message': "Success", 'error': False})
    else:
        package = request.json
        package['valid_from'] = datetime.datetime.fromtimestamp(
            int(package['valid_from'])).strftime('%Y-%m-%d %H:%M:%S')
        package['valid_till'] = datetime.datetime.fromtimestamp(
            int(package['valid_till'])).strftime('%Y-%m-%d %H:%M:%S')
        cities = package.get("cities", None)
        experiences = package.get("experiences", None)
        inclusions = package.get("inclusions", None)
        package.pop('cities', None)
        package.pop('experiences', None)
        package.pop('inclusions', None)
        package_post = Packages(**package)
        package_post.save()
        for city in cities:
            city["package_id"] = package_post.id
            city_post = Cities(**city)
            package_post.cities.append(city_post)
            city_post.save()
        for experience in experiences:
            experience["package_id"] = package_post.id
            experience_post = Experiences(**experience)
            package_post.experiences.append(experience_post)
            experience_post.save()
        inclusions["package_id"] = package_post.id
        inclusions_post = Inclusions(**inclusions)
        package_post.amenities = inclusions_post
        inclusions_post.save()

        result = PackageSchema().dump(package_post)
        return jsonify({'result': {'package': result.data}, 'message': "Success", 'error': False})


@app.route('/api/v1/package/<int:id>', methods=['PUT', 'DELETE'])
def package_id(id):
    if request.method == 'PUT':
        put = Packages.query.filter_by(id=id).update(request.json)
        if put:
            Packages.update_db()
            s = Packages.query.filter_by(id=id).first()
            result = PackageSchema(many=False).dump(s)
            return jsonify({'result': result.data, "status": "Success", 'error': False})
    else:
        packages = Packages.query.filter_by(id=id).first()
        if not packages:
            return jsonify({'result': {}, 'message': "No Found", 'error': True})
        Packages.delete_db(packages)
        return jsonify({'result': {}, 'message': "Success", 'error': False})

