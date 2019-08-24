# -*- coding: utf-8 -*-
from stay_app import db
from stay_app.model.base import Base

import enum


class MealPlan(enum.Enum):
    CP = "Continental Plan"
    MAP = "Modified American Plan"
    EP = "European Plan"
    AP = "American Plan"


class BedType(enum.Enum):
    Single = "Single"
    Double = "Double"
    Queen = "Queen"
    King = "King"


class HotelCollection(Base):
    __tablename__ = 'hotel_collection'

    collection_name = db.Column(db.String, nullable=True)
    featured = db.Column(db.Boolean, default=False, nullable=True)
    desc = db.Column(db.Text, nullable=True)
    image = db.Column(db.String, nullable=True)
    products = db.relationship('CollectionProduct', backref='hotel_collection')
    hotels = db.relationship('Hotel', backref='hotel_collection')

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def __repr__(self):
        return '<collection %r>' % self.collection


class Hotel(Base):
    __tablename__ = 'hotel'

    name = db.Column(db.String)
    star = db.Column(db.Integer, nullable=True)
    rating = db.Column(db.DECIMAL, nullable=True)
    slug = db.Column(db.String(255))
    phone = db.Column(db.String, nullable=True)
    city = db.Column(db.String, nullable=True)
    country = db.Column(db.String, nullable=True)
    desc = db.Column(db.Text, nullable=True)
    category = db.Column(db.Integer, nullable=True)
    address = db.Column(db.String, nullable=True)
    images = db.relationship('Image', backref='hotel')
    rooms = db.relationship('Room',  backref='hotel')
    latitude = db.Column('latitude', db.Float(asdecimal=True), nullable=True)
    longitude = db.Column('longitude', db.Float(asdecimal=True), nullable=True)
    amenities = db.relationship('Amenity', uselist=False, backref='hotel')
    collection_id = db.Column(db.Integer, db.ForeignKey('hotel_collection.id'), nullable=True)

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def __repr__(self):
        return '<name %r>' % self.name


class CollectionProduct(Base):
    __tablename__ = 'collection_product'

    hotel_collection_id = db.Column(db.Integer, db.ForeignKey('hotel_collection.id'), nullable=False)
    product_url = db.Column(db.String, nullable=True)
    product_name = db.Column(db.String, nullable=True)
    featured_product = db.Column(db.Boolean, default=False, nullable=True)
    product_desc = db.Column(db.Text, nullable=True)
    product_image = db.Column(db.String, nullable=True)

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def __repr__(self):
        return '<image_url %r>' % self.image_url


class Room(Base):

    __tablename__ = 'room'

    hotel_id = db.Column(db.Integer, db.ForeignKey('hotel.id'), nullable=False)
    max_no_of_guest = db.Column(db.Integer, nullable=True)
    lowest_price_room = db.Column(db.Boolean, default=False, nullable=True)
    room_type = db.Column(db.String, nullable=True)
    b2b_lowest_price_room = db.Column(db.Boolean, default=False, nullable=True)
    image_url = db.Column(db.String, nullable=True)
    meal_plan = db.Column(db.Enum(MealPlan))
    balcony = db.Column(db.Boolean, default=False, nullable=True)
    facilities = db.relationship('Facility', uselist=False, backref='room')
    deals = db.relationship('Deal', backref='room')

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def __repr__(self):
        return '<hotel_id %r>' % self.hotel_id


