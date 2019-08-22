# -*- coding: utf-8 -*-
from stay_app.model.hotel import Hotel
from stay_app.model.hotel import Image
from stay_app.model.hotel import Facility
from stay_app.model.hotel import Amenity
from stay_app.model.hotel import Deal
from stay_app.model.hotel import Website
from stay_app.model.hotel import Room
from stay_app.model.hotel import HotelCollection
from stay_app.model.hotel import CollectionProduct
from stay_app.model.hotel import Booking
from stay_app.model.hotel import MealPlan
from stay_app.model.hotel import BookingDeal
from stay_app.model.hotel import PriceCalendar
from stay_app import ma
from marshmallow_enum import EnumField
from stay_app.schema.base import safe_execute


class WebsiteSchema(ma.ModelSchema):
    class Meta:
        model = Website
        exclude = ('updated_at', 'created_at', 'hotel')


class PriceCalendarSchema(ma.ModelSchema):
    date = ma.Method('date_epoch')

    def date_epoch(self, obj):
        return safe_execute(None, ValueError, obj.date)

    class Meta:
        model = PriceCalendar
        exclude = ('updated_at', 'created_at')


class DealSchema(ma.ModelSchema):
    website = ma.Nested(WebsiteSchema, many=False)
    price_calendar = ma.Nested(PriceCalendarSchema, many=True)

    class Meta:
        model = Deal
        exclude = ('updated_at', 'created_at')


class AmenitySchema(ma.ModelSchema):
    class Meta:
        model = Amenity
        exclude = ('updated_at', 'created_at', 'hotel')


class CollectionProductSchema(ma.ModelSchema):
    class Meta:
        model = CollectionProduct
        exclude = ('updated_at', 'created_at')


class ImageSchema(ma.ModelSchema):
    class Meta:
        model = Image
        exclude = ('updated_at', 'created_at', 'hotel')


class FacilitySchema(ma.ModelSchema):
    class Meta:
        model = Facility
        exclude = ('updated_at', 'created_at', 'hotel')


class RoomSchema(ma.ModelSchema):
    deals = ma.Nested(DealSchema, many=True)

    facilities = ma.Nested(FacilitySchema, many=False)
    meal_plan = EnumField(MealPlan, by_value=True)

    class Meta:
        model = Room
        exclude = ('updated_at', 'created_at')


class HotelSchema(ma.ModelSchema):
    amenities = ma.Nested(AmenitySchema, many=False)
    images = ma.Nested(ImageSchema, many=True)
    rooms = ma.Nested(RoomSchema, many=True)

    class Meta:
        model = Hotel
        exclude = ('updated_at', 'created_at')


class HotelCollectionSchema(ma.ModelSchema):
    products = ma.Nested(CollectionProductSchema, many=True)
    hotels = ma.Nested(HotelSchema, many=True)

    class Meta:
        model = HotelCollection
        exclude = ('updated_at', 'created_at', 'hotel')


class HotelDealSchema(ma.ModelSchema):
    amenities = ma.Nested(AmenitySchema, many=False)
    images = ma.Nested(ImageSchema, many=True)

    class Meta:
        model = Hotel
        exclude = ('updated_at', 'created_at')


class RoomDealSchema(ma.ModelSchema):
    facilities = ma.Nested(FacilitySchema, many=False)
    hotel = ma.Nested(HotelDealSchema, many=False)

    class Meta:
        model = Room
        exclude = ('updated_at', 'created_at')


class BookingDealSchema(ma.ModelSchema):
    website = ma.Nested(WebsiteSchema, many=False)
    room = ma.Nested(RoomDealSchema, many=False)
    booking_date = ma.Method('booking_date_epoch')

    def booking_date_epoch(self, obj):
        return safe_execute(None, ValueError, obj.booking_date)

    class Meta:
        model = Deal
        exclude = ('updated_at', 'created_at')


class BookingSchema(ma.ModelSchema):
    deals = ma.Nested(BookingDealSchema, many=True)

    class Meta:
        model = Booking
        exclude = ('updated_at', 'created_at')