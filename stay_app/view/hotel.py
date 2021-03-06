# -*- coding: utf-8 -*-

from stay_app.model.hotel import Hotel, Amenity, Image, Deal, Website, Facility, Room, HotelCollection, \
    CollectionProduct, Booking, PriceCalendar, BookingDeal
from stay_app import app, db, cors
# from sqlalchemy import or_
from sqlalchemy import func
from slugify import slugify
from flask import jsonify, request
from stay_app.schema.hotel import HotelSchema, AmenitySchema, ImageSchema, DealSchema, WebsiteSchema, FacilitySchema,\
     RoomSchema, HotelCollectionSchema, CollectionProductSchema, BookingSchema, PriceCalendarSchema
import datetime
import time
from itertools import cycle
# import simplejson as json
# import json
import decimal
import flask.json


class MyJSONEncoder(flask.json.JSONEncoder):

    def default(self, obj):
        if isinstance(obj, decimal.Decimal):
            # Convert decimal instances to strings.
            return str(obj)
        return super(MyJSONEncoder, self).default(obj)


app.json_encoder = MyJSONEncoder


@app.route('/api/v1/hotel', methods=['GET', 'POST'])
def hotel_api():
    if request.method == 'GET':
        args = request.args.to_dict()
        args.pop('b2b_lowest_price_room', None)
        args.pop('lowest_price_room', None)
        rating = request.args.get('rating')
        args.pop('rating', None)
        city = request.args.get('city')
        args.pop('city', None)
        name = request.args.get('name')
        args.pop('name', None)
        price_start = request.args.get('price_start', None)
        price_end = request.args.get('price_end', None)
        args.pop('price_start', None)
        args.pop('price_end', None)
        page = request.args.get('page', 1)
        per_page = request.args.get('per_page', 10)
        args.pop('page', None)
        args.pop('per_page', None)
        check_in = request.args.get('ci')
        check_out = request.args.get('co')
        args.pop('ci', None)
        args.pop('co', None)
        room_list = []
        q = db.session.query(Hotel).outerjoin(Amenity).outerjoin(Room).outerjoin(Facility).outerjoin(Deal).outerjoin(PriceCalendar)
        q_room = db.session.query(Room)
        q_deal = db.session.query(Deal)
        q_price = db.session.query(PriceCalendar)
        for hotel in q:
            rooms = q_room.filter(Room.hotel_id == hotel.id).all()
            for room in rooms:
                room_list.append(room.id)
                if check_in and check_out:
                    deals = q_deal.filter(Deal.room_id == room.id).all()
                    ci = datetime.datetime.fromtimestamp(int(check_in)).date()
                    co = datetime.datetime.fromtimestamp(int(check_out)).date()
                    delta = co - ci
                    for deal in deals:
                        price_list = q_price.filter(PriceCalendar.deal_id == deal.id, PriceCalendar.date >= ci, PriceCalendar.date < co).all()
                        price = 0
                        if delta.days > 0:
                            for i in range(delta.days):
                                if i < len(price_list):
                                    price_list = price_list[i] + price
                                else:
                                    if deal.b2b_selling_price:
                                        price = deal.b2b_selling_price + price
                            price = int(price/delta.days)
                        deal.price = price
            deal = q_deal.filter(Deal.room_id.in_(room_list)).order_by(Deal.b2c_selling_price.asc()).first()
            business_deal = q_deal.filter(Deal.room_id.in_(room_list)).order_by(Deal.b2b_selling_price.asc()).first()
            if deal:
                room = q_room.filter(Room.id == deal.room_id).first()
                room.lowest_price_room = True
            if business_deal:
                room = q_room.filter(Room.id == business_deal.room_id).first()
                room.b2b_lowest_price_room = True
            hotel.rooms = rooms
        for key in args:
            if key in Hotel.__dict__:
                q = q.filter(getattr(Hotel, key) == args[key])
            elif key in Amenity.__dict__:
                q = q.filter(getattr(Amenity, key) == args[key])
            elif key in Room.__dict__:
                q = q.filter(getattr(Room, key) == args[key])
            elif key in Facility.__dict__:
                q = q.filter(getattr(Facility, key) == args[key])
            elif key in Deal.__dict__:
                q = q.filter(getattr(Deal, key) == args[key])
            elif key in PriceCalendar.__dict__:
                q = q.filter(getattr(PriceCalendar, key) == args[key])
        if city:
            q = q.filter(Hotel.city.ilike('%' + city + '%'))
        if name:
            q = q.filter(Hotel.name.ilike('%' + name + '%'))
        if rating:
            q = q.filter(Hotel.rating >= rating)
        if price_start and price_end:
            q = q.filter(Deal.sell >= price_start, Deal.price <= price_end)
        hotels = q.offset((int(page) - 1) * int(per_page)).limit(int(per_page)).all()
        result = HotelSchema(many=True).dump(hotels)
        return jsonify({'result': {'hotel': result.data}, 'message': "Success", 'error': False})
    else:
        hotel = request.json
        images = hotel.get("images", None)
        rooms = hotel.get("rooms", None)
        amenities = hotel.get("amenities", None)
        hotel["slug"] = slugify(hotel.get("name"))
        hotel.pop('amenities', None)
        hotel.pop('images', None)
        hotel.pop('rooms', None)
        hotel_slug = Hotel.query.filter_by(slug=slugify(hotel.get("name"))).first()
        if not hotel_slug:
            hotel_post = Hotel(**hotel)
            hotel_post.save()
            for image in images:
                image["hotel_id"] = hotel_post.id
                image_post = Image(**image)
                hotel_post.images.append(image_post)
                image_post.save()
            for room in rooms:
                facilities = room.get("facilities", None)
                room.pop('facilities', None)
                room["hotel_id"] = hotel_post.id
                room_post = Room(**room)
                hotel_post.rooms.append(room_post)
                room_post.save()
                facilities["room_id"] = room_post.id
                facility_post = Facility(**facilities)
                room_post.facilities = facility_post
                facility_post.save()
            amenities["hotel_id"] = hotel_post.id
            amenities_post = Amenity(**amenities)
            hotel_post.amenities = amenities_post
            amenities_post.save()
            hotel_result = HotelSchema().dump(hotel_post)
            return jsonify({'result': {'hotel': hotel_result.data}, 'message': "Success", 'error': False})
        else:
            return jsonify({'result': {'hotel': []}, 'message': "hotel name already exist", 'error': True})


