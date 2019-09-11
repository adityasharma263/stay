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
from stay_app.model.hotel import BedType
from stay_app.model.hotel import BookingDeal
from stay_app.model.hotel import Cart
from stay_app.model.hotel import CartDeal
from stay_app.model.hotel import PriceCalendar
from stay_app import ma
from marshmallow_enum import EnumField
from stay_app.schema.base import safe_execute



#-------------------------------------------------------Hotel Detail-------------------------------------------


class WebsiteSchema(ma.ModelSchema):
    class Meta:
        model = Website
        exclude = ('updated_at', 'created_at')


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
    bed_type = EnumField(BedType, by_value=True)

    class Meta:
        model = Facility
        exclude = ('updated_at', 'created_at')


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


#-------------------------------------------------------Cart--------------------------------------------


class CartHotelSchema(ma.ModelSchema):
    class Meta:
        model = Hotel
        exclude = ('updated_at', 'created_at', "star", "rating", "phone", "desc", "address",
                   "images", "slug", "latitude", "amenities", "collection_id", "hotel_collection",
                   "longitude", "longitude", "country", "category", "rooms")


class CartRoomSchema(ma.ModelSchema):
    meal_plan = EnumField(MealPlan, by_value=True)
    hotel = ma.Nested(CartHotelSchema, many=False)

    class Meta:
        model = Room
        exclude = ('updated_at', 'created_at', "deals", "facilities")


class CartDealSchema(ma.ModelSchema):
    room = ma.Nested(CartRoomSchema, many=False)

    class Meta:
        model = Deal
        exclude = ('updated_at', 'created_at', "price_calendar", "b2c_selling_price", "b2b_final_price",
                   "b2b_selected_deal", "b2c_final_price", "base_price", "commission_in_percentage", "b2b_margin_price",
                   "b2b_selling_price", "b2c_margin_price", "hotel_url", "b2c_lowest_price", "b2c_selected_deal",
                   "b2b_lowest_price")


class CartItemSchema(ma.ModelSchema):
    deal = ma.Nested(CartDealSchema, many=False)

    class Meta:
        model = CartDeal
        exclude = ('updated_at', 'created_at')


class CartSchema(ma.ModelSchema):
    cart_deals = ma.Nested(CartItemSchema, many=True)

    class Meta:
        model = Cart
        exclude = ('updated_at', 'created_at')

#-------------------------------------------------------Terminal-------------------------------------------






class RoomTerminalSchema(ma.ModelSchema):
    meal_plan = EnumField(MealPlan, by_value=True)

    class Meta:
        model = Room
        exclude = ('updated_at', 'created_at', "max_no_of_guest", "image_url", "facilities", "deals")


class HotelTerminalSchema(ma.ModelSchema):
    rooms = ma.Nested(RoomTerminalSchema, many=True)

    class Meta:
        model = Hotel
        exclude = ('updated_at', "city", 'created_at', "star", "rating", "phone", "desc", "address",
                   "images", "slug", "latitude", "amenities", "collection_id", "hotel_collection",
                   "longitude", "longitude", "country", "category")


#------------------------------------------------------- B2B List view ------------------------------------------------------


class DealB2BListSchema(ma.ModelSchema):

    class Meta:
        model = Deal
        exclude = ('updated_at', 'created_at', "website", "price_calendar", "b2c_selling_price", "b2b_final_price",
                   "b2c_final_price", "base_price", "commission_in_percentage", "b2b_margin_price", "b2b_selling_price",
                   "b2c_margin_price", "hotel_url", "b2c_lowest_price", "b2c_selected_deal", "room", "website_id")



class RoomB2BListSchema(ma.ModelSchema):
    meal_plan = EnumField(MealPlan, by_value=True)
    deals = ma.Nested(DealB2BListSchema, many=True)

    class Meta:
        model = Room
        exclude = ('updated_at', 'created_at', "facilities", "hotel")


class HotelB2BListSchema(ma.ModelSchema):
    amenities = ma.Nested(AmenitySchema, many=False)
    rooms = ma.Nested(RoomB2BListSchema, many=True)

    class Meta:
        model = Hotel
        exclude = ('updated_at', 'created_at', "phone", "desc", "address",
                   "images", "latitude", "collection_id", "hotel_collection",
                   "longitude", "longitude", "country", "category")



#-------------------------------------------------------Booking-------------------------------------------


class BookingHotelSchema(ma.ModelSchema):

    class Meta:
        model = Hotel
        exclude = ('updated_at', 'created_at')


class BookingRoomSchema(ma.ModelSchema):
    hotel = ma.Nested(BookingHotelSchema, many=False)
    meal_plan = EnumField(MealPlan, by_value=True)

    class Meta:
        model = Room
        exclude = ('updated_at', 'created_at')


class BookingDealSchema(ma.ModelSchema):
    website = ma.Nested(WebsiteSchema, many=False)
    room = ma.Nested(BookingRoomSchema, many=False)

    class Meta:
        model = BookingDeal
        exclude = ('updated_at', 'created_at')


class BookingSchema(ma.ModelSchema):
    deals = ma.Nested(BookingDealSchema, many=True)
    booking_date = ma.Method('booking_date_epoch')

    def booking_date_epoch(self, obj):
        return safe_execute(None, ValueError, obj.booking_date)

    class Meta:
        model = Booking
        exclude = ('updated_at', 'created_at')