class Amenity(Base):
    __tablename__ = 'amenity'

    hotel_id = db.Column(db.Integer, db.ForeignKey('hotel.id'), unique=True, nullable=False)
    conference_room = db.Column(db.Boolean, default=False, nullable=True)
    airport_transfers = db.Column(db.Boolean, default=False, nullable=True)
    parking = db.Column(db.Boolean, default=False, nullable=True)
    couple_friendly = db.Column(db.Boolean, default=False, nullable=True)
    express_check_in_out = db.Column(db.Boolean, default=False, nullable=True)
    laundry_service = db.Column(db.Boolean, default=False, nullable=True)
    indoor_swimming_pool = db.Column(db.Boolean, default=False, nullable=True)
    outdoor_swimming_pool = db.Column(db.Boolean, default=False, nullable=True)
    porter_service = db.Column(db.Boolean, default=False, nullable=True)
    Room_cleaning_service = db.Column(db.Boolean, default=False, nullable=True)
    terrace = db.Column(db.Boolean, default=False, nullable=True)
    child_baby_cot = db.Column(db.Boolean, default=False, nullable=True)
    wheelchair_accessible = db.Column(db.Boolean, default=False, nullable=True)
    doorman = db.Column(db.Boolean, default=False, nullable=True)
    hairdresser = db.Column(db.Boolean, default=False, nullable=True)
    banquets = db.Column(db.Boolean, default=False, nullable=True)
    non_smoking_smoking_rooms = db.Column(db.Boolean, default=False, nullable=True)
    pet_allowance = db.Column(db.Boolean, default=False, nullable=True)
    lift = db.Column(db.Boolean, default=False, nullable=True)
    bar = db.Column(db.Boolean, default=False, nullable=True)
    gym = db.Column(db.Boolean, default=False, nullable=True)
    pool = db.Column(db.Boolean, default=False, nullable=True)
    restaurant = db.Column(db.Boolean, default=False, nullable=True)
    spa = db.Column(db.Boolean, default=False, nullable=True)
    wifi_in_lobby = db.Column(db.Boolean, default=False, nullable=True)
    twenty_four_hr_reception = db.Column(db.Boolean, default=False, nullable=True)
    twenty_four_hr_room_service = db.Column(db.Boolean, default=False, nullable=True)

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def __repr__(self):
        return '<pool %r>' % self.pool


class Image(Base):
    __tablename__ = 'image'

    hotel_id = db.Column(db.Integer, db.ForeignKey('hotel.id'), nullable=False)
    image_url = db.Column(db.String, nullable=True)

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def __repr__(self):
        return '<image_url %r>' % self.image_url


class Facility(Base):

    __tablename__ = 'facility'

    bed_type = db.Column(db.Enum(BedType))
    no_of_bed = db.Column(db.Integer, nullable=True)
    jacuzzi = db.Column(db.Boolean, default=False, nullable=True)
    bathroom_with_shower = db.Column(db.Boolean, default=False, nullable=True)
    bathroom_nightie = db.Column(db.Boolean, default=False, nullable=True)
    wardrobes_closet = db.Column(db.Boolean, default=False, nullable=True)
    room_slipper = db.Column(db.Boolean, default=False, nullable=True)
    morning_newspaper = db.Column(db.Boolean, default=False, nullable=True)
    food_serve_at_room = db.Column(db.Boolean, default=False, nullable=True)
    ironing_facility = db.Column(db.Boolean, default=False, nullable=True)
    view = db.Column(db.Boolean, default=False, nullable=True)
    free_toiletries = db.Column(db.Boolean, default=False, nullable=True)
    bathroom_towels = db.Column(db.Boolean, default=False, nullable=True)
    bathroom_cosmetics = db.Column(db.Boolean, default=False, nullable=True)
    weighing_machine = db.Column(db.Boolean, default=False, nullable=True)
    room_seating_area = db.Column(db.Boolean, default=False, nullable=True)
    free_evening_snacks = db.Column(db.Boolean, default=False, nullable=True)
    ac = db.Column(db.Boolean, default=False, nullable=True)
    hairdryer = db.Column(db.Boolean, default=False, nullable=True)
    wifi = db.Column(db.Boolean, default=False, nullable=True)
    tv = db.Column(db.Boolean, default=False, nullable=True)
    phone = db.Column(db.Boolean, default=False, nullable=True)
    room_safe = db.Column(db.Boolean, default=False, nullable=True)
    heater = db.Column(db.Boolean, default=False, nullable=True)
    desk = db.Column(db.Boolean, default=False, nullable=True)
    fan = db.Column(db.Boolean, default=False, nullable=True)
    electric_kettle = db.Column(db.Boolean, default=False, nullable=True)
    room_id = db.Column(db.Integer, db.ForeignKey('room.id'), unique=True, nullable=False)

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def __repr__(self):
        return '<ac %r>' % self.ac


class Website(Base):

    __tablename__ = 'website'

    website = db.Column(db.String)
    logo_image = db.Column(db.String, nullable=True)

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def __repr__(self):
        return '<website %r>' % self.website