@app.route('/api/v1/hotel/<int:id>', methods=['PUT', 'DELETE'])
def hotel_id(id):
    if request.method == 'PUT':
        put = Hotel.query.filter_by(id=id).update(request.json)
        if put:
            Hotel.update_db()
            hotels = Hotel.query.filter_by(id=id).first()
            result = HotelSchema(many=False).dump(hotels)
            return jsonify({'result': result.data, "status": "Success", 'error': False})
    elif request.method == 'DELETE':
        hotel = Hotel.query.filter_by(id=id).first()
        if not hotel:
            return jsonify({'result': {}, 'message': "No Found", 'error': True})
        Amenity.query.filter_by(hotel_id=id).delete()
        Image.query.filter_by(hotel_id=id).delete()
        # collection = HotelCollection.query.filter_by(hotel_id=id).first()
        # if collection:
        #     CollectionProduct.query.filter_by(hotel_collection_id=collection.id).delete()
        #     HotelCollection.delete_db(collection)
        rooms = Room.query.filter_by(hotel_id=id).all()
        if rooms:
            for room in rooms:
                Facility.query.filter_by(room_id=room.id).delete()
                Deal.query.filter_by(room_id=room.id).delete()
                Room.delete_db(room)
        Hotel.delete_db(hotel)
        return jsonify({'result': {}, 'message': "Success", 'error': False})


@app.route('/api/v1/hotel/collection', methods=['GET', 'POST'])
def hotel_collection_api():
    if request.method == 'GET':
        args = request.args.to_dict()
        args.pop('page', None)
        args.pop('per_page', None)
        page = int(request.args.get('page', 1))
        per_page = int(request.args.get('per_page', 10))
        data = HotelCollection.query.filter_by(**args).offset((int(page) - 1) * int(per_page)).limit(int(per_page)).all()
        result = HotelCollectionSchema(many=True).dump(data)
        return jsonify({'result': {'collection': result.data}, 'message': "Success", 'error': False})
    else:
        collection = request.json
        products = collection.get("products", None)
        collection.pop('products', None)
        post = HotelCollection(**collection)
        post.save()
        for product in products:
            product["collection_id"] = post.id
            product_post = CollectionProduct(**product)
            post.product.append(product_post)
            product_post.save()
        result = HotelCollectionSchema().dump(post)
        return jsonify({'result': {'collection': result.data}, 'message': "Success", 'error': False})


@app.route('/api/v1/hotel/collection/<int:id>', methods=['PUT', 'DELETE'])
def hotel_collection_id(id):
    if request.method == 'PUT':
        put = HotelCollection.query.filter_by(id=id).update(request.json)
        if put:
            HotelCollection.update_db()
            s = HotelCollection.query.filter_by(id=id).first()
            result = HotelCollectionSchema(many=False).dump(s)
            return jsonify({'result': result.data, "status": "Success", 'error': False})
    else:
        collection = HotelCollection.query.filter_by(id=id).first()
        if not collection:
            return jsonify({'result': {}, 'message': "No Found", 'error': True})
        else:
            put = Hotel.query.filter_by(collection_id=collection.id).update({"collection_id": None})
            if put:
                Hotel.update_db()
            CollectionProduct.query.filter_by(hotel_collection_id=collection.id).delete()
            HotelCollection.delete_db(collection)
        return jsonify({'result': {}, 'message': "Success", 'error': False})


@app.route('/api/v1/hotel/collection/product', methods=['GET', 'POST'])
def collection_product_api():
    if request.method == 'GET':
        args = request.args.to_dict()
        args.pop('page', None)
        args.pop('per_page', None)
        page = int(request.args.get('page', 1))
        per_page = int(request.args.get('per_page', 10))
        data = CollectionProduct.query.filter_by(**args).offset((int(page) - 1) * int(per_page)).limit(int(per_page)).all()
        result = CollectionProductSchema(many=True).dump(data)
        return jsonify({'result': {'products': result.data}, 'message': "Success", 'error': False})
    else:
        post = CollectionProduct(**request.json)
        post.save()
        result = CollectionProductSchema().dump(post)
        return jsonify({'result': {'products': result.data}, 'message': "Success", 'error': False})


@app.route('/api/v1/hotel/collection/product/<int:id>', methods=['PUT', 'DELETE'])
def collection_product_id(id):
    if request.method == 'PUT':
        put = CollectionProduct.query.filter_by(id=id).update(request.json)
        if put:
            CollectionProduct.update_db()
            s = CollectionProduct.query.filter_by(id=id).first()
            result = HotelCollectionSchema(many=False).dump(s)
            return jsonify({'result': result.data, "status": "Success", 'error': False})
    else:
        collection_product = CollectionProduct.query.filter_by(id=id).first()
        if not collection_product:
            return jsonify({'result': {}, 'message': "No Found", 'error': True})
        CollectionProduct.delete_db(collection_product)
        return jsonify({'result': {}, 'message': "Success", 'error': False})