class Deal(Base):

    __tablename__ = 'deal'

    b2b_selling_price = db.Column(db.Integer, nullable=True)
    sold_out = db.Column(db.Boolean, default=False, nullable=True)
    b2c_selling_price = db.Column(db.Integer, nullable=True)
    price = db.Column(db.Integer, nullable=True)
    base_price = db.Column(db.Integer, nullable=True)
    commission_in_percentage = db.Column(db.Integer, nullable=True)
    b2b_margin_price = db.Column(db.Integer, nullable=True)
    b2c_margin_price = db.Column(db.Integer, nullable=True)
    hotel_url = db.Column(db.String)
    ts_exclusive = db.Column(db.Boolean, default=False, nullable=True)
    partner_id = db.Column(db.Integer, nullable=True)
    website_id = db.Column(db.Integer, db.ForeignKey('website.id'), unique=False, nullable=True)
    room_id = db.Column(db.Integer, db.ForeignKey('room.id'), unique=False, nullable=False)
    website = db.relationship('Website', foreign_keys=website_id)
    price_calendar = db.relationship('PriceCalendar', backref='deal')

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def __repr__(self):
        return '<room_id %r>' % self.room_id


class PriceCalendar(Base):

    __tablename__ = 'price_calendar'

    commission_in_percentage = db.Column(db.Integer, nullable=True)
    sold_out = db.Column(db.Boolean, default=False, nullable=True)
    b2b_selling_price = db.Column(db.Integer, nullable=True)
    b2c_selling_price = db.Column(db.Integer, nullable=True)
    b2b_margin_price = db.Column(db.Integer, nullable=True)
    b2c_margin_price = db.Column(db.Integer, nullable=True)
    base_price = db.Column(db.Integer, nullable=True)
    weekend = db.Column(db.Boolean, default=False, nullable=True)
    date = db.Column(db.DateTime(timezone=True), nullable=True)
    deal_id = db.Column(db.Integer, db.ForeignKey('deal.id'), unique=False, nullable=False)

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def __repr__(self):
        return '<deal_id %r>' % self.deal_id


class Cart(Base):
    __tablename__ = 'cart'

    partner_id = db.Column(db.Integer, nullable=False)
    total_no_of_deals = db.Column(db.Integer, nullable=False)
    total_booking_amount = db.Column(db.Integer, nullable=True)
    cart_deals = db.relationship('CartDeal', backref='cart')

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def __repr__(self):
        return '<partner_id %r>' % self.partner_id


class CartDeal(Base):

    __tablename__ = 'cart_deal'

    cart_id = db.Column(db.Integer, db.ForeignKey('cart.id'), unique=False)
    deal_id = db.Column(db.Integer, db.ForeignKey('deal.id'), unique=False, nullable=False)
    current_deal_amount = db.Column(db.Integer, nullable=True)
    ci_date = db.Column(db.DateTime(timezone=True), nullable=True)
    co_date = db.Column(db.DateTime(timezone=True), nullable=True)
    deal = db.relationship('Deal', foreign_keys=deal_id)
    no_of_deals = db.Column(db.Integer, nullable=True)

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def __repr__(self):
        return '<booking_id %r>' % self.booking_id


class Booking(Base):

    __tablename__ = 'booking'

    booking_no = db.Column(db.String, nullable=True)
    booking_date = db.Column(db.DateTime(timezone=True), nullable=True)
    partner_id = db.Column(db.Integer, nullable=False)
    total_booking_amount = db.Column(db.Integer, nullable=True)
    deals = db.relationship('BookingDeal', backref='booking')

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def __repr__(self):
        return '<booking_no %r>' % self.booking_no


class BookingDeal(Base):

    __tablename__ = 'booking_deal'

    room_id = db.Column(db.Integer, db.ForeignKey('room.id'), unique=False)
    room = db.relationship('Room', foreign_keys=room_id)
    current_deal_amount = db.Column(db.Integer, nullable=True)
    ci_date = db.Column(db.DateTime(timezone=True), nullable=True)
    co_date = db.Column(db.DateTime(timezone=True), nullable=True)
    selling_price = db.Column(db.Integer, nullable=True)
    base_price = db.Column(db.Integer, nullable=True)
    commission_in_percentage = db.Column(db.Integer, nullable=True)
    margin_price = db.Column(db.Integer, nullable=True)
    ts_exclusive = db.Column(db.Boolean, default=False, nullable=True)
    partner_id = db.Column(db.Integer, nullable=True)
    website_id = db.Column(db.Integer, db.ForeignKey('website.id'), unique=False)
    booking_id = db.Column(db.Integer, db.ForeignKey('booking.id'), unique=False)
    guest_fist_name = db.Column(db.String, nullable=True)
    guest_last_name = db.Column(db.String, nullable=True)
    contact_no = db.Column(db.String, nullable=True)
    email = db.Column(db.String(120), nullable=True)

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def __repr__(self):
        return '<booking_id %r>' % self.booking_id