@app.route('/api/v1/room', methods=['GET', 'POST'])
def room_api():
    if request.method == 'GET':
        args = request.args.to_dict()
        args.pop('page', None)
        args.pop('per_page', None)
        page = int(request.args.get('page', 1))
        per_page = int(request.args.get('per_page', 10))
        args.pop('lowest_price_room', None)
        rooms = Room.query.filter_by(**args).offset((int(page) - 1) * int(per_page)).limit(int(per_page)).all()
        result = RoomSchema(many=True).dump(rooms)
        return jsonify({'result': {'rooms': result.data}, 'message': "Success", 'error': False})
    else:
        room = request.json
        facilities = room.get("facilities", None)
        deals = room.get('deals', None)
        room.pop('deals', None)
        room.pop('facilities', None)
        room_post = Room(**room)
        room_post.save()
        for deal in deals:
            deal["room_id"] = room_post.id
            price_calendar = deal.get("price_calendar", None)
            deal.pop('price_calendar', None)
            deal_post = Deal(**deal)
            room_post.deals.append(deal_post)
            deal_post.save()
            for price in price_calendar:
                price["deal_id"] = deal_post.id
                price_post = PriceCalendar(**price)
                deal_post.price_calendar.append(price_post)
                price_post.save()
        facilities["room_id"] = room_post.id
        facility_post = Facility(**facilities)
        room_post.facilities = facility_post
        facility_post.save()
        room_result = RoomSchema().dump(room_post)
        # facility = room.get("facilities", None)
        # if facility:
        #     facility_obj = {
        #         "room_id": room_result.data['id'],
        #         "ac": facility.get("ac", None),
        #         "bed_type": facility.get("bed_type", None),
        #         "no_of_bed": facility.get("no_of_bed", None),
        #         "bathroom_cosmetics": facility.get("bathroom_cosmetics", None),
        #         "bathroom_nightie": facility.get("bathroom_nightie", None),
        #         "bathroom_towels": facility.get("bathroom_towels", None),
        #         "bathroom_with_shower": facility.get("bathroom_with_shower", None),
        #         "desk": facility.get("desk", None),
        #         "electric_kettle": facility.get("electric_kettle", None),
        #         "fan": facility.get("fan", None),
        #         "food_serve_at_room": facility.get("food_serve_at_room", None),
        #         "free_evening_snacks": facility.get("free_evening_snacks", None),
        #         "free_toiletries": facility.get("free_toiletries", None),
        #         "hairdryer": facility.get("hairdryer", None),
        #         "heater": facility.get("heater", None),
        #         "ironing_facility": facility.get("ironing_facility", None),
        #         "morning_newspaper": facility.get("morning_newspaper", None),
        #         "phone": facility.get("phone", None),
        #         "room_safe": facility.get("room_safe", None),
        #         "room_seating_area": facility.get("room_seating_area", None),
        #         "room_slipper": facility.get("room_slipper", None),
        #         "tv": facility.get("tv", None),
        #         "view": facility.get("view", None),
        #         "wardrobes_closet": facility.get("wardrobes_closet", None),
        #         "weighing_machine": facility.get("weighing_machine", None),
        #         "wifi": facility.get("wifi", None)
        #     }
        #     Facility(**facility_obj).save()
        # if room.get('deals'):
        #     for deal in room['deals']:
        #         deal_obj = {
        #             "price": deal.get("price", None),
        #             "weekend": deal.get("weekend", None),
        #             "hotel_url": deal.get("hotel_url", None),
        #             "room_id": room_result.data['id'],
        #             "website_id": deal.get("website_id", None)
        #         }
        #         Deal(**deal_obj).save()
        return jsonify({'result': {'room': room_result}, 'message': "Success", 'error': False})


@app.route('/api/v1/room/<int:id>', methods=['PUT', 'DELETE'])
def room_id(id):
    if request.method == 'PUT':
        put = Room.query.filter_by(id=id).update(request.json)
        if put:
            Room.update_db()
            s = Room.query.filter_by(id=id).first()
            result = RoomSchema(many=False).dump(s)
            return jsonify({'result': result.data, "status": "Success", 'error': False})
    else:
        rooms = Room.query.filter_by(id=id).first()
        if not rooms:
            return jsonify({'result': {}, 'message': "No Found", 'error': True})
        Facility.query.filter_by(room_id=id).delete()
        Deal.query.filter_by(room_id=id).delete()
        Room.delete_db(rooms)
        return jsonify({'result': {}, 'message': "Success", 'error': False})


@app.route('/api/v1/amenity', methods=['GET', 'POST'])
def amenity_api():
    if request.method == 'GET':
        args = request.args.to_dict()
        args.pop('page', None)
        args.pop('per_page', None)
        page = int(request.args.get('page', 1))
        per_page = int(request.args.get('per_page', 10))
        data = Amenity.query.filter_by(**args).offset((page - 1) * per_page).limit(per_page).all()
        result = AmenitySchema(many=True).dump(data)
        return jsonify({'result': {'amenities': result.data}, 'message': "Success", 'error': False})
    else:
        post = Amenity(**request.json)
        post.save()
        result = AmenitySchema().dump(post)
        return jsonify({'result': {'amenities': result.data}, 'message': "Success", 'error': False})


@app.route('/api/v1/amenity/<int:id>', methods=['PUT', 'DELETE'])
def amenity_id(id):
    if request.method == 'PUT':
        put = Amenity.query.filter_by(id=id).update(request.json)
        if put:
            Amenity.update_db()
            s = Amenity.query.filter_by(id=id).first()
            result = AmenitySchema(many=False).dump(s)
            return jsonify({'result': result.data, "status": "Success", 'error': False})
    else:
        amenities = Amenity.query.filter_by(id=id).first()
        if not amenities:
            return jsonify({'result': {}, 'message': "No Found", 'error': True})
        Amenity.delete_db(amenities)
        return jsonify({'result': {}, 'message': "Success", 'error': False})


@app.route('/api/v1/image', methods=['GET', 'POST'])
def image_api():
    if request.method == 'GET':
        args = request.args.to_dict()
        args.pop('page', None)
        args.pop('per_page', None)
        page = int(request.args.get('page', 1))
        per_page = int(request.args.get('per_page', 10))
        data = Image.query.filter_by(**args).offset((page - 1) * per_page).limit(per_page).all()
        result = ImageSchema(many=True).dump(data)
        return jsonify({'result': {'images': result.data}, 'message': "Success", 'error': False})
    else:
        post = Image(**request.json)
        post.save()
        result = ImageSchema().dump(post)
        return jsonify({'result': {'image': result.data}, 'message': "Success", 'error': False})


@app.route('/api/v1/image/<int:id>', methods=['PUT', 'DELETE'])
def image_id(id):
    if request.method == 'PUT':
        put = Image.query.filter_by(id=id).update(request.json)
        if put:
            Image.update_db()
            s = Image.query.filter_by(id=id).first()
            result = ImageSchema(many=False).dump(s)
            return jsonify({'result': result.data, "status": "Success", 'error': False})
    else:
        images = Image.query.filter_by(id=id).first()
        if not images:
            return jsonify({'result': {}, 'message': "No Found", 'error': True})
        Image.delete_db(images)
        return jsonify({'result': {}, 'message': "Success", 'error': False})


@app.route('/api/v1/facility', methods=['GET', 'POST'])
def facility_api():
    if request.method == 'GET':
        args = request.args.to_dict()
        args.pop('page', None)
        args.pop('per_page', None)
        page = int(request.args.get('page', 1))
        per_page = int(request.args.get('per_page', 10))
        data = Facility.query.filter_by(**args).offset((page - 1) * per_page).limit(per_page).all()
        result = FacilitySchema(many=True).dump(data)
        return jsonify({'result': {'facilities': result.data}, 'message': "Success", 'error': False})
    else:
        post = Facility(**request.json)
        post.save()
        result = FacilitySchema().dump(post)
        return jsonify({'result': {'facilities': result.data}, 'message': "Success", 'error': False})


@app.route('/api/v1/facility/<int:id>', methods=['PUT', 'DELETE'])
def facility_id(id):
    if request.method == 'PUT':
        print(request.json)
        put = Facility.query.filter_by(id=id).update(request.json)
        if put:
            Facility.update_db()
            s = Facility.query.filter_by(id=id).first()
            result = FacilitySchema(many=False).dump(s)
            return jsonify({'result': result.data, "status": "Success", 'error': False})
    else:
        data = Facility.query.filter_by(id=id).first()
        if not data:
            return jsonify({'result': {}, 'message': "No Found", 'error': True})
        Facility.delete_db(data)
        return jsonify({'result': {}, 'message': "Success", 'error': False})


@app.route('/api/v1/website', methods=['GET', 'POST'])
def website_api():
    if request.method == 'GET':
        args = request.args.to_dict()
        args.pop('page', None)
        args.pop('per_page', None)
        page = int(request.args.get('page', 1))
        per_page = int(request.args.get('per_page', 10))
        web = Website.query.filter_by(**args).offset((int(page) - 1) * int(per_page)).limit(int(per_page)).all()
        result = WebsiteSchema(many=True).dump(web)
        return jsonify({'result': {'website': result.data}, 'message': "Success", 'error': False})
    else:
        post = Website(**request.json)
        post.save()
        result = WebsiteSchema().dump(post)
        return jsonify({'result': {'website': result.data}, 'message': "Success", 'error': False})


@app.route('/api/v1/deal', methods=['GET', 'POST'])
def deal_api():
    if request.method == 'GET':
        args = request.args.to_dict()
        price_start = request.args.get('price_start', None)
        price_end = request.args.get('price_end', None)
        args.pop('price_start', None)
        args.pop('price_end', None)
        hotel_id = request.args.get('hotel_id', None)
        args.pop('hotel_id', None)
        page = request.args.get('page', 1)
        per_page = request.args.get('per_page', 10)
        args.pop('page', None)
        args.pop('per_page', None)
        # if check_in and check_out:
        #     no_of_days = int(check_out) - int(check_in)
        #     sec = datetime.timedelta(seconds=int(no_of_days))
        #     d = datetime.datetime(1, 1, 1) + sec
        #     no_of_days = d.day - 1
        #     check_in = datetime.datetime.fromtimestamp(
        #         int(check_in)).weekday()
        #     check_out = datetime.datetime.fromtimestamp(
        #         int(check_out)).weekday()
        #     a = [0, 1, 2, 3, 4, 5, 6]
        #     pool = cycle(a)
        #     start = False
        #     days = []
        #     weekend = False
        #     for i, val in enumerate(pool):
        #         if start and val == check_out and len(days) == no_of_days:
        #             break
        #         if start:
        #             days.append(val)
        #         if val == check_in and start is False:
        #             start = True
        #             days.append(val)
        #     for day in days:
        #         if day == 5:
        #             weekend = True
        #         elif day == 6:
        #             weekend = True
        #     args['weekend'] = weekend
        # args.pop('check_in', None)
        # args.pop('check_out', None)
        hotel_room_id = []
        price = []
        if hotel_id:
            rooms_list = Room.query.filter(Room.hotel_id == hotel_id).all()
            for room_obj in rooms_list:
                deals = Deal.query.filter_by(**args).filter(Deal.room_id.in_(room_obj.id)).all()
        elif price_start and price_end:
            deals = Deal.query.filter_by(**args)\
                .filter(Deal.price >= price_start, Deal.price <= price_end).offset((page - 1) * per_page).limit(per_page).all()
        else:
            deals = Deal.query.filter_by(**args).offset((int(page) - 1) * int(per_page)).limit(int(per_page)).all()

        result = DealSchema(many=True).dump(deals)
        return jsonify({'result': {'deal': result.data}, 'message': "Success", 'error': False})
    else:
        deal = request.json
        price_calendar = deal.get("price_calendar", None)
        deal.pop('price_calendar', None)
        deal_post = Deal(**deal)
        deal_post.save()
        for price in price_calendar:
            price["deal_id"] = deal_post.id
            price_post = PriceCalendar(**price)
            deal_post.price_calendar.append(price_post)
            price_post.save()
        result = DealSchema().dump(deal_post)
        return jsonify({'result': {'deal': result.data}, 'message': 'Success', 'error': False})


@app.route('/api/v1/deal/<int:id>', methods=['PUT', 'DELETE'])
def deal_id(id):
    if request.method == 'PUT':
        put = Deal.query.filter_by(id=id).update(request.json)
        if put:
            Deal.update_db()
            data = Deal.query.filter_by(id=id).first()
            result = DealSchema(many=False).dump(data)
            return jsonify({'result': result.data, "status": "Success", 'error': False})
    else:
        data = Deal.query.filter_by(id=id).first()
        if not data:
            return jsonify({'result': {}, 'message': "No Found", 'error': True})
        Deal.delete_db(data)
        return jsonify({'result': {}, 'message': "Success", 'error': False})


@app.route('/api/v1/hotel/search', methods=['POST'])
def hotel_search():
    search = request.json
    search = search['search']
    cities = []
    names = []
    hotel_cities = Hotel.query.distinct(Hotel.city).filter(Hotel.city.ilike('%' + search + '%')).order_by(Hotel.city).limit(5).all()
    for hotel_city in hotel_cities:
        cities.append(hotel_city.city.lower())
    hotel_names = Hotel.query.distinct(Hotel.name).filter(Hotel.name.ilike('%' + search + '%')).order_by(Hotel.name).limit(5).all()
    for hotel_name in hotel_names:
        names.append({"name": hotel_name.name.lower(),
                      "slug": hotel_name.slug.lower(),
                      "id": hotel_name.id})
    return jsonify({'result': {'cities': list(set(cities)), "names": list(set(names))}, 'message': "Success", 'error': False})


@app.route('/api/v1/booking', methods=['GET', 'POST'])
def booking_api():
    if request.method == 'GET':
        args = request.args.to_dict()
        page = request.args.get('page', 1)
        per_page = request.args.get('per_page', 10)
        args.pop('page', None)
        args.pop('per_page', None)
        bookings = Booking.query.filter_by(**args).offset((page - 1) * per_page).limit(per_page).all()
        result = BookingSchema(many=True).dump(bookings)
        return jsonify({'result': {'bookings': result.data}, 'message': "Success", 'error': False})
    else:
        booking = request.json
        deals = booking.get("deals", None)
        booking.pop('deals', None)
        booking_post = Booking(**booking)
        booking_post.save()
        for deal in deals:
            deal["booking_id"] = booking_post.id
            deal_post = Deal(**deal)
            booking_post.deals.append(deal_post)
            deal_post.save()
        result = BookingSchema().dump(booking_post)
        return jsonify({'result': {'booking': result.data}, 'message': "Success", 'error': False})


@app.route('/api/v1/booking/<int:id>', methods=['PUT', 'DELETE'])
def booking_id(id):
    if request.method == 'PUT':
        put = Booking.query.filter_by(id=id).update(request.json)
        if put:
            Booking.update_db()
            s = Booking.query.filter_by(id=id).first()
            result = BookingSchema(many=False).dump(s)
            return jsonify({'result': result.data, "status": "Success", 'error': False})
    else:
        bookings = Booking.query.filter_by(id=id).first()
        if not bookings:
            return jsonify({'result': {}, 'message': "No Found", 'error': True})
        Booking.delete_db(bookings)
        return jsonify({'result': {}, 'message': "Success", 'error': False})

