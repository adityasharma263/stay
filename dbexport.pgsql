--
-- PostgreSQL database dump
--

-- Dumped from database version 10.7 (Ubuntu 10.7-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.7 (Ubuntu 10.7-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: mealplan; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.mealplan AS ENUM (
    'CP',
    'MAP',
    'EP',
    'AP'
);


ALTER TYPE public.mealplan OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: amenity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.amenity (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    hotel_id integer NOT NULL,
    conference_room boolean,
    parking boolean,
    couple_friendly boolean,
    express_check_in_out boolean,
    laundry_service boolean,
    indoor_swimming_pool boolean,
    outdoor_swimming_pool boolean,
    porter_service boolean,
    "Room_cleaning_service" boolean,
    terrace boolean,
    child_baby_cot boolean,
    wheelchair_accessible boolean,
    doorman boolean,
    hairdresser boolean,
    banquets boolean,
    non_smoking_smoking_rooms boolean,
    pet_allowance boolean,
    lift boolean,
    bar boolean,
    gym boolean,
    pool boolean,
    restaurant boolean,
    spa boolean,
    wifi_in_lobby boolean,
    twenty_four_hr_reception boolean,
    twenty_four_hr_room_service boolean,
    airport_transfers boolean
);


ALTER TABLE public.amenity OWNER TO postgres;

--
-- Name: amenity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.amenity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amenity_id_seq OWNER TO postgres;

--
-- Name: amenity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.amenity_id_seq OWNED BY public.amenity.id;


--
-- Name: booking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    booking_no character varying,
    partner_id integer NOT NULL,
    booking_date timestamp with time zone,
    total_booking_amount integer
);


ALTER TABLE public.booking OWNER TO postgres;

--
-- Name: booking_deal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_deal (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    booking_id integer,
    base_price integer,
    ci_date timestamp with time zone,
    co_date timestamp with time zone,
    commission_in_percentage integer,
    contact_no character varying,
    email character varying(120),
    guest_fist_name character varying,
    guest_last_name character varying,
    margin_price integer,
    partner_id integer,
    room_id integer,
    selling_price integer,
    ts_exclusive boolean,
    website_id integer,
    current_deal_amount integer
);


ALTER TABLE public.booking_deal OWNER TO postgres;

--
-- Name: booking_deal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_deal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_deal_id_seq OWNER TO postgres;

--
-- Name: booking_deal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_deal_id_seq OWNED BY public.booking_deal.id;


--
-- Name: booking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_id_seq OWNER TO postgres;

--
-- Name: booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_id_seq OWNED BY public.booking.id;


--
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    partner_id integer NOT NULL,
    total_no_of_deals integer NOT NULL,
    total_booking_amount integer
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- Name: cart_deal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_deal (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    cart_id integer,
    deal_id integer NOT NULL,
    current_deal_amount integer,
    ci_date timestamp with time zone,
    co_date timestamp with time zone,
    no_of_deals integer
);


ALTER TABLE public.cart_deal OWNER TO postgres;

--
-- Name: cart_deal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_deal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_deal_id_seq OWNER TO postgres;

--
-- Name: cart_deal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_deal_id_seq OWNED BY public.cart_deal.id;


--
-- Name: cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_id_seq OWNER TO postgres;

--
-- Name: cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_id_seq OWNED BY public.cart.id;


--
-- Name: collection_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collection_product (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    hotel_collection_id integer NOT NULL,
    product_url character varying,
    product_name character varying,
    featured_product boolean,
    product_desc text,
    product_image character varying
);


ALTER TABLE public.collection_product OWNER TO postgres;

--
-- Name: collection_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.collection_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collection_product_id_seq OWNER TO postgres;

--
-- Name: collection_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.collection_product_id_seq OWNED BY public.collection_product.id;


--
-- Name: deal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deal (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    hotel_url character varying,
    website_id integer,
    room_id integer NOT NULL,
    base_price integer,
    commission_in_percentage integer,
    b2b_margin_price integer,
    b2b_selling_price integer,
    b2c_margin_price integer,
    b2c_selling_price integer,
    partner_id integer,
    ts_exclusive boolean,
    price integer,
    sold_out boolean
);


ALTER TABLE public.deal OWNER TO postgres;

--
-- Name: deal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deal_id_seq OWNER TO postgres;

--
-- Name: deal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deal_id_seq OWNED BY public.deal.id;


--
-- Name: facility; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facility (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    bed_type integer,
    no_of_bed integer,
    bathroom_with_shower boolean,
    bathroom_nightie boolean,
    wardrobes_closet boolean,
    room_slipper boolean,
    morning_newspaper boolean,
    food_serve_at_room boolean,
    ironing_facility boolean,
    view boolean,
    free_toiletries boolean,
    bathroom_towels boolean,
    bathroom_cosmetics boolean,
    weighing_machine boolean,
    room_seating_area boolean,
    free_evening_snacks boolean,
    ac boolean,
    hairdryer boolean,
    wifi boolean,
    tv boolean,
    phone boolean,
    room_safe boolean,
    heater boolean,
    desk boolean,
    fan boolean,
    electric_kettle boolean,
    room_id integer NOT NULL,
    jacuzzi boolean
);


ALTER TABLE public.facility OWNER TO postgres;

--
-- Name: facility_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facility_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facility_id_seq OWNER TO postgres;

--
-- Name: facility_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facility_id_seq OWNED BY public.facility.id;


--
-- Name: hotel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hotel (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name character varying,
    star integer,
    rating numeric,
    phone character varying,
    city character varying,
    "desc" text,
    category integer,
    address character varying,
    latitude double precision,
    longitude double precision,
    collection_id integer,
    country character varying
);


ALTER TABLE public.hotel OWNER TO postgres;

--
-- Name: hotel_collection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hotel_collection (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    collection_name character varying,
    featured boolean,
    "desc" text,
    image character varying
);


ALTER TABLE public.hotel_collection OWNER TO postgres;

--
-- Name: hotel_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hotel_collection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hotel_collection_id_seq OWNER TO postgres;

--
-- Name: hotel_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hotel_collection_id_seq OWNED BY public.hotel_collection.id;


--
-- Name: hotel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hotel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hotel_id_seq OWNER TO postgres;

--
-- Name: hotel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hotel_id_seq OWNED BY public.hotel.id;


--
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    hotel_id integer NOT NULL,
    image_url character varying
);


ALTER TABLE public.image OWNER TO postgres;

--
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.image_id_seq OWNER TO postgres;

--
-- Name: image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;


--
-- Name: price_calendar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price_calendar (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    date timestamp without time zone,
    deal_id integer NOT NULL,
    base_price integer,
    commission_in_percentage integer,
    b2b_margin_price integer,
    b2b_selling_price integer,
    b2c_margin_price integer,
    b2c_selling_price integer,
    sold_out boolean,
    weekend boolean
);


ALTER TABLE public.price_calendar OWNER TO postgres;

--
-- Name: price_calendar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.price_calendar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.price_calendar_id_seq OWNER TO postgres;

--
-- Name: price_calendar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.price_calendar_id_seq OWNED BY public.price_calendar.id;


--
-- Name: room; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.room (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    hotel_id integer NOT NULL,
    image_url character varying,
    balcony boolean,
    lowest_price_room boolean,
    b2b_lowest_price_room boolean,
    meal_plan public.mealplan,
    max_no_of_guest integer,
    room_type character varying
);


ALTER TABLE public.room OWNER TO postgres;

--
-- Name: room_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.room_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.room_id_seq OWNER TO postgres;

--
-- Name: room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.room_id_seq OWNED BY public.room.id;


--
-- Name: website; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.website (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    website character varying,
    logo_image character varying
);


ALTER TABLE public.website OWNER TO postgres;

--
-- Name: website_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.website_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.website_id_seq OWNER TO postgres;

--
-- Name: website_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.website_id_seq OWNED BY public.website.id;


--
-- Name: amenity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amenity ALTER COLUMN id SET DEFAULT nextval('public.amenity_id_seq'::regclass);


--
-- Name: booking id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking ALTER COLUMN id SET DEFAULT nextval('public.booking_id_seq'::regclass);


--
-- Name: booking_deal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_deal ALTER COLUMN id SET DEFAULT nextval('public.booking_deal_id_seq'::regclass);


--
-- Name: cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);


--
-- Name: cart_deal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_deal ALTER COLUMN id SET DEFAULT nextval('public.cart_deal_id_seq'::regclass);


--
-- Name: collection_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_product ALTER COLUMN id SET DEFAULT nextval('public.collection_product_id_seq'::regclass);


--
-- Name: deal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deal ALTER COLUMN id SET DEFAULT nextval('public.deal_id_seq'::regclass);


--
-- Name: facility id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility ALTER COLUMN id SET DEFAULT nextval('public.facility_id_seq'::regclass);


--
-- Name: hotel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel ALTER COLUMN id SET DEFAULT nextval('public.hotel_id_seq'::regclass);


--
-- Name: hotel_collection id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel_collection ALTER COLUMN id SET DEFAULT nextval('public.hotel_collection_id_seq'::regclass);


--
-- Name: image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);


--
-- Name: price_calendar id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_calendar ALTER COLUMN id SET DEFAULT nextval('public.price_calendar_id_seq'::regclass);


--
-- Name: room id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room ALTER COLUMN id SET DEFAULT nextval('public.room_id_seq'::regclass);


--
-- Name: website id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.website ALTER COLUMN id SET DEFAULT nextval('public.website_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
802fc5996861
\.


--
-- Data for Name: amenity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.amenity (id, created_at, updated_at, hotel_id, conference_room, parking, couple_friendly, express_check_in_out, laundry_service, indoor_swimming_pool, outdoor_swimming_pool, porter_service, "Room_cleaning_service", terrace, child_baby_cot, wheelchair_accessible, doorman, hairdresser, banquets, non_smoking_smoking_rooms, pet_allowance, lift, bar, gym, pool, restaurant, spa, wifi_in_lobby, twenty_four_hr_reception, twenty_four_hr_room_service, airport_transfers) FROM stdin;
1	2019-06-25 23:49:00.806373+05:30	2019-06-25 23:49:00.806373+05:30	3	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	\N
2	2019-06-25 23:52:10.956504+05:30	2019-06-25 23:52:10.956504+05:30	5	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	f	f	f	\N
3	2019-06-25 23:53:33.375695+05:30	2019-06-25 23:53:33.375695+05:30	7	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	\N
4	2019-06-25 23:57:04.086462+05:30	2019-06-25 23:57:04.086462+05:30	8	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	\N
5	2019-06-25 23:57:05.526362+05:30	2019-06-25 23:57:05.526362+05:30	9	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	f	f	f	\N
6	2019-06-25 23:57:08.648626+05:30	2019-06-25 23:57:08.648626+05:30	10	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	f	f	f	\N
7	2019-06-25 23:57:12.03656+05:30	2019-06-25 23:57:12.03656+05:30	11	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	f	f	f	\N
8	2019-06-25 23:57:16.687237+05:30	2019-06-25 23:57:16.687237+05:30	12	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	f	f	f	\N
9	2019-06-25 23:57:21.990992+05:30	2019-06-25 23:57:21.990992+05:30	13	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	f	f	f	\N
10	2019-08-23 01:12:20.756943+05:30	2019-08-23 01:12:20.756943+05:30	17	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	t	t	t	f	f	f	f	f
11	2019-08-23 01:13:15.500163+05:30	2019-08-23 01:13:15.500163+05:30	18	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	t	t	t	f	f	f	f	f
12	2019-08-23 01:13:30.024016+05:30	2019-08-23 01:13:30.024016+05:30	19	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	t	t	t	f	f	f	f	f
13	2019-08-23 01:14:02.658953+05:30	2019-08-23 01:14:02.658953+05:30	20	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	t	t	t	f	f	f	f	f
14	2019-08-23 01:14:16.319582+05:30	2019-08-23 01:14:16.319582+05:30	21	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	t	t	t	f	f	f	f	f
15	2019-08-23 19:48:30.138992+05:30	2019-08-23 19:48:30.138992+05:30	22	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	f	f	t	f	f	f	f	f
16	2019-08-23 19:48:39.150234+05:30	2019-08-23 19:48:39.150234+05:30	23	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	t	t	t	f	f	f	f	f
17	2019-08-23 19:49:24.298256+05:30	2019-08-23 19:49:24.298256+05:30	24	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	t	t	t	f	f	f	f	f
18	2019-08-23 19:49:36.354289+05:30	2019-08-23 19:49:36.354289+05:30	25	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	t	t	t	f	f	f	f	f
19	2019-08-23 19:50:04.032423+05:30	2019-08-23 19:50:04.032423+05:30	26	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	t	t	t	f	f	f	f	f
20	2019-08-23 19:50:16.475796+05:30	2019-08-23 19:50:16.475796+05:30	27	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	t	t	t	f	f	f	f	f
21	2019-08-23 19:50:28.831711+05:30	2019-08-23 19:50:28.831711+05:30	28	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	t	t	t	f	f	f	f	f
22	2019-08-23 19:50:41.618429+05:30	2019-08-23 19:50:41.618429+05:30	29	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	t	t	t	f	f	f	f	f
23	2019-08-23 19:51:04.324706+05:30	2019-08-23 19:51:04.324706+05:30	30	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	t	t	t	f	f	f	f	f
24	2019-08-23 19:51:25.01493+05:30	2019-08-23 19:51:25.01493+05:30	31	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	t	t	t	f	f	f	f	f
25	2019-08-23 19:51:56.04709+05:30	2019-08-23 19:51:56.04709+05:30	32	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	t	t	t	f	f	f	f	f
26	2019-08-23 19:52:16.538476+05:30	2019-08-23 19:52:16.538476+05:30	33	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	t	t	t	f	f	f	f	f
27	2019-08-23 19:52:55.629372+05:30	2019-08-23 19:52:55.629372+05:30	34	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	t	t	t	f	f	f	f	f
28	2019-08-23 19:53:36.801323+05:30	2019-08-23 19:53:36.801323+05:30	35	f	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	f	t	t	t	f	f	f	f	f
29	2019-08-23 19:55:00.925555+05:30	2019-08-23 19:55:00.925555+05:30	36	f	t	f	f	t	f	f	f	f	f	f	f	f	f	f	f	f	t	f	t	t	t	f	f	f	f	f
\.


--
-- Data for Name: booking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking (id, created_at, updated_at, booking_no, partner_id, booking_date, total_booking_amount) FROM stdin;
1	\N	\N	TSB01	1	\N	\N
4	2019-08-01 17:41:20.384207+05:30	2019-08-01 17:41:20.384207+05:30	TSB01	1	\N	\N
5	2019-08-01 17:41:27.979889+05:30	2019-08-01 17:41:27.979889+05:30	TSB01	1	\N	\N
6	2019-08-01 17:41:30.125859+05:30	2019-08-01 17:41:30.125859+05:30	TSB01	1	\N	\N
\.


--
-- Data for Name: booking_deal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_deal (id, created_at, updated_at, booking_id, base_price, ci_date, co_date, commission_in_percentage, contact_no, email, guest_fist_name, guest_last_name, margin_price, partner_id, room_id, selling_price, ts_exclusive, website_id, current_deal_amount) FROM stdin;
1	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (id, created_at, updated_at, partner_id, total_no_of_deals, total_booking_amount) FROM stdin;
\.


--
-- Data for Name: cart_deal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_deal (id, created_at, updated_at, cart_id, deal_id, current_deal_amount, ci_date, co_date, no_of_deals) FROM stdin;
\.


--
-- Data for Name: collection_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collection_product (id, created_at, updated_at, hotel_collection_id, product_url, product_name, featured_product, product_desc, product_image) FROM stdin;
\.


--
-- Data for Name: deal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deal (id, created_at, updated_at, hotel_url, website_id, room_id, base_price, commission_in_percentage, b2b_margin_price, b2b_selling_price, b2c_margin_price, b2c_selling_price, partner_id, ts_exclusive, price, sold_out) FROM stdin;
1	2019-06-24 18:27:59.830157+05:30	2019-06-24 18:27:59.830157+05:30	yjgv	1	1	\N	\N	\N	300	\N	500	\N	t	\N	\N
2	2019-06-24 18:28:26.942277+05:30	2019-06-24 18:28:26.942277+05:30	bii	1	2	\N	\N	\N	100	\N	300	\N	t	\N	\N
3	2019-06-24 18:29:02.911809+05:30	2019-06-24 18:29:02.911809+05:30	uih	1	3	\N	\N	\N	200	\N	400	\N	t	\N	\N
4	2019-06-25 23:57:13.751725+05:30	2019-06-25 23:57:13.751725+05:30	http://134.209.150.124/api/v1/hotel?id=11	1	6	\N	\N	\N	300	\N	200	\N	t	\N	\N
5	2019-06-25 23:57:18.988988+05:30	2019-06-25 23:57:18.988988+05:30	http://134.209.150.124/api/v1/hotel?id=12	1	7	\N	\N	\N	500	\N	\N	\N	t	\N	\N
\.


--
-- Data for Name: facility; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facility (id, created_at, updated_at, bed_type, no_of_bed, bathroom_with_shower, bathroom_nightie, wardrobes_closet, room_slipper, morning_newspaper, food_serve_at_room, ironing_facility, view, free_toiletries, bathroom_towels, bathroom_cosmetics, weighing_machine, room_seating_area, free_evening_snacks, ac, hairdryer, wifi, tv, phone, room_safe, heater, desk, fan, electric_kettle, room_id, jacuzzi) FROM stdin;
1	2019-08-20 16:27:20.034029+05:30	2019-08-20 16:27:20.034029+05:30	\N	\N	f	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N
2	\N	\N	\N	\N	t	t	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	\N
3	2019-08-23 01:12:09.909341+05:30	2019-08-23 01:12:09.909341+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	10	f
4	2019-08-23 01:12:09.954001+05:30	2019-08-23 01:12:09.954001+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	11	f
5	2019-08-23 01:12:20.668523+05:30	2019-08-23 01:12:20.668523+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	12	f
6	2019-08-23 01:12:20.701656+05:30	2019-08-23 01:12:20.701656+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	13	f
7	2019-08-23 01:12:20.724148+05:30	2019-08-23 01:12:20.724148+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	14	f
8	2019-08-23 01:12:20.747307+05:30	2019-08-23 01:12:20.747307+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	15	f
9	2019-08-23 01:13:15.001879+05:30	2019-08-23 01:13:15.001879+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	16	f
10	2019-08-23 01:13:15.02468+05:30	2019-08-23 01:13:15.02468+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	17	f
11	2019-08-23 01:13:15.068226+05:30	2019-08-23 01:13:15.068226+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	18	f
12	2019-08-23 01:13:15.101626+05:30	2019-08-23 01:13:15.101626+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	19	f
13	2019-08-23 01:13:15.135105+05:30	2019-08-23 01:13:15.135105+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	20	f
14	2019-08-23 01:13:15.17969+05:30	2019-08-23 01:13:15.17969+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	21	f
15	2019-08-23 01:13:15.223819+05:30	2019-08-23 01:13:15.223819+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	22	f
16	2019-08-23 01:13:15.267215+05:30	2019-08-23 01:13:15.267215+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	23	f
17	2019-08-23 01:13:15.289513+05:30	2019-08-23 01:13:15.289513+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	24	f
18	2019-08-23 01:13:15.312044+05:30	2019-08-23 01:13:15.312044+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	25	f
19	2019-08-23 01:13:15.33395+05:30	2019-08-23 01:13:15.33395+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	26	f
20	2019-08-23 01:13:15.355924+05:30	2019-08-23 01:13:15.355924+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	27	f
21	2019-08-23 01:13:15.378439+05:30	2019-08-23 01:13:15.378439+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	28	f
22	2019-08-23 01:13:15.400828+05:30	2019-08-23 01:13:15.400828+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	29	f
23	2019-08-23 01:13:15.423326+05:30	2019-08-23 01:13:15.423326+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	30	f
24	2019-08-23 01:13:15.444988+05:30	2019-08-23 01:13:15.444988+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	31	f
25	2019-08-23 01:13:15.467312+05:30	2019-08-23 01:13:15.467312+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	32	f
26	2019-08-23 01:13:15.489199+05:30	2019-08-23 01:13:15.489199+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	33	f
27	2019-08-23 01:13:29.991111+05:30	2019-08-23 01:13:29.991111+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	34	f
28	2019-08-23 01:13:30.013949+05:30	2019-08-23 01:13:30.013949+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	35	f
29	2019-08-23 01:14:02.492711+05:30	2019-08-23 01:14:02.492711+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	36	f
30	2019-08-23 01:14:02.515103+05:30	2019-08-23 01:14:02.515103+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	37	f
31	2019-08-23 01:14:02.537864+05:30	2019-08-23 01:14:02.537864+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	38	f
32	2019-08-23 01:14:02.581548+05:30	2019-08-23 01:14:02.581548+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	39	f
33	2019-08-23 01:14:02.62596+05:30	2019-08-23 01:14:02.62596+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	40	f
34	2019-08-23 01:14:02.647791+05:30	2019-08-23 01:14:02.647791+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	41	f
35	2019-08-23 01:14:16.286486+05:30	2019-08-23 01:14:16.286486+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	42	f
36	2019-08-23 01:14:16.308403+05:30	2019-08-23 01:14:16.308403+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	43	f
37	2019-08-23 19:48:29.984632+05:30	2019-08-23 19:48:29.984632+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	44	f
38	2019-08-23 19:48:30.117116+05:30	2019-08-23 19:48:30.117116+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	45	f
39	2019-08-23 19:48:39.072663+05:30	2019-08-23 19:48:39.072663+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	46	f
40	2019-08-23 19:48:39.09534+05:30	2019-08-23 19:48:39.09534+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	47	f
41	2019-08-23 19:48:39.116654+05:30	2019-08-23 19:48:39.116654+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	48	f
42	2019-08-23 19:48:39.138993+05:30	2019-08-23 19:48:39.138993+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	49	f
43	2019-08-23 19:49:23.865714+05:30	2019-08-23 19:49:23.865714+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	50	f
44	2019-08-23 19:49:23.88772+05:30	2019-08-23 19:49:23.88772+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	51	f
45	2019-08-23 19:49:23.910229+05:30	2019-08-23 19:49:23.910229+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	52	f
46	2019-08-23 19:49:23.932303+05:30	2019-08-23 19:49:23.932303+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	53	f
47	2019-08-23 19:49:23.954481+05:30	2019-08-23 19:49:23.954481+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	54	f
48	2019-08-23 19:49:23.97766+05:30	2019-08-23 19:49:23.97766+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	55	f
49	2019-08-23 19:49:24.032202+05:30	2019-08-23 19:49:24.032202+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	56	f
50	2019-08-23 19:49:24.054105+05:30	2019-08-23 19:49:24.054105+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	57	f
51	2019-08-23 19:49:24.087429+05:30	2019-08-23 19:49:24.087429+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	58	f
52	2019-08-23 19:49:24.109326+05:30	2019-08-23 19:49:24.109326+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	59	f
53	2019-08-23 19:49:24.132236+05:30	2019-08-23 19:49:24.132236+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	60	f
54	2019-08-23 19:49:24.15379+05:30	2019-08-23 19:49:24.15379+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	61	f
55	2019-08-23 19:49:24.175792+05:30	2019-08-23 19:49:24.175792+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	62	f
56	2019-08-23 19:49:24.198219+05:30	2019-08-23 19:49:24.198219+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	63	f
57	2019-08-23 19:49:24.220395+05:30	2019-08-23 19:49:24.220395+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	64	f
58	2019-08-23 19:49:24.242491+05:30	2019-08-23 19:49:24.242491+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	65	f
59	2019-08-23 19:49:24.264338+05:30	2019-08-23 19:49:24.264338+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	66	f
60	2019-08-23 19:49:24.286768+05:30	2019-08-23 19:49:24.286768+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	67	f
61	2019-08-23 19:49:36.321184+05:30	2019-08-23 19:49:36.321184+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	68	f
62	2019-08-23 19:49:36.343533+05:30	2019-08-23 19:49:36.343533+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	69	f
63	2019-08-23 19:50:03.911394+05:30	2019-08-23 19:50:03.911394+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	70	f
64	2019-08-23 19:50:03.932849+05:30	2019-08-23 19:50:03.932849+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	71	f
65	2019-08-23 19:50:03.954935+05:30	2019-08-23 19:50:03.954935+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	72	f
66	2019-08-23 19:50:03.977738+05:30	2019-08-23 19:50:03.977738+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	73	f
67	2019-08-23 19:50:03.999629+05:30	2019-08-23 19:50:03.999629+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	74	f
68	2019-08-23 19:50:04.021971+05:30	2019-08-23 19:50:04.021971+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	75	f
69	2019-08-23 19:50:16.442414+05:30	2019-08-23 19:50:16.442414+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	76	f
70	2019-08-23 19:50:16.464659+05:30	2019-08-23 19:50:16.464659+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	77	f
71	2019-08-23 19:50:28.798088+05:30	2019-08-23 19:50:28.798088+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	78	f
72	2019-08-23 19:50:28.820496+05:30	2019-08-23 19:50:28.820496+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	79	f
73	2019-08-23 19:50:41.564351+05:30	2019-08-23 19:50:41.564351+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	80	f
74	2019-08-23 19:50:41.607646+05:30	2019-08-23 19:50:41.607646+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	81	f
75	2019-08-23 19:51:04.246989+05:30	2019-08-23 19:51:04.246989+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	82	f
76	2019-08-23 19:51:04.269187+05:30	2019-08-23 19:51:04.269187+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	83	f
77	2019-08-23 19:51:04.291513+05:30	2019-08-23 19:51:04.291513+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	84	f
78	2019-08-23 19:51:04.313607+05:30	2019-08-23 19:51:04.313607+05:30	2	2	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	85	f
79	2019-08-23 19:51:24.981816+05:30	2019-08-23 19:51:24.981816+05:30	2	2	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	86	f
80	2019-08-23 19:51:25.003942+05:30	2019-08-23 19:51:25.003942+05:30	2	2	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	87	f
81	2019-08-23 19:51:55.969135+05:30	2019-08-23 19:51:55.969135+05:30	2	2	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	88	f
82	2019-08-23 19:51:55.991802+05:30	2019-08-23 19:51:55.991802+05:30	2	2	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	89	f
83	2019-08-23 19:51:56.013734+05:30	2019-08-23 19:51:56.013734+05:30	2	2	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	90	f
84	2019-08-23 19:51:56.035576+05:30	2019-08-23 19:51:56.035576+05:30	2	2	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	91	f
85	2019-08-23 19:52:16.505853+05:30	2019-08-23 19:52:16.505853+05:30	2	2	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	92	f
86	2019-08-23 19:52:16.52858+05:30	2019-08-23 19:52:16.52858+05:30	2	2	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	93	f
87	2019-08-23 19:52:55.551273+05:30	2019-08-23 19:52:55.551273+05:30	2	2	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	94	f
88	2019-08-23 19:52:55.573876+05:30	2019-08-23 19:52:55.573876+05:30	2	2	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	95	f
89	2019-08-23 19:52:55.595854+05:30	2019-08-23 19:52:55.595854+05:30	2	2	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	96	f
90	2019-08-23 19:52:55.618063+05:30	2019-08-23 19:52:55.618063+05:30	2	2	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	97	f
91	2019-08-23 19:53:36.725375+05:30	2019-08-23 19:53:36.725375+05:30	2	2	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	98	f
92	2019-08-23 19:53:36.746252+05:30	2019-08-23 19:53:36.746252+05:30	2	2	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	99	f
93	2019-08-23 19:53:36.768251+05:30	2019-08-23 19:53:36.768251+05:30	2	2	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	100	f
94	2019-08-23 19:53:36.790284+05:30	2019-08-23 19:53:36.790284+05:30	2	2	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	101	f
95	2019-08-23 19:55:00.759741+05:30	2019-08-23 19:55:00.759741+05:30	2	2	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	102	f
96	2019-08-23 19:55:00.782252+05:30	2019-08-23 19:55:00.782252+05:30	2	2	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	103	f
97	2019-08-23 19:55:00.804356+05:30	2019-08-23 19:55:00.804356+05:30	2	2	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	104	f
98	2019-08-23 19:55:00.826534+05:30	2019-08-23 19:55:00.826534+05:30	2	2	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	105	f
99	2019-08-23 19:55:00.848269+05:30	2019-08-23 19:55:00.848269+05:30	2	2	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	106	f
100	2019-08-23 19:55:00.870879+05:30	2019-08-23 19:55:00.870879+05:30	2	2	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	107	f
101	2019-08-23 19:55:00.89309+05:30	2019-08-23 19:55:00.89309+05:30	2	2	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	108	f
102	2019-08-23 19:55:00.91498+05:30	2019-08-23 19:55:00.91498+05:30	2	2	f	f	f	f	f	f	f	t	f	f	f	f	f	f	f	f	t	t	f	f	f	f	f	t	109	f
\.


--
-- Data for Name: hotel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hotel (id, created_at, updated_at, name, star, rating, phone, city, "desc", category, address, latitude, longitude, collection_id, country) FROM stdin;
1	2019-06-24 18:24:48.950977+05:30	2019-06-24 18:24:48.950977+05:30	leela	3	7	9857832822	delhi	yfkuyfvu	1	hiuho	2	2	\N	\N
2	\N	\N	radison	4	\N	89888998	Delhi	\N	\N	\N	\N	\N	\N	\N
3	2019-06-25 23:49:00.781498+05:30	2019-06-25 23:49:00.781498+05:30	Hotel Adishwar Gold	1	\N	9714472449	Ahmedabad	Nestled in Ahmedabad, a great tourist attraction destination, as there are number of interesting places to see in and around the city, Hotel Ashirvad Gold is affordable property. The hotel is located at an accessible distance from Sardar Vallabhbhai Patel International Airport and Ahmedabad Central Railway Station.\r\n\r\nHotel Ashirvad Gold is a classic hotel standing tall as an oasis of calm in the midst of the bustling city. The guests can spent their day exploring popular tourist destinations like Sardar Patel National Memorial, Kankaria Lake, Sabarmati Ashram, Sidi Sayed Mosque, Sarkhej Roza and many more. Guests can enjoy fun filled shopping experience, shopping at malls located in the vicinity of the hotel. To try regional dishes, guests can visit nearby dining facilities.\r\n\r\nTo ease the stress of travel, hotel offer conveniences like room service, luggage storage, front desk, parking, doctor on call and many more. The property houses simple and sober rooms that offer a homely ambience to guests. All rooms comes with attached bathrooms with essential bathroom facilities and amenities.\r\n\r\nCool off and have a relax stay at Hotel Ashirvad Gold!\r\n	3	4th Floor,Adishwar Gold Complex, Nr. Galaxy Business Park,Opp. Torrent Power	23.0399999999999991	72.6779999999999973	\N	\N
5	2019-06-25 23:52:10.661728+05:30	2019-06-25 23:52:10.661728+05:30	Ryewood Green	2	4.0	02114272755	Lonavala And Khandala	Ryewood Green is located in Lonavala which is usually known for its beautiful valley and green mountains that makes this place naturally beautiful. This place holds many beautiful places like waterfalls, woody meadows and lush green valleys. Ryewood Green is an ideal getaway that offers fine melange of comfort and opulence at an affordable rate. The nearest airport and railway station to the property is Pune Airport and Lonavala Railway Station.\r\n\r\n\r\n\r\nThe property features quite capacious accommodation and offers all necessary facilities like front desk and many more making the stay a memorable one for guests. The rooms of the hotel are a blend of beauty and comfort with exquisite interiors and spacious to move around freely. The cozy ambience and soothing decor of the rooms in the hotel makes it the ideal destination to relax and unwind. Attached bathrooms here are fitted with essential bathroom amenities and toiletries. Guests can also visit nearby restaurants to try out local delights. Many shopping places can be explored by guests located close to the property.\r\n\r\n\r\n\r\nHave a funfilled stay at Ryewood Green!\r\n	3	Plot 4, H-ward, CTS NO 29, Near to Shanti Sadan School, Ryewood  	18.7469999999999999	73.3930000000000007	\N	\N
7	2019-06-25 23:53:32.774977+05:30	2019-06-25 23:53:32.774977+05:30	Kabir Residency	1	\N	9714980067	Ahmedabad	&nbsp;1st Floor, New Anand Shopping Centre, Airport Road, Sardar Nagar, Hansol, Ahmedabad, Gujarat 382475Ahmedabad&nbsp;&nbsp;is the largest city and former capital ofGujarat, which is a state in&nbsp;India. It is the administrative headquarters of the&nbsp;Ahmedabad district&nbsp;and the seat of the&nbsp;Gujarat High Court. With a population of more than 6.3 million and an extended population of 7.8 million, it is the&nbsp;sixth largest city&nbsp;and&nbsp;seventh largest metropolitan area&nbsp;of India. Ahmedabad is located on the banks of the&nbsp;Sabarmati River, 30&nbsp;km (19&nbsp;mi) from the state capital&nbsp;Gandhinagar, which is its twin city.Ahmedabad has emerged as an important economic and industrial hub in India. It is the second largest producer of&nbsp;cotton&nbsp;in India, and&nbsp;its stock exchange&nbsp;is the country&#39;s second oldest.&nbsp;Cricket&nbsp;is a popular sport in Ahmedabad, which houses the 54,000-seat&nbsp;Sardar Patel Stadium. The effects of&nbsp;liberalisation of the Indian economy&nbsp;have energised the city&#39;s economy towards&nbsp;tertiary sector&nbsp;activities such as commerce, communication and construction.Ahmedabad&#39;s increasing population has resulted in an increase in the construction and housing industries resulting in recent development of skyscrapers.	3	Kabir residency new ananad shopping center first flore hansol air port road sardar nagar ahemdabad	23.0853730000000006	72.6225000000000023	\N	\N
8	2019-06-25 23:57:04.000197+05:30	2019-06-25 23:57:04.000197+05:30	Hotel Surbhi Guest House	1	\N	91-9727656208	Ahmedabad	Shantipura Circle, Sarkhej-sanand Road, Shantipura, Ahmedabad, Gujarat 382210	3	Shantipura Circle, Sarkhej-sanand Road, Shantipura, Ahmedabad, Gujarat 382210	22.9881799999999998	72.47072	\N	\N
9	2019-06-25 23:57:04.896226+05:30	2019-06-25 23:57:04.896226+05:30	Swiss Wood Hotel	3	\N	9418059826	Manali	Swiss Wood Hotel, a 3 star property, is an ideal blend of comfort and the right ambiance for the guests to unwind. The hotel's strategic location and signature hospitality make it an ideal stay option for business and leisure guests.\r\n\r\nThe array of essential services rendered by the hotel includes Wi-Fi, parking and swimming pool. The management also provide doctor on call facility to guests in case of emergency services.\r\n\r\nFor ensuring utmost comfort of guests, hotel offers a good selection of in-room amenities like cable television, iron/ironing board and telephone. The private bathrooms are equipped with shower area and hot/ cold running water. A wide selection of local dishes can be enjoyed at the hotel on site restaurant.\r\n\r\nLocal attractions close to hotel are Hidimba Devi Temple, Solang Valley, Rohtang pass and Sultanpur palace. Manali bius station is just 2 km away from hotel and Airport is 49.9 km.\r\n\r\nMake your visit pleasant and unforgettable by making a choice to stay at Swiss Wood Hotel.\r\n	3	Aleo,manali, Nagar Road, New Manali	32.2287400000000019	77.1962599999999952	\N	\N
10	2019-06-25 23:57:07.446045+05:30	2019-06-25 23:57:07.446045+05:30	Hotel Monarch Residency	0	\N	9785555005	Manali	Hotel Monarch Residency is located in a hill station which is surrounded by high peaks in the beautiful green valley of the beas river, Manali. The nearest airport is the Bhuntar Airport and the closest rail-head is the Jogindernagar Railway Station which makes it convenient for the visitors to commute. Hotel offers a wide variety of modern facilities like laundry services, Wi-Fi access, gym, 24 hour front desk, conference hall for corporate meetings and seminars and banquet hall for wedding and engagement parties, birthday and kitty parties and other social events. The hotel has restaurant where guests can enjoy lip-smacking and delectable dishes. The property has fully furnished and well equipped rooms with amenities like television, telephone, tea/coffee maker, room heater and mini bar. Each room has attached bathroom with regular supply of hot and cold water. Room service is provided round the clock for a relaxing and comfortable stay. Popular places to visit in Manali are Van Vihar (1 km), Siyali Mahadev Temple (2 km), Hidimba Devi Temple (3 km), Jogini Waterfall (3 km), Solang Valley (12 km), Bhrigu Lake (17 km), Beas Kund (21 km), Naggar Castle (23 km) and many more. Have an unforgettable stay at Hotel Monarch Residency!\r\n	3	Near Bias Bridge (Aleo) New Manali Nagar Road, MANALI (HP).\r\nManali, India	32.2399860000000018	77.1928900000000056	\N	\N
11	2019-06-25 23:57:11.556048+05:30	2019-06-25 23:57:11.556048+05:30	Apna Cottage	0	\N	9418266546	Manali	Apna Cottage is a pretty and cozy stay home in the beautiful city of Manali. It offers you spectacular views of the Himalayas. They have tastefully designed the rooms having wooden dcor giving a sophisticated feel to it. The rooms contain all the essential amenities. They have a dining hall for you to come eat at and a terrace with access to the guests as well. In such quiet and serene surroundings, they offer a variety of activities for you to keep busy with, like, indoor games, trekking, barbeque and bonfire night. This welcoming place gives you all the comforts of a home in an unknown place. It truly is a home away from home.\r\n	3	Kanyal Road, Kanyal, Himachal Pradesh, Manali, Holiday Heights, 175131	32.2251740000000026	77.1822700000000026	\N	\N
12	2019-06-25 23:57:15.796866+05:30	2019-06-25 23:57:15.796866+05:30	Hotel Park Paradise	3	\N	9816900922	Manali	The hotel offers accommodation in well-furnished and spacious rooms equipped with amenities like television, telephone etc. Facilities available at hotel Park Paradise include travel desk, parking facility, and doctor on call (on request). Hotel Park Paradise is easily accessible from airport and railway station. Hotel Facilities Lawns/Gardens, Restaurant, Travel Desk, Parking Facility, Doctor on Call (on request) Chargeable Facilities: Laundry Service, Taxi Service, Airport/Railway Station Transfer, Guide Service, Sightseeing, Bonfire Room Amenities  Television, Intercom Facility, Mineral Water (chargeable), Daily Newspaper (on request), Room Heater (chargeable), Shower Area, Geyser in Bathroom, Hot/Cold Water, Bathroom Toiletries The hotel has 24 rooms with room service available from 7 AM to 10 PM. Internet: Not Available Parking Facility: Available Check-in Time: 12:00 Noon Check-out Time: 12:00 Noon\r\n	3	Naggar Road, Aleo, New Manali	32.2281070000000014	77.1965799999999973	\N	\N
13	2019-06-25 23:57:21.497498+05:30	2019-06-25 23:57:21.497498+05:30	Hotel Valley View	2	\N	\N	Manali	Hotel Valley View is located just below the beautiful and mighty hills of Vashist. The hotel is placed on the green landscape and mist tall deodar,apple orchad and pine trees that lush clean, fresh and cool air. The silent atmosphere makes you relax while enjoying the nature blessed valley.Hotel Valley View is Just 3 km far from Manali bus stand and 50 km far from Bhunter airport.Hotel Valley View caters to every needs of the guests. The rooms are furnished with wooden flooring, airy, with attach balcony facing the valley or the mountains. Every room has room service, color television, laundry service etc. The restaurant serves tasty and healthy Indian, Continental and Chinese cuisines.Situated in Manali, an ancient town located near the end of the Kullu valley on the National Highway leading to Leh, The Valley View Resort is in and around famous tourist places like Hadimba Devi Mandir, Jogini waterfall, Manikaran Gurudwara, Museum of Himachal Culture &amp; Folk Art, Solang Valley and many more.The Bhuntar Airpor is at Bhuntar town, situated on NH21, Jogindernagar railway station is the nearest railhead to Manali, the Himachal Pradesh state bus service is ace and one can get frequent buses from the region to different parts of the country at reasonable cost. Guest can avail such transportation while their stay at The Valley View Resort.The hotel offers facilities like activity centre, laundry service, parking facility. In case of medical emergency guest can request for doctor on call facility.The hotel offers room and house keeping service. The hotel houses spacious and comfortable rooms which comes with amenities like television, telephone, bathroom toiletries, hot and cold water.Experience the scenic beauty and calm environment at The Valley View Resort.	3	Near Hot Springs Vashisht, Manali District Kullu, Himachal pradesh 175131	32.264164000000001	77.1874899999999968	\N	\N
14	2019-08-23 01:11:09.353149+05:30	2019-08-23 01:11:09.353149+05:30	Ryewood Green	2	4.0	02114272755	Lonavala And Khandala	Ryewood Green is located in Lonavala which is usually known for its beautiful valley and green mountains that makes this place naturally beautiful. This place holds many beautiful places like waterfalls, woody meadows and lush green valleys. Ryewood Green is an ideal getaway that offers fine melange of comfort and opulence at an affordable rate. The nearest airport and railway station to the property is Pune Airport and Lonavala Railway Station.\r\n\r\n\r\n\r\nThe property features quite capacious accommodation and offers all necessary facilities like front desk and many more making the stay a memorable one for guests. The rooms of the hotel are a blend of beauty and comfort with exquisite interiors and spacious to move around freely. The cozy ambience and soothing decor of the rooms in the hotel makes it the ideal destination to relax and unwind. Attached bathrooms here are fitted with essential bathroom amenities and toiletries. Guests can also visit nearby restaurants to try out local delights. Many shopping places can be explored by guests located close to the property.\r\n\r\n\r\n\r\nHave a funfilled stay at Ryewood Green!\r\n	3	Plot 4, H-ward, CTS NO 29, Near to Shanti Sadan School, Ryewood  	18.7469999999999999	73.3930000000000007	\N	India
15	2019-08-23 01:11:18.600525+05:30	2019-08-23 01:11:18.600525+05:30	Greenland Delsol Resort.	3	5.0	9765712735	Lonavala And Khandala	Set in the breathtaking hilly surroundings of Lonavala, Hotel Greenland Desol is about an hours drive from Pune railway station and the airport. The property is located close to Jain Temple, off New Mumbai-Pune Express Highway. For recreation of guests, the hotel has an outdoor swimming pool and games room that is provided with carom board.. Organise business events, conference and informal gatherings at the multi-purpose venues of the hotel. Facilities likelaundry,free parking and Wi-Fi access further add to the convenience.\r\n\r\nGuests can choose from 24 air-conditioned roomsthat feature contemporary decor and furnishings. All guestrooms have attached baths provided with granite countertop,toiletries and round-the-clock supply of hot/cold water. Cable TVand telephone are some of the common in-room amenities.\r\n\r\nThe on-site multi-cuisine restaurant serves buffet breakfas.Guests can also enjoy authentic Indian andChinesedishes here. In-room dining facility is also offered through room service.\r\n\r\nDo not miss to explore the beauty of serene Lonavala Lake, which is just a 10 minute drive from here!\r\n	3	Gold Valley Road off new express highway near swapnalok society near Jain temple Tungarli	18.7702619999999989	73.3978000000000037	\N	India
16	2019-08-23 01:12:09.528269+05:30	2019-08-23 01:12:09.528269+05:30	Ryewood Green	2	4.0	02114272755	Lonavala And Khandala	Ryewood Green is located in Lonavala which is usually known for its beautiful valley and green mountains that makes this place naturally beautiful. This place holds many beautiful places like waterfalls, woody meadows and lush green valleys. Ryewood Green is an ideal getaway that offers fine melange of comfort and opulence at an affordable rate. The nearest airport and railway station to the property is Pune Airport and Lonavala Railway Station.\r\n\r\n\r\n\r\nThe property features quite capacious accommodation and offers all necessary facilities like front desk and many more making the stay a memorable one for guests. The rooms of the hotel are a blend of beauty and comfort with exquisite interiors and spacious to move around freely. The cozy ambience and soothing decor of the rooms in the hotel makes it the ideal destination to relax and unwind. Attached bathrooms here are fitted with essential bathroom amenities and toiletries. Guests can also visit nearby restaurants to try out local delights. Many shopping places can be explored by guests located close to the property.\r\n\r\n\r\n\r\nHave a funfilled stay at Ryewood Green!\r\n	3	Plot 4, H-ward, CTS NO 29, Near to Shanti Sadan School, Ryewood  	18.7469999999999999	73.3930000000000007	\N	India
17	2019-08-23 01:12:19.763047+05:30	2019-08-23 01:12:19.763047+05:30	Greenland Delsol Resort.	3	5.0	9765712735	Lonavala And Khandala	Set in the breathtaking hilly surroundings of Lonavala, Hotel Greenland Desol is about an hours drive from Pune railway station and the airport. The property is located close to Jain Temple, off New Mumbai-Pune Express Highway. For recreation of guests, the hotel has an outdoor swimming pool and games room that is provided with carom board.. Organise business events, conference and informal gatherings at the multi-purpose venues of the hotel. Facilities likelaundry,free parking and Wi-Fi access further add to the convenience.\r\n\r\nGuests can choose from 24 air-conditioned roomsthat feature contemporary decor and furnishings. All guestrooms have attached baths provided with granite countertop,toiletries and round-the-clock supply of hot/cold water. Cable TVand telephone are some of the common in-room amenities.\r\n\r\nThe on-site multi-cuisine restaurant serves buffet breakfas.Guests can also enjoy authentic Indian andChinesedishes here. In-room dining facility is also offered through room service.\r\n\r\nDo not miss to explore the beauty of serene Lonavala Lake, which is just a 10 minute drive from here!\r\n	3	Gold Valley Road off new express highway near swapnalok society near Jain temple Tungarli	18.7702619999999989	73.3978000000000037	\N	India
18	2019-08-23 01:13:13.982233+05:30	2019-08-23 01:13:13.982233+05:30	Sai Moreshwar Resort- New Management	3	4.0	9594044000	Lonavala And Khandala	Sai Moreshwar Resort is situated near Tata Guest House on Mumbai-Pune Highway in Lonavala. It is a beautiful 3 star resort with 39 rooms offering comfortable accommodation with modern amenities. The rooms are available with and without air-conditioners.\r\n\r\nThe hotel offers all the standard facilities which will make your holidays pleasant. Some of them include running hot water facility, television and intercom in every room.\r\n\r\nApart from above facilities, Sai Moreshwar Resort offers delicious multi cuisine fare at Sai Maurya Restaurant.\r\n\r\nThe hotel also features conference facilities to its guest with the help of its 2 new conference halls. The fully equipped halls can be easily joined to accommodate larger groups and audiences. There is also Wi-Fi connectivity in the common area only. Extra mattress will be provided for extra Adult and child instead of extra bed\r\n	3	Mumbai Pune Highway, Next to TATA Guest House	18.7589189999999988	73.392470000000003	\N	India
19	2019-08-23 01:13:29.364816+05:30	2019-08-23 01:13:29.364816+05:30	Honeybee Resorts	3	\N	8080048080	Lonavala And Khandala	The Honeybee Resort is situated in beautiful hill station, Lonavala And Khandala. The property is at a distance of 71 km from Pune Airport, Lonavala railway station is 2.3 km and MST Bus Stand is 1.8 km away.\r\n\r\nThe property has an advantage as it enjoys propinquity to various famous excursions of the region such as Tungarli Lake(1.3 km), Karla Caves(12 km), Tiger Point(12.8 km), Lohgarh Fort(13.8 km), Bhaja Caves(17.1 km) and many more notable spots which guests can visit during their stay.\r\n\r\nThe resort offers services that are designed to offer maximum comfort to its guests. Some of the services offered here are swimming pool, parking, power backup, front desk, room service, doctor on call and laundry. The property also has lush green garden where guests can spend time with their loved ones. The conference facility available at the resort is an ideal place for arranging meetings and conferences. Featuring capacious and spotlessly clean rooms equipped with modern amenities like television, telephone, hot/cold water, attached bathroom and various other essential bathroom toiletries.\r\n\r\nThe Honeybee Resort is an oasis of peace and tranquillity!\r\n	3	Plot No.20, Near Gurukul School, Tungarli Dam Road, Lonavala.	18.766172000000001	73.4081649999999968	\N	India
20	2019-08-23 01:14:01.70698+05:30	2019-08-23 01:14:01.70698+05:30	Rishikesh Resorts	0	\N	9422510540	Lonavala And Khandala	2.7 km from Lonavala Railway Station, Rishikesh Resort has a restaurant, coffee shop, banquet hall and Wi-Fi internet (surcharge).\r\n\r\nRishikesh Resort is a budget accommodation located on the Mumbai-Pune Highway. The resort offers 19 Super Deluxe rooms that are featured with modern amenities like Wi-Fi internet connectivity (surcharge) and en suite bathroom. Some attractions that guests can visit during their stay at the resort are Valvan Village Pond, Tungarli Village Park and Valvan Dam.\r\n\r\nIdeal for both business and leisure travellers, the resort offers facilities like conference hall, parking, currency exchange, doctor-on-call, banquet, laundry and airport transportation. It also has special facilities for physically challenged guests. There is an arcade or games room within the premises for recreation purpose.\r\n\r\nThe resort has a restaurant that prepares a wide range of dishes for guests. In addition, it also has a coffee shop, where guests can hangout and relish coffee, tea and light snacks.\r\n\r\nPlan a picnic at the Valvan Dam located near the resort for a fun-filled experience.\r\n	3	B Ward C S No 161  old Mumbai pune road lonavlala	18.7552529999999997	73.4009700000000009	\N	India
21	2019-08-23 01:14:16.15395+05:30	2019-08-23 01:14:16.15395+05:30	Hotel Fun N Food	0	\N	9638121314	Lonavala And Khandala		3	Mumbai Pune Road, NAKHATRANA Hilltop Colony Khandala, Maharashtra - 410301	18.7589040000000011	73.3711299999999937	\N	India
22	2019-08-23 19:48:29.074755+05:30	2019-08-23 19:48:29.074755+05:30	Ryewood Green	2	4.0	02114272755	Lonavala And Khandala	Ryewood Green is located in Lonavala which is usually known for its beautiful valley and green mountains that makes this place naturally beautiful. This place holds many beautiful places like waterfalls, woody meadows and lush green valleys. Ryewood Green is an ideal getaway that offers fine melange of comfort and opulence at an affordable rate. The nearest airport and railway station to the property is Pune Airport and Lonavala Railway Station.\r\n\r\n\r\n\r\nThe property features quite capacious accommodation and offers all necessary facilities like front desk and many more making the stay a memorable one for guests. The rooms of the hotel are a blend of beauty and comfort with exquisite interiors and spacious to move around freely. The cozy ambience and soothing decor of the rooms in the hotel makes it the ideal destination to relax and unwind. Attached bathrooms here are fitted with essential bathroom amenities and toiletries. Guests can also visit nearby restaurants to try out local delights. Many shopping places can be explored by guests located close to the property.\r\n\r\n\r\n\r\nHave a funfilled stay at Ryewood Green!\r\n	3	Plot 4, H-ward, CTS NO 29, Near to Shanti Sadan School, Ryewood  	18.7469999999999999	73.3930000000000007	\N	India
23	2019-08-23 19:48:38.32819+05:30	2019-08-23 19:48:38.32819+05:30	Greenland Delsol Resort.	3	5.0	9765712735	Lonavala And Khandala	Set in the breathtaking hilly surroundings of Lonavala, Hotel Greenland Desol is about an hours drive from Pune railway station and the airport. The property is located close to Jain Temple, off New Mumbai-Pune Express Highway. For recreation of guests, the hotel has an outdoor swimming pool and games room that is provided with carom board.. Organise business events, conference and informal gatherings at the multi-purpose venues of the hotel. Facilities likelaundry,free parking and Wi-Fi access further add to the convenience.\r\n\r\nGuests can choose from 24 air-conditioned roomsthat feature contemporary decor and furnishings. All guestrooms have attached baths provided with granite countertop,toiletries and round-the-clock supply of hot/cold water. Cable TVand telephone are some of the common in-room amenities.\r\n\r\nThe on-site multi-cuisine restaurant serves buffet breakfas.Guests can also enjoy authentic Indian andChinesedishes here. In-room dining facility is also offered through room service.\r\n\r\nDo not miss to explore the beauty of serene Lonavala Lake, which is just a 10 minute drive from here!\r\n	3	Gold Valley Road off new express highway near swapnalok society near Jain temple Tungarli	18.7702619999999989	73.3978000000000037	\N	India
24	2019-08-23 19:49:23.042522+05:30	2019-08-23 19:49:23.042522+05:30	Sai Moreshwar Resort- New Management	3	4.0	9594044000	Lonavala And Khandala	Sai Moreshwar Resort is situated near Tata Guest House on Mumbai-Pune Highway in Lonavala. It is a beautiful 3 star resort with 39 rooms offering comfortable accommodation with modern amenities. The rooms are available with and without air-conditioners.\r\n\r\nThe hotel offers all the standard facilities which will make your holidays pleasant. Some of them include running hot water facility, television and intercom in every room.\r\n\r\nApart from above facilities, Sai Moreshwar Resort offers delicious multi cuisine fare at Sai Maurya Restaurant.\r\n\r\nThe hotel also features conference facilities to its guest with the help of its 2 new conference halls. The fully equipped halls can be easily joined to accommodate larger groups and audiences. There is also Wi-Fi connectivity in the common area only. Extra mattress will be provided for extra Adult and child instead of extra bed\r\n	3	Mumbai Pune Highway, Next to TATA Guest House	18.7589189999999988	73.392470000000003	\N	India
25	2019-08-23 19:49:35.649012+05:30	2019-08-23 19:49:35.649012+05:30	Honeybee Resorts	3	\N	8080048080	Lonavala And Khandala	The Honeybee Resort is situated in beautiful hill station, Lonavala And Khandala. The property is at a distance of 71 km from Pune Airport, Lonavala railway station is 2.3 km and MST Bus Stand is 1.8 km away.\r\n\r\nThe property has an advantage as it enjoys propinquity to various famous excursions of the region such as Tungarli Lake(1.3 km), Karla Caves(12 km), Tiger Point(12.8 km), Lohgarh Fort(13.8 km), Bhaja Caves(17.1 km) and many more notable spots which guests can visit during their stay.\r\n\r\nThe resort offers services that are designed to offer maximum comfort to its guests. Some of the services offered here are swimming pool, parking, power backup, front desk, room service, doctor on call and laundry. The property also has lush green garden where guests can spend time with their loved ones. The conference facility available at the resort is an ideal place for arranging meetings and conferences. Featuring capacious and spotlessly clean rooms equipped with modern amenities like television, telephone, hot/cold water, attached bathroom and various other essential bathroom toiletries.\r\n\r\nThe Honeybee Resort is an oasis of peace and tranquillity!\r\n	3	Plot No.20, Near Gurukul School, Tungarli Dam Road, Lonavala.	18.766172000000001	73.4081649999999968	\N	India
26	2019-08-23 19:50:03.210028+05:30	2019-08-23 19:50:03.210028+05:30	Rishikesh Resorts	0	\N	9422510540	Lonavala And Khandala	2.7 km from Lonavala Railway Station, Rishikesh Resort has a restaurant, coffee shop, banquet hall and Wi-Fi internet (surcharge).\r\n\r\nRishikesh Resort is a budget accommodation located on the Mumbai-Pune Highway. The resort offers 19 Super Deluxe rooms that are featured with modern amenities like Wi-Fi internet connectivity (surcharge) and en suite bathroom. Some attractions that guests can visit during their stay at the resort are Valvan Village Pond, Tungarli Village Park and Valvan Dam.\r\n\r\nIdeal for both business and leisure travellers, the resort offers facilities like conference hall, parking, currency exchange, doctor-on-call, banquet, laundry and airport transportation. It also has special facilities for physically challenged guests. There is an arcade or games room within the premises for recreation purpose.\r\n\r\nThe resort has a restaurant that prepares a wide range of dishes for guests. In addition, it also has a coffee shop, where guests can hangout and relish coffee, tea and light snacks.\r\n\r\nPlan a picnic at the Valvan Dam located near the resort for a fun-filled experience.\r\n	3	B Ward C S No 161  old Mumbai pune road lonavlala	18.7552529999999997	73.4009700000000009	\N	India
27	2019-08-23 19:50:16.358705+05:30	2019-08-23 19:50:16.358705+05:30	Hotel Fun N Food	0	\N	9638121314	Lonavala And Khandala		3	Mumbai Pune Road, NAKHATRANA Hilltop Colony Khandala, Maharashtra - 410301	18.7589040000000011	73.3711299999999937	\N	India
28	2019-08-23 19:50:28.688059+05:30	2019-08-23 19:50:28.688059+05:30	Kohinoor Exotica	0	\N	9371744436	Lonavala And Khandala		3	Tungarli - Maval,\r\nLonavala	18.7584599999999995	73.4089050000000043	\N	India
29	2019-08-23 19:50:41.476415+05:30	2019-08-23 19:50:41.476415+05:30	Villa 9	0	\N	9764465635	Lonavala And Khandala	Villa Nine serves as a perfect holiday home, where you can not only relax and unwind, but spend some quality time with your loved ones.\r\n\r\nGuests can challenge each other for a game of badminton, a cricket or football match, or throw a frisbee around. The choices are endless.\r\nAn ideal Getaway for families, young professionals, college students, women groups and your extended family members that is your pets! We welcome you to villa 9, not just a holiday home but an experience.\r\n\r\nServing as an ideal getaway for families, professionals, friends, or mix-matched groups. Feel free to bring your four-legged friends along too!\r\n	3	9, Sun Montana, Tungarli, Lonavala, Near Lagoona Resort.	18.771097000000001	73.4063199999999938	\N	India
30	2019-08-23 19:51:03.940612+05:30	2019-08-23 19:51:03.940612+05:30	Amey House 	1	\N	91-9049464479	Lonavala And Khandala	Location: Amey House is situated in most beautiful and charming twin hill stations, Lonavala And Khandala. The nearest airport is the Lohegaon Airport and the closest railway station is the Lonavala Railway Station making it convenient for the visitors to commute.&nbsp;Room Amenities: The property has well furnished and equipped rooms with all the basic necessities for a comfortable stay. Each room has attached bathroom with regular supply of hot and cold water.&nbsp;Hotel Facilities: The bungalow has all the required facilities for a relaxing and memorable stay. &nbsp;	3	patan road malavli tal. maval	18.739725	73.489760000000004	\N	India
31	2019-08-23 19:51:24.400426+05:30	2019-08-23 19:51:24.400426+05:30	Bhairavgarh By Zennia Hotels ( A Unit Indian Heritage Hotels & Resorts)	4	4.0	7073612345	Udaipur	Nestled in the historic city, Udaipur. Hotel Bhairavgarh Palace is located at a distance of 22.7 km from the Maharana Pratap Airport, 7.4 km from the Udaipur Main Railway Station and 5 km from the Bus Stand Chitrakot Nagar.\r\n\r\nPopular tourist attractions like Saheliyon Ki Bari(6.8 km), City Palace(9.6 km), Jagadish Temple(9.9 km), Lake Pichola(12.5 km), Shiv Niwas Palace(13 km) and many others are situated within close proximity to the hotel.\r\n\r\nAmidst the most beautiful landscapes and luxurious interiors, the hotel features various modern facilities suchlike swimming pool, power backup, Wi-Fi internet access, doctor on call, concierge service, play area, front desk, car rental, area shuttle, laundry service, parking and airport/railway station transfer(chargeable).\r\n\r\nAccommodation at the hotel is available in well-appointed rooms offering an imperial class and modern comfort with in-room amenities such as LCD television, tea/coffee maker, mini bar, writing desk, safe deposit box, telephone and attached bathrooms with hot/cold water and essential toiletries.\r\n\r\nYour taste buds will travel the world at this bright and inviting multi-cuisine in-house restaurant with its eclectic Indian and international menu with impeccable service. While our specialized team of chefs makes every effort to appease your taste buds. Besides, The property features a stylish rooftop restaurant that serves tempting array of scrumptious barbeque delights. Moreover, guests can also relish evening drinks and spend some quality time with family and friends at the onsite bar, which is stocked with choicest spirits.\r\n\r\nThose on business tour can host meetings, conferences and seminars as it features well-equipped conference hall making it a perfect base for business travellers. Additionally, perfect arrangement for social gatherings can be made at banquet halls.\r\n\r\nExperience a grand stay and a warm hospitality at Hotel Bhairavgarh Palace!\r\n	3	Maharana Pratap Khel Gaon, 200 ft road, Chitrakoot Nagar, Bhuwana	24.6341059999999992	73.7266539999999964	\N	India
32	2019-08-23 19:51:55.220872+05:30	2019-08-23 19:51:55.220872+05:30	Times Fateh Vilas Hotel and Resort-Pure Veg	3	2.0	8141871000	Udaipur	Times Fateh Vilas Hotel & Resort is situated 5 km from Jagdish temple. All rooms feature a kitchen and a private bathroom. Free WiFi is available. At the resort, all rooms are fitted with a desk and a TV. The rooms include a seating area. A buffet breakfast is served every morning at the property. Staff at the 24-hour front desk can provide tips on the area. Bagore ki Haveli is 5 km from Times Fateh Vilas Hotel & Resort. Maharana Pratap Airport is 27 km away.\r\n	3	Opp St Mathews School Near Church, Rani Rd, Main Udaipu City	24.5925389999999986	73.6638300000000044	\N	India
33	2019-08-23 19:52:15.814225+05:30	2019-08-23 19:52:15.814225+05:30	NARAYANS LEELA INN	3	5.0	02942413646	Udaipur	A boutique hotel, Narayans Leela Inn is located at a distance of 22 km from Maharana Pratap Airport, 1.7 km from Railway Station and 700 Meter from Bus Station of Udaipur. For a convenient and trouble-free stay, the hotel offers facilities such as travel desk, laundry, doctor on call and outdoor parking space.\r\n\r\nA luxury hotel features clean, comfortable and aesthetically designed rooms equipped with modern conveniences. In-room amenities include air-conditioner, Wi-Fi connectivity, music chennels, mirror and daily newspaper. Attached bathroom comes with hot/cold water and bathroom toiletries.\r\n\r\nThe property is in close proximity to City Palace (1.2 km), Gulab Bagh (200 Meter), Lake Pichola (1.6 KMS) Saheliyon ki Badi (3.5 km), Sajjangarh Fort (9.3 km) and Lake fateh sagar (3.5 kms). It offers pure vegetarian India Food. Terrace of the hotel has a scenic view of Udaipur City Palace.\r\n\r\nHotel Narayans Leela Inn is an ultimate hotel in Udaipur for both business and leisure travelers!\r\n	3	33 Jal Darshan Market, RMV Road Gulab Bagh, 	24.5770000000000017	73.6940000000000026	\N	India
34	2019-08-23 19:52:54.511909+05:30	2019-08-23 19:52:54.511909+05:30	Hotel Janak Niwas - Udaipur	2	\N	9950770671	Udaipur	Location: Nestled in the lake city that possess a splendid style in recreation and entertainment, Udaipur, Hotel Janak Niwas commemorates the lively spirit of city through its traditional Rajasthani architecture and stately interiors. The Udaipur Railway Station and Udaipur City Bus Station is 3 km away from the property. One can visit various tourist attractions like Jagadish Temple(240 m), City Palace(1 km), Lake Pichola(2 km), Fateh Sagar Lake(3 km) and many more in their leisure time. The hotel is at an accessible distance from the Udaipur Airport.\r\n\r\n\r\n\r\nRoom Amenities: The rooms offers harmonious blend of elegance, luxury and offer exclusivity with timeless style and grace. They are replete with essential room amenities like television, restful beds, clean linen, table, chairs and attached bathrooms equipped with essential toiletries along with hot/cold water supply.\r\n\r\n\r\n\r\nHotel Facilities: For a relaxed and comfortable stay, the hotel features facilities like front desk, parking, laundry, car rental, Wi-Fi, travel/tour desk, currency exchange and room service. For immediate care of guests, doctor on call facility is also available. An epitome of warm hospitality, efficient and polite staff of the hotel makes guests feel at home. Last but not the least, hotel also features recreational activities like ayurvedic massage, boat riding, cooking classes, heritage city walk on guests request.\r\n\r\n\r\n\r\nDining: The hotel features roof top bistro with spectacular views of the old city and also one of the oldest mountain area of the world "Aravali Parvat Mala", offering variety of multi cuisine and authentic flavors of Rajasthan. Dinning in this terrace restaurant captures guest's mood and takes them in a special journey.\r\n	3	15 Sahiwalo ki gali, Bhattiyani Chotta, Udaipur, Rajasthan 313001	24.5784720000000014	73.6847149999999971	\N	India
35	2019-08-23 19:53:36.410274+05:30	2019-08-23 19:53:36.410274+05:30	Mewar Inn	1	3.0	9680884370	Udaipur	Hotel Mewar Inn is a standard accommodation option, located near Pichola Lake in the city of Udaipur. To make the sojourn pleasant for guests, a range of conveniences are offered here. There is a fully equipped business centre and an internet cafe in the hotel premises. Ayurvedic massage, travel desk, parking (off-road), car rental, money exchange, laundry and doctor-on-call services are some other facilities that guests can avail during their stay at the hotel\r\n\r\nHere, accommodation is offered in 20 well-furnished and spacious rooms. All these air-conditioned rooms are fitted with basic amenities like satellite TV, and direct dial telephone; however only selected rooms have work desk. Clean attached bath with quality toiletries, shower facility and adequate water supply is common in every room.\r\n\r\nOsho is the a la carte restaurant set on the roof of the hotel. To tantalise the taste buds, a fine selection of Indian, Chinese, Continental, Italian and French delicacies are served here. It is a semi-al fresco style restaurant, where guests can relish delicious food while enjoying spectacular views of the hotels environs.\r\n\r\nJagdish Mandir and Fateh Sagar Lake are two of the prominent city attractions that are reachable within a 10-minute drive of the hotel.\r\n	3	42, Residency Road, Opp. GBH American Hospital,\r\nUdaipur 	24.5937629999999992	73.6973339999999979	\N	India
36	2019-08-23 19:55:00.534789+05:30	2019-08-23 19:55:00.534789+05:30	Kaveri palace	2	\N	7877740909	Udaipur	Kaveri Palace, Udaipur is synonymous to the comfortable accommodation service and enjoyable stay. The hotel is located 21.6 km from Maharana Pratap Airport, 1.5 km from Railway Station and 0.5 km from Bus Stand. The prominent tourist places of the city where guests can visit are Lake Palace (500 m), Gulab Bagh (500 m), Lake Pichola (1 km), City Palace (2.3 km), Saheliyon-ki-Bari (3.5 km), Sukhadia Circle (3.7 km), Fateh Sagar Lake (4.4 km) and many more. Kaveri Palace features elegant and neat rooms equipped with modern amenities such as air-conditioning, cable television, intercom, mineral water, iron and ironing board, study table, daily newspaper, shower area, geyser, hot/cold water and bathroom with necessary toiletries. Ample conveniences are offered at the hotel to suffice the varying requirements of guests. These includes doctor on call, travel desk, parking, laundry service and taxi service. Backed by a team of skilled professionals, the property ensures that all needs of guests are fulfilled timely. Experience a grand stay and a warm hospitality at Kaveri Palace!	3	 Opposite SBBJ Bank, Surajpole, Udaipur, Rajasthan 313001	24.5783500000000004	73.6962199999999967	\N	India
\.


--
-- Data for Name: hotel_collection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hotel_collection (id, created_at, updated_at, collection_name, featured, "desc", image) FROM stdin;
\.


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.image (id, created_at, updated_at, hotel_id, image_url) FROM stdin;
1	2019-06-25 23:52:10.702217+05:30	2019-06-25 23:52:10.702217+05:30	5	r1imghtlak.mmtcdn.com/3365218a6f2711e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
2	2019-06-25 23:52:10.723655+05:30	2019-06-25 23:52:10.723655+05:30	5	r1imghtlak.mmtcdn.com/43a20b306f2711e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
3	2019-06-25 23:52:10.735959+05:30	2019-06-25 23:52:10.735959+05:30	5	r1imghtlak.mmtcdn.com/496071386f2711e798fc0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
4	2019-06-25 23:52:10.757353+05:30	2019-06-25 23:52:10.757353+05:30	5	r1imghtlak.mmtcdn.com/605daab86f2711e7886e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
5	2019-06-25 23:52:10.768632+05:30	2019-06-25 23:52:10.768632+05:30	5	r1imghtlak.mmtcdn.com/3365218a6f2711e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
6	2019-06-25 23:52:10.779446+05:30	2019-06-25 23:52:10.779446+05:30	5	r1imghtlak.mmtcdn.com/43a20b306f2711e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
7	2019-06-25 23:52:10.790843+05:30	2019-06-25 23:52:10.790843+05:30	5	r1imghtlak.mmtcdn.com/496071386f2711e798fc0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
8	2019-06-25 23:52:10.801638+05:30	2019-06-25 23:52:10.801638+05:30	5	r1imghtlak.mmtcdn.com/605daab86f2711e7886e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
9	2019-06-25 23:52:10.812717+05:30	2019-06-25 23:52:10.812717+05:30	5	r1imghtlak.mmtcdn.com/0b5c8d5827f811e6a6680015c5f4277e.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,68&output-format=jpg
10	2019-06-25 23:52:10.823959+05:30	2019-06-25 23:52:10.823959+05:30	5	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201605131553527667-23884b4c298d11e6b6ec0022195573b9.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
11	2019-06-25 23:52:10.835021+05:30	2019-06-25 23:52:10.835021+05:30	5	r1imghtlak.mmtcdn.com/359e98506f2711e798fc0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
12	2019-06-25 23:52:10.846916+05:30	2019-06-25 23:52:10.846916+05:30	5	r1imghtlak.mmtcdn.com/3814cee26f2711e7886e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
13	2019-06-25 23:52:10.869121+05:30	2019-06-25 23:52:10.869121+05:30	5	r1imghtlak.mmtcdn.com/3f45bf786f2711e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
14	2019-06-25 23:52:10.879615+05:30	2019-06-25 23:52:10.879615+05:30	5	r1imghtlak.mmtcdn.com/3f640d346f2711e798fc0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
15	2019-06-25 23:52:10.89004+05:30	2019-06-25 23:52:10.89004+05:30	5	r1imghtlak.mmtcdn.com/4d12abfc6f2711e7886e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
16	2019-06-25 23:52:10.902693+05:30	2019-06-25 23:52:10.902693+05:30	5	r1imghtlak.mmtcdn.com/52de55c26f2711e798fc0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
17	2019-06-25 23:52:10.912214+05:30	2019-06-25 23:52:10.912214+05:30	5	r1imghtlak.mmtcdn.com/5379e5826f2711e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
18	2019-06-25 23:52:10.923319+05:30	2019-06-25 23:52:10.923319+05:30	5	r1imghtlak.mmtcdn.com/55f38b606f2711e7886e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
19	2019-06-25 23:52:10.934711+05:30	2019-06-25 23:52:10.934711+05:30	5	r1imghtlak.mmtcdn.com/6292f1446f2711e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
20	2019-06-25 23:52:10.945958+05:30	2019-06-25 23:52:10.945958+05:30	5	r1imghtlak.mmtcdn.com/691bc1586f2711e7886e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
21	2019-06-25 23:53:32.809981+05:30	2019-06-25 23:53:32.809981+05:30	7	r1imghtlak.mmtcdn.com/ba1019def41111e589dd001ec9b85d13.jfif?&output-quality=75&output-format=jpg
22	2019-06-25 23:53:32.822831+05:30	2019-06-25 23:53:32.822831+05:30	7	r1imghtlak.mmtcdn.com/4252bf9afa2511e58b370022195573b9.jfif?&output-quality=75&output-format=jpg
23	2019-06-25 23:53:32.843962+05:30	2019-06-25 23:53:32.843962+05:30	7	r1imghtlak.mmtcdn.com/ba1019def41111e589dd001ec9b85d13.jfif?&output-quality=75&output-format=jpg
24	2019-06-25 23:53:32.864971+05:30	2019-06-25 23:53:32.864971+05:30	7	r1imghtlak.mmtcdn.com/4252bf9afa2511e58b370022195573b9.jfif?&output-quality=75&output-format=jpg
25	2019-06-25 23:53:32.877076+05:30	2019-06-25 23:53:32.877076+05:30	7	r1imghtlak.mmtcdn.com/b72ef9a6f41111e5b0d236cfdd80c293.jfif?&output-quality=75&output-format=jpg
26	2019-06-25 23:53:32.887228+05:30	2019-06-25 23:53:32.887228+05:30	7	r1imghtlak.mmtcdn.com/b7d647b0f41111e5ba9e5ee5da2daa2a.jfif?&output-quality=75&output-format=jpg
27	2019-06-25 23:53:32.899163+05:30	2019-06-25 23:53:32.899163+05:30	7	r1imghtlak.mmtcdn.com/ce94d322721411e783e6025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
28	2019-06-25 23:53:32.909261+05:30	2019-06-25 23:53:32.909261+05:30	7	r1imghtlak.mmtcdn.com/e1890368721411e7b7fa025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
29	2019-06-25 23:53:32.919883+05:30	2019-06-25 23:53:32.919883+05:30	7	r1imghtlak.mmtcdn.com/2668250e721511e7aec50a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
30	2019-06-25 23:53:32.930997+05:30	2019-06-25 23:53:32.930997+05:30	7	r1imghtlak.mmtcdn.com/fcb263fee62311e783f10a209fbd0127.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
31	2019-06-25 23:53:32.953426+05:30	2019-06-25 23:53:32.953426+05:30	7	r1imghtlak.mmtcdn.com/08ed6268e62411e7a8c60a209fbd0127.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
32	2019-06-25 23:53:32.964552+05:30	2019-06-25 23:53:32.964552+05:30	7	r1imghtlak.mmtcdn.com/13d45718e62411e7aef80a9df65c8753.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
33	2019-06-25 23:53:32.975638+05:30	2019-06-25 23:53:32.975638+05:30	7	r1imghtlak.mmtcdn.com/18819c1ce62411e7afaf0224510f5e5b.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
34	2019-06-25 23:53:32.986908+05:30	2019-06-25 23:53:32.986908+05:30	7	r1imghtlak.mmtcdn.com/b72ef9a6f41111e5b0d236cfdd80c293.jfif?&output-quality=75&output-format=jpg
35	2019-06-25 23:53:32.997537+05:30	2019-06-25 23:53:32.997537+05:30	7	r1imghtlak.mmtcdn.com/b7d647b0f41111e5ba9e5ee5da2daa2a.jfif?&output-quality=75&output-format=jpg
36	2019-06-25 23:53:33.009032+05:30	2019-06-25 23:53:33.009032+05:30	7	r1imghtlak.mmtcdn.com/ce94d322721411e783e6025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
37	2019-06-25 23:53:33.020145+05:30	2019-06-25 23:53:33.020145+05:30	7	r1imghtlak.mmtcdn.com/e1890368721411e7b7fa025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
38	2019-06-25 23:53:33.031271+05:30	2019-06-25 23:53:33.031271+05:30	7	r1imghtlak.mmtcdn.com/2668250e721511e7aec50a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
39	2019-06-25 23:53:33.042295+05:30	2019-06-25 23:53:33.042295+05:30	7	r1imghtlak.mmtcdn.com/fcb263fee62311e783f10a209fbd0127.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
40	2019-06-25 23:53:33.054464+05:30	2019-06-25 23:53:33.054464+05:30	7	r1imghtlak.mmtcdn.com/08ed6268e62411e7a8c60a209fbd0127.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
41	2019-06-25 23:53:33.075435+05:30	2019-06-25 23:53:33.075435+05:30	7	r1imghtlak.mmtcdn.com/13d45718e62411e7aef80a9df65c8753.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
42	2019-06-25 23:53:33.086988+05:30	2019-06-25 23:53:33.086988+05:30	7	r1imghtlak.mmtcdn.com/18819c1ce62411e7afaf0224510f5e5b.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
43	2019-06-25 23:53:33.097641+05:30	2019-06-25 23:53:33.097641+05:30	7	r1imghtlak.mmtcdn.com/2fe8020a8c5e11e5bb28daf4768ad8d9.jfif?&output-quality=75&output-format=jpg
44	2019-06-25 23:53:33.108588+05:30	2019-06-25 23:53:33.108588+05:30	7	r1imghtlak.mmtcdn.com/3ad7201a8c5e11e5936336cfdd80c293.jfif?&output-quality=75&output-format=jpg
45	2019-06-25 23:53:33.120005+05:30	2019-06-25 23:53:33.120005+05:30	7	r1imghtlak.mmtcdn.com/440d9eb68c5e11e5a9070015c5f4277e.jfif?&output-quality=75&output-format=jpg
46	2019-06-25 23:53:33.130818+05:30	2019-06-25 23:53:33.130818+05:30	7	r1imghtlak.mmtcdn.com/647e20808c5e11e5bdc0001ec9b85d13.jfif?&output-quality=75&output-format=jpg
47	2019-06-25 23:53:33.152675+05:30	2019-06-25 23:53:33.152675+05:30	7	r1imghtlak.mmtcdn.com/6eadf5c68c5e11e592f0001ec9b85d13.jfif?&output-quality=75&output-format=jpg
48	2019-06-25 23:53:33.163808+05:30	2019-06-25 23:53:33.163808+05:30	7	r1imghtlak.mmtcdn.com/ca7691e0721411e783e6025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
49	2019-06-25 23:53:33.17519+05:30	2019-06-25 23:53:33.17519+05:30	7	r1imghtlak.mmtcdn.com/cca00686721411e783e6025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
50	2019-06-25 23:53:33.186477+05:30	2019-06-25 23:53:33.186477+05:30	7	r1imghtlak.mmtcdn.com/d0d16132721411e783e6025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
51	2019-06-25 23:53:33.197371+05:30	2019-06-25 23:53:33.197371+05:30	7	r1imghtlak.mmtcdn.com/d7fa5a90721411e7b7fa025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
52	2019-06-25 23:53:33.220824+05:30	2019-06-25 23:53:33.220824+05:30	7	r1imghtlak.mmtcdn.com/de24b564721411e7b7fa025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
53	2019-06-25 23:53:33.242103+05:30	2019-06-25 23:53:33.242103+05:30	7	r1imghtlak.mmtcdn.com/e5106ae4721411e7b7fa025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
54	2019-06-25 23:53:33.264596+05:30	2019-06-25 23:53:33.264596+05:30	7	r1imghtlak.mmtcdn.com/22426f16721511e7aec50a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
55	2019-06-25 23:53:33.286754+05:30	2019-06-25 23:53:33.286754+05:30	7	r1imghtlak.mmtcdn.com/2448ec9a721511e7aec50a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
56	2019-06-25 23:53:33.309571+05:30	2019-06-25 23:53:33.309571+05:30	7	r1imghtlak.mmtcdn.com/2899ea42721511e7aec50a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
57	2019-06-25 23:53:33.330939+05:30	2019-06-25 23:53:33.330939+05:30	7	r1imghtlak.mmtcdn.com/ed339cf0d8f311e7b29d0a209fbd0127.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
58	2019-06-25 23:53:33.352581+05:30	2019-06-25 23:53:33.352581+05:30	7	r1imghtlak.mmtcdn.com/f648556ad8f311e78a4302755708f0b3.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
59	2019-06-25 23:57:04.035049+05:30	2019-06-25 23:57:04.035049+05:30	8	r1imghtlak.mmtcdn.com/b7b88438775e11e789f00a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
60	2019-06-25 23:57:04.064476+05:30	2019-06-25 23:57:04.064476+05:30	8	r1imghtlak.mmtcdn.com/b7b88438775e11e789f00a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
61	2019-06-25 23:57:04.076144+05:30	2019-06-25 23:57:04.076144+05:30	8	r1imghtlak.mmtcdn.com/b7b88438775e11e789f00a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
62	2019-06-25 23:57:04.939995+05:30	2019-06-25 23:57:04.939995+05:30	9	r1imghtlak.mmtcdn.com/166c33466b8211e7ae460a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
63	2019-06-25 23:57:04.961895+05:30	2019-06-25 23:57:04.961895+05:30	9	r1imghtlak.mmtcdn.com/150b5bda6b8211e7ae460a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
64	2019-06-25 23:57:04.984185+05:30	2019-06-25 23:57:04.984185+05:30	9	r1imghtlak.mmtcdn.com/155df3226b8211e7ab360a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
65	2019-06-25 23:57:05.00508+05:30	2019-06-25 23:57:05.00508+05:30	9	r1imghtlak.mmtcdn.com/1593b0346b8211e7b64e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
66	2019-06-25 23:57:05.015944+05:30	2019-06-25 23:57:05.015944+05:30	9	r1imghtlak.mmtcdn.com/15a59fd86b8211e7a5730a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
67	2019-06-25 23:57:05.02708+05:30	2019-06-25 23:57:05.02708+05:30	9	r1imghtlak.mmtcdn.com/15c107f06b8211e7ae460a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
68	2019-06-25 23:57:05.038203+05:30	2019-06-25 23:57:05.038203+05:30	9	r1imghtlak.mmtcdn.com/15ff2d966b8211e7af7c0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
69	2019-06-25 23:57:05.049343+05:30	2019-06-25 23:57:05.049343+05:30	9	r1imghtlak.mmtcdn.com/15fe14386b8211e7ab360a4cef95d023.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,19&output-format=jpg
70	2019-06-25 23:57:05.060339+05:30	2019-06-25 23:57:05.060339+05:30	9	r1imghtlak.mmtcdn.com/162aaa8e6b8211e7925b0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
71	2019-06-25 23:57:05.071373+05:30	2019-06-25 23:57:05.071373+05:30	9	r1imghtlak.mmtcdn.com/1653bc4e6b8211e7b0e30a4cef95d023.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,19&output-format=jpg
72	2019-06-25 23:57:05.082524+05:30	2019-06-25 23:57:05.082524+05:30	9	r1imghtlak.mmtcdn.com/16bcb79e6b8211e78b490a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
73	2019-06-25 23:57:05.093559+05:30	2019-06-25 23:57:05.093559+05:30	9	r1imghtlak.mmtcdn.com/16b37b2a6b8211e7ab360a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
74	2019-06-25 23:57:05.104823+05:30	2019-06-25 23:57:05.104823+05:30	9	r1imghtlak.mmtcdn.com/16ed507a6b8211e7827b0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
75	2019-06-25 23:57:05.115652+05:30	2019-06-25 23:57:05.115652+05:30	9	r1imghtlak.mmtcdn.com/16e253f06b8211e7925b0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
76	2019-06-25 23:57:05.126817+05:30	2019-06-25 23:57:05.126817+05:30	9	r1imghtlak.mmtcdn.com/1718b30a6b8211e7b2ef0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
77	2019-06-25 23:57:05.13797+05:30	2019-06-25 23:57:05.13797+05:30	9	r1imghtlak.mmtcdn.com/14b6f2e86b8211e7ab360a4cef95d023.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
78	2019-06-25 23:57:05.148969+05:30	2019-06-25 23:57:05.148969+05:30	9	r1imghtlak.mmtcdn.com/1504d7a66b8211e7827b0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
79	2019-06-25 23:57:05.16015+05:30	2019-06-25 23:57:05.16015+05:30	9	r1imghtlak.mmtcdn.com/17c1637e6b8211e7b2ef0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
80	2019-06-25 23:57:05.171134+05:30	2019-06-25 23:57:05.171134+05:30	9	r1imghtlak.mmtcdn.com/63be07689b1011e4a8c832e76f7e45c9.jfif?&output-quality=75&downsize=520:*&crop=520:350;0,19&output-format=jpg
81	2019-06-25 23:57:05.182193+05:30	2019-06-25 23:57:05.182193+05:30	9	r1imghtlak.mmtcdn.com/cc390b089b1011e4a435daf4768ad8d9.jfif?&output-quality=75&downsize=520:*&crop=520:350;0,171&output-format=jpg
82	2019-06-25 23:57:05.193173+05:30	2019-06-25 23:57:05.193173+05:30	9	r1imghtlak.mmtcdn.com/3881d1509b1111e48d93daf4768ad8d9.jfif?&output-quality=75&downsize=520:*&crop=520:350;0,19&output-format=jpg
83	2019-06-25 23:57:05.204272+05:30	2019-06-25 23:57:05.204272+05:30	9	r1imghtlak.mmtcdn.com/68630480a8f811e492b6daf4768ad8d9.jfif?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
84	2019-06-25 23:57:05.215379+05:30	2019-06-25 23:57:05.215379+05:30	9	r1imghtlak.mmtcdn.com/8a05ca8ca8f811e48a7536cfdd80c293.jfif?&output-quality=75&downsize=520:350&output-format=jpg
85	2019-06-25 23:57:05.226457+05:30	2019-06-25 23:57:05.226457+05:30	9	r1imghtlak.mmtcdn.com/0d63ce06a8f911e4abf536cfdd80c293.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
86	2019-06-25 23:57:05.237539+05:30	2019-06-25 23:57:05.237539+05:30	9	r1imghtlak.mmtcdn.com/b791a728a8f811e4b2605ee5da2daa2a.jfif?&output-quality=75&downsize=520:350&output-format=jpg
87	2019-06-25 23:57:05.249145+05:30	2019-06-25 23:57:05.249145+05:30	9	r1imghtlak.mmtcdn.com/e5137e24a8f811e48bf9daf4768ad8d9.jfif?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
88	2019-06-25 23:57:05.260942+05:30	2019-06-25 23:57:05.260942+05:30	9	r1imghtlak.mmtcdn.com/41a30150a8f911e4a59f5ee5da2daa2a.jfif?&output-quality=75&downsize=520:*&crop=520:350;0,19&output-format=jpg
89	2019-06-25 23:57:05.271906+05:30	2019-06-25 23:57:05.271906+05:30	9	r1imghtlak.mmtcdn.com/87b63996a8f911e48d0bdaf4768ad8d9.jfif?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
90	2019-06-25 23:57:05.282991+05:30	2019-06-25 23:57:05.282991+05:30	9	r1imghtlak.mmtcdn.com/d86c2260a8f911e4898032e76f7e45c9.jfif?&output-quality=75&downsize=520:*&crop=520:350;0,21&output-format=jpg
91	2019-06-25 23:57:05.294027+05:30	2019-06-25 23:57:05.294027+05:30	9	r1imghtlak.mmtcdn.com/f32bc236a8f911e4997132e76f7e45c9.jfif?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
92	2019-06-25 23:57:05.305091+05:30	2019-06-25 23:57:05.305091+05:30	9	r1imghtlak.mmtcdn.com/71ea00eca8fa11e4b64cdaf4768ad8d9.jfif?&output-quality=75&downsize=520:*&crop=520:350;0,19&output-format=jpg
93	2019-06-25 23:57:05.31603+05:30	2019-06-25 23:57:05.31603+05:30	9	r1imghtlak.mmtcdn.com/8f5a3926a8fa11e4b1c35ee5da2daa2a.jfif?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
94	2019-06-25 23:57:05.327411+05:30	2019-06-25 23:57:05.327411+05:30	9	r1imghtlak.mmtcdn.com/bc0b3132a8fa11e484e35ee5da2daa2a.jfif?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
95	2019-06-25 23:57:05.338313+05:30	2019-06-25 23:57:05.338313+05:30	9	r1imghtlak.mmtcdn.com/e5be4b22a8fa11e4af96daf4768ad8d9.jfif?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
96	2019-06-25 23:57:05.349461+05:30	2019-06-25 23:57:05.349461+05:30	9	r1imghtlak.mmtcdn.com/35b459b4a8fb11e482a932e76f7e45c9.jfif?&output-quality=75&downsize=520:*&crop=520:350;0,19&output-format=jpg
97	2019-06-25 23:57:05.360596+05:30	2019-06-25 23:57:05.360596+05:30	9	r1imghtlak.mmtcdn.com/140558a86b8211e7869a0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
98	2019-06-25 23:57:05.371562+05:30	2019-06-25 23:57:05.371562+05:30	9	r1imghtlak.mmtcdn.com/143eba626b8211e7a5730a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
99	2019-06-25 23:57:05.382229+05:30	2019-06-25 23:57:05.382229+05:30	9	r1imghtlak.mmtcdn.com/150484906b8211e7b0e30a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
100	2019-06-25 23:57:05.393735+05:30	2019-06-25 23:57:05.393735+05:30	9	r1imghtlak.mmtcdn.com/1559c64e6b8211e78ed20a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
101	2019-06-25 23:57:05.405684+05:30	2019-06-25 23:57:05.405684+05:30	9	r1imghtlak.mmtcdn.com/15b621286b8211e7827b0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
102	2019-06-25 23:57:05.426167+05:30	2019-06-25 23:57:05.426167+05:30	9	r1imghtlak.mmtcdn.com/15e9c0466b8211e78ed20a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
103	2019-06-25 23:57:05.437065+05:30	2019-06-25 23:57:05.437065+05:30	9	r1imghtlak.mmtcdn.com/162b03c66b8211e78b490a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
104	2019-06-25 23:57:05.448187+05:30	2019-06-25 23:57:05.448187+05:30	9	r1imghtlak.mmtcdn.com/16ad59986b8211e7a71a0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
105	2019-06-25 23:57:05.459339+05:30	2019-06-25 23:57:05.459339+05:30	9	r1imghtlak.mmtcdn.com/170eae646b8211e7a5730a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
106	2019-06-25 23:57:05.470464+05:30	2019-06-25 23:57:05.470464+05:30	9	r1imghtlak.mmtcdn.com/17577fa46b8211e78b490a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
107	2019-06-25 23:57:05.481709+05:30	2019-06-25 23:57:05.481709+05:30	9	r1imghtlak.mmtcdn.com/178683806b8211e7827b0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
108	2019-06-25 23:57:05.49275+05:30	2019-06-25 23:57:05.49275+05:30	9	r1imghtlak.mmtcdn.com/17bf08366b8211e78ed20a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
109	2019-06-25 23:57:05.50385+05:30	2019-06-25 23:57:05.50385+05:30	9	r1imghtlak.mmtcdn.com/1856ef206b8211e7925b0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
110	2019-06-25 23:57:05.515179+05:30	2019-06-25 23:57:05.515179+05:30	9	r1imghtlak.mmtcdn.com/18c6f70c6b8211e7b64e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
111	2019-06-25 23:57:07.474317+05:30	2019-06-25 23:57:07.474317+05:30	10	r1imghtlak.mmtcdn.com/a0bd0208180611e6b62c0022195573b9.jpg?&output-quality=75&output-format=jpg
112	2019-06-25 23:57:07.485567+05:30	2019-06-25 23:57:07.485567+05:30	10	r1imghtlak.mmtcdn.com/79453430decf11e693b80a209fbd0127.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
113	2019-06-25 23:57:07.496353+05:30	2019-06-25 23:57:07.496353+05:30	10	r1imghtlak.mmtcdn.com/37cf0ea070d211e790b90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
114	2019-06-25 23:57:07.507594+05:30	2019-06-25 23:57:07.507594+05:30	10	r1imghtlak.mmtcdn.com/9fe059bcff6c11e7966c0224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
115	2019-06-25 23:57:07.518806+05:30	2019-06-25 23:57:07.518806+05:30	10	r1imghtlak.mmtcdn.com/a14b8e84ff6c11e7877b02755708f0b3.jpg?&output-quality=75&downsize=*:350&crop=520:350;4,0&output-format=jpg
116	2019-06-25 23:57:07.529859+05:30	2019-06-25 23:57:07.529859+05:30	10	r1imghtlak.mmtcdn.com/a0d4c470ff6c11e79dbe0ae7c55c9020.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
117	2019-06-25 23:57:07.540816+05:30	2019-06-25 23:57:07.540816+05:30	10	r1imghtlak.mmtcdn.com/a2c40f3eff6c11e7beca0a746fbd6492.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
118	2019-06-25 23:57:07.552127+05:30	2019-06-25 23:57:07.552127+05:30	10	r1imghtlak.mmtcdn.com/a2d18fbaff6c11e78edb0a746fbd6492.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
119	2019-06-25 23:57:07.563153+05:30	2019-06-25 23:57:07.563153+05:30	10	r1imghtlak.mmtcdn.com/a3d97eeaff6c11e7b754029188e798e0.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
120	2019-06-25 23:57:07.574387+05:30	2019-06-25 23:57:07.574387+05:30	10	r1imghtlak.mmtcdn.com/a405504cff6c11e7916a0224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
121	2019-06-25 23:57:07.585165+05:30	2019-06-25 23:57:07.585165+05:30	10	r1imghtlak.mmtcdn.com/a0bd0208180611e6b62c0022195573b9.jpg?&output-quality=75&output-format=jpg
122	2019-06-25 23:57:07.596334+05:30	2019-06-25 23:57:07.596334+05:30	10	r1imghtlak.mmtcdn.com/79453430decf11e693b80a209fbd0127.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
123	2019-06-25 23:57:07.607603+05:30	2019-06-25 23:57:07.607603+05:30	10	r1imghtlak.mmtcdn.com/37cf0ea070d211e790b90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
124	2019-06-25 23:57:07.618422+05:30	2019-06-25 23:57:07.618422+05:30	10	r1imghtlak.mmtcdn.com/9fe059bcff6c11e7966c0224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
125	2019-06-25 23:57:07.629508+05:30	2019-06-25 23:57:07.629508+05:30	10	r1imghtlak.mmtcdn.com/a14b8e84ff6c11e7877b02755708f0b3.jpg?&output-quality=75&downsize=*:350&crop=520:350;4,0&output-format=jpg
126	2019-06-25 23:57:07.640632+05:30	2019-06-25 23:57:07.640632+05:30	10	r1imghtlak.mmtcdn.com/a0d4c470ff6c11e79dbe0ae7c55c9020.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
127	2019-06-25 23:57:07.65185+05:30	2019-06-25 23:57:07.65185+05:30	10	r1imghtlak.mmtcdn.com/a2c40f3eff6c11e7beca0a746fbd6492.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
128	2019-06-25 23:57:07.663399+05:30	2019-06-25 23:57:07.663399+05:30	10	r1imghtlak.mmtcdn.com/a2d18fbaff6c11e78edb0a746fbd6492.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
129	2019-06-25 23:57:07.67452+05:30	2019-06-25 23:57:07.67452+05:30	10	r1imghtlak.mmtcdn.com/a3d97eeaff6c11e7b754029188e798e0.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
130	2019-06-25 23:57:07.68527+05:30	2019-06-25 23:57:07.68527+05:30	10	r1imghtlak.mmtcdn.com/a405504cff6c11e7916a0224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
131	2019-06-25 23:57:07.696564+05:30	2019-06-25 23:57:07.696564+05:30	10	r1imghtlak.mmtcdn.com/b9c75e3eff6c11e79a56029188e798e0.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
132	2019-06-25 23:57:07.70757+05:30	2019-06-25 23:57:07.70757+05:30	10	r1imghtlak.mmtcdn.com/10ed9dfcded211e69fc00224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
133	2019-06-25 23:57:07.718692+05:30	2019-06-25 23:57:07.718692+05:30	10	r1imghtlak.mmtcdn.com/10d28922ded211e68db10a209fbd0127.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
134	2019-06-25 23:57:07.729765+05:30	2019-06-25 23:57:07.729765+05:30	10	r1imghtlak.mmtcdn.com/13f40892ded211e69c9a02755708f0b3.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
135	2019-06-25 23:57:07.740727+05:30	2019-06-25 23:57:07.740727+05:30	10	r1imghtlak.mmtcdn.com/3562149070d311e7b9ef025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
136	2019-06-25 23:57:07.751998+05:30	2019-06-25 23:57:07.751998+05:30	10	r1imghtlak.mmtcdn.com/b71aa31cff6c11e7974402755708f0b3.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
137	2019-06-25 23:57:07.773721+05:30	2019-06-25 23:57:07.773721+05:30	10	r1imghtlak.mmtcdn.com/b8143210ff6c11e7b50a0a1f8dbbfb44.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
138	2019-06-25 23:57:07.785549+05:30	2019-06-25 23:57:07.785549+05:30	10	r1imghtlak.mmtcdn.com/bf232002ff6c11e7877a02755708f0b3.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
139	2019-06-25 23:57:07.79557+05:30	2019-06-25 23:57:07.79557+05:30	10	r1imghtlak.mmtcdn.com/b9c75e3eff6c11e79a56029188e798e0.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
140	2019-06-25 23:57:07.81952+05:30	2019-06-25 23:57:07.81952+05:30	10	r1imghtlak.mmtcdn.com/10ed9dfcded211e69fc00224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
141	2019-06-25 23:57:07.840848+05:30	2019-06-25 23:57:07.840848+05:30	10	r1imghtlak.mmtcdn.com/10d28922ded211e68db10a209fbd0127.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
142	2019-06-25 23:57:07.863121+05:30	2019-06-25 23:57:07.863121+05:30	10	r1imghtlak.mmtcdn.com/13f40892ded211e69c9a02755708f0b3.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
143	2019-06-25 23:57:07.885757+05:30	2019-06-25 23:57:07.885757+05:30	10	r1imghtlak.mmtcdn.com/3562149070d311e7b9ef025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
144	2019-06-25 23:57:07.90888+05:30	2019-06-25 23:57:07.90888+05:30	10	r1imghtlak.mmtcdn.com/b71aa31cff6c11e7974402755708f0b3.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
145	2019-06-25 23:57:07.930697+05:30	2019-06-25 23:57:07.930697+05:30	10	r1imghtlak.mmtcdn.com/b8143210ff6c11e7b50a0a1f8dbbfb44.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
146	2019-06-25 23:57:07.951794+05:30	2019-06-25 23:57:07.951794+05:30	10	r1imghtlak.mmtcdn.com/bf232002ff6c11e7877a02755708f0b3.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
147	2019-06-25 23:57:07.972751+05:30	2019-06-25 23:57:07.972751+05:30	10	r1imghtlak.mmtcdn.com/8b0f1fbeff6c11e786950a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
148	2019-06-25 23:57:07.984608+05:30	2019-06-25 23:57:07.984608+05:30	10	r1imghtlak.mmtcdn.com/8f758e9eff6c11e7a8d70224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
149	2019-06-25 23:57:07.995148+05:30	2019-06-25 23:57:07.995148+05:30	10	r1imghtlak.mmtcdn.com/8be9c8bcff6c11e79d1d0a1f8dbbfb44.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
150	2019-06-25 23:57:08.006076+05:30	2019-06-25 23:57:08.006076+05:30	10	r1imghtlak.mmtcdn.com/938d6e98ff6c11e78edb0a746fbd6492.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
151	2019-06-25 23:57:08.0172+05:30	2019-06-25 23:57:08.0172+05:30	10	r1imghtlak.mmtcdn.com/91c9d556ff6c11e791250276c744fe44.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
152	2019-06-25 23:57:08.028353+05:30	2019-06-25 23:57:08.028353+05:30	10	r1imghtlak.mmtcdn.com/c97a8064dece11e6b6020a209fbd0127.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
153	2019-06-25 23:57:08.040313+05:30	2019-06-25 23:57:08.040313+05:30	10	r1imghtlak.mmtcdn.com/c97054b8dece11e6a3890a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
154	2019-06-25 23:57:08.050385+05:30	2019-06-25 23:57:08.050385+05:30	10	r1imghtlak.mmtcdn.com/a821608e180611e698ff0022195573b9.jpg?&output-quality=75&output-format=jpg
155	2019-06-25 23:57:08.061684+05:30	2019-06-25 23:57:08.061684+05:30	10	r1imghtlak.mmtcdn.com/bfa62334180611e6973e0022195573b9.jpg?&output-quality=75&output-format=jpg
156	2019-06-25 23:57:08.072648+05:30	2019-06-25 23:57:08.072648+05:30	10	r1imghtlak.mmtcdn.com/cec7c6bcdece11e685e602bf5ac07431.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
157	2019-06-25 23:57:08.084245+05:30	2019-06-25 23:57:08.084245+05:30	10	r1imghtlak.mmtcdn.com/8b0f1fbeff6c11e786950a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
158	2019-06-25 23:57:08.0947+05:30	2019-06-25 23:57:08.0947+05:30	10	r1imghtlak.mmtcdn.com/8f758e9eff6c11e7a8d70224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
159	2019-06-25 23:57:08.105823+05:30	2019-06-25 23:57:08.105823+05:30	10	r1imghtlak.mmtcdn.com/8be9c8bcff6c11e79d1d0a1f8dbbfb44.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
160	2019-06-25 23:57:08.116973+05:30	2019-06-25 23:57:08.116973+05:30	10	r1imghtlak.mmtcdn.com/938d6e98ff6c11e78edb0a746fbd6492.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
161	2019-06-25 23:57:08.12789+05:30	2019-06-25 23:57:08.12789+05:30	10	r1imghtlak.mmtcdn.com/91c9d556ff6c11e791250276c744fe44.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
162	2019-06-25 23:57:08.139101+05:30	2019-06-25 23:57:08.139101+05:30	10	r1imghtlak.mmtcdn.com/c97a8064dece11e6b6020a209fbd0127.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
163	2019-06-25 23:57:08.150292+05:30	2019-06-25 23:57:08.150292+05:30	10	r1imghtlak.mmtcdn.com/c97054b8dece11e6a3890a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
164	2019-06-25 23:57:08.161387+05:30	2019-06-25 23:57:08.161387+05:30	10	r1imghtlak.mmtcdn.com/a821608e180611e698ff0022195573b9.jpg?&output-quality=75&output-format=jpg
165	2019-06-25 23:57:08.172351+05:30	2019-06-25 23:57:08.172351+05:30	10	r1imghtlak.mmtcdn.com/bfa62334180611e6973e0022195573b9.jpg?&output-quality=75&output-format=jpg
166	2019-06-25 23:57:08.183565+05:30	2019-06-25 23:57:08.183565+05:30	10	r1imghtlak.mmtcdn.com/cec7c6bcdece11e685e602bf5ac07431.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
167	2019-06-25 23:57:08.206991+05:30	2019-06-25 23:57:08.206991+05:30	10	r1imghtlak.mmtcdn.com/232254e646dc11e7bd710224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
168	2019-06-25 23:57:08.227436+05:30	2019-06-25 23:57:08.227436+05:30	10	r1imghtlak.mmtcdn.com/32fa15e846dc11e7b3410a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
169	2019-06-25 23:57:08.238926+05:30	2019-06-25 23:57:08.238926+05:30	10	r1imghtlak.mmtcdn.com/cbb2ba0e4a8f11e78c770224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
170	2019-06-25 23:57:08.24982+05:30	2019-06-25 23:57:08.24982+05:30	10	r1imghtlak.mmtcdn.com/495d4c8846dc11e780f80a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
171	2019-06-25 23:57:08.260874+05:30	2019-06-25 23:57:08.260874+05:30	10	r1imghtlak.mmtcdn.com/ac7c380c46db11e78a8902755708f0b3.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
172	2019-06-25 23:57:08.272212+05:30	2019-06-25 23:57:08.272212+05:30	10	r1imghtlak.mmtcdn.com/c31fe3944a8f11e780b80224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
173	2019-06-25 23:57:08.2833+05:30	2019-06-25 23:57:08.2833+05:30	10	r1imghtlak.mmtcdn.com/c81503b64a8f11e78c770224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
174	2019-06-25 23:57:08.294339+05:30	2019-06-25 23:57:08.294339+05:30	10	r1imghtlak.mmtcdn.com/84e3523cdece11e69ff302bf5ac07431.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
175	2019-06-25 23:57:08.305311+05:30	2019-06-25 23:57:08.305311+05:30	10	r1imghtlak.mmtcdn.com/8bfb8144ded711e68e0c0a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
176	2019-06-25 23:57:08.316396+05:30	2019-06-25 23:57:08.316396+05:30	10	r1imghtlak.mmtcdn.com/819ce5bcded711e68dbf0a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
177	2019-06-25 23:57:08.327829+05:30	2019-06-25 23:57:08.327829+05:30	10	r1imghtlak.mmtcdn.com/5b1ba9f2180611e6bad70022195573b9.jpg?&output-quality=75&output-format=jpg
178	2019-06-25 23:57:08.33878+05:30	2019-06-25 23:57:08.33878+05:30	10	r1imghtlak.mmtcdn.com/6579a052180611e685780022195573b9.jpg?&output-quality=75&output-format=jpg
179	2019-06-25 23:57:08.349558+05:30	2019-06-25 23:57:08.349558+05:30	10	r1imghtlak.mmtcdn.com/52017c5c180611e680ce0022195573b9.jpg?&output-quality=75&output-format=jpg
180	2019-06-25 23:57:08.361016+05:30	2019-06-25 23:57:08.361016+05:30	10	r1imghtlak.mmtcdn.com/7c7919deded711e68e0c0a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
181	2019-06-25 23:57:08.371986+05:30	2019-06-25 23:57:08.371986+05:30	10	r1imghtlak.mmtcdn.com/8601c8b6ded711e6ba2202bf5ac07431.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
182	2019-06-25 23:57:08.38328+05:30	2019-06-25 23:57:08.38328+05:30	10	r1imghtlak.mmtcdn.com/ca1a2ab846db11e790ad0a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
183	2019-06-25 23:57:08.394352+05:30	2019-06-25 23:57:08.394352+05:30	10	r1imghtlak.mmtcdn.com/cb9ad86046db11e78af102755708f0b3.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
184	2019-06-25 23:57:08.4049+05:30	2019-06-25 23:57:08.4049+05:30	10	r1imghtlak.mmtcdn.com/0418fe5646dc11e7878b0224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
185	2019-06-25 23:57:08.416336+05:30	2019-06-25 23:57:08.416336+05:30	10	r1imghtlak.mmtcdn.com/3956683846dc11e792e10a209fbd0127.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
186	2019-06-25 23:57:08.42763+05:30	2019-06-25 23:57:08.42763+05:30	10	r1imghtlak.mmtcdn.com/2a47983046dc11e7be480224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
187	2019-06-25 23:57:08.438621+05:30	2019-06-25 23:57:08.438621+05:30	10	r1imghtlak.mmtcdn.com/43b9b8c046dc11e7bed10a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
188	2019-06-25 23:57:08.449245+05:30	2019-06-25 23:57:08.449245+05:30	10	r1imghtlak.mmtcdn.com/4c1c6fda46dc11e7bc380224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;4,0&output-format=jpg
189	2019-06-25 23:57:08.460553+05:30	2019-06-25 23:57:08.460553+05:30	10	r1imghtlak.mmtcdn.com/4c3692b646dc11e78ba80a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
190	2019-06-25 23:57:08.482364+05:30	2019-06-25 23:57:08.482364+05:30	10	r1imghtlak.mmtcdn.com/4ebd446246dc11e7ab0a0a209fbd0127.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
191	2019-06-25 23:57:08.494081+05:30	2019-06-25 23:57:08.494081+05:30	10	r1imghtlak.mmtcdn.com/57c2e8a046dc11e7b3410a9df65c8753.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,22&output-format=jpg
192	2019-06-25 23:57:08.505609+05:30	2019-06-25 23:57:08.505609+05:30	10	r1imghtlak.mmtcdn.com/624610ea46dc11e7ad0602755708f0b3.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,13&output-format=jpg
193	2019-06-25 23:57:08.527917+05:30	2019-06-25 23:57:08.527917+05:30	10	r1imghtlak.mmtcdn.com/cbc1fb0e4a8f11e788fb0a209fbd0127.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
194	2019-06-25 23:57:08.550837+05:30	2019-06-25 23:57:08.550837+05:30	10	r1imghtlak.mmtcdn.com/bb0f634c70d111e7a0e50a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
195	2019-06-25 23:57:08.572025+05:30	2019-06-25 23:57:08.572025+05:30	10	r1imghtlak.mmtcdn.com/bc48efee70d111e790b90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
196	2019-06-25 23:57:08.593926+05:30	2019-06-25 23:57:08.593926+05:30	10	r1imghtlak.mmtcdn.com/c7195e3670d111e7a0e50a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
197	2019-06-25 23:57:11.59647+05:30	2019-06-25 23:57:11.59647+05:30	11	r1imghtlak.mmtcdn.com/f3bf871031a711e9b1a90242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
198	2019-06-25 23:57:11.615873+05:30	2019-06-25 23:57:11.615873+05:30	11	r1imghtlak.mmtcdn.com/f3d3814831a711e982230242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
199	2019-06-25 23:57:11.625939+05:30	2019-06-25 23:57:11.625939+05:30	11	r1imghtlak.mmtcdn.com/f54cb70631a711e9ba1f0242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
200	2019-06-25 23:57:11.637081+05:30	2019-06-25 23:57:11.637081+05:30	11	r1imghtlak.mmtcdn.com/f55755b231a711e9a1de0242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
201	2019-06-25 23:57:11.648385+05:30	2019-06-25 23:57:11.648385+05:30	11	r1imghtlak.mmtcdn.com/f6da44c631a711e9b6490242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
202	2019-06-25 23:57:11.659583+05:30	2019-06-25 23:57:11.659583+05:30	11	r1imghtlak.mmtcdn.com/f70a45ea31a711e990bb0242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
203	2019-06-25 23:57:11.670519+05:30	2019-06-25 23:57:11.670519+05:30	11	r1imghtlak.mmtcdn.com/f877b13831a711e98c870242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
204	2019-06-25 23:57:11.68173+05:30	2019-06-25 23:57:11.68173+05:30	11	r1imghtlak.mmtcdn.com/f8d755c031a711e9a7e10242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
205	2019-06-25 23:57:11.693132+05:30	2019-06-25 23:57:11.693132+05:30	11	r1imghtlak.mmtcdn.com/fa2ccfc231a711e9a1de0242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
206	2019-06-25 23:57:11.704082+05:30	2019-06-25 23:57:11.704082+05:30	11	r1imghtlak.mmtcdn.com/fa5db57e31a711e9a71a0242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
207	2019-06-25 23:57:11.714886+05:30	2019-06-25 23:57:11.714886+05:30	11	r1imghtlak.mmtcdn.com/fc06f6ce31a711e9aa350242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
208	2019-06-25 23:57:11.726185+05:30	2019-06-25 23:57:11.726185+05:30	11	r1imghtlak.mmtcdn.com/f3bf871031a711e9b1a90242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
209	2019-06-25 23:57:11.73719+05:30	2019-06-25 23:57:11.73719+05:30	11	r1imghtlak.mmtcdn.com/f3d3814831a711e982230242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
210	2019-06-25 23:57:11.748166+05:30	2019-06-25 23:57:11.748166+05:30	11	r1imghtlak.mmtcdn.com/f54cb70631a711e9ba1f0242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
211	2019-06-25 23:57:11.759319+05:30	2019-06-25 23:57:11.759319+05:30	11	r1imghtlak.mmtcdn.com/f55755b231a711e9a1de0242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
212	2019-06-25 23:57:11.770269+05:30	2019-06-25 23:57:11.770269+05:30	11	r1imghtlak.mmtcdn.com/f6da44c631a711e9b6490242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
213	2019-06-25 23:57:11.781424+05:30	2019-06-25 23:57:11.781424+05:30	11	r1imghtlak.mmtcdn.com/f70a45ea31a711e990bb0242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
214	2019-06-25 23:57:11.792443+05:30	2019-06-25 23:57:11.792443+05:30	11	r1imghtlak.mmtcdn.com/f877b13831a711e98c870242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
215	2019-06-25 23:57:11.803528+05:30	2019-06-25 23:57:11.803528+05:30	11	r1imghtlak.mmtcdn.com/f8d755c031a711e9a7e10242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
216	2019-06-25 23:57:11.814876+05:30	2019-06-25 23:57:11.814876+05:30	11	r1imghtlak.mmtcdn.com/fa2ccfc231a711e9a1de0242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
217	2019-06-25 23:57:11.825867+05:30	2019-06-25 23:57:11.825867+05:30	11	r1imghtlak.mmtcdn.com/fa5db57e31a711e9a71a0242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
218	2019-06-25 23:57:11.836667+05:30	2019-06-25 23:57:11.836667+05:30	11	r1imghtlak.mmtcdn.com/fc06f6ce31a711e9aa350242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
219	2019-06-25 23:57:11.847931+05:30	2019-06-25 23:57:11.847931+05:30	11	r1imghtlak.mmtcdn.com/ed37f93631a711e9b1860242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
220	2019-06-25 23:57:11.859028+05:30	2019-06-25 23:57:11.859028+05:30	11	r1imghtlak.mmtcdn.com/ee96956231a711e9bd7a0242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
221	2019-06-25 23:57:11.870016+05:30	2019-06-25 23:57:11.870016+05:30	11	r1imghtlak.mmtcdn.com/f01a5fc231a711e9a48f0242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
222	2019-06-25 23:57:11.881073+05:30	2019-06-25 23:57:11.881073+05:30	11	r1imghtlak.mmtcdn.com/f052719631a711e9889c0242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
223	2019-06-25 23:57:11.892335+05:30	2019-06-25 23:57:11.892335+05:30	11	r1imghtlak.mmtcdn.com/f3350e8c31a711e993de0242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
224	2019-06-25 23:57:11.954411+05:30	2019-06-25 23:57:11.954411+05:30	11	r1imghtlak.mmtcdn.com/f1a2c46031a711e9b1860242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
225	2019-06-25 23:57:11.982271+05:30	2019-06-25 23:57:11.982271+05:30	11	r1imghtlak.mmtcdn.com/f1bff56c31a711e9bd7a0242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
226	2019-06-25 23:57:12.003403+05:30	2019-06-25 23:57:12.003403+05:30	11	r1imghtlak.mmtcdn.com/f360f0ba31a711e9af7b0242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
227	2019-06-25 23:57:12.014738+05:30	2019-06-25 23:57:12.014738+05:30	11	r1imghtlak.mmtcdn.com/eed1255631a711e9a71a0242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
228	2019-06-25 23:57:12.025451+05:30	2019-06-25 23:57:12.025451+05:30	11	r1imghtlak.mmtcdn.com/ed3bf49631a711e9b6e10242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
229	2019-06-25 23:57:15.832818+05:30	2019-06-25 23:57:15.832818+05:30	12	r1imghtlak.mmtcdn.com/g5ag71an2h59t3peqtbc7vf2006t.jpg?&output-quality=75&output-format=jpg
230	2019-06-25 23:57:15.84434+05:30	2019-06-25 23:57:15.84434+05:30	12	r1imghtlak.mmtcdn.com/bai98tsfm94dd7jb7m2c2164003i.jpg?&output-quality=75&output-format=jpg
231	2019-06-25 23:57:15.855366+05:30	2019-06-25 23:57:15.855366+05:30	12	r1imghtlak.mmtcdn.com/4040973e6b8211e792c70a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
232	2019-06-25 23:57:15.866398+05:30	2019-06-25 23:57:15.866398+05:30	12	r1imghtlak.mmtcdn.com/4115b14e6b8211e787e40a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
233	2019-06-25 23:57:15.877553+05:30	2019-06-25 23:57:15.877553+05:30	12	r1imghtlak.mmtcdn.com/419330246b8211e7827b0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
234	2019-06-25 23:57:15.888653+05:30	2019-06-25 23:57:15.888653+05:30	12	r1imghtlak.mmtcdn.com/41c4726a6b8211e787e40a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
235	2019-06-25 23:57:15.899696+05:30	2019-06-25 23:57:15.899696+05:30	12	r1imghtlak.mmtcdn.com/4237de9e6b8211e7a5730a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
236	2019-06-25 23:57:15.910974+05:30	2019-06-25 23:57:15.910974+05:30	12	r1imghtlak.mmtcdn.com/42f78a826b8211e7a5730a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
237	2019-06-25 23:57:15.921863+05:30	2019-06-25 23:57:15.921863+05:30	12	r1imghtlak.mmtcdn.com/439c67fa6b8211e7a5730a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
238	2019-06-25 23:57:15.93313+05:30	2019-06-25 23:57:15.93313+05:30	12	r1imghtlak.mmtcdn.com/g5ag71an2h59t3peqtbc7vf2006t.jpg?&output-quality=75&output-format=jpg
239	2019-06-25 23:57:15.944055+05:30	2019-06-25 23:57:15.944055+05:30	12	r1imghtlak.mmtcdn.com/bai98tsfm94dd7jb7m2c2164003i.jpg?&output-quality=75&output-format=jpg
240	2019-06-25 23:57:15.955451+05:30	2019-06-25 23:57:15.955451+05:30	12	r1imghtlak.mmtcdn.com/4040973e6b8211e792c70a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
241	2019-06-25 23:57:15.966403+05:30	2019-06-25 23:57:15.966403+05:30	12	r1imghtlak.mmtcdn.com/4115b14e6b8211e787e40a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
242	2019-06-25 23:57:15.977066+05:30	2019-06-25 23:57:15.977066+05:30	12	r1imghtlak.mmtcdn.com/419330246b8211e7827b0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
243	2019-06-25 23:57:15.989527+05:30	2019-06-25 23:57:15.989527+05:30	12	r1imghtlak.mmtcdn.com/41c4726a6b8211e787e40a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
244	2019-06-25 23:57:16.011231+05:30	2019-06-25 23:57:16.011231+05:30	12	r1imghtlak.mmtcdn.com/4237de9e6b8211e7a5730a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
245	2019-06-25 23:57:16.021477+05:30	2019-06-25 23:57:16.021477+05:30	12	r1imghtlak.mmtcdn.com/42f78a826b8211e7a5730a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
246	2019-06-25 23:57:16.032648+05:30	2019-06-25 23:57:16.032648+05:30	12	r1imghtlak.mmtcdn.com/439c67fa6b8211e7a5730a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
247	2019-06-25 23:57:16.043874+05:30	2019-06-25 23:57:16.043874+05:30	12	r1imghtlak.mmtcdn.com/rj815bpe5l2fvcllu80t05tf007k.jpg?&output-quality=75&output-format=jpg
248	2019-06-25 23:57:16.055216+05:30	2019-06-25 23:57:16.055216+05:30	12	r1imghtlak.mmtcdn.com/3f38553e6b8211e7b73c0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
249	2019-06-25 23:57:16.066031+05:30	2019-06-25 23:57:16.066031+05:30	12	r1imghtlak.mmtcdn.com/sq9jtlhpm94ph14h4hv82eun004k.jpg?&output-quality=75&output-format=jpg
250	2019-06-25 23:57:16.07697+05:30	2019-06-25 23:57:16.07697+05:30	12	r1imghtlak.mmtcdn.com/3f3740406b8211e7b0e30a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
251	2019-06-25 23:57:16.088187+05:30	2019-06-25 23:57:16.088187+05:30	12	r1imghtlak.mmtcdn.com/404bb1f06b8211e784390a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
252	2019-06-25 23:57:16.099097+05:30	2019-06-25 23:57:16.099097+05:30	12	r1imghtlak.mmtcdn.com/410881546b8211e792c70a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
253	2019-06-25 23:57:16.110132+05:30	2019-06-25 23:57:16.110132+05:30	12	r1imghtlak.mmtcdn.com/41ba166c6b8211e792c70a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
254	2019-06-25 23:57:16.12245+05:30	2019-06-25 23:57:16.12245+05:30	12	r1imghtlak.mmtcdn.com/4274ab806b8211e787e40a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
255	2019-06-25 23:57:16.14405+05:30	2019-06-25 23:57:16.14405+05:30	12	r1imghtlak.mmtcdn.com/rj815bpe5l2fvcllu80t05tf007k.jpg?&output-quality=75&output-format=jpg
256	2019-06-25 23:57:16.166177+05:30	2019-06-25 23:57:16.166177+05:30	12	r1imghtlak.mmtcdn.com/3f38553e6b8211e7b73c0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
257	2019-06-25 23:57:16.177511+05:30	2019-06-25 23:57:16.177511+05:30	12	r1imghtlak.mmtcdn.com/sq9jtlhpm94ph14h4hv82eun004k.jpg?&output-quality=75&output-format=jpg
258	2019-06-25 23:57:16.187849+05:30	2019-06-25 23:57:16.187849+05:30	12	r1imghtlak.mmtcdn.com/3f3740406b8211e7b0e30a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
259	2019-06-25 23:57:16.199279+05:30	2019-06-25 23:57:16.199279+05:30	12	r1imghtlak.mmtcdn.com/404bb1f06b8211e784390a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
260	2019-06-25 23:57:16.210622+05:30	2019-06-25 23:57:16.210622+05:30	12	r1imghtlak.mmtcdn.com/410881546b8211e792c70a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
261	2019-06-25 23:57:16.220874+05:30	2019-06-25 23:57:16.220874+05:30	12	r1imghtlak.mmtcdn.com/41ba166c6b8211e792c70a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
262	2019-06-25 23:57:16.232369+05:30	2019-06-25 23:57:16.232369+05:30	12	r1imghtlak.mmtcdn.com/4274ab806b8211e787e40a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
263	2019-06-25 23:57:16.243634+05:30	2019-06-25 23:57:16.243634+05:30	12	r1imghtlak.mmtcdn.com/421322f26b8211e784390a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
264	2019-06-25 23:57:16.254732+05:30	2019-06-25 23:57:16.254732+05:30	12	r1imghtlak.mmtcdn.com/416f84086b8211e7b73c0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
265	2019-06-25 23:57:16.265231+05:30	2019-06-25 23:57:16.265231+05:30	12	r1imghtlak.mmtcdn.com/3fe413386b8211e787e40a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
266	2019-06-25 23:57:16.276679+05:30	2019-06-25 23:57:16.276679+05:30	12	r1imghtlak.mmtcdn.com/406c601c6b8211e7827b0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
267	2019-06-25 23:57:16.299663+05:30	2019-06-25 23:57:16.299663+05:30	12	r1imghtlak.mmtcdn.com/40ed19006b8211e7b73c0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
268	2019-06-25 23:57:16.320461+05:30	2019-06-25 23:57:16.320461+05:30	12	r1imghtlak.mmtcdn.com/3fdf0b5e6b8211e7b0e30a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
269	2019-06-25 23:57:16.33164+05:30	2019-06-25 23:57:16.33164+05:30	12	r1imghtlak.mmtcdn.com/406b802a6b8211e7b73c0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
270	2019-06-25 23:57:16.342565+05:30	2019-06-25 23:57:16.342565+05:30	12	r1imghtlak.mmtcdn.com/40756b4e6b8211e787e40a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
271	2019-06-25 23:57:16.354011+05:30	2019-06-25 23:57:16.354011+05:30	12	r1imghtlak.mmtcdn.com/40f7fbf46b8211e7a2a30a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
272	2019-06-25 23:57:16.36504+05:30	2019-06-25 23:57:16.36504+05:30	12	r1imghtlak.mmtcdn.com/410d35466b8211e7a5730a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
273	2019-06-25 23:57:16.376761+05:30	2019-06-25 23:57:16.376761+05:30	12	r1imghtlak.mmtcdn.com/419fc6726b8211e7a5730a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
274	2019-06-25 23:57:16.399815+05:30	2019-06-25 23:57:16.399815+05:30	12	r1imghtlak.mmtcdn.com/3fd6f68a6b8211e7827b0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
275	2019-06-25 23:57:16.421641+05:30	2019-06-25 23:57:16.421641+05:30	12	r1imghtlak.mmtcdn.com/8sg8usgv797bf511ikn9p3ma005a.jpg?&output-quality=75&output-format=jpg
276	2019-06-25 23:57:16.443703+05:30	2019-06-25 23:57:16.443703+05:30	12	r1imghtlak.mmtcdn.com/418066d86b8211e784390a4cef95d023.jpg?&output-quality=75&output-format=jpg
277	2019-06-25 23:57:16.464725+05:30	2019-06-25 23:57:16.464725+05:30	12	r1imghtlak.mmtcdn.com/1kjkhaqui51s147a373tgn8h007m.jpg?&output-quality=75&output-format=jpg
278	2019-06-25 23:57:16.476328+05:30	2019-06-25 23:57:16.476328+05:30	12	r1imghtlak.mmtcdn.com/3f569eea6b8211e7827b0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
279	2019-06-25 23:57:16.487645+05:30	2019-06-25 23:57:16.487645+05:30	12	r1imghtlak.mmtcdn.com/3fc327f46b8211e784390a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
280	2019-06-25 23:57:16.509632+05:30	2019-06-25 23:57:16.509632+05:30	12	r1imghtlak.mmtcdn.com/406672b06b8211e7b0e30a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
281	2019-06-25 23:57:16.532276+05:30	2019-06-25 23:57:16.532276+05:30	12	r1imghtlak.mmtcdn.com/40e80bcc6b8211e7b0e30a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
282	2019-06-25 23:57:16.554361+05:30	2019-06-25 23:57:16.554361+05:30	12	r1imghtlak.mmtcdn.com/41030a8a6b8211e7827b0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
283	2019-06-25 23:57:16.576172+05:30	2019-06-25 23:57:16.576172+05:30	12	r1imghtlak.mmtcdn.com/416f2c606b8211e7b0e30a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
284	2019-06-25 23:57:16.598258+05:30	2019-06-25 23:57:16.598258+05:30	12	r1imghtlak.mmtcdn.com/419b6ffa6b8211e7a2a30a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
285	2019-06-25 23:57:16.620435+05:30	2019-06-25 23:57:16.620435+05:30	12	r1imghtlak.mmtcdn.com/4212ba386b8211e7a2a30a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
286	2019-06-25 23:57:16.64216+05:30	2019-06-25 23:57:16.64216+05:30	12	r1imghtlak.mmtcdn.com/429cc21e6b8211e7a2a30a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
287	2019-06-25 23:57:16.664759+05:30	2019-06-25 23:57:16.664759+05:30	12	r1imghtlak.mmtcdn.com/432e998c6b8211e7a2a30a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
288	2019-06-25 23:57:21.546755+05:30	2019-06-25 23:57:21.546755+05:30	13	r1imghtlak.mmtcdn.com/99cec05075f511e79909025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
289	2019-06-25 23:57:21.557836+05:30	2019-06-25 23:57:21.557836+05:30	13	r1imghtlak.mmtcdn.com/9a571c1675f511e7915d0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
290	2019-06-25 23:57:21.56882+05:30	2019-06-25 23:57:21.56882+05:30	13	r1imghtlak.mmtcdn.com/9aa2e34475f511e79909025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
291	2019-06-25 23:57:21.580398+05:30	2019-06-25 23:57:21.580398+05:30	13	r1imghtlak.mmtcdn.com/9b57312875f511e79909025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
292	2019-06-25 23:57:21.591736+05:30	2019-06-25 23:57:21.591736+05:30	13	r1imghtlak.mmtcdn.com/9beabf7475f511e7bc530a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
293	2019-06-25 23:57:21.603425+05:30	2019-06-25 23:57:21.603425+05:30	13	r1imghtlak.mmtcdn.com/99d03a5c75f511e793a6025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
294	2019-06-25 23:57:21.625789+05:30	2019-06-25 23:57:21.625789+05:30	13	r1imghtlak.mmtcdn.com/9a77c16475f511e7b9e8025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
295	2019-06-25 23:57:21.648367+05:30	2019-06-25 23:57:21.648367+05:30	13	r1imghtlak.mmtcdn.com/99cec05075f511e79909025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
296	2019-06-25 23:57:21.669407+05:30	2019-06-25 23:57:21.669407+05:30	13	r1imghtlak.mmtcdn.com/9a571c1675f511e7915d0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
297	2019-06-25 23:57:21.691317+05:30	2019-06-25 23:57:21.691317+05:30	13	r1imghtlak.mmtcdn.com/9aa2e34475f511e79909025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
298	2019-06-25 23:57:21.702487+05:30	2019-06-25 23:57:21.702487+05:30	13	r1imghtlak.mmtcdn.com/9b57312875f511e79909025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
299	2019-06-25 23:57:21.712904+05:30	2019-06-25 23:57:21.712904+05:30	13	r1imghtlak.mmtcdn.com/9beabf7475f511e7bc530a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
300	2019-06-25 23:57:21.724236+05:30	2019-06-25 23:57:21.724236+05:30	13	r1imghtlak.mmtcdn.com/99d03a5c75f511e793a6025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
301	2019-06-25 23:57:21.735471+05:30	2019-06-25 23:57:21.735471+05:30	13	r1imghtlak.mmtcdn.com/9a77c16475f511e7b9e8025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
302	2019-06-25 23:57:21.746564+05:30	2019-06-25 23:57:21.746564+05:30	13	r1imghtlak.mmtcdn.com/99b7179875f511e7bc530a4cef95d023.jpg?&output-quality=75&output-format=jpg
303	2019-06-25 23:57:21.757387+05:30	2019-06-25 23:57:21.757387+05:30	13	r1imghtlak.mmtcdn.com/99cec05075f511e79909025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
304	2019-06-25 23:57:21.76872+05:30	2019-06-25 23:57:21.76872+05:30	13	r1imghtlak.mmtcdn.com/9a51ae4875f511e7bc530a4cef95d023.jpg?&output-quality=75&output-format=jpg
305	2019-06-25 23:57:21.779644+05:30	2019-06-25 23:57:21.779644+05:30	13	r1imghtlak.mmtcdn.com/9a571c1675f511e7915d0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
306	2019-06-25 23:57:21.790937+05:30	2019-06-25 23:57:21.790937+05:30	13	r1imghtlak.mmtcdn.com/9adac5c075f511e7bc530a4cef95d023.jpg?&output-quality=75&output-format=jpg
307	2019-06-25 23:57:21.801976+05:30	2019-06-25 23:57:21.801976+05:30	13	r1imghtlak.mmtcdn.com/9b269fc275f511e7b9e8025f77df004f.jpg?&output-quality=75&output-format=jpg
308	2019-06-25 23:57:21.812778+05:30	2019-06-25 23:57:21.812778+05:30	13	r1imghtlak.mmtcdn.com/9b57312875f511e79909025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
309	2019-06-25 23:57:21.824277+05:30	2019-06-25 23:57:21.824277+05:30	13	r1imghtlak.mmtcdn.com/9bba72ba75f511e7b9e8025f77df004f.jpg?&output-quality=75&output-format=jpg
310	2019-06-25 23:57:21.835216+05:30	2019-06-25 23:57:21.835216+05:30	13	r1imghtlak.mmtcdn.com/9c44f3a475f511e7b9e8025f77df004f.jpg?&output-quality=75&output-format=jpg
311	2019-06-25 23:57:21.846098+05:30	2019-06-25 23:57:21.846098+05:30	13	r1imghtlak.mmtcdn.com/9cdd298a75f511e79909025f77df004f.jpg?&output-quality=75&output-format=jpg
312	2019-06-25 23:57:21.85736+05:30	2019-06-25 23:57:21.85736+05:30	13	r1imghtlak.mmtcdn.com/9c51b3a075f511e7915d0a4cef95d023.jpg?&output-quality=75&output-format=jpg
313	2019-06-25 23:57:21.868395+05:30	2019-06-25 23:57:21.868395+05:30	13	r1imghtlak.mmtcdn.com/9bbe7eaa75f511e7915d0a4cef95d023.jpg?&output-quality=75&output-format=jpg
314	2019-06-25 23:57:21.879478+05:30	2019-06-25 23:57:21.879478+05:30	13	r1imghtlak.mmtcdn.com/99cadee075f511e7915d0a4cef95d023.jpg?&output-quality=75&output-format=jpg
315	2019-06-25 23:57:21.890573+05:30	2019-06-25 23:57:21.890573+05:30	13	r1imghtlak.mmtcdn.com/99c2fc9875f511e7b9e8025f77df004f.jpg?&output-quality=75&output-format=jpg
316	2019-06-25 23:57:21.90163+05:30	2019-06-25 23:57:21.90163+05:30	13	r1imghtlak.mmtcdn.com/99d03a5c75f511e793a6025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
317	2019-06-25 23:57:21.924743+05:30	2019-06-25 23:57:21.924743+05:30	13	r1imghtlak.mmtcdn.com/9a77c16475f511e7b9e8025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
318	2019-06-25 23:57:21.946678+05:30	2019-06-25 23:57:21.946678+05:30	13	r1imghtlak.mmtcdn.com/9c4489e675f511e79909025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
319	2019-06-25 23:57:21.968808+05:30	2019-06-25 23:57:21.968808+05:30	13	r1imghtlak.mmtcdn.com/9b14905275f511e7915d0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
320	2019-08-23 01:11:09.488283+05:30	2019-08-23 01:11:09.488283+05:30	14	r1imghtlak.mmtcdn.com/3365218a6f2711e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
321	2019-08-23 01:11:09.521691+05:30	2019-08-23 01:11:09.521691+05:30	14	r1imghtlak.mmtcdn.com/43a20b306f2711e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
322	2019-08-23 01:11:09.544408+05:30	2019-08-23 01:11:09.544408+05:30	14	r1imghtlak.mmtcdn.com/496071386f2711e798fc0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
323	2019-08-23 01:11:09.565871+05:30	2019-08-23 01:11:09.565871+05:30	14	r1imghtlak.mmtcdn.com/605daab86f2711e7886e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
324	2019-08-23 01:11:09.578141+05:30	2019-08-23 01:11:09.578141+05:30	14	r1imghtlak.mmtcdn.com/3365218a6f2711e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
325	2019-08-23 01:11:09.59822+05:30	2019-08-23 01:11:09.59822+05:30	14	r1imghtlak.mmtcdn.com/43a20b306f2711e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
326	2019-08-23 01:11:09.620726+05:30	2019-08-23 01:11:09.620726+05:30	14	r1imghtlak.mmtcdn.com/496071386f2711e798fc0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
327	2019-08-23 01:11:09.644143+05:30	2019-08-23 01:11:09.644143+05:30	14	r1imghtlak.mmtcdn.com/605daab86f2711e7886e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
328	2019-08-23 01:11:09.664791+05:30	2019-08-23 01:11:09.664791+05:30	14	r1imghtlak.mmtcdn.com/0b5c8d5827f811e6a6680015c5f4277e.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,68&output-format=jpg
329	2019-08-23 01:11:09.676072+05:30	2019-08-23 01:11:09.676072+05:30	14	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201605131553527667-23884b4c298d11e6b6ec0022195573b9.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
330	2019-08-23 01:11:09.68673+05:30	2019-08-23 01:11:09.68673+05:30	14	r1imghtlak.mmtcdn.com/359e98506f2711e798fc0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
331	2019-08-23 01:11:09.698076+05:30	2019-08-23 01:11:09.698076+05:30	14	r1imghtlak.mmtcdn.com/3814cee26f2711e7886e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
332	2019-08-23 01:11:09.709069+05:30	2019-08-23 01:11:09.709069+05:30	14	r1imghtlak.mmtcdn.com/3f45bf786f2711e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
333	2019-08-23 01:11:09.720727+05:30	2019-08-23 01:11:09.720727+05:30	14	r1imghtlak.mmtcdn.com/3f640d346f2711e798fc0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
334	2019-08-23 01:11:09.743515+05:30	2019-08-23 01:11:09.743515+05:30	14	r1imghtlak.mmtcdn.com/4d12abfc6f2711e7886e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
335	2019-08-23 01:11:09.764526+05:30	2019-08-23 01:11:09.764526+05:30	14	r1imghtlak.mmtcdn.com/52de55c26f2711e798fc0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
336	2019-08-23 01:11:09.776641+05:30	2019-08-23 01:11:09.776641+05:30	14	r1imghtlak.mmtcdn.com/5379e5826f2711e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
337	2019-08-23 01:11:09.798414+05:30	2019-08-23 01:11:09.798414+05:30	14	r1imghtlak.mmtcdn.com/55f38b606f2711e7886e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
338	2019-08-23 01:11:09.820784+05:30	2019-08-23 01:11:09.820784+05:30	14	r1imghtlak.mmtcdn.com/6292f1446f2711e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
339	2019-08-23 01:11:09.842042+05:30	2019-08-23 01:11:09.842042+05:30	14	r1imghtlak.mmtcdn.com/691bc1586f2711e7886e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
340	2019-08-23 01:11:18.644242+05:30	2019-08-23 01:11:18.644242+05:30	15	r1imghtlak.mmtcdn.com/fe8562602e5511e8bda00224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
341	2019-08-23 01:11:18.665039+05:30	2019-08-23 01:11:18.665039+05:30	15	r1imghtlak.mmtcdn.com/98d9bbf26ed211e782c6025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
342	2019-08-23 01:11:18.676313+05:30	2019-08-23 01:11:18.676313+05:30	15	r1imghtlak.mmtcdn.com/2c1d0b5e6ed211e7886e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
343	2019-08-23 01:11:18.687344+05:30	2019-08-23 01:11:18.687344+05:30	15	r1imghtlak.mmtcdn.com/50a3fda66ed311e7944d025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
344	2019-08-23 01:11:18.698437+05:30	2019-08-23 01:11:18.698437+05:30	15	r1imghtlak.mmtcdn.com/014a80d42e5611e883800224510f5e5b.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
345	2019-08-23 01:11:18.709478+05:30	2019-08-23 01:11:18.709478+05:30	15	r1imghtlak.mmtcdn.com/040b09062e5611e8af0002755708f0b3.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
346	2019-08-23 01:11:18.730858+05:30	2019-08-23 01:11:18.730858+05:30	15	r1imghtlak.mmtcdn.com/06e3beac2e5611e8bddb02755708f0b3.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
347	2019-08-23 01:11:18.742675+05:30	2019-08-23 01:11:18.742675+05:30	15	r1imghtlak.mmtcdn.com/0ce7d2482e5611e8beac0a9df65c8753.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
348	2019-08-23 01:11:18.753632+05:30	2019-08-23 01:11:18.753632+05:30	15	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-c41a00c8464511e9b6730242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;118,0&output-format=jpg
349	2019-08-23 01:11:18.764932+05:30	2019-08-23 01:11:18.764932+05:30	15	r1imghtlak.mmtcdn.com/fe8562602e5511e8bda00224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
350	2019-08-23 01:11:18.776551+05:30	2019-08-23 01:11:18.776551+05:30	15	r1imghtlak.mmtcdn.com/98d9bbf26ed211e782c6025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
351	2019-08-23 01:11:18.799297+05:30	2019-08-23 01:11:18.799297+05:30	15	r1imghtlak.mmtcdn.com/2c1d0b5e6ed211e7886e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
352	2019-08-23 01:11:18.821058+05:30	2019-08-23 01:11:18.821058+05:30	15	r1imghtlak.mmtcdn.com/50a3fda66ed311e7944d025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
353	2019-08-23 01:11:18.843463+05:30	2019-08-23 01:11:18.843463+05:30	15	r1imghtlak.mmtcdn.com/014a80d42e5611e883800224510f5e5b.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
354	2019-08-23 01:11:18.852803+05:30	2019-08-23 01:11:18.852803+05:30	15	r1imghtlak.mmtcdn.com/040b09062e5611e8af0002755708f0b3.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
355	2019-08-23 01:11:18.864206+05:30	2019-08-23 01:11:18.864206+05:30	15	r1imghtlak.mmtcdn.com/06e3beac2e5611e8bddb02755708f0b3.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
356	2019-08-23 01:11:18.875227+05:30	2019-08-23 01:11:18.875227+05:30	15	r1imghtlak.mmtcdn.com/0ce7d2482e5611e8beac0a9df65c8753.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
357	2019-08-23 01:11:18.886831+05:30	2019-08-23 01:11:18.886831+05:30	15	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-c41a00c8464511e9b6730242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;118,0&output-format=jpg
358	2019-08-23 01:11:18.898166+05:30	2019-08-23 01:11:18.898166+05:30	15	r1imghtlak.mmtcdn.com/0d5dbb342e5b11e8b9bf0224510f5e5b.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
359	2019-08-23 01:11:18.908325+05:30	2019-08-23 01:11:18.908325+05:30	15	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-e6d45d3e391111e9a5230242ac110004.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
360	2019-08-23 01:11:18.919735+05:30	2019-08-23 01:11:18.919735+05:30	15	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-eb45c3da391111e9a7790242ac110002.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
361	2019-08-23 01:11:18.931431+05:30	2019-08-23 01:11:18.931431+05:30	15	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-a323b40c3b1b11e9a7070242ac110002.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
362	2019-08-23 01:11:18.95249+05:30	2019-08-23 01:11:18.95249+05:30	15	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-67e766f6464511e9b35b0242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;118,0&output-format=jpg
363	2019-08-23 01:11:18.96487+05:30	2019-08-23 01:11:18.96487+05:30	15	r1imghtlak.mmtcdn.com/0d5dbb342e5b11e8b9bf0224510f5e5b.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
364	2019-08-23 01:11:18.986675+05:30	2019-08-23 01:11:18.986675+05:30	15	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-e6d45d3e391111e9a5230242ac110004.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
365	2019-08-23 01:11:19.009356+05:30	2019-08-23 01:11:19.009356+05:30	15	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-eb45c3da391111e9a7790242ac110002.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
366	2019-08-23 01:11:19.030876+05:30	2019-08-23 01:11:19.030876+05:30	15	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-a323b40c3b1b11e9a7070242ac110002.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
367	2019-08-23 01:11:19.042315+05:30	2019-08-23 01:11:19.042315+05:30	15	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-67e766f6464511e9b35b0242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;118,0&output-format=jpg
368	2019-08-23 01:11:19.052529+05:30	2019-08-23 01:11:19.052529+05:30	15	r1imghtlak.mmtcdn.com/4e0f85badd2b11e49ed732e76f7e45c9.jfif?&output-quality=75&downsize=*:350&crop=520:350;49,0&output-format=jpg
369	2019-08-23 01:11:19.063654+05:30	2019-08-23 01:11:19.063654+05:30	15	r1imghtlak.mmtcdn.com/4b12e3361c9f11e4af2932e76f7e45c9.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
370	2019-08-23 01:11:19.074991+05:30	2019-08-23 01:11:19.074991+05:30	15	r1imghtlak.mmtcdn.com/22b28e423b4711e5a8ff001ec9b85d13.jfif?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
371	2019-08-23 01:11:19.086411+05:30	2019-08-23 01:11:19.086411+05:30	15	r1imghtlak.mmtcdn.com/08d6d5963b4711e5bc94001ec9b85d13.jfif?&output-quality=75&downsize=*:350&crop=520:350;39,0&output-format=jpg
372	2019-08-23 01:11:19.097381+05:30	2019-08-23 01:11:19.097381+05:30	15	r1imghtlak.mmtcdn.com/6b8cb0741c9f11e4aa04daf4768ad8d9.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
373	2019-08-23 01:11:19.107501+05:30	2019-08-23 01:11:19.107501+05:30	15	r1imghtlak.mmtcdn.com/1e8413b21c9f11e484b3f67d89ce50a3.jpeg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
374	2019-08-23 01:11:19.119024+05:30	2019-08-23 01:11:19.119024+05:30	15	r1imghtlak.mmtcdn.com/2dcb485e1c9f11e489315ee5da2daa2a.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
375	2019-08-23 01:11:19.13029+05:30	2019-08-23 01:11:19.13029+05:30	15	r1imghtlak.mmtcdn.com/ecf12d2a6ed111e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
376	2019-08-23 01:11:19.14161+05:30	2019-08-23 01:11:19.14161+05:30	15	r1imghtlak.mmtcdn.com/ee3a652a6ed111e798fc0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;51,0&output-format=jpg
377	2019-08-23 01:11:19.152338+05:30	2019-08-23 01:11:19.152338+05:30	15	r1imghtlak.mmtcdn.com/fca9dbb86ed111e78bf60a4cef95d023.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
378	2019-08-23 01:11:19.164345+05:30	2019-08-23 01:11:19.164345+05:30	15	r1imghtlak.mmtcdn.com/fdfe77e46ed111e7b9780a4cef95d023.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
379	2019-08-23 01:11:19.186298+05:30	2019-08-23 01:11:19.186298+05:30	15	r1imghtlak.mmtcdn.com/2c118f546ed211e7afa30a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
380	2019-08-23 01:11:19.208351+05:30	2019-08-23 01:11:19.208351+05:30	15	r1imghtlak.mmtcdn.com/381d57c46ed211e7b193025f77df004f.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,12&output-format=jpg
381	2019-08-23 01:11:19.231814+05:30	2019-08-23 01:11:19.231814+05:30	15	r1imghtlak.mmtcdn.com/44fde6de6ed211e7b9780a4cef95d023.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
382	2019-08-23 01:11:19.253197+05:30	2019-08-23 01:11:19.253197+05:30	15	r1imghtlak.mmtcdn.com/477e69ba6ed211e7bec90a4cef95d023.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
383	2019-08-23 01:11:19.275819+05:30	2019-08-23 01:11:19.275819+05:30	15	r1imghtlak.mmtcdn.com/567c03d26ed211e799cf025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
384	2019-08-23 01:11:19.29615+05:30	2019-08-23 01:11:19.29615+05:30	15	r1imghtlak.mmtcdn.com/5d3d83806ed211e7b193025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;51,0&output-format=jpg
385	2019-08-23 01:11:19.307918+05:30	2019-08-23 01:11:19.307918+05:30	15	r1imghtlak.mmtcdn.com/616ce7706ed211e7b07f025f77df004f.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
386	2019-08-23 01:11:19.320239+05:30	2019-08-23 01:11:19.320239+05:30	15	r1imghtlak.mmtcdn.com/62c22bbc6ed211e782c6025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
387	2019-08-23 01:11:19.341533+05:30	2019-08-23 01:11:19.341533+05:30	15	r1imghtlak.mmtcdn.com/6f41b68c6ed211e7a5fc025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
388	2019-08-23 01:11:19.351594+05:30	2019-08-23 01:11:19.351594+05:30	15	r1imghtlak.mmtcdn.com/7d26e11e6ed211e7afa30a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;51,0&output-format=jpg
389	2019-08-23 01:11:19.362902+05:30	2019-08-23 01:11:19.362902+05:30	15	r1imghtlak.mmtcdn.com/83346bee6ed211e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;51,0&output-format=jpg
390	2019-08-23 01:11:19.374029+05:30	2019-08-23 01:11:19.374029+05:30	15	r1imghtlak.mmtcdn.com/a2417c426ed311e799cf025f77df004f.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
391	2019-08-23 01:11:19.384565+05:30	2019-08-23 01:11:19.384565+05:30	15	r1imghtlak.mmtcdn.com/1d5a3a08da8211e785380a209fbd0127.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
392	2019-08-23 01:11:19.39675+05:30	2019-08-23 01:11:19.39675+05:30	15	r1imghtlak.mmtcdn.com/780e73bada8211e7899202755708f0b3.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
393	2019-08-23 01:11:19.4184+05:30	2019-08-23 01:11:19.4184+05:30	15	r1imghtlak.mmtcdn.com/7dec160cda8211e785380a209fbd0127.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
394	2019-08-23 01:11:19.429638+05:30	2019-08-23 01:11:19.429638+05:30	15	r1imghtlak.mmtcdn.com/8ac08f7ada8211e79a6a02755708f0b3.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
395	2019-08-23 01:11:19.439831+05:30	2019-08-23 01:11:19.439831+05:30	15	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-da25ac303b6b11e9a7ca0242ac110003.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
396	2019-08-23 01:11:19.451045+05:30	2019-08-23 01:11:19.451045+05:30	15	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-33cb871e3b6c11e9b07c0242ac110005.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
397	2019-08-23 01:11:19.463437+05:30	2019-08-23 01:11:19.463437+05:30	15	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-6e2e1b903d0311e980de0242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;118,0&output-format=jpg
398	2019-08-23 01:11:19.485084+05:30	2019-08-23 01:11:19.485084+05:30	15	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-1a665f9e402411e982d20242ac110003.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
399	2019-08-23 01:11:19.507046+05:30	2019-08-23 01:11:19.507046+05:30	15	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-b2dce05e402411e98d4c0242ac110003.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
400	2019-08-23 01:12:09.566004+05:30	2019-08-23 01:12:09.566004+05:30	16	r1imghtlak.mmtcdn.com/3365218a6f2711e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
401	2019-08-23 01:12:09.576738+05:30	2019-08-23 01:12:09.576738+05:30	16	r1imghtlak.mmtcdn.com/43a20b306f2711e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
402	2019-08-23 01:12:09.587732+05:30	2019-08-23 01:12:09.587732+05:30	16	r1imghtlak.mmtcdn.com/496071386f2711e798fc0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
403	2019-08-23 01:12:09.610477+05:30	2019-08-23 01:12:09.610477+05:30	16	r1imghtlak.mmtcdn.com/605daab86f2711e7886e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
404	2019-08-23 01:12:09.63277+05:30	2019-08-23 01:12:09.63277+05:30	16	r1imghtlak.mmtcdn.com/3365218a6f2711e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
405	2019-08-23 01:12:09.65426+05:30	2019-08-23 01:12:09.65426+05:30	16	r1imghtlak.mmtcdn.com/43a20b306f2711e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
406	2019-08-23 01:12:09.665548+05:30	2019-08-23 01:12:09.665548+05:30	16	r1imghtlak.mmtcdn.com/496071386f2711e798fc0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
407	2019-08-23 01:12:09.675982+05:30	2019-08-23 01:12:09.675982+05:30	16	r1imghtlak.mmtcdn.com/605daab86f2711e7886e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
408	2019-08-23 01:12:09.68758+05:30	2019-08-23 01:12:09.68758+05:30	16	r1imghtlak.mmtcdn.com/0b5c8d5827f811e6a6680015c5f4277e.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,68&output-format=jpg
409	2019-08-23 01:12:09.710166+05:30	2019-08-23 01:12:09.710166+05:30	16	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201605131553527667-23884b4c298d11e6b6ec0022195573b9.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
410	2019-08-23 01:12:09.720143+05:30	2019-08-23 01:12:09.720143+05:30	16	r1imghtlak.mmtcdn.com/359e98506f2711e798fc0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
411	2019-08-23 01:12:09.731715+05:30	2019-08-23 01:12:09.731715+05:30	16	r1imghtlak.mmtcdn.com/3814cee26f2711e7886e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
412	2019-08-23 01:12:09.742909+05:30	2019-08-23 01:12:09.742909+05:30	16	r1imghtlak.mmtcdn.com/3f45bf786f2711e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
413	2019-08-23 01:12:09.754+05:30	2019-08-23 01:12:09.754+05:30	16	r1imghtlak.mmtcdn.com/3f640d346f2711e798fc0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
414	2019-08-23 01:12:09.764794+05:30	2019-08-23 01:12:09.764794+05:30	16	r1imghtlak.mmtcdn.com/4d12abfc6f2711e7886e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
415	2019-08-23 01:12:09.776103+05:30	2019-08-23 01:12:09.776103+05:30	16	r1imghtlak.mmtcdn.com/52de55c26f2711e798fc0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
416	2019-08-23 01:12:09.79877+05:30	2019-08-23 01:12:09.79877+05:30	16	r1imghtlak.mmtcdn.com/5379e5826f2711e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
417	2019-08-23 01:12:09.821513+05:30	2019-08-23 01:12:09.821513+05:30	16	r1imghtlak.mmtcdn.com/55f38b606f2711e7886e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
418	2019-08-23 01:12:09.844093+05:30	2019-08-23 01:12:09.844093+05:30	16	r1imghtlak.mmtcdn.com/6292f1446f2711e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
419	2019-08-23 01:12:09.865203+05:30	2019-08-23 01:12:09.865203+05:30	16	r1imghtlak.mmtcdn.com/691bc1586f2711e7886e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
420	2019-08-23 01:12:19.818784+05:30	2019-08-23 01:12:19.818784+05:30	17	r1imghtlak.mmtcdn.com/fe8562602e5511e8bda00224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
421	2019-08-23 01:12:19.850878+05:30	2019-08-23 01:12:19.850878+05:30	17	r1imghtlak.mmtcdn.com/98d9bbf26ed211e782c6025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
422	2019-08-23 01:12:19.872648+05:30	2019-08-23 01:12:19.872648+05:30	17	r1imghtlak.mmtcdn.com/2c1d0b5e6ed211e7886e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
423	2019-08-23 01:12:19.894686+05:30	2019-08-23 01:12:19.894686+05:30	17	r1imghtlak.mmtcdn.com/50a3fda66ed311e7944d025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
424	2019-08-23 01:12:19.904536+05:30	2019-08-23 01:12:19.904536+05:30	17	r1imghtlak.mmtcdn.com/014a80d42e5611e883800224510f5e5b.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
425	2019-08-23 01:12:19.916412+05:30	2019-08-23 01:12:19.916412+05:30	17	r1imghtlak.mmtcdn.com/040b09062e5611e8af0002755708f0b3.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
426	2019-08-23 01:12:19.9273+05:30	2019-08-23 01:12:19.9273+05:30	17	r1imghtlak.mmtcdn.com/06e3beac2e5611e8bddb02755708f0b3.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
427	2019-08-23 01:12:19.938834+05:30	2019-08-23 01:12:19.938834+05:30	17	r1imghtlak.mmtcdn.com/0ce7d2482e5611e8beac0a9df65c8753.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
428	2019-08-23 01:12:19.961254+05:30	2019-08-23 01:12:19.961254+05:30	17	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-c41a00c8464511e9b6730242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;118,0&output-format=jpg
429	2019-08-23 01:12:19.97179+05:30	2019-08-23 01:12:19.97179+05:30	17	r1imghtlak.mmtcdn.com/fe8562602e5511e8bda00224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
430	2019-08-23 01:12:19.982121+05:30	2019-08-23 01:12:19.982121+05:30	17	r1imghtlak.mmtcdn.com/98d9bbf26ed211e782c6025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
431	2019-08-23 01:12:19.993206+05:30	2019-08-23 01:12:19.993206+05:30	17	r1imghtlak.mmtcdn.com/2c1d0b5e6ed211e7886e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
432	2019-08-23 01:12:20.005188+05:30	2019-08-23 01:12:20.005188+05:30	17	r1imghtlak.mmtcdn.com/50a3fda66ed311e7944d025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
433	2019-08-23 01:12:20.081627+05:30	2019-08-23 01:12:20.081627+05:30	17	r1imghtlak.mmtcdn.com/014a80d42e5611e883800224510f5e5b.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
434	2019-08-23 01:12:20.092499+05:30	2019-08-23 01:12:20.092499+05:30	17	r1imghtlak.mmtcdn.com/040b09062e5611e8af0002755708f0b3.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
435	2019-08-23 01:12:20.103638+05:30	2019-08-23 01:12:20.103638+05:30	17	r1imghtlak.mmtcdn.com/06e3beac2e5611e8bddb02755708f0b3.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
436	2019-08-23 01:12:20.1147+05:30	2019-08-23 01:12:20.1147+05:30	17	r1imghtlak.mmtcdn.com/0ce7d2482e5611e8beac0a9df65c8753.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
437	2019-08-23 01:12:20.125871+05:30	2019-08-23 01:12:20.125871+05:30	17	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-c41a00c8464511e9b6730242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;118,0&output-format=jpg
438	2019-08-23 01:12:20.1371+05:30	2019-08-23 01:12:20.1371+05:30	17	r1imghtlak.mmtcdn.com/0d5dbb342e5b11e8b9bf0224510f5e5b.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
439	2019-08-23 01:12:20.148101+05:30	2019-08-23 01:12:20.148101+05:30	17	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-e6d45d3e391111e9a5230242ac110004.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
440	2019-08-23 01:12:20.158977+05:30	2019-08-23 01:12:20.158977+05:30	17	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-eb45c3da391111e9a7790242ac110002.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
441	2019-08-23 01:12:20.170077+05:30	2019-08-23 01:12:20.170077+05:30	17	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-a323b40c3b1b11e9a7070242ac110002.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
442	2019-08-23 01:12:20.181167+05:30	2019-08-23 01:12:20.181167+05:30	17	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-67e766f6464511e9b35b0242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;118,0&output-format=jpg
443	2019-08-23 01:12:20.192096+05:30	2019-08-23 01:12:20.192096+05:30	17	r1imghtlak.mmtcdn.com/0d5dbb342e5b11e8b9bf0224510f5e5b.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
444	2019-08-23 01:12:20.203267+05:30	2019-08-23 01:12:20.203267+05:30	17	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-e6d45d3e391111e9a5230242ac110004.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
445	2019-08-23 01:12:20.214622+05:30	2019-08-23 01:12:20.214622+05:30	17	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-eb45c3da391111e9a7790242ac110002.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
446	2019-08-23 01:12:20.226386+05:30	2019-08-23 01:12:20.226386+05:30	17	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-a323b40c3b1b11e9a7070242ac110002.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
447	2019-08-23 01:12:20.245571+05:30	2019-08-23 01:12:20.245571+05:30	17	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-67e766f6464511e9b35b0242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;118,0&output-format=jpg
448	2019-08-23 01:12:20.260036+05:30	2019-08-23 01:12:20.260036+05:30	17	r1imghtlak.mmtcdn.com/4e0f85badd2b11e49ed732e76f7e45c9.jfif?&output-quality=75&downsize=*:350&crop=520:350;49,0&output-format=jpg
449	2019-08-23 01:12:20.284753+05:30	2019-08-23 01:12:20.284753+05:30	17	r1imghtlak.mmtcdn.com/4b12e3361c9f11e4af2932e76f7e45c9.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
450	2019-08-23 01:12:20.303723+05:30	2019-08-23 01:12:20.303723+05:30	17	r1imghtlak.mmtcdn.com/22b28e423b4711e5a8ff001ec9b85d13.jfif?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
451	2019-08-23 01:12:20.314193+05:30	2019-08-23 01:12:20.314193+05:30	17	r1imghtlak.mmtcdn.com/08d6d5963b4711e5bc94001ec9b85d13.jfif?&output-quality=75&downsize=*:350&crop=520:350;39,0&output-format=jpg
452	2019-08-23 01:12:20.325319+05:30	2019-08-23 01:12:20.325319+05:30	17	r1imghtlak.mmtcdn.com/6b8cb0741c9f11e4aa04daf4768ad8d9.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
453	2019-08-23 01:12:20.337039+05:30	2019-08-23 01:12:20.337039+05:30	17	r1imghtlak.mmtcdn.com/1e8413b21c9f11e484b3f67d89ce50a3.jpeg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
454	2019-08-23 01:12:20.359361+05:30	2019-08-23 01:12:20.359361+05:30	17	r1imghtlak.mmtcdn.com/2dcb485e1c9f11e489315ee5da2daa2a.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
455	2019-08-23 01:12:20.370904+05:30	2019-08-23 01:12:20.370904+05:30	17	r1imghtlak.mmtcdn.com/ecf12d2a6ed111e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
456	2019-08-23 01:12:20.380723+05:30	2019-08-23 01:12:20.380723+05:30	17	r1imghtlak.mmtcdn.com/ee3a652a6ed111e798fc0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;51,0&output-format=jpg
457	2019-08-23 01:12:20.392849+05:30	2019-08-23 01:12:20.392849+05:30	17	r1imghtlak.mmtcdn.com/fca9dbb86ed111e78bf60a4cef95d023.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
458	2019-08-23 01:12:20.402902+05:30	2019-08-23 01:12:20.402902+05:30	17	r1imghtlak.mmtcdn.com/fdfe77e46ed111e7b9780a4cef95d023.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
459	2019-08-23 01:12:20.415296+05:30	2019-08-23 01:12:20.415296+05:30	17	r1imghtlak.mmtcdn.com/2c118f546ed211e7afa30a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
460	2019-08-23 01:12:20.425609+05:30	2019-08-23 01:12:20.425609+05:30	17	r1imghtlak.mmtcdn.com/381d57c46ed211e7b193025f77df004f.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,12&output-format=jpg
461	2019-08-23 01:12:20.43594+05:30	2019-08-23 01:12:20.43594+05:30	17	r1imghtlak.mmtcdn.com/44fde6de6ed211e7b9780a4cef95d023.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
462	2019-08-23 01:12:20.446963+05:30	2019-08-23 01:12:20.446963+05:30	17	r1imghtlak.mmtcdn.com/477e69ba6ed211e7bec90a4cef95d023.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
463	2019-08-23 01:12:20.458028+05:30	2019-08-23 01:12:20.458028+05:30	17	r1imghtlak.mmtcdn.com/567c03d26ed211e799cf025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
464	2019-08-23 01:12:20.469047+05:30	2019-08-23 01:12:20.469047+05:30	17	r1imghtlak.mmtcdn.com/5d3d83806ed211e7b193025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;51,0&output-format=jpg
465	2019-08-23 01:12:20.480264+05:30	2019-08-23 01:12:20.480264+05:30	17	r1imghtlak.mmtcdn.com/616ce7706ed211e7b07f025f77df004f.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
466	2019-08-23 01:12:20.491823+05:30	2019-08-23 01:12:20.491823+05:30	17	r1imghtlak.mmtcdn.com/62c22bbc6ed211e782c6025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
467	2019-08-23 01:12:20.502369+05:30	2019-08-23 01:12:20.502369+05:30	17	r1imghtlak.mmtcdn.com/6f41b68c6ed211e7a5fc025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
468	2019-08-23 01:12:20.513434+05:30	2019-08-23 01:12:20.513434+05:30	17	r1imghtlak.mmtcdn.com/7d26e11e6ed211e7afa30a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;51,0&output-format=jpg
469	2019-08-23 01:12:20.524479+05:30	2019-08-23 01:12:20.524479+05:30	17	r1imghtlak.mmtcdn.com/83346bee6ed211e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;51,0&output-format=jpg
470	2019-08-23 01:12:20.536051+05:30	2019-08-23 01:12:20.536051+05:30	17	r1imghtlak.mmtcdn.com/a2417c426ed311e799cf025f77df004f.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
471	2019-08-23 01:12:20.546692+05:30	2019-08-23 01:12:20.546692+05:30	17	r1imghtlak.mmtcdn.com/1d5a3a08da8211e785380a209fbd0127.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
472	2019-08-23 01:12:20.557709+05:30	2019-08-23 01:12:20.557709+05:30	17	r1imghtlak.mmtcdn.com/780e73bada8211e7899202755708f0b3.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
473	2019-08-23 01:12:20.569007+05:30	2019-08-23 01:12:20.569007+05:30	17	r1imghtlak.mmtcdn.com/7dec160cda8211e785380a209fbd0127.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
474	2019-08-23 01:12:20.57991+05:30	2019-08-23 01:12:20.57991+05:30	17	r1imghtlak.mmtcdn.com/8ac08f7ada8211e79a6a02755708f0b3.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
475	2019-08-23 01:12:20.591014+05:30	2019-08-23 01:12:20.591014+05:30	17	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-da25ac303b6b11e9a7ca0242ac110003.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
476	2019-08-23 01:12:20.602192+05:30	2019-08-23 01:12:20.602192+05:30	17	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-33cb871e3b6c11e9b07c0242ac110005.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
477	2019-08-23 01:12:20.613434+05:30	2019-08-23 01:12:20.613434+05:30	17	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-6e2e1b903d0311e980de0242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;118,0&output-format=jpg
478	2019-08-23 01:12:20.624317+05:30	2019-08-23 01:12:20.624317+05:30	17	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-1a665f9e402411e982d20242ac110003.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
479	2019-08-23 01:12:20.636035+05:30	2019-08-23 01:12:20.636035+05:30	17	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-b2dce05e402411e98d4c0242ac110003.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
480	2019-08-23 01:13:14.039005+05:30	2019-08-23 01:13:14.039005+05:30	18	r1imghtlak.mmtcdn.com/6c9184aed76711e38a64f67d89ce50a3.jpeg?&output-quality=75&downsize=520:*&crop=520:350;0,171&output-format=jpg
481	2019-08-23 01:13:14.060613+05:30	2019-08-23 01:13:14.060613+05:30	18	r1imghtlak.mmtcdn.com/fdf13b9cc3a411e781650a9df65c8753.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
482	2019-08-23 01:13:14.083784+05:30	2019-08-23 01:13:14.083784+05:30	18	r1imghtlak.mmtcdn.com/6c9184aed76711e38a64f67d89ce50a3.jpeg?&output-quality=75&downsize=520:*&crop=520:350;0,171&output-format=jpg
483	2019-08-23 01:13:14.105905+05:30	2019-08-23 01:13:14.105905+05:30	18	r1imghtlak.mmtcdn.com/fdf13b9cc3a411e781650a9df65c8753.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
484	2019-08-23 01:13:14.116121+05:30	2019-08-23 01:13:14.116121+05:30	18	r1imghtlak.mmtcdn.com/b677d18a6d2e11e780080a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
485	2019-08-23 01:13:14.128411+05:30	2019-08-23 01:13:14.128411+05:30	18	r1imghtlak.mmtcdn.com/993496c06d2f11e79a460a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
486	2019-08-23 01:13:14.138024+05:30	2019-08-23 01:13:14.138024+05:30	18	r1imghtlak.mmtcdn.com/5d1ebfb0f1df11e690790a9df65c8753.jfif?&output-quality=75&downsize=*:350&crop=520:350;3,0&output-format=jpg
487	2019-08-23 01:13:14.148984+05:30	2019-08-23 01:13:14.148984+05:30	18	r1imghtlak.mmtcdn.com/b677d18a6d2e11e780080a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
488	2019-08-23 01:13:14.160148+05:30	2019-08-23 01:13:14.160148+05:30	18	r1imghtlak.mmtcdn.com/993496c06d2f11e79a460a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
489	2019-08-23 01:13:14.171567+05:30	2019-08-23 01:13:14.171567+05:30	18	r1imghtlak.mmtcdn.com/5d1ebfb0f1df11e690790a9df65c8753.jfif?&output-quality=75&downsize=*:350&crop=520:350;3,0&output-format=jpg
490	2019-08-23 01:13:14.182464+05:30	2019-08-23 01:13:14.182464+05:30	18	r1imghtlak.mmtcdn.com/224071e8c3a511e7b5f30224510f5e5b.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
491	2019-08-23 01:13:14.194775+05:30	2019-08-23 01:13:14.194775+05:30	18	r1imghtlak.mmtcdn.com/224071e8c3a511e7b5f30224510f5e5b.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
492	2019-08-23 01:13:14.216803+05:30	2019-08-23 01:13:14.216803+05:30	18	r1imghtlak.mmtcdn.com/ba81a1cc6d3611e784480a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
493	2019-08-23 01:13:14.237788+05:30	2019-08-23 01:13:14.237788+05:30	18	r1imghtlak.mmtcdn.com/574aff406d3111e7abd4025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
494	2019-08-23 01:13:14.249188+05:30	2019-08-23 01:13:14.249188+05:30	18	r1imghtlak.mmtcdn.com/b60dc8906d3211e7b4d3025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
495	2019-08-23 01:13:14.260118+05:30	2019-08-23 01:13:14.260118+05:30	18	r1imghtlak.mmtcdn.com/a700cc16c3a511e789300a9df65c8753.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
496	2019-08-23 01:13:14.282936+05:30	2019-08-23 01:13:14.282936+05:30	18	r1imghtlak.mmtcdn.com/ba81a1cc6d3611e784480a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
497	2019-08-23 01:13:14.293348+05:30	2019-08-23 01:13:14.293348+05:30	18	r1imghtlak.mmtcdn.com/574aff406d3111e7abd4025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
498	2019-08-23 01:13:14.37076+05:30	2019-08-23 01:13:14.37076+05:30	18	r1imghtlak.mmtcdn.com/b60dc8906d3211e7b4d3025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
499	2019-08-23 01:13:14.404013+05:30	2019-08-23 01:13:14.404013+05:30	18	r1imghtlak.mmtcdn.com/a700cc16c3a511e789300a9df65c8753.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
500	2019-08-23 01:13:14.427292+05:30	2019-08-23 01:13:14.427292+05:30	18	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/200907161027423392-90dca7a4d76611e3a6ebbaaf629e9523.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
501	2019-08-23 01:13:14.448868+05:30	2019-08-23 01:13:14.448868+05:30	18	r1imghtlak.mmtcdn.com/8b6ce9386d3011e7a456025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
502	2019-08-23 01:13:14.459535+05:30	2019-08-23 01:13:14.459535+05:30	18	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/200907161027423392-182f130ed76711e3bad8f67d89ce50a3.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
503	2019-08-23 01:13:14.469922+05:30	2019-08-23 01:13:14.469922+05:30	18	r1imghtlak.mmtcdn.com/246e75de6d3111e7abd4025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
504	2019-08-23 01:13:14.481286+05:30	2019-08-23 01:13:14.481286+05:30	18	r1imghtlak.mmtcdn.com/3b3641fc6d3611e79a460a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
505	2019-08-23 01:13:14.492499+05:30	2019-08-23 01:13:14.492499+05:30	18	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/200907161027423392-861fc35e111711e6abfe0015c5f4277e.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
506	2019-08-23 01:13:14.503847+05:30	2019-08-23 01:13:14.503847+05:30	18	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/200907161027423392-90dca7a4d76611e3a6ebbaaf629e9523.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
507	2019-08-23 01:13:14.526448+05:30	2019-08-23 01:13:14.526448+05:30	18	r1imghtlak.mmtcdn.com/8b6ce9386d3011e7a456025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
508	2019-08-23 01:13:14.53626+05:30	2019-08-23 01:13:14.53626+05:30	18	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/200907161027423392-182f130ed76711e3bad8f67d89ce50a3.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
509	2019-08-23 01:13:14.548088+05:30	2019-08-23 01:13:14.548088+05:30	18	r1imghtlak.mmtcdn.com/246e75de6d3111e7abd4025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
510	2019-08-23 01:13:14.558977+05:30	2019-08-23 01:13:14.558977+05:30	18	r1imghtlak.mmtcdn.com/3b3641fc6d3611e79a460a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
511	2019-08-23 01:13:14.569793+05:30	2019-08-23 01:13:14.569793+05:30	18	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/200907161027423392-861fc35e111711e6abfe0015c5f4277e.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
512	2019-08-23 01:13:14.581257+05:30	2019-08-23 01:13:14.581257+05:30	18	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/200907161027423392-961c370ed12911e3b4b4f67d89ce50a3.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
513	2019-08-23 01:13:14.592502+05:30	2019-08-23 01:13:14.592502+05:30	18	r1imghtlak.mmtcdn.com/ac28cdd4c3a411e78b910a9df65c8753.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
514	2019-08-23 01:13:14.602871+05:30	2019-08-23 01:13:14.602871+05:30	18	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/200907161027423392-961c370ed12911e3b4b4f67d89ce50a3.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
515	2019-08-23 01:13:14.614317+05:30	2019-08-23 01:13:14.614317+05:30	18	r1imghtlak.mmtcdn.com/ac28cdd4c3a411e78b910a9df65c8753.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
516	2019-08-23 01:13:14.625338+05:30	2019-08-23 01:13:14.625338+05:30	18	r1imghtlak.mmtcdn.com/e7062bfaf1df11e6ab350a209fbd0127.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
517	2019-08-23 01:13:14.63645+05:30	2019-08-23 01:13:14.63645+05:30	18	r1imghtlak.mmtcdn.com/0e6c8806f1e011e6876b02bf5ac07431.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
518	2019-08-23 01:13:14.647755+05:30	2019-08-23 01:13:14.647755+05:30	18	r1imghtlak.mmtcdn.com/e7062bfaf1df11e6ab350a209fbd0127.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
519	2019-08-23 01:13:14.658548+05:30	2019-08-23 01:13:14.658548+05:30	18	r1imghtlak.mmtcdn.com/0e6c8806f1e011e6876b02bf5ac07431.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
520	2019-08-23 01:13:14.669539+05:30	2019-08-23 01:13:14.669539+05:30	18	r1imghtlak.mmtcdn.com/77edfe22c3a411e7801d0a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;51,0&output-format=jpg
521	2019-08-23 01:13:14.680789+05:30	2019-08-23 01:13:14.680789+05:30	18	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/200907161027423392-e93dbcb6111711e6a03b001ec9b85d13.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
522	2019-08-23 01:13:14.691805+05:30	2019-08-23 01:13:14.691805+05:30	18	r1imghtlak.mmtcdn.com/77edfe22c3a411e7801d0a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;51,0&output-format=jpg
523	2019-08-23 01:13:14.702796+05:30	2019-08-23 01:13:14.702796+05:30	18	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/200907161027423392-e93dbcb6111711e6a03b001ec9b85d13.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
524	2019-08-23 01:13:14.714032+05:30	2019-08-23 01:13:14.714032+05:30	18	r1imghtlak.mmtcdn.com/6e1e6acc6d3611e79a460a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
525	2019-08-23 01:13:14.725072+05:30	2019-08-23 01:13:14.725072+05:30	18	r1imghtlak.mmtcdn.com/a72d5388028511e4be5ff67d89ce50a3.jpeg?&output-quality=75&downsize=*:350&crop=520:350;23,0&output-format=jpg
526	2019-08-23 01:13:14.736649+05:30	2019-08-23 01:13:14.736649+05:30	18	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/200907161027423392-db2b06a8d12011e39347baaf629e9523.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
527	2019-08-23 01:13:14.747119+05:30	2019-08-23 01:13:14.747119+05:30	18	r1imghtlak.mmtcdn.com/5e51f778d76411e3a6ebbaaf629e9523.jpeg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
528	2019-08-23 01:13:14.758002+05:30	2019-08-23 01:13:14.758002+05:30	18	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/200907161027423392-3c838764d76511e38a64f67d89ce50a3.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
529	2019-08-23 01:13:14.769275+05:30	2019-08-23 01:13:14.769275+05:30	18	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/200907161027423392-c3873850d76511e38bcabaaf629e9523.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
530	2019-08-23 01:13:14.780504+05:30	2019-08-23 01:13:14.780504+05:30	18	r1imghtlak.mmtcdn.com/fc6afc1ad76511e38a64f67d89ce50a3.jpeg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
531	2019-08-23 01:13:14.803998+05:30	2019-08-23 01:13:14.803998+05:30	18	r1imghtlak.mmtcdn.com/4f9e74466d2e11e780080a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
532	2019-08-23 01:13:14.825322+05:30	2019-08-23 01:13:14.825322+05:30	18	r1imghtlak.mmtcdn.com/d885d9e86d2e11e780080a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
533	2019-08-23 01:13:14.848579+05:30	2019-08-23 01:13:14.848579+05:30	18	r1imghtlak.mmtcdn.com/305563a06d2f11e7bd4f0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
534	2019-08-23 01:13:14.892155+05:30	2019-08-23 01:13:14.892155+05:30	18	r1imghtlak.mmtcdn.com/4e6872f66d2f11e7bd4f0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
535	2019-08-23 01:13:14.914638+05:30	2019-08-23 01:13:14.914638+05:30	18	r1imghtlak.mmtcdn.com/2de27e046d3011e7a456025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
536	2019-08-23 01:13:14.935396+05:30	2019-08-23 01:13:14.935396+05:30	18	r1imghtlak.mmtcdn.com/ba6c2e246d3011e7a456025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
537	2019-08-23 01:13:14.948047+05:30	2019-08-23 01:13:14.948047+05:30	18	r1imghtlak.mmtcdn.com/e92947b06d3011e7a456025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
538	2019-08-23 01:13:14.968634+05:30	2019-08-23 01:13:14.968634+05:30	18	r1imghtlak.mmtcdn.com/983e43da6d3211e7b4d3025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
539	2019-08-23 01:13:14.980584+05:30	2019-08-23 01:13:14.980584+05:30	18	r1imghtlak.mmtcdn.com/f1eab1706d3211e7b4d3025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
540	2019-08-23 01:13:29.40506+05:30	2019-08-23 01:13:29.40506+05:30	19	r1imghtlak.mmtcdn.com/2193ed3e7b0511e8a9220261db56d4cc.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
541	2019-08-23 01:13:29.416186+05:30	2019-08-23 01:13:29.416186+05:30	19	r1imghtlak.mmtcdn.com/22a72b827b0511e8b83a0ab31350c864.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
542	2019-08-23 01:13:29.438388+05:30	2019-08-23 01:13:29.438388+05:30	19	r1imghtlak.mmtcdn.com/21ab6c5c7b0511e8a4640ac813d17884.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
543	2019-08-23 01:13:29.46064+05:30	2019-08-23 01:13:29.46064+05:30	19	r1imghtlak.mmtcdn.com/229a612c7b0511e8b11a0ac813d17884.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
544	2019-08-23 01:13:29.47116+05:30	2019-08-23 01:13:29.47116+05:30	19	r1imghtlak.mmtcdn.com/9c19151c7b0411e8be4602755708f0b3.jpg?&output-quality=75&downsize=*:350&crop=520:350;80,0&output-format=jpg
545	2019-08-23 01:13:29.481905+05:30	2019-08-23 01:13:29.481905+05:30	19	r1imghtlak.mmtcdn.com/2193ed3e7b0511e8a9220261db56d4cc.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
546	2019-08-23 01:13:29.492656+05:30	2019-08-23 01:13:29.492656+05:30	19	r1imghtlak.mmtcdn.com/22a72b827b0511e8b83a0ab31350c864.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
547	2019-08-23 01:13:29.504229+05:30	2019-08-23 01:13:29.504229+05:30	19	r1imghtlak.mmtcdn.com/21ab6c5c7b0511e8a4640ac813d17884.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
548	2019-08-23 01:13:29.514788+05:30	2019-08-23 01:13:29.514788+05:30	19	r1imghtlak.mmtcdn.com/229a612c7b0511e8b11a0ac813d17884.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
549	2019-08-23 01:13:29.526267+05:30	2019-08-23 01:13:29.526267+05:30	19	r1imghtlak.mmtcdn.com/9c19151c7b0411e8be4602755708f0b3.jpg?&output-quality=75&downsize=*:350&crop=520:350;80,0&output-format=jpg
550	2019-08-23 01:13:29.549002+05:30	2019-08-23 01:13:29.549002+05:30	19	r1imghtlak.mmtcdn.com/37acf7367b0611e885850a664b86a0a6.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
551	2019-08-23 01:13:29.571365+05:30	2019-08-23 01:13:29.571365+05:30	19	r1imghtlak.mmtcdn.com/0b40ec4c7adf11e8a5630a6e7e26c28c.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,85&output-format=jpg
552	2019-08-23 01:13:29.593284+05:30	2019-08-23 01:13:29.593284+05:30	19	r1imghtlak.mmtcdn.com/2fdd08707b0611e886fd0214eedcad2a.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
553	2019-08-23 01:13:29.60386+05:30	2019-08-23 01:13:29.60386+05:30	19	r1imghtlak.mmtcdn.com/321875347b0611e8a9220261db56d4cc.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
554	2019-08-23 01:13:29.614923+05:30	2019-08-23 01:13:29.614923+05:30	19	r1imghtlak.mmtcdn.com/309fd95e7b0611e896f802755708f0b3.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
555	2019-08-23 01:13:29.625832+05:30	2019-08-23 01:13:29.625832+05:30	19	r1imghtlak.mmtcdn.com/3a0689207b0611e8bd480261db56d4cc.jpg?&output-quality=75&downsize=*:350&crop=520:350;80,0&output-format=jpg
556	2019-08-23 01:13:29.637202+05:30	2019-08-23 01:13:29.637202+05:30	19	r1imghtlak.mmtcdn.com/33a653807b0611e88ce80283eb712168.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
557	2019-08-23 01:13:29.648119+05:30	2019-08-23 01:13:29.648119+05:30	19	r1imghtlak.mmtcdn.com/baa491ba739311e79137025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
558	2019-08-23 01:13:29.67034+05:30	2019-08-23 01:13:29.67034+05:30	19	r1imghtlak.mmtcdn.com/395140e27b0611e8ad860a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
559	2019-08-23 01:13:29.682004+05:30	2019-08-23 01:13:29.682004+05:30	19	r1imghtlak.mmtcdn.com/357a9bc67b0611e8b8050224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
560	2019-08-23 01:13:29.691964+05:30	2019-08-23 01:13:29.691964+05:30	19	r1imghtlak.mmtcdn.com/396d61647b0611e8894d0224510f5e5b.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
561	2019-08-23 01:13:29.703533+05:30	2019-08-23 01:13:29.703533+05:30	19	r1imghtlak.mmtcdn.com/3495ffd47b0611e88e5d02755708f0b3.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
562	2019-08-23 01:13:29.714266+05:30	2019-08-23 01:13:29.714266+05:30	19	r1imghtlak.mmtcdn.com/368230927b0611e883c00ac813d17884.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
563	2019-08-23 01:13:29.72546+05:30	2019-08-23 01:13:29.72546+05:30	19	r1imghtlak.mmtcdn.com/33f29b507b0611e890a80a664b86a0a6.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
564	2019-08-23 01:13:29.736519+05:30	2019-08-23 01:13:29.736519+05:30	19	r1imghtlak.mmtcdn.com/38822aa07b0611e8af1a02755708f0b3.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
565	2019-08-23 01:13:29.747786+05:30	2019-08-23 01:13:29.747786+05:30	19	r1imghtlak.mmtcdn.com/34ba100e7b0611e894d30a9df65c8753.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
566	2019-08-23 01:13:29.758831+05:30	2019-08-23 01:13:29.758831+05:30	19	r1imghtlak.mmtcdn.com/316fe4327b0611e8bf750a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
567	2019-08-23 01:13:29.76958+05:30	2019-08-23 01:13:29.76958+05:30	19	r1imghtlak.mmtcdn.com/3098c40c7b0611e881f10a6e7e26c28c.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
568	2019-08-23 01:13:29.780736+05:30	2019-08-23 01:13:29.780736+05:30	19	r1imghtlak.mmtcdn.com/322702fc7b0611e8b0150224510f5e5b.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
569	2019-08-23 01:13:29.792275+05:30	2019-08-23 01:13:29.792275+05:30	19	r1imghtlak.mmtcdn.com/379838a07b0611e8925d0ab31350c864.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
570	2019-08-23 01:13:29.814878+05:30	2019-08-23 01:13:29.814878+05:30	19	r1imghtlak.mmtcdn.com/bc01c4d0dd6011e5b50adaf4768ad8d9.png?&output-quality=75&output-format=jpg
571	2019-08-23 01:13:29.837069+05:30	2019-08-23 01:13:29.837069+05:30	19	r1imghtlak.mmtcdn.com/99d803fe739311e7915d0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
572	2019-08-23 01:13:29.859818+05:30	2019-08-23 01:13:29.859818+05:30	19	r1imghtlak.mmtcdn.com/a1d3624c739311e7915d0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
573	2019-08-23 01:13:29.881924+05:30	2019-08-23 01:13:29.881924+05:30	19	r1imghtlak.mmtcdn.com/3167c1b27b0611e8be240a9df65c8753.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
574	2019-08-23 01:13:29.903091+05:30	2019-08-23 01:13:29.903091+05:30	19	r1imghtlak.mmtcdn.com/357ce3d67b0611e8b5da0261db56d4cc.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
575	2019-08-23 01:13:29.9159+05:30	2019-08-23 01:13:29.9159+05:30	19	r1imghtlak.mmtcdn.com/ad127a1c739311e7884d025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
576	2019-08-23 01:13:29.936373+05:30	2019-08-23 01:13:29.936373+05:30	19	r1imghtlak.mmtcdn.com/369c53c87b0611e89fe50283eb712168.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
577	2019-08-23 01:13:29.95838+05:30	2019-08-23 01:13:29.95838+05:30	19	r1imghtlak.mmtcdn.com/32c3dcee7b0611e8bc210ac813d17884.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
578	2019-08-23 01:14:01.740178+05:30	2019-08-23 01:14:01.740178+05:30	20	r1imghtlak.mmtcdn.com/31d5b31c1ed411e48f4e32e76f7e45c9.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
579	2019-08-23 01:14:01.750555+05:30	2019-08-23 01:14:01.750555+05:30	20	r1imghtlak.mmtcdn.com/3b16fa301ed411e48c835ee5da2daa2a.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
580	2019-08-23 01:14:01.762247+05:30	2019-08-23 01:14:01.762247+05:30	20	r1imghtlak.mmtcdn.com/5ce961b871a411e793d80a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
581	2019-08-23 01:14:01.77301+05:30	2019-08-23 01:14:01.77301+05:30	20	r1imghtlak.mmtcdn.com/c436c11271a411e7b4900a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
582	2019-08-23 01:14:01.784558+05:30	2019-08-23 01:14:01.784558+05:30	20	r1imghtlak.mmtcdn.com/31d5b31c1ed411e48f4e32e76f7e45c9.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
583	2019-08-23 01:14:01.795904+05:30	2019-08-23 01:14:01.795904+05:30	20	r1imghtlak.mmtcdn.com/3b16fa301ed411e48c835ee5da2daa2a.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
584	2019-08-23 01:14:01.806297+05:30	2019-08-23 01:14:01.806297+05:30	20	r1imghtlak.mmtcdn.com/5ce961b871a411e793d80a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
585	2019-08-23 01:14:01.817353+05:30	2019-08-23 01:14:01.817353+05:30	20	r1imghtlak.mmtcdn.com/c436c11271a411e7b4900a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
586	2019-08-23 01:14:01.82867+05:30	2019-08-23 01:14:01.82867+05:30	20	r1imghtlak.mmtcdn.com/609c52641ed411e4b61fdaf4768ad8d9.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
587	2019-08-23 01:14:01.840982+05:30	2019-08-23 01:14:01.840982+05:30	20	r1imghtlak.mmtcdn.com/66b93d9c1ed411e4b3e536cfdd80c293.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
588	2019-08-23 01:14:01.861513+05:30	2019-08-23 01:14:01.861513+05:30	20	r1imghtlak.mmtcdn.com/c69b291871a211e79d84025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
589	2019-08-23 01:14:01.873051+05:30	2019-08-23 01:14:01.873051+05:30	20	r1imghtlak.mmtcdn.com/cd02324c71a211e79d84025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
590	2019-08-23 01:14:01.884447+05:30	2019-08-23 01:14:01.884447+05:30	20	r1imghtlak.mmtcdn.com/d71bb01e71a211e79d84025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
591	2019-08-23 01:14:01.907441+05:30	2019-08-23 01:14:01.907441+05:30	20	r1imghtlak.mmtcdn.com/609c52641ed411e4b61fdaf4768ad8d9.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
592	2019-08-23 01:14:01.929446+05:30	2019-08-23 01:14:01.929446+05:30	20	r1imghtlak.mmtcdn.com/66b93d9c1ed411e4b3e536cfdd80c293.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
593	2019-08-23 01:14:01.951125+05:30	2019-08-23 01:14:01.951125+05:30	20	r1imghtlak.mmtcdn.com/c69b291871a211e79d84025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
594	2019-08-23 01:14:01.972913+05:30	2019-08-23 01:14:01.972913+05:30	20	r1imghtlak.mmtcdn.com/cd02324c71a211e79d84025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
595	2019-08-23 01:14:01.984219+05:30	2019-08-23 01:14:01.984219+05:30	20	r1imghtlak.mmtcdn.com/d71bb01e71a211e79d84025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
596	2019-08-23 01:14:01.99418+05:30	2019-08-23 01:14:01.99418+05:30	20	r1imghtlak.mmtcdn.com/f065282c1ed311e48ac45ee5da2daa2a.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
597	2019-08-23 01:14:02.005963+05:30	2019-08-23 01:14:02.005963+05:30	20	r1imghtlak.mmtcdn.com/f96780fa1ed311e4be6a5ee5da2daa2a.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
598	2019-08-23 01:14:02.016762+05:30	2019-08-23 01:14:02.016762+05:30	20	r1imghtlak.mmtcdn.com/b0289efe71a211e79d84025f77df004f.jpg?&output-quality=75&output-format=jpg
599	2019-08-23 01:14:02.028881+05:30	2019-08-23 01:14:02.028881+05:30	20	r1imghtlak.mmtcdn.com/d1c1a39e71a211e79d84025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
600	2019-08-23 01:14:02.050163+05:30	2019-08-23 01:14:02.050163+05:30	20	r1imghtlak.mmtcdn.com/fc8f2b6e71a211e79d84025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
601	2019-08-23 01:14:02.073786+05:30	2019-08-23 01:14:02.073786+05:30	20	r1imghtlak.mmtcdn.com/6a595db271a411e793d80a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
602	2019-08-23 01:14:02.0954+05:30	2019-08-23 01:14:02.0954+05:30	20	r1imghtlak.mmtcdn.com/8e35813e71a411e7ac9a0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
603	2019-08-23 01:14:02.105816+05:30	2019-08-23 01:14:02.105816+05:30	20	r1imghtlak.mmtcdn.com/c9fbb22e71a411e7b4900a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
604	2019-08-23 01:14:02.116425+05:30	2019-08-23 01:14:02.116425+05:30	20	r1imghtlak.mmtcdn.com/f065282c1ed311e48ac45ee5da2daa2a.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
605	2019-08-23 01:14:02.127425+05:30	2019-08-23 01:14:02.127425+05:30	20	r1imghtlak.mmtcdn.com/f96780fa1ed311e4be6a5ee5da2daa2a.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
606	2019-08-23 01:14:02.139455+05:30	2019-08-23 01:14:02.139455+05:30	20	r1imghtlak.mmtcdn.com/b0289efe71a211e79d84025f77df004f.jpg?&output-quality=75&output-format=jpg
607	2019-08-23 01:14:02.161739+05:30	2019-08-23 01:14:02.161739+05:30	20	r1imghtlak.mmtcdn.com/d1c1a39e71a211e79d84025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
608	2019-08-23 01:14:02.182908+05:30	2019-08-23 01:14:02.182908+05:30	20	r1imghtlak.mmtcdn.com/fc8f2b6e71a211e79d84025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
609	2019-08-23 01:14:02.208101+05:30	2019-08-23 01:14:02.208101+05:30	20	r1imghtlak.mmtcdn.com/6a595db271a411e793d80a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
610	2019-08-23 01:14:02.227699+05:30	2019-08-23 01:14:02.227699+05:30	20	r1imghtlak.mmtcdn.com/8e35813e71a411e7ac9a0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
611	2019-08-23 01:14:02.239075+05:30	2019-08-23 01:14:02.239075+05:30	20	r1imghtlak.mmtcdn.com/c9fbb22e71a411e7b4900a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
612	2019-08-23 01:14:02.249328+05:30	2019-08-23 01:14:02.249328+05:30	20	r1imghtlak.mmtcdn.com/673ea1f41ed311e4b2ebf67d89ce50a3.jpeg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
613	2019-08-23 01:14:02.261529+05:30	2019-08-23 01:14:02.261529+05:30	20	r1imghtlak.mmtcdn.com/bf9131d071a211e79d84025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
614	2019-08-23 01:14:02.272456+05:30	2019-08-23 01:14:02.272456+05:30	20	r1imghtlak.mmtcdn.com/ddddf61e71a211e79d84025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
615	2019-08-23 01:14:02.294785+05:30	2019-08-23 01:14:02.294785+05:30	20	r1imghtlak.mmtcdn.com/e87a2f0271a211e79d84025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
616	2019-08-23 01:14:02.315607+05:30	2019-08-23 01:14:02.315607+05:30	20	r1imghtlak.mmtcdn.com/f73867a271a211e79d84025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
617	2019-08-23 01:14:02.338434+05:30	2019-08-23 01:14:02.338434+05:30	20	r1imghtlak.mmtcdn.com/5726f56a71a411e793d80a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
618	2019-08-23 01:14:02.360597+05:30	2019-08-23 01:14:02.360597+05:30	20	r1imghtlak.mmtcdn.com/6515c17471a411e793d80a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
619	2019-08-23 01:14:02.383052+05:30	2019-08-23 01:14:02.383052+05:30	20	r1imghtlak.mmtcdn.com/881c46b671a411e793d80a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
620	2019-08-23 01:14:02.405698+05:30	2019-08-23 01:14:02.405698+05:30	20	r1imghtlak.mmtcdn.com/95aab6d271a411e7ac9a0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
621	2019-08-23 01:14:02.426457+05:30	2019-08-23 01:14:02.426457+05:30	20	r1imghtlak.mmtcdn.com/b34700ce71a411e7b4900a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
622	2019-08-23 01:14:02.438126+05:30	2019-08-23 01:14:02.438126+05:30	20	r1imghtlak.mmtcdn.com/b859167e71a411e7b4900a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
623	2019-08-23 01:14:02.451807+05:30	2019-08-23 01:14:02.451807+05:30	20	r1imghtlak.mmtcdn.com/bf7c6e6071a411e7b4900a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
624	2019-08-23 01:14:16.188871+05:30	2019-08-23 01:14:16.188871+05:30	21	r1imghtlak.mmtcdn.com/b9c76cced09011e5acaadaf4768ad8d9.png?&output-quality=75&downsize=*:350&crop=520:350;7,0&output-format=jpg
625	2019-08-23 01:14:16.210126+05:30	2019-08-23 01:14:16.210126+05:30	21	r1imghtlak.mmtcdn.com/243976b2d14811e584ef5ee5da2daa2a.png?&output-quality=75&output-format=jpg
626	2019-08-23 01:14:16.231517+05:30	2019-08-23 01:14:16.231517+05:30	21	r1imghtlak.mmtcdn.com/266adb60d14811e5b9535ee5da2daa2a.png?&output-quality=75&downsize=*:350&crop=520:350;8,0&output-format=jpg
627	2019-08-23 01:14:16.242026+05:30	2019-08-23 01:14:16.242026+05:30	21	r1imghtlak.mmtcdn.com/4b3cec3ad14811e5bf005ee5da2daa2a.png?&output-quality=75&downsize=*:350&crop=520:350;29,0&output-format=jpg
628	2019-08-23 01:14:16.253028+05:30	2019-08-23 01:14:16.253028+05:30	21	r1imghtlak.mmtcdn.com/226f9ffed3ba11e5bfb5001ec9b85d13.png?&output-quality=75&downsize=*:350&crop=520:350;33,0&output-format=jpg
629	2019-08-23 19:48:29.401187+05:30	2019-08-23 19:48:29.401187+05:30	22	r1imghtlak.mmtcdn.com/3365218a6f2711e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
630	2019-08-23 19:48:29.551822+05:30	2019-08-23 19:48:29.551822+05:30	22	r1imghtlak.mmtcdn.com/43a20b306f2711e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
631	2019-08-23 19:48:29.562264+05:30	2019-08-23 19:48:29.562264+05:30	22	r1imghtlak.mmtcdn.com/496071386f2711e798fc0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
632	2019-08-23 19:48:29.573233+05:30	2019-08-23 19:48:29.573233+05:30	22	r1imghtlak.mmtcdn.com/605daab86f2711e7886e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
633	2019-08-23 19:48:29.583816+05:30	2019-08-23 19:48:29.583816+05:30	22	r1imghtlak.mmtcdn.com/3365218a6f2711e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
634	2019-08-23 19:48:29.594913+05:30	2019-08-23 19:48:29.594913+05:30	22	r1imghtlak.mmtcdn.com/43a20b306f2711e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
635	2019-08-23 19:48:29.606105+05:30	2019-08-23 19:48:29.606105+05:30	22	r1imghtlak.mmtcdn.com/496071386f2711e798fc0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
636	2019-08-23 19:48:29.617151+05:30	2019-08-23 19:48:29.617151+05:30	22	r1imghtlak.mmtcdn.com/605daab86f2711e7886e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
637	2019-08-23 19:48:29.628316+05:30	2019-08-23 19:48:29.628316+05:30	22	r1imghtlak.mmtcdn.com/0b5c8d5827f811e6a6680015c5f4277e.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,68&output-format=jpg
638	2019-08-23 19:48:29.639465+05:30	2019-08-23 19:48:29.639465+05:30	22	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201605131553527667-23884b4c298d11e6b6ec0022195573b9.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
639	2019-08-23 19:48:29.650767+05:30	2019-08-23 19:48:29.650767+05:30	22	r1imghtlak.mmtcdn.com/359e98506f2711e798fc0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
640	2019-08-23 19:48:29.662068+05:30	2019-08-23 19:48:29.662068+05:30	22	r1imghtlak.mmtcdn.com/3814cee26f2711e7886e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
641	2019-08-23 19:48:29.673568+05:30	2019-08-23 19:48:29.673568+05:30	22	r1imghtlak.mmtcdn.com/3f45bf786f2711e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
642	2019-08-23 19:48:29.694773+05:30	2019-08-23 19:48:29.694773+05:30	22	r1imghtlak.mmtcdn.com/3f640d346f2711e798fc0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
643	2019-08-23 19:48:29.705602+05:30	2019-08-23 19:48:29.705602+05:30	22	r1imghtlak.mmtcdn.com/4d12abfc6f2711e7886e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
644	2019-08-23 19:48:29.738919+05:30	2019-08-23 19:48:29.738919+05:30	22	r1imghtlak.mmtcdn.com/52de55c26f2711e798fc0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
645	2019-08-23 19:48:29.751623+05:30	2019-08-23 19:48:29.751623+05:30	22	r1imghtlak.mmtcdn.com/5379e5826f2711e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
646	2019-08-23 19:48:29.760917+05:30	2019-08-23 19:48:29.760917+05:30	22	r1imghtlak.mmtcdn.com/55f38b606f2711e7886e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
647	2019-08-23 19:48:29.77214+05:30	2019-08-23 19:48:29.77214+05:30	22	r1imghtlak.mmtcdn.com/6292f1446f2711e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
648	2019-08-23 19:48:29.784106+05:30	2019-08-23 19:48:29.784106+05:30	22	r1imghtlak.mmtcdn.com/691bc1586f2711e7886e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
649	2019-08-23 19:48:38.341859+05:30	2019-08-23 19:48:38.341859+05:30	23	r1imghtlak.mmtcdn.com/fe8562602e5511e8bda00224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
650	2019-08-23 19:48:38.352839+05:30	2019-08-23 19:48:38.352839+05:30	23	r1imghtlak.mmtcdn.com/98d9bbf26ed211e782c6025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
651	2019-08-23 19:48:38.363937+05:30	2019-08-23 19:48:38.363937+05:30	23	r1imghtlak.mmtcdn.com/2c1d0b5e6ed211e7886e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
652	2019-08-23 19:48:38.375042+05:30	2019-08-23 19:48:38.375042+05:30	23	r1imghtlak.mmtcdn.com/50a3fda66ed311e7944d025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
653	2019-08-23 19:48:38.386232+05:30	2019-08-23 19:48:38.386232+05:30	23	r1imghtlak.mmtcdn.com/014a80d42e5611e883800224510f5e5b.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
654	2019-08-23 19:48:38.397554+05:30	2019-08-23 19:48:38.397554+05:30	23	r1imghtlak.mmtcdn.com/040b09062e5611e8af0002755708f0b3.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
655	2019-08-23 19:48:38.409158+05:30	2019-08-23 19:48:38.409158+05:30	23	r1imghtlak.mmtcdn.com/06e3beac2e5611e8bddb02755708f0b3.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
656	2019-08-23 19:48:38.41986+05:30	2019-08-23 19:48:38.41986+05:30	23	r1imghtlak.mmtcdn.com/0ce7d2482e5611e8beac0a9df65c8753.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
657	2019-08-23 19:48:38.431627+05:30	2019-08-23 19:48:38.431627+05:30	23	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-c41a00c8464511e9b6730242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;118,0&output-format=jpg
658	2019-08-23 19:48:38.441291+05:30	2019-08-23 19:48:38.441291+05:30	23	r1imghtlak.mmtcdn.com/fe8562602e5511e8bda00224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
659	2019-08-23 19:48:38.452503+05:30	2019-08-23 19:48:38.452503+05:30	23	r1imghtlak.mmtcdn.com/98d9bbf26ed211e782c6025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
660	2019-08-23 19:48:38.463788+05:30	2019-08-23 19:48:38.463788+05:30	23	r1imghtlak.mmtcdn.com/2c1d0b5e6ed211e7886e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
661	2019-08-23 19:48:38.47503+05:30	2019-08-23 19:48:38.47503+05:30	23	r1imghtlak.mmtcdn.com/50a3fda66ed311e7944d025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
662	2019-08-23 19:48:38.486339+05:30	2019-08-23 19:48:38.486339+05:30	23	r1imghtlak.mmtcdn.com/014a80d42e5611e883800224510f5e5b.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
663	2019-08-23 19:48:38.496891+05:30	2019-08-23 19:48:38.496891+05:30	23	r1imghtlak.mmtcdn.com/040b09062e5611e8af0002755708f0b3.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
664	2019-08-23 19:48:38.508236+05:30	2019-08-23 19:48:38.508236+05:30	23	r1imghtlak.mmtcdn.com/06e3beac2e5611e8bddb02755708f0b3.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
665	2019-08-23 19:48:38.51939+05:30	2019-08-23 19:48:38.51939+05:30	23	r1imghtlak.mmtcdn.com/0ce7d2482e5611e8beac0a9df65c8753.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
666	2019-08-23 19:48:38.530267+05:30	2019-08-23 19:48:38.530267+05:30	23	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-c41a00c8464511e9b6730242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;118,0&output-format=jpg
667	2019-08-23 19:48:38.541324+05:30	2019-08-23 19:48:38.541324+05:30	23	r1imghtlak.mmtcdn.com/0d5dbb342e5b11e8b9bf0224510f5e5b.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
668	2019-08-23 19:48:38.551925+05:30	2019-08-23 19:48:38.551925+05:30	23	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-e6d45d3e391111e9a5230242ac110004.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
669	2019-08-23 19:48:38.564298+05:30	2019-08-23 19:48:38.564298+05:30	23	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-eb45c3da391111e9a7790242ac110002.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
670	2019-08-23 19:48:38.586057+05:30	2019-08-23 19:48:38.586057+05:30	23	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-a323b40c3b1b11e9a7070242ac110002.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
671	2019-08-23 19:48:38.596611+05:30	2019-08-23 19:48:38.596611+05:30	23	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-67e766f6464511e9b35b0242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;118,0&output-format=jpg
672	2019-08-23 19:48:38.608635+05:30	2019-08-23 19:48:38.608635+05:30	23	r1imghtlak.mmtcdn.com/0d5dbb342e5b11e8b9bf0224510f5e5b.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
673	2019-08-23 19:48:38.618788+05:30	2019-08-23 19:48:38.618788+05:30	23	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-e6d45d3e391111e9a5230242ac110004.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
674	2019-08-23 19:48:38.629596+05:30	2019-08-23 19:48:38.629596+05:30	23	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-eb45c3da391111e9a7790242ac110002.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
675	2019-08-23 19:48:38.640732+05:30	2019-08-23 19:48:38.640732+05:30	23	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-a323b40c3b1b11e9a7070242ac110002.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
676	2019-08-23 19:48:38.651976+05:30	2019-08-23 19:48:38.651976+05:30	23	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-67e766f6464511e9b35b0242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;118,0&output-format=jpg
677	2019-08-23 19:48:38.662903+05:30	2019-08-23 19:48:38.662903+05:30	23	r1imghtlak.mmtcdn.com/4e0f85badd2b11e49ed732e76f7e45c9.jfif?&output-quality=75&downsize=*:350&crop=520:350;49,0&output-format=jpg
678	2019-08-23 19:48:38.674004+05:30	2019-08-23 19:48:38.674004+05:30	23	r1imghtlak.mmtcdn.com/4b12e3361c9f11e4af2932e76f7e45c9.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
679	2019-08-23 19:48:38.685317+05:30	2019-08-23 19:48:38.685317+05:30	23	r1imghtlak.mmtcdn.com/22b28e423b4711e5a8ff001ec9b85d13.jfif?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
680	2019-08-23 19:48:38.696022+05:30	2019-08-23 19:48:38.696022+05:30	23	r1imghtlak.mmtcdn.com/08d6d5963b4711e5bc94001ec9b85d13.jfif?&output-quality=75&downsize=*:350&crop=520:350;39,0&output-format=jpg
681	2019-08-23 19:48:38.707211+05:30	2019-08-23 19:48:38.707211+05:30	23	r1imghtlak.mmtcdn.com/6b8cb0741c9f11e4aa04daf4768ad8d9.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
682	2019-08-23 19:48:38.718392+05:30	2019-08-23 19:48:38.718392+05:30	23	r1imghtlak.mmtcdn.com/1e8413b21c9f11e484b3f67d89ce50a3.jpeg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
683	2019-08-23 19:48:38.729393+05:30	2019-08-23 19:48:38.729393+05:30	23	r1imghtlak.mmtcdn.com/2dcb485e1c9f11e489315ee5da2daa2a.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
684	2019-08-23 19:48:38.740599+05:30	2019-08-23 19:48:38.740599+05:30	23	r1imghtlak.mmtcdn.com/ecf12d2a6ed111e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
685	2019-08-23 19:48:38.751324+05:30	2019-08-23 19:48:38.751324+05:30	23	r1imghtlak.mmtcdn.com/ee3a652a6ed111e798fc0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;51,0&output-format=jpg
686	2019-08-23 19:48:38.762607+05:30	2019-08-23 19:48:38.762607+05:30	23	r1imghtlak.mmtcdn.com/fca9dbb86ed111e78bf60a4cef95d023.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
687	2019-08-23 19:48:38.773741+05:30	2019-08-23 19:48:38.773741+05:30	23	r1imghtlak.mmtcdn.com/fdfe77e46ed111e7b9780a4cef95d023.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
688	2019-08-23 19:48:38.784993+05:30	2019-08-23 19:48:38.784993+05:30	23	r1imghtlak.mmtcdn.com/2c118f546ed211e7afa30a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
689	2019-08-23 19:48:38.795717+05:30	2019-08-23 19:48:38.795717+05:30	23	r1imghtlak.mmtcdn.com/381d57c46ed211e7b193025f77df004f.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,12&output-format=jpg
690	2019-08-23 19:48:38.807027+05:30	2019-08-23 19:48:38.807027+05:30	23	r1imghtlak.mmtcdn.com/44fde6de6ed211e7b9780a4cef95d023.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
691	2019-08-23 19:48:38.830563+05:30	2019-08-23 19:48:38.830563+05:30	23	r1imghtlak.mmtcdn.com/477e69ba6ed211e7bec90a4cef95d023.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
692	2019-08-23 19:48:38.852639+05:30	2019-08-23 19:48:38.852639+05:30	23	r1imghtlak.mmtcdn.com/567c03d26ed211e799cf025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
693	2019-08-23 19:48:38.875083+05:30	2019-08-23 19:48:38.875083+05:30	23	r1imghtlak.mmtcdn.com/5d3d83806ed211e7b193025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;51,0&output-format=jpg
694	2019-08-23 19:48:38.895912+05:30	2019-08-23 19:48:38.895912+05:30	23	r1imghtlak.mmtcdn.com/616ce7706ed211e7b07f025f77df004f.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
695	2019-08-23 19:48:38.906718+05:30	2019-08-23 19:48:38.906718+05:30	23	r1imghtlak.mmtcdn.com/62c22bbc6ed211e782c6025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
696	2019-08-23 19:48:38.917998+05:30	2019-08-23 19:48:38.917998+05:30	23	r1imghtlak.mmtcdn.com/6f41b68c6ed211e7a5fc025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
697	2019-08-23 19:48:38.929158+05:30	2019-08-23 19:48:38.929158+05:30	23	r1imghtlak.mmtcdn.com/7d26e11e6ed211e7afa30a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;51,0&output-format=jpg
698	2019-08-23 19:48:38.940064+05:30	2019-08-23 19:48:38.940064+05:30	23	r1imghtlak.mmtcdn.com/83346bee6ed211e7bec90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;51,0&output-format=jpg
699	2019-08-23 19:48:38.951256+05:30	2019-08-23 19:48:38.951256+05:30	23	r1imghtlak.mmtcdn.com/a2417c426ed311e799cf025f77df004f.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
700	2019-08-23 19:48:38.962307+05:30	2019-08-23 19:48:38.962307+05:30	23	r1imghtlak.mmtcdn.com/1d5a3a08da8211e785380a209fbd0127.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
701	2019-08-23 19:48:38.973221+05:30	2019-08-23 19:48:38.973221+05:30	23	r1imghtlak.mmtcdn.com/780e73bada8211e7899202755708f0b3.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
702	2019-08-23 19:48:38.984386+05:30	2019-08-23 19:48:38.984386+05:30	23	r1imghtlak.mmtcdn.com/7dec160cda8211e785380a209fbd0127.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
703	2019-08-23 19:48:38.995414+05:30	2019-08-23 19:48:38.995414+05:30	23	r1imghtlak.mmtcdn.com/8ac08f7ada8211e79a6a02755708f0b3.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
704	2019-08-23 19:48:39.006536+05:30	2019-08-23 19:48:39.006536+05:30	23	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-da25ac303b6b11e9a7ca0242ac110003.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
705	2019-08-23 19:48:39.017302+05:30	2019-08-23 19:48:39.017302+05:30	23	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-33cb871e3b6c11e9b07c0242ac110005.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
706	2019-08-23 19:48:39.028752+05:30	2019-08-23 19:48:39.028752+05:30	23	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-6e2e1b903d0311e980de0242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;118,0&output-format=jpg
707	2019-08-23 19:48:39.039972+05:30	2019-08-23 19:48:39.039972+05:30	23	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-1a665f9e402411e982d20242ac110003.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
708	2019-08-23 19:48:39.05104+05:30	2019-08-23 19:48:39.05104+05:30	23	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201108071250464121-b2dce05e402411e98d4c0242ac110003.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
709	2019-08-23 19:49:23.056523+05:30	2019-08-23 19:49:23.056523+05:30	24	r1imghtlak.mmtcdn.com/6c9184aed76711e38a64f67d89ce50a3.jpeg?&output-quality=75&downsize=520:*&crop=520:350;0,171&output-format=jpg
710	2019-08-23 19:49:23.067938+05:30	2019-08-23 19:49:23.067938+05:30	24	r1imghtlak.mmtcdn.com/fdf13b9cc3a411e781650a9df65c8753.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
711	2019-08-23 19:49:23.07928+05:30	2019-08-23 19:49:23.07928+05:30	24	r1imghtlak.mmtcdn.com/6c9184aed76711e38a64f67d89ce50a3.jpeg?&output-quality=75&downsize=520:*&crop=520:350;0,171&output-format=jpg
712	2019-08-23 19:49:23.090766+05:30	2019-08-23 19:49:23.090766+05:30	24	r1imghtlak.mmtcdn.com/fdf13b9cc3a411e781650a9df65c8753.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
713	2019-08-23 19:49:23.101863+05:30	2019-08-23 19:49:23.101863+05:30	24	r1imghtlak.mmtcdn.com/b677d18a6d2e11e780080a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
714	2019-08-23 19:49:23.112561+05:30	2019-08-23 19:49:23.112561+05:30	24	r1imghtlak.mmtcdn.com/993496c06d2f11e79a460a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
715	2019-08-23 19:49:23.123909+05:30	2019-08-23 19:49:23.123909+05:30	24	r1imghtlak.mmtcdn.com/5d1ebfb0f1df11e690790a9df65c8753.jfif?&output-quality=75&downsize=*:350&crop=520:350;3,0&output-format=jpg
716	2019-08-23 19:49:23.134927+05:30	2019-08-23 19:49:23.134927+05:30	24	r1imghtlak.mmtcdn.com/b677d18a6d2e11e780080a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
717	2019-08-23 19:49:23.146139+05:30	2019-08-23 19:49:23.146139+05:30	24	r1imghtlak.mmtcdn.com/993496c06d2f11e79a460a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
718	2019-08-23 19:49:23.157277+05:30	2019-08-23 19:49:23.157277+05:30	24	r1imghtlak.mmtcdn.com/5d1ebfb0f1df11e690790a9df65c8753.jfif?&output-quality=75&downsize=*:350&crop=520:350;3,0&output-format=jpg
719	2019-08-23 19:49:23.168171+05:30	2019-08-23 19:49:23.168171+05:30	24	r1imghtlak.mmtcdn.com/224071e8c3a511e7b5f30224510f5e5b.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
720	2019-08-23 19:49:23.179312+05:30	2019-08-23 19:49:23.179312+05:30	24	r1imghtlak.mmtcdn.com/224071e8c3a511e7b5f30224510f5e5b.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
721	2019-08-23 19:49:23.190533+05:30	2019-08-23 19:49:23.190533+05:30	24	r1imghtlak.mmtcdn.com/ba81a1cc6d3611e784480a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
722	2019-08-23 19:49:23.201615+05:30	2019-08-23 19:49:23.201615+05:30	24	r1imghtlak.mmtcdn.com/574aff406d3111e7abd4025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
723	2019-08-23 19:49:23.22396+05:30	2019-08-23 19:49:23.22396+05:30	24	r1imghtlak.mmtcdn.com/b60dc8906d3211e7b4d3025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
724	2019-08-23 19:49:23.234727+05:30	2019-08-23 19:49:23.234727+05:30	24	r1imghtlak.mmtcdn.com/a700cc16c3a511e789300a9df65c8753.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
725	2019-08-23 19:49:23.246106+05:30	2019-08-23 19:49:23.246106+05:30	24	r1imghtlak.mmtcdn.com/ba81a1cc6d3611e784480a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
726	2019-08-23 19:49:23.256581+05:30	2019-08-23 19:49:23.256581+05:30	24	r1imghtlak.mmtcdn.com/574aff406d3111e7abd4025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
727	2019-08-23 19:49:23.290956+05:30	2019-08-23 19:49:23.290956+05:30	24	r1imghtlak.mmtcdn.com/b60dc8906d3211e7b4d3025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
728	2019-08-23 19:49:23.313028+05:30	2019-08-23 19:49:23.313028+05:30	24	r1imghtlak.mmtcdn.com/a700cc16c3a511e789300a9df65c8753.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
729	2019-08-23 19:49:23.323714+05:30	2019-08-23 19:49:23.323714+05:30	24	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/200907161027423392-90dca7a4d76611e3a6ebbaaf629e9523.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
730	2019-08-23 19:49:23.334139+05:30	2019-08-23 19:49:23.334139+05:30	24	r1imghtlak.mmtcdn.com/8b6ce9386d3011e7a456025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
731	2019-08-23 19:49:23.345351+05:30	2019-08-23 19:49:23.345351+05:30	24	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/200907161027423392-182f130ed76711e3bad8f67d89ce50a3.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
732	2019-08-23 19:49:23.356324+05:30	2019-08-23 19:49:23.356324+05:30	24	r1imghtlak.mmtcdn.com/246e75de6d3111e7abd4025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
733	2019-08-23 19:49:23.367671+05:30	2019-08-23 19:49:23.367671+05:30	24	r1imghtlak.mmtcdn.com/3b3641fc6d3611e79a460a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
734	2019-08-23 19:49:23.390651+05:30	2019-08-23 19:49:23.390651+05:30	24	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/200907161027423392-861fc35e111711e6abfe0015c5f4277e.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
735	2019-08-23 19:49:23.401149+05:30	2019-08-23 19:49:23.401149+05:30	24	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/200907161027423392-90dca7a4d76611e3a6ebbaaf629e9523.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
736	2019-08-23 19:49:23.411629+05:30	2019-08-23 19:49:23.411629+05:30	24	r1imghtlak.mmtcdn.com/8b6ce9386d3011e7a456025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
737	2019-08-23 19:49:23.42322+05:30	2019-08-23 19:49:23.42322+05:30	24	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/200907161027423392-182f130ed76711e3bad8f67d89ce50a3.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
738	2019-08-23 19:49:23.434227+05:30	2019-08-23 19:49:23.434227+05:30	24	r1imghtlak.mmtcdn.com/246e75de6d3111e7abd4025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
739	2019-08-23 19:49:23.445046+05:30	2019-08-23 19:49:23.445046+05:30	24	r1imghtlak.mmtcdn.com/3b3641fc6d3611e79a460a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
740	2019-08-23 19:49:23.45578+05:30	2019-08-23 19:49:23.45578+05:30	24	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/200907161027423392-861fc35e111711e6abfe0015c5f4277e.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
741	2019-08-23 19:49:23.467471+05:30	2019-08-23 19:49:23.467471+05:30	24	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/200907161027423392-961c370ed12911e3b4b4f67d89ce50a3.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
742	2019-08-23 19:49:23.478578+05:30	2019-08-23 19:49:23.478578+05:30	24	r1imghtlak.mmtcdn.com/ac28cdd4c3a411e78b910a9df65c8753.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
743	2019-08-23 19:49:23.489493+05:30	2019-08-23 19:49:23.489493+05:30	24	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/200907161027423392-961c370ed12911e3b4b4f67d89ce50a3.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
744	2019-08-23 19:49:23.500483+05:30	2019-08-23 19:49:23.500483+05:30	24	r1imghtlak.mmtcdn.com/ac28cdd4c3a411e78b910a9df65c8753.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
745	2019-08-23 19:49:23.511749+05:30	2019-08-23 19:49:23.511749+05:30	24	r1imghtlak.mmtcdn.com/e7062bfaf1df11e6ab350a209fbd0127.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
746	2019-08-23 19:49:23.522265+05:30	2019-08-23 19:49:23.522265+05:30	24	r1imghtlak.mmtcdn.com/0e6c8806f1e011e6876b02bf5ac07431.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
747	2019-08-23 19:49:23.533649+05:30	2019-08-23 19:49:23.533649+05:30	24	r1imghtlak.mmtcdn.com/e7062bfaf1df11e6ab350a209fbd0127.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
748	2019-08-23 19:49:23.544885+05:30	2019-08-23 19:49:23.544885+05:30	24	r1imghtlak.mmtcdn.com/0e6c8806f1e011e6876b02bf5ac07431.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
749	2019-08-23 19:49:23.556999+05:30	2019-08-23 19:49:23.556999+05:30	24	r1imghtlak.mmtcdn.com/77edfe22c3a411e7801d0a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;51,0&output-format=jpg
750	2019-08-23 19:49:23.579+05:30	2019-08-23 19:49:23.579+05:30	24	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/200907161027423392-e93dbcb6111711e6a03b001ec9b85d13.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
751	2019-08-23 19:49:23.6014+05:30	2019-08-23 19:49:23.6014+05:30	24	r1imghtlak.mmtcdn.com/77edfe22c3a411e7801d0a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;51,0&output-format=jpg
752	2019-08-23 19:49:23.622262+05:30	2019-08-23 19:49:23.622262+05:30	24	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/200907161027423392-e93dbcb6111711e6a03b001ec9b85d13.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
753	2019-08-23 19:49:23.633614+05:30	2019-08-23 19:49:23.633614+05:30	24	r1imghtlak.mmtcdn.com/6e1e6acc6d3611e79a460a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
754	2019-08-23 19:49:23.644395+05:30	2019-08-23 19:49:23.644395+05:30	24	r1imghtlak.mmtcdn.com/a72d5388028511e4be5ff67d89ce50a3.jpeg?&output-quality=75&downsize=*:350&crop=520:350;23,0&output-format=jpg
755	2019-08-23 19:49:23.655846+05:30	2019-08-23 19:49:23.655846+05:30	24	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/200907161027423392-db2b06a8d12011e39347baaf629e9523.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
756	2019-08-23 19:49:23.66677+05:30	2019-08-23 19:49:23.66677+05:30	24	r1imghtlak.mmtcdn.com/5e51f778d76411e3a6ebbaaf629e9523.jpeg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
757	2019-08-23 19:49:23.677901+05:30	2019-08-23 19:49:23.677901+05:30	24	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/200907161027423392-3c838764d76511e38a64f67d89ce50a3.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
758	2019-08-23 19:49:23.688658+05:30	2019-08-23 19:49:23.688658+05:30	24	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/200907161027423392-c3873850d76511e38bcabaaf629e9523.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
759	2019-08-23 19:49:23.699969+05:30	2019-08-23 19:49:23.699969+05:30	24	r1imghtlak.mmtcdn.com/fc6afc1ad76511e38a64f67d89ce50a3.jpeg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
760	2019-08-23 19:49:23.711084+05:30	2019-08-23 19:49:23.711084+05:30	24	r1imghtlak.mmtcdn.com/4f9e74466d2e11e780080a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
761	2019-08-23 19:49:23.722129+05:30	2019-08-23 19:49:23.722129+05:30	24	r1imghtlak.mmtcdn.com/d885d9e86d2e11e780080a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
762	2019-08-23 19:49:23.733159+05:30	2019-08-23 19:49:23.733159+05:30	24	r1imghtlak.mmtcdn.com/305563a06d2f11e7bd4f0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
763	2019-08-23 19:49:23.743959+05:30	2019-08-23 19:49:23.743959+05:30	24	r1imghtlak.mmtcdn.com/4e6872f66d2f11e7bd4f0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
764	2019-08-23 19:49:23.755805+05:30	2019-08-23 19:49:23.755805+05:30	24	r1imghtlak.mmtcdn.com/2de27e046d3011e7a456025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
765	2019-08-23 19:49:23.777877+05:30	2019-08-23 19:49:23.777877+05:30	24	r1imghtlak.mmtcdn.com/ba6c2e246d3011e7a456025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
766	2019-08-23 19:49:23.800286+05:30	2019-08-23 19:49:23.800286+05:30	24	r1imghtlak.mmtcdn.com/e92947b06d3011e7a456025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
767	2019-08-23 19:49:23.822854+05:30	2019-08-23 19:49:23.822854+05:30	24	r1imghtlak.mmtcdn.com/983e43da6d3211e7b4d3025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
768	2019-08-23 19:49:23.843473+05:30	2019-08-23 19:49:23.843473+05:30	24	r1imghtlak.mmtcdn.com/f1eab1706d3211e7b4d3025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
769	2019-08-23 19:49:35.813395+05:30	2019-08-23 19:49:35.813395+05:30	25	r1imghtlak.mmtcdn.com/2193ed3e7b0511e8a9220261db56d4cc.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
770	2019-08-23 19:49:35.834431+05:30	2019-08-23 19:49:35.834431+05:30	25	r1imghtlak.mmtcdn.com/22a72b827b0511e8b83a0ab31350c864.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
771	2019-08-23 19:49:35.844844+05:30	2019-08-23 19:49:35.844844+05:30	25	r1imghtlak.mmtcdn.com/21ab6c5c7b0511e8a4640ac813d17884.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
772	2019-08-23 19:49:35.856195+05:30	2019-08-23 19:49:35.856195+05:30	25	r1imghtlak.mmtcdn.com/229a612c7b0511e8b11a0ac813d17884.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
773	2019-08-23 19:49:35.867205+05:30	2019-08-23 19:49:35.867205+05:30	25	r1imghtlak.mmtcdn.com/9c19151c7b0411e8be4602755708f0b3.jpg?&output-quality=75&downsize=*:350&crop=520:350;80,0&output-format=jpg
774	2019-08-23 19:49:35.878618+05:30	2019-08-23 19:49:35.878618+05:30	25	r1imghtlak.mmtcdn.com/2193ed3e7b0511e8a9220261db56d4cc.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
775	2019-08-23 19:49:35.88989+05:30	2019-08-23 19:49:35.88989+05:30	25	r1imghtlak.mmtcdn.com/22a72b827b0511e8b83a0ab31350c864.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
776	2019-08-23 19:49:35.912173+05:30	2019-08-23 19:49:35.912173+05:30	25	r1imghtlak.mmtcdn.com/21ab6c5c7b0511e8a4640ac813d17884.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
777	2019-08-23 19:49:35.934617+05:30	2019-08-23 19:49:35.934617+05:30	25	r1imghtlak.mmtcdn.com/229a612c7b0511e8b11a0ac813d17884.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
778	2019-08-23 19:49:35.956845+05:30	2019-08-23 19:49:35.956845+05:30	25	r1imghtlak.mmtcdn.com/9c19151c7b0411e8be4602755708f0b3.jpg?&output-quality=75&downsize=*:350&crop=520:350;80,0&output-format=jpg
779	2019-08-23 19:49:35.977751+05:30	2019-08-23 19:49:35.977751+05:30	25	r1imghtlak.mmtcdn.com/37acf7367b0611e885850a664b86a0a6.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
780	2019-08-23 19:49:35.989146+05:30	2019-08-23 19:49:35.989146+05:30	25	r1imghtlak.mmtcdn.com/0b40ec4c7adf11e8a5630a6e7e26c28c.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,85&output-format=jpg
781	2019-08-23 19:49:36.000467+05:30	2019-08-23 19:49:36.000467+05:30	25	r1imghtlak.mmtcdn.com/2fdd08707b0611e886fd0214eedcad2a.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
782	2019-08-23 19:49:36.011748+05:30	2019-08-23 19:49:36.011748+05:30	25	r1imghtlak.mmtcdn.com/321875347b0611e8a9220261db56d4cc.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
783	2019-08-23 19:49:36.022492+05:30	2019-08-23 19:49:36.022492+05:30	25	r1imghtlak.mmtcdn.com/309fd95e7b0611e896f802755708f0b3.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
784	2019-08-23 19:49:36.033799+05:30	2019-08-23 19:49:36.033799+05:30	25	r1imghtlak.mmtcdn.com/3a0689207b0611e8bd480261db56d4cc.jpg?&output-quality=75&downsize=*:350&crop=520:350;80,0&output-format=jpg
785	2019-08-23 19:49:36.044433+05:30	2019-08-23 19:49:36.044433+05:30	25	r1imghtlak.mmtcdn.com/33a653807b0611e88ce80283eb712168.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
786	2019-08-23 19:49:36.055145+05:30	2019-08-23 19:49:36.055145+05:30	25	r1imghtlak.mmtcdn.com/baa491ba739311e79137025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
787	2019-08-23 19:49:36.066999+05:30	2019-08-23 19:49:36.066999+05:30	25	r1imghtlak.mmtcdn.com/395140e27b0611e8ad860a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
788	2019-08-23 19:49:36.077716+05:30	2019-08-23 19:49:36.077716+05:30	25	r1imghtlak.mmtcdn.com/357a9bc67b0611e8b8050224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
789	2019-08-23 19:49:36.089134+05:30	2019-08-23 19:49:36.089134+05:30	25	r1imghtlak.mmtcdn.com/396d61647b0611e8894d0224510f5e5b.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
790	2019-08-23 19:49:36.100063+05:30	2019-08-23 19:49:36.100063+05:30	25	r1imghtlak.mmtcdn.com/3495ffd47b0611e88e5d02755708f0b3.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
791	2019-08-23 19:49:36.111235+05:30	2019-08-23 19:49:36.111235+05:30	25	r1imghtlak.mmtcdn.com/368230927b0611e883c00ac813d17884.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
792	2019-08-23 19:49:36.122262+05:30	2019-08-23 19:49:36.122262+05:30	25	r1imghtlak.mmtcdn.com/33f29b507b0611e890a80a664b86a0a6.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
793	2019-08-23 19:49:36.133382+05:30	2019-08-23 19:49:36.133382+05:30	25	r1imghtlak.mmtcdn.com/38822aa07b0611e8af1a02755708f0b3.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
794	2019-08-23 19:49:36.143713+05:30	2019-08-23 19:49:36.143713+05:30	25	r1imghtlak.mmtcdn.com/34ba100e7b0611e894d30a9df65c8753.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
795	2019-08-23 19:49:36.156668+05:30	2019-08-23 19:49:36.156668+05:30	25	r1imghtlak.mmtcdn.com/316fe4327b0611e8bf750a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
796	2019-08-23 19:49:36.178707+05:30	2019-08-23 19:49:36.178707+05:30	25	r1imghtlak.mmtcdn.com/3098c40c7b0611e881f10a6e7e26c28c.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
797	2019-08-23 19:49:36.200316+05:30	2019-08-23 19:49:36.200316+05:30	25	r1imghtlak.mmtcdn.com/322702fc7b0611e8b0150224510f5e5b.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
798	2019-08-23 19:49:36.210825+05:30	2019-08-23 19:49:36.210825+05:30	25	r1imghtlak.mmtcdn.com/379838a07b0611e8925d0ab31350c864.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
799	2019-08-23 19:49:36.221395+05:30	2019-08-23 19:49:36.221395+05:30	25	r1imghtlak.mmtcdn.com/bc01c4d0dd6011e5b50adaf4768ad8d9.png?&output-quality=75&output-format=jpg
800	2019-08-23 19:49:36.233122+05:30	2019-08-23 19:49:36.233122+05:30	25	r1imghtlak.mmtcdn.com/99d803fe739311e7915d0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
801	2019-08-23 19:49:36.244217+05:30	2019-08-23 19:49:36.244217+05:30	25	r1imghtlak.mmtcdn.com/a1d3624c739311e7915d0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
802	2019-08-23 19:49:36.254811+05:30	2019-08-23 19:49:36.254811+05:30	25	r1imghtlak.mmtcdn.com/3167c1b27b0611e8be240a9df65c8753.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
803	2019-08-23 19:49:36.26625+05:30	2019-08-23 19:49:36.26625+05:30	25	r1imghtlak.mmtcdn.com/357ce3d67b0611e8b5da0261db56d4cc.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
804	2019-08-23 19:49:36.277364+05:30	2019-08-23 19:49:36.277364+05:30	25	r1imghtlak.mmtcdn.com/ad127a1c739311e7884d025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
805	2019-08-23 19:49:36.288255+05:30	2019-08-23 19:49:36.288255+05:30	25	r1imghtlak.mmtcdn.com/369c53c87b0611e89fe50283eb712168.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
806	2019-08-23 19:49:36.29946+05:30	2019-08-23 19:49:36.29946+05:30	25	r1imghtlak.mmtcdn.com/32c3dcee7b0611e8bc210ac813d17884.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
807	2019-08-23 19:50:03.223115+05:30	2019-08-23 19:50:03.223115+05:30	26	r1imghtlak.mmtcdn.com/31d5b31c1ed411e48f4e32e76f7e45c9.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
808	2019-08-23 19:50:03.23452+05:30	2019-08-23 19:50:03.23452+05:30	26	r1imghtlak.mmtcdn.com/3b16fa301ed411e48c835ee5da2daa2a.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
809	2019-08-23 19:50:03.245474+05:30	2019-08-23 19:50:03.245474+05:30	26	r1imghtlak.mmtcdn.com/5ce961b871a411e793d80a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
810	2019-08-23 19:50:03.269118+05:30	2019-08-23 19:50:03.269118+05:30	26	r1imghtlak.mmtcdn.com/c436c11271a411e7b4900a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
811	2019-08-23 19:50:03.280722+05:30	2019-08-23 19:50:03.280722+05:30	26	r1imghtlak.mmtcdn.com/31d5b31c1ed411e48f4e32e76f7e45c9.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
812	2019-08-23 19:50:03.290835+05:30	2019-08-23 19:50:03.290835+05:30	26	r1imghtlak.mmtcdn.com/3b16fa301ed411e48c835ee5da2daa2a.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
813	2019-08-23 19:50:03.302093+05:30	2019-08-23 19:50:03.302093+05:30	26	r1imghtlak.mmtcdn.com/5ce961b871a411e793d80a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
814	2019-08-23 19:50:03.31343+05:30	2019-08-23 19:50:03.31343+05:30	26	r1imghtlak.mmtcdn.com/c436c11271a411e7b4900a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
815	2019-08-23 19:50:03.32418+05:30	2019-08-23 19:50:03.32418+05:30	26	r1imghtlak.mmtcdn.com/609c52641ed411e4b61fdaf4768ad8d9.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
816	2019-08-23 19:50:03.335372+05:30	2019-08-23 19:50:03.335372+05:30	26	r1imghtlak.mmtcdn.com/66b93d9c1ed411e4b3e536cfdd80c293.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
817	2019-08-23 19:50:03.34671+05:30	2019-08-23 19:50:03.34671+05:30	26	r1imghtlak.mmtcdn.com/c69b291871a211e79d84025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
818	2019-08-23 19:50:03.357533+05:30	2019-08-23 19:50:03.357533+05:30	26	r1imghtlak.mmtcdn.com/cd02324c71a211e79d84025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
819	2019-08-23 19:50:03.368459+05:30	2019-08-23 19:50:03.368459+05:30	26	r1imghtlak.mmtcdn.com/d71bb01e71a211e79d84025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
820	2019-08-23 19:50:03.37984+05:30	2019-08-23 19:50:03.37984+05:30	26	r1imghtlak.mmtcdn.com/609c52641ed411e4b61fdaf4768ad8d9.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
821	2019-08-23 19:50:03.390744+05:30	2019-08-23 19:50:03.390744+05:30	26	r1imghtlak.mmtcdn.com/66b93d9c1ed411e4b3e536cfdd80c293.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
822	2019-08-23 19:50:03.401762+05:30	2019-08-23 19:50:03.401762+05:30	26	r1imghtlak.mmtcdn.com/c69b291871a211e79d84025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
823	2019-08-23 19:50:03.412867+05:30	2019-08-23 19:50:03.412867+05:30	26	r1imghtlak.mmtcdn.com/cd02324c71a211e79d84025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
824	2019-08-23 19:50:03.424241+05:30	2019-08-23 19:50:03.424241+05:30	26	r1imghtlak.mmtcdn.com/d71bb01e71a211e79d84025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
825	2019-08-23 19:50:03.435026+05:30	2019-08-23 19:50:03.435026+05:30	26	r1imghtlak.mmtcdn.com/f065282c1ed311e48ac45ee5da2daa2a.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
826	2019-08-23 19:50:03.445701+05:30	2019-08-23 19:50:03.445701+05:30	26	r1imghtlak.mmtcdn.com/f96780fa1ed311e4be6a5ee5da2daa2a.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
827	2019-08-23 19:50:03.457334+05:30	2019-08-23 19:50:03.457334+05:30	26	r1imghtlak.mmtcdn.com/b0289efe71a211e79d84025f77df004f.jpg?&output-quality=75&output-format=jpg
828	2019-08-23 19:50:03.468501+05:30	2019-08-23 19:50:03.468501+05:30	26	r1imghtlak.mmtcdn.com/d1c1a39e71a211e79d84025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
829	2019-08-23 19:50:03.479514+05:30	2019-08-23 19:50:03.479514+05:30	26	r1imghtlak.mmtcdn.com/fc8f2b6e71a211e79d84025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
830	2019-08-23 19:50:03.490582+05:30	2019-08-23 19:50:03.490582+05:30	26	r1imghtlak.mmtcdn.com/6a595db271a411e793d80a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
831	2019-08-23 19:50:03.501805+05:30	2019-08-23 19:50:03.501805+05:30	26	r1imghtlak.mmtcdn.com/8e35813e71a411e7ac9a0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
832	2019-08-23 19:50:03.512579+05:30	2019-08-23 19:50:03.512579+05:30	26	r1imghtlak.mmtcdn.com/c9fbb22e71a411e7b4900a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
833	2019-08-23 19:50:03.523854+05:30	2019-08-23 19:50:03.523854+05:30	26	r1imghtlak.mmtcdn.com/f065282c1ed311e48ac45ee5da2daa2a.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
834	2019-08-23 19:50:03.534827+05:30	2019-08-23 19:50:03.534827+05:30	26	r1imghtlak.mmtcdn.com/f96780fa1ed311e4be6a5ee5da2daa2a.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
835	2019-08-23 19:50:03.546025+05:30	2019-08-23 19:50:03.546025+05:30	26	r1imghtlak.mmtcdn.com/b0289efe71a211e79d84025f77df004f.jpg?&output-quality=75&output-format=jpg
836	2019-08-23 19:50:03.55718+05:30	2019-08-23 19:50:03.55718+05:30	26	r1imghtlak.mmtcdn.com/d1c1a39e71a211e79d84025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
837	2019-08-23 19:50:03.568046+05:30	2019-08-23 19:50:03.568046+05:30	26	r1imghtlak.mmtcdn.com/fc8f2b6e71a211e79d84025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
838	2019-08-23 19:50:03.57918+05:30	2019-08-23 19:50:03.57918+05:30	26	r1imghtlak.mmtcdn.com/6a595db271a411e793d80a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
839	2019-08-23 19:50:03.590353+05:30	2019-08-23 19:50:03.590353+05:30	26	r1imghtlak.mmtcdn.com/8e35813e71a411e7ac9a0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
840	2019-08-23 19:50:03.601435+05:30	2019-08-23 19:50:03.601435+05:30	26	r1imghtlak.mmtcdn.com/c9fbb22e71a411e7b4900a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
841	2019-08-23 19:50:03.612205+05:30	2019-08-23 19:50:03.612205+05:30	26	r1imghtlak.mmtcdn.com/673ea1f41ed311e4b2ebf67d89ce50a3.jpeg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
842	2019-08-23 19:50:03.624165+05:30	2019-08-23 19:50:03.624165+05:30	26	r1imghtlak.mmtcdn.com/bf9131d071a211e79d84025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
843	2019-08-23 19:50:03.645847+05:30	2019-08-23 19:50:03.645847+05:30	26	r1imghtlak.mmtcdn.com/ddddf61e71a211e79d84025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
844	2019-08-23 19:50:03.656641+05:30	2019-08-23 19:50:03.656641+05:30	26	r1imghtlak.mmtcdn.com/e87a2f0271a211e79d84025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
845	2019-08-23 19:50:03.667896+05:30	2019-08-23 19:50:03.667896+05:30	26	r1imghtlak.mmtcdn.com/f73867a271a211e79d84025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
846	2019-08-23 19:50:03.67898+05:30	2019-08-23 19:50:03.67898+05:30	26	r1imghtlak.mmtcdn.com/5726f56a71a411e793d80a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
847	2019-08-23 19:50:03.712041+05:30	2019-08-23 19:50:03.712041+05:30	26	r1imghtlak.mmtcdn.com/6515c17471a411e793d80a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
848	2019-08-23 19:50:03.746763+05:30	2019-08-23 19:50:03.746763+05:30	26	r1imghtlak.mmtcdn.com/881c46b671a411e793d80a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
849	2019-08-23 19:50:03.789708+05:30	2019-08-23 19:50:03.789708+05:30	26	r1imghtlak.mmtcdn.com/95aab6d271a411e7ac9a0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
850	2019-08-23 19:50:03.800651+05:30	2019-08-23 19:50:03.800651+05:30	26	r1imghtlak.mmtcdn.com/b34700ce71a411e7b4900a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
851	2019-08-23 19:50:03.834155+05:30	2019-08-23 19:50:03.834155+05:30	26	r1imghtlak.mmtcdn.com/b859167e71a411e7b4900a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
852	2019-08-23 19:50:03.878882+05:30	2019-08-23 19:50:03.878882+05:30	26	r1imghtlak.mmtcdn.com/bf7c6e6071a411e7b4900a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
853	2019-08-23 19:50:16.376049+05:30	2019-08-23 19:50:16.376049+05:30	27	r1imghtlak.mmtcdn.com/b9c76cced09011e5acaadaf4768ad8d9.png?&output-quality=75&downsize=*:350&crop=520:350;7,0&output-format=jpg
854	2019-08-23 19:50:16.387082+05:30	2019-08-23 19:50:16.387082+05:30	27	r1imghtlak.mmtcdn.com/243976b2d14811e584ef5ee5da2daa2a.png?&output-quality=75&output-format=jpg
855	2019-08-23 19:50:16.39816+05:30	2019-08-23 19:50:16.39816+05:30	27	r1imghtlak.mmtcdn.com/266adb60d14811e5b9535ee5da2daa2a.png?&output-quality=75&downsize=*:350&crop=520:350;8,0&output-format=jpg
856	2019-08-23 19:50:16.409259+05:30	2019-08-23 19:50:16.409259+05:30	27	r1imghtlak.mmtcdn.com/4b3cec3ad14811e5bf005ee5da2daa2a.png?&output-quality=75&downsize=*:350&crop=520:350;29,0&output-format=jpg
857	2019-08-23 19:50:16.420603+05:30	2019-08-23 19:50:16.420603+05:30	27	r1imghtlak.mmtcdn.com/226f9ffed3ba11e5bfb5001ec9b85d13.png?&output-quality=75&downsize=*:350&crop=520:350;33,0&output-format=jpg
858	2019-08-23 19:50:28.709943+05:30	2019-08-23 19:50:28.709943+05:30	28	r1imghtlak.mmtcdn.com/a2280c549dc311e5ae9136cfdd80c293.png?&output-quality=75&output-format=jpg
859	2019-08-23 19:50:28.721348+05:30	2019-08-23 19:50:28.721348+05:30	28	r1imghtlak.mmtcdn.com/af15785c9dc311e5adf9daf4768ad8d9.png?&output-quality=75&output-format=jpg
860	2019-08-23 19:50:28.731596+05:30	2019-08-23 19:50:28.731596+05:30	28	r1imghtlak.mmtcdn.com/927e0f98cf1d11e59cd436cfdd80c293.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,12&output-format=jpg
861	2019-08-23 19:50:28.742979+05:30	2019-08-23 19:50:28.742979+05:30	28	r1imghtlak.mmtcdn.com/941dd856cf1d11e5a8ab36cfdd80c293.jpg?&output-quality=75&output-format=jpg
862	2019-08-23 19:50:28.754201+05:30	2019-08-23 19:50:28.754201+05:30	28	r1imghtlak.mmtcdn.com/94fb5514cf1d11e5946d36cfdd80c293.jpg?&output-quality=75&output-format=jpg
863	2019-08-23 19:50:28.765034+05:30	2019-08-23 19:50:28.765034+05:30	28	r1imghtlak.mmtcdn.com/9677ed94cf1d11e5946d36cfdd80c293.jpg?&output-quality=75&output-format=jpg
864	2019-08-23 19:50:28.776306+05:30	2019-08-23 19:50:28.776306+05:30	28	r1imghtlak.mmtcdn.com/990b3b74cf1d11e598b936cfdd80c293.jpg?&output-quality=75&output-format=jpg
865	2019-08-23 19:51:03.959695+05:30	2019-08-23 19:51:03.959695+05:30	30	r1imghtlak.mmtcdn.com/bffd02128e4311e7bac2025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
866	2019-08-23 19:51:03.969322+05:30	2019-08-23 19:51:03.969322+05:30	30	r1imghtlak.mmtcdn.com/c14d8e2a8e4311e788f10a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
867	2019-08-23 19:51:03.980717+05:30	2019-08-23 19:51:03.980717+05:30	30	r1imghtlak.mmtcdn.com/bffd02128e4311e7bac2025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
868	2019-08-23 19:51:03.991836+05:30	2019-08-23 19:51:03.991836+05:30	30	r1imghtlak.mmtcdn.com/c14d8e2a8e4311e788f10a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
869	2019-08-23 19:51:04.00317+05:30	2019-08-23 19:51:04.00317+05:30	30	r1imghtlak.mmtcdn.com/c177a12e8e4311e7a386025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
870	2019-08-23 19:51:04.01424+05:30	2019-08-23 19:51:04.01424+05:30	30	r1imghtlak.mmtcdn.com/c1ba71528e4311e7bac2025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
871	2019-08-23 19:51:04.025126+05:30	2019-08-23 19:51:04.025126+05:30	30	r1imghtlak.mmtcdn.com/c177a12e8e4311e7a386025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
872	2019-08-23 19:51:04.03637+05:30	2019-08-23 19:51:04.03637+05:30	30	r1imghtlak.mmtcdn.com/c1ba71528e4311e7bac2025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
873	2019-08-23 19:51:04.047533+05:30	2019-08-23 19:51:04.047533+05:30	30	r1imghtlak.mmtcdn.com/bf67e2c28e4311e7a386025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
874	2019-08-23 19:51:04.0587+05:30	2019-08-23 19:51:04.0587+05:30	30	r1imghtlak.mmtcdn.com/bf056de08e4311e7bac2025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
875	2019-08-23 19:51:04.069901+05:30	2019-08-23 19:51:04.069901+05:30	30	r1imghtlak.mmtcdn.com/bffd02128e4311e7bac2025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
876	2019-08-23 19:51:04.092633+05:30	2019-08-23 19:51:04.092633+05:30	30	r1imghtlak.mmtcdn.com/c177a12e8e4311e7a386025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
877	2019-08-23 19:51:04.153703+05:30	2019-08-23 19:51:04.153703+05:30	30	r1imghtlak.mmtcdn.com/c04061ce8e4311e788f10a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
878	2019-08-23 19:51:04.192994+05:30	2019-08-23 19:51:04.192994+05:30	30	r1imghtlak.mmtcdn.com/c34b99928e4311e788f10a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
879	2019-08-23 19:51:04.21347+05:30	2019-08-23 19:51:04.21347+05:30	30	r1imghtlak.mmtcdn.com/bf5a79528e4311e788f10a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
880	2019-08-23 19:51:04.225201+05:30	2019-08-23 19:51:04.225201+05:30	30	r1imghtlak.mmtcdn.com/c1ba71528e4311e7bac2025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
881	2019-08-23 19:51:24.429933+05:30	2019-08-23 19:51:24.429933+05:30	31	r1imghtlak.mmtcdn.com/cafde73c3ac711e7963d0224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;3,0&output-format=jpg
882	2019-08-23 19:51:24.451629+05:30	2019-08-23 19:51:24.451629+05:30	31	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201409241156174898-e8ca714a3ac711e7b3150a209fbd0127.jpg?&output-quality=75&downsize=*:350&crop=520:350;3,0&output-format=jpg
883	2019-08-23 19:51:24.473312+05:30	2019-08-23 19:51:24.473312+05:30	31	r1imghtlak.mmtcdn.com/72d6a04c739a11e792d0025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
884	2019-08-23 19:51:24.496118+05:30	2019-08-23 19:51:24.496118+05:30	31	r1imghtlak.mmtcdn.com/c9c6e740739a11e7bc530a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
885	2019-08-23 19:51:24.51767+05:30	2019-08-23 19:51:24.51767+05:30	31	r1imghtlak.mmtcdn.com/d1a89e601a0011e89c120a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
886	2019-08-23 19:51:24.529305+05:30	2019-08-23 19:51:24.529305+05:30	31	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201409241156174898-f3f485601a0011e8817202755708f0b3.jpg?&output-quality=75&downsize=*:350&crop=520:350;3,0&output-format=jpg
887	2019-08-23 19:51:24.539263+05:30	2019-08-23 19:51:24.539263+05:30	31	r1imghtlak.mmtcdn.com/cafde73c3ac711e7963d0224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;3,0&output-format=jpg
888	2019-08-23 19:51:24.551949+05:30	2019-08-23 19:51:24.551949+05:30	31	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201409241156174898-e8ca714a3ac711e7b3150a209fbd0127.jpg?&output-quality=75&downsize=*:350&crop=520:350;3,0&output-format=jpg
889	2019-08-23 19:51:24.561471+05:30	2019-08-23 19:51:24.561471+05:30	31	r1imghtlak.mmtcdn.com/72d6a04c739a11e792d0025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
890	2019-08-23 19:51:24.572805+05:30	2019-08-23 19:51:24.572805+05:30	31	r1imghtlak.mmtcdn.com/c9c6e740739a11e7bc530a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
891	2019-08-23 19:51:24.584126+05:30	2019-08-23 19:51:24.584126+05:30	31	r1imghtlak.mmtcdn.com/d1a89e601a0011e89c120a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
892	2019-08-23 19:51:24.595184+05:30	2019-08-23 19:51:24.595184+05:30	31	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201409241156174898-f3f485601a0011e8817202755708f0b3.jpg?&output-quality=75&downsize=*:350&crop=520:350;3,0&output-format=jpg
893	2019-08-23 19:51:24.606314+05:30	2019-08-23 19:51:24.606314+05:30	31	r1imghtlak.mmtcdn.com/1b0804b85d7611e6b9565ee5da2daa2a.jpg?&output-quality=75&downsize=*:350&crop=520:350;3,0&output-format=jpg
894	2019-08-23 19:51:24.617425+05:30	2019-08-23 19:51:24.617425+05:30	31	r1imghtlak.mmtcdn.com/e19405c45d7511e6a2575ee5da2daa2a.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
895	2019-08-23 19:51:24.628259+05:30	2019-08-23 19:51:24.628259+05:30	31	r1imghtlak.mmtcdn.com/f7978da05d7511e6be985ee5da2daa2a.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
896	2019-08-23 19:51:24.639349+05:30	2019-08-23 19:51:24.639349+05:30	31	r1imghtlak.mmtcdn.com/3cda536a5df411e69dec5ee5da2daa2a.jpg?&output-quality=75&downsize=*:350&crop=520:350;3,0&output-format=jpg
897	2019-08-23 19:51:24.650659+05:30	2019-08-23 19:51:24.650659+05:30	31	r1imghtlak.mmtcdn.com/cc449210443811e7802302755708f0b3.jpg?&output-quality=75&downsize=*:350&crop=520:350;82,0&output-format=jpg
898	2019-08-23 19:51:24.66166+05:30	2019-08-23 19:51:24.66166+05:30	31	r1imghtlak.mmtcdn.com/6fbebb7c5df411e6bd5a5ee5da2daa2a.jpg?&output-quality=75&downsize=*:350&crop=520:350;3,0&output-format=jpg
899	2019-08-23 19:51:24.67254+05:30	2019-08-23 19:51:24.67254+05:30	31	r1imghtlak.mmtcdn.com/b345ac1a538611e788a402be818ef5c5.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
900	2019-08-23 19:51:24.683756+05:30	2019-08-23 19:51:24.683756+05:30	31	r1imghtlak.mmtcdn.com/08adb61e739b11e7acb60a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
901	2019-08-23 19:51:24.694931+05:30	2019-08-23 19:51:24.694931+05:30	31	r1imghtlak.mmtcdn.com/74657c70739b11e7910e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
902	2019-08-23 19:51:24.705929+05:30	2019-08-23 19:51:24.705929+05:30	31	r1imghtlak.mmtcdn.com/e8440936739b11e7910e0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
903	2019-08-23 19:51:24.71645+05:30	2019-08-23 19:51:24.71645+05:30	31	r1imghtlak.mmtcdn.com/cc553a309f7711e7b9c90a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;51,0&output-format=jpg
904	2019-08-23 19:51:24.728172+05:30	2019-08-23 19:51:24.728172+05:30	31	r1imghtlak.mmtcdn.com/d616c0c09f7711e78c190a209fbd0127.jpg?&output-quality=75&downsize=*:350&crop=520:350;51,0&output-format=jpg
905	2019-08-23 19:51:24.739391+05:30	2019-08-23 19:51:24.739391+05:30	31	r1imghtlak.mmtcdn.com/dcf2e4969f7711e7b43b0a209fbd0127.jpg?&output-quality=75&downsize=*:350&crop=520:350;51,0&output-format=jpg
906	2019-08-23 19:51:24.749819+05:30	2019-08-23 19:51:24.749819+05:30	31	r1imghtlak.mmtcdn.com/e53d28509f7711e7a6190abf8c3f28e8.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,3&output-format=jpg
907	2019-08-23 19:51:24.76074+05:30	2019-08-23 19:51:24.76074+05:30	31	r1imghtlak.mmtcdn.com/f21e2b149f7711e79e1d0224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;4,0&output-format=jpg
908	2019-08-23 19:51:24.772142+05:30	2019-08-23 19:51:24.772142+05:30	31	r1imghtlak.mmtcdn.com/f9b8a0d49f7711e787e40a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;7,0&output-format=jpg
909	2019-08-23 19:51:24.783099+05:30	2019-08-23 19:51:24.783099+05:30	31	r1imghtlak.mmtcdn.com/03bbdb5a9f7811e7836902cf78a43b2c.jpg?&output-quality=75&downsize=520:350&output-format=jpg
910	2019-08-23 19:51:24.794731+05:30	2019-08-23 19:51:24.794731+05:30	31	r1imghtlak.mmtcdn.com/58c2133a9f7811e79b4f0a141913ba2c.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
911	2019-08-23 19:51:24.805938+05:30	2019-08-23 19:51:24.805938+05:30	31	r1imghtlak.mmtcdn.com/628851f49f7811e7b9900a209fbd0127.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
912	2019-08-23 19:51:24.816674+05:30	2019-08-23 19:51:24.816674+05:30	31	r1imghtlak.mmtcdn.com/6b2def309f7811e7a85e0224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;5,0&output-format=jpg
913	2019-08-23 19:51:24.827886+05:30	2019-08-23 19:51:24.827886+05:30	31	r1imghtlak.mmtcdn.com/727757549f7811e7b31b0abf8c3f28e8.jpg?&output-quality=75&downsize=520:350&output-format=jpg
914	2019-08-23 19:51:24.850774+05:30	2019-08-23 19:51:24.850774+05:30	31	r1imghtlak.mmtcdn.com/7f58258e9f7811e7aa360a141913ba2c.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,3&output-format=jpg
915	2019-08-23 19:51:24.873434+05:30	2019-08-23 19:51:24.873434+05:30	31	r1imghtlak.mmtcdn.com/2b014ce61a0111e891f40a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
916	2019-08-23 19:51:24.893944+05:30	2019-08-23 19:51:24.893944+05:30	31	r1imghtlak.mmtcdn.com/118e7694b03311e8adaa0ac2229b7162.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
917	2019-08-23 19:51:24.905478+05:30	2019-08-23 19:51:24.905478+05:30	31	r1imghtlak.mmtcdn.com/12c018f6b03311e8820d020381a52c20.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
918	2019-08-23 19:51:24.916583+05:30	2019-08-23 19:51:24.916583+05:30	31	r1imghtlak.mmtcdn.com/132d2b3ab03311e884100aea9f0f8f9a.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
919	2019-08-23 19:51:24.928722+05:30	2019-08-23 19:51:24.928722+05:30	31	r1imghtlak.mmtcdn.com/13c72b9ab03311e8bc97020381a52c20.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
920	2019-08-23 19:51:24.950194+05:30	2019-08-23 19:51:24.950194+05:30	31	r1imghtlak.mmtcdn.com/13594882b03311e89b00027737af04da.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
921	2019-08-23 19:51:55.239357+05:30	2019-08-23 19:51:55.239357+05:30	32	r1imghtlak.mmtcdn.com/df0b36b2ddd211e893e00242ac110004.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
922	2019-08-23 19:51:55.250714+05:30	2019-08-23 19:51:55.250714+05:30	32	r1imghtlak.mmtcdn.com/df4e71e8ddd211e8ab050242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
923	2019-08-23 19:51:55.272339+05:30	2019-08-23 19:51:55.272339+05:30	32	r1imghtlak.mmtcdn.com/e17185b4ddd211e89bd70242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
924	2019-08-23 19:51:55.283023+05:30	2019-08-23 19:51:55.283023+05:30	32	r1imghtlak.mmtcdn.com/e0e19972338111e998720242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;3,0&output-format=jpg
925	2019-08-23 19:51:55.294255+05:30	2019-08-23 19:51:55.294255+05:30	32	r1imghtlak.mmtcdn.com/df0b36b2ddd211e893e00242ac110004.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
926	2019-08-23 19:51:55.305022+05:30	2019-08-23 19:51:55.305022+05:30	32	r1imghtlak.mmtcdn.com/df4e71e8ddd211e8ab050242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
927	2019-08-23 19:51:55.316303+05:30	2019-08-23 19:51:55.316303+05:30	32	r1imghtlak.mmtcdn.com/e17185b4ddd211e89bd70242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
928	2019-08-23 19:51:55.327537+05:30	2019-08-23 19:51:55.327537+05:30	32	r1imghtlak.mmtcdn.com/e0e19972338111e998720242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;3,0&output-format=jpg
929	2019-08-23 19:51:55.33804+05:30	2019-08-23 19:51:55.33804+05:30	32	r1imghtlak.mmtcdn.com/823fbda4ddd211e8a3060242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
930	2019-08-23 19:51:55.349486+05:30	2019-08-23 19:51:55.349486+05:30	32	r1imghtlak.mmtcdn.com/8234f680ddd211e8938a0242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
931	2019-08-23 19:51:55.360429+05:30	2019-08-23 19:51:55.360429+05:30	32	r1imghtlak.mmtcdn.com/850d410addd211e88cfa0242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
932	2019-08-23 19:51:55.383552+05:30	2019-08-23 19:51:55.383552+05:30	32	r1imghtlak.mmtcdn.com/49d8b478262211e9acf80242ac110002.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
933	2019-08-23 19:51:55.405562+05:30	2019-08-23 19:51:55.405562+05:30	32	r1imghtlak.mmtcdn.com/2966c7f02dea11e9a4620242ac110002.jfif?&output-quality=75&downsize=*:350&crop=520:350;4,0&output-format=jpg
934	2019-08-23 19:51:55.427865+05:30	2019-08-23 19:51:55.427865+05:30	32	r1imghtlak.mmtcdn.com/823fbda4ddd211e8a3060242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
935	2019-08-23 19:51:55.450795+05:30	2019-08-23 19:51:55.450795+05:30	32	r1imghtlak.mmtcdn.com/8234f680ddd211e8938a0242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
936	2019-08-23 19:51:55.472013+05:30	2019-08-23 19:51:55.472013+05:30	32	r1imghtlak.mmtcdn.com/850d410addd211e88cfa0242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
937	2019-08-23 19:51:55.494512+05:30	2019-08-23 19:51:55.494512+05:30	32	r1imghtlak.mmtcdn.com/49d8b478262211e9acf80242ac110002.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
938	2019-08-23 19:51:55.516951+05:30	2019-08-23 19:51:55.516951+05:30	32	r1imghtlak.mmtcdn.com/2966c7f02dea11e9a4620242ac110002.jfif?&output-quality=75&downsize=*:350&crop=520:350;4,0&output-format=jpg
939	2019-08-23 19:51:55.538308+05:30	2019-08-23 19:51:55.538308+05:30	32	r1imghtlak.mmtcdn.com/5b856828d9cf11e8add60242ac110004.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
940	2019-08-23 19:51:55.560545+05:30	2019-08-23 19:51:55.560545+05:30	32	r1imghtlak.mmtcdn.com/fc621b04d9d111e88cef0242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
941	2019-08-23 19:51:55.581622+05:30	2019-08-23 19:51:55.581622+05:30	32	r1imghtlak.mmtcdn.com/582b908ad9cf11e8a20a0242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
942	2019-08-23 19:51:55.593264+05:30	2019-08-23 19:51:55.593264+05:30	32	r1imghtlak.mmtcdn.com/450af9d2d9cf11e8b4170242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
943	2019-08-23 19:51:55.605274+05:30	2019-08-23 19:51:55.605274+05:30	32	r1imghtlak.mmtcdn.com/3e8c2ca2d9cf11e891cc0242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
944	2019-08-23 19:51:55.615815+05:30	2019-08-23 19:51:55.615815+05:30	32	r1imghtlak.mmtcdn.com/408aabb4d9cf11e8a49e0242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
945	2019-08-23 19:51:55.625613+05:30	2019-08-23 19:51:55.625613+05:30	32	r1imghtlak.mmtcdn.com/4415c48ad9cf11e8bcf90242ac110004.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
946	2019-08-23 19:51:55.636707+05:30	2019-08-23 19:51:55.636707+05:30	32	r1imghtlak.mmtcdn.com/469c61fad9cf11e8b41a0242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
947	2019-08-23 19:51:55.647855+05:30	2019-08-23 19:51:55.647855+05:30	32	r1imghtlak.mmtcdn.com/4b65099ed9cf11e885cd0242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
948	2019-08-23 19:51:55.659867+05:30	2019-08-23 19:51:55.659867+05:30	32	r1imghtlak.mmtcdn.com/48fbce54d9cf11e8a49e0242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
949	2019-08-23 19:51:55.669964+05:30	2019-08-23 19:51:55.669964+05:30	32	r1imghtlak.mmtcdn.com/57249e48d9cf11e8a9d70242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
950	2019-08-23 19:51:55.68132+05:30	2019-08-23 19:51:55.68132+05:30	32	r1imghtlak.mmtcdn.com/fbb6cde4d9d111e8864b0242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;71,0&output-format=jpg
951	2019-08-23 19:51:55.693219+05:30	2019-08-23 19:51:55.693219+05:30	32	r1imghtlak.mmtcdn.com/4f13120cd9cf11e8a20a0242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
952	2019-08-23 19:51:55.703267+05:30	2019-08-23 19:51:55.703267+05:30	32	r1imghtlak.mmtcdn.com/51460304d9cf11e884ae0242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
953	2019-08-23 19:51:55.714552+05:30	2019-08-23 19:51:55.714552+05:30	32	r1imghtlak.mmtcdn.com/4e426d3cd9cf11e8ba770242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
954	2019-08-23 19:51:55.726856+05:30	2019-08-23 19:51:55.726856+05:30	32	r1imghtlak.mmtcdn.com/f9667f1cd9d111e8bbdc0242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
955	2019-08-23 19:51:55.748449+05:30	2019-08-23 19:51:55.748449+05:30	32	r1imghtlak.mmtcdn.com/f9bd2c04d9d111e8bcf10242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
956	2019-08-23 19:51:55.770508+05:30	2019-08-23 19:51:55.770508+05:30	32	r1imghtlak.mmtcdn.com/41905770d9cf11e8b4dc0242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
957	2019-08-23 19:51:55.793127+05:30	2019-08-23 19:51:55.793127+05:30	32	r1imghtlak.mmtcdn.com/db4875fac51c11e7ae690224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
958	2019-08-23 19:51:55.81538+05:30	2019-08-23 19:51:55.81538+05:30	32	r1imghtlak.mmtcdn.com/49f257bad9cf11e89c410242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
959	2019-08-23 19:51:55.836299+05:30	2019-08-23 19:51:55.836299+05:30	32	r1imghtlak.mmtcdn.com/fe3367c6d9d111e8b57e0242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
960	2019-08-23 19:51:55.847207+05:30	2019-08-23 19:51:55.847207+05:30	32	r1imghtlak.mmtcdn.com/d297aba6c51c11e7bf520a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
961	2019-08-23 19:51:55.858258+05:30	2019-08-23 19:51:55.858258+05:30	32	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201608011434072696-34d360881fe611e9897d0242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
962	2019-08-23 19:51:55.869399+05:30	2019-08-23 19:51:55.869399+05:30	32	r1imghtlak.mmtcdn.com/3e525bbe1fe611e9b80f0242ac110002.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,55&output-format=jpg
963	2019-08-23 19:51:55.881464+05:30	2019-08-23 19:51:55.881464+05:30	32	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201608011434072696-407b1548338211e9ad7c0242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;18,0&output-format=jpg
964	2019-08-23 19:51:55.891899+05:30	2019-08-23 19:51:55.891899+05:30	32	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201608011434072696-407d4ec6338211e9b13f0242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;19,0&output-format=jpg
965	2019-08-23 19:51:55.902737+05:30	2019-08-23 19:51:55.902737+05:30	32	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201608011434072696-42751f2e338211e9bc650242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;19,0&output-format=jpg
966	2019-08-23 19:51:55.913966+05:30	2019-08-23 19:51:55.913966+05:30	32	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201608011434072696-6455326e338211e987eb0242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;35,0&output-format=jpg
967	2019-08-23 19:51:55.926043+05:30	2019-08-23 19:51:55.926043+05:30	32	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201608011434072696-6905dfc0338211e9b29f0242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;51,0&output-format=jpg
968	2019-08-23 19:51:55.936056+05:30	2019-08-23 19:51:55.936056+05:30	32	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201608011434072696-84e0fb1e338511e9b6940242ac110003.jpg?&output-quality=75&downsize=*:350&crop=520:350;71,0&output-format=jpg
969	2019-08-23 19:51:55.947479+05:30	2019-08-23 19:51:55.947479+05:30	32	r1imghtlak.mmtcdn.com/ab1467e4338511e98bbd0242ac110003.jfif?&output-quality=75&downsize=*:350&crop=520:350;51,0&output-format=jpg
970	2019-08-23 19:52:15.830619+05:30	2019-08-23 19:52:15.830619+05:30	33	r1imghtlak.mmtcdn.com/67ae99200c2a11e987600242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
971	2019-08-23 19:52:15.841763+05:30	2019-08-23 19:52:15.841763+05:30	33	r1imghtlak.mmtcdn.com/8b3636f00c2a11e9baea0242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
972	2019-08-23 19:52:15.851881+05:30	2019-08-23 19:52:15.851881+05:30	33	r1imghtlak.mmtcdn.com/2d8097b42c3a11e994c40242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
973	2019-08-23 19:52:15.863372+05:30	2019-08-23 19:52:15.863372+05:30	33	r1imghtlak.mmtcdn.com/d19b61502c3d11e996920242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
974	2019-08-23 19:52:15.874709+05:30	2019-08-23 19:52:15.874709+05:30	33	r1imghtlak.mmtcdn.com/df30380e2c3d11e9bde80242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
975	2019-08-23 19:52:15.886184+05:30	2019-08-23 19:52:15.886184+05:30	33	r1imghtlak.mmtcdn.com/67ae99200c2a11e987600242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
976	2019-08-23 19:52:15.908678+05:30	2019-08-23 19:52:15.908678+05:30	33	r1imghtlak.mmtcdn.com/8b3636f00c2a11e9baea0242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
977	2019-08-23 19:52:15.931483+05:30	2019-08-23 19:52:15.931483+05:30	33	r1imghtlak.mmtcdn.com/2d8097b42c3a11e994c40242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
978	2019-08-23 19:52:15.953043+05:30	2019-08-23 19:52:15.953043+05:30	33	r1imghtlak.mmtcdn.com/d19b61502c3d11e996920242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
979	2019-08-23 19:52:15.976814+05:30	2019-08-23 19:52:15.976814+05:30	33	r1imghtlak.mmtcdn.com/df30380e2c3d11e9bde80242ac110002.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
980	2019-08-23 19:52:15.996028+05:30	2019-08-23 19:52:15.996028+05:30	33	r1imghtlak.mmtcdn.com/ff06e4d4e40711e4ba40daf4768ad8d9.jfif?&output-quality=75&downsize=*:350&crop=520:350;110,0&output-format=jpg
981	2019-08-23 19:52:16.007661+05:30	2019-08-23 19:52:16.007661+05:30	33	r1imghtlak.mmtcdn.com/694d6b36e40a11e4954cdaf4768ad8d9.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
982	2019-08-23 19:52:16.029619+05:30	2019-08-23 19:52:16.029619+05:30	33	r1imghtlak.mmtcdn.com/3cb8325ee40a11e4a1e1daf4768ad8d9.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
983	2019-08-23 19:52:16.053025+05:30	2019-08-23 19:52:16.053025+05:30	33	r1imghtlak.mmtcdn.com/a063db64e41411e4867332e76f7e45c9.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
984	2019-08-23 19:52:16.062987+05:30	2019-08-23 19:52:16.062987+05:30	33	r1imghtlak.mmtcdn.com/0495e3f8e40f11e49e1e001ec9b85d13.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
985	2019-08-23 19:52:16.073629+05:30	2019-08-23 19:52:16.073629+05:30	33	r1imghtlak.mmtcdn.com/c6bce528e1d311e493f232e76f7e45c9.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
986	2019-08-23 19:52:16.086143+05:30	2019-08-23 19:52:16.086143+05:30	33	r1imghtlak.mmtcdn.com/c4a1e446e40d11e4b40e001ec9b85d13.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
987	2019-08-23 19:52:16.108379+05:30	2019-08-23 19:52:16.108379+05:30	33	r1imghtlak.mmtcdn.com/9d6b620c5b6511e4a905daf4768ad8d9.jfif?&output-quality=75&downsize=*:350&crop=520:350;3,0&output-format=jpg
988	2019-08-23 19:52:16.129132+05:30	2019-08-23 19:52:16.129132+05:30	33	r1imghtlak.mmtcdn.com/fd80076ee40a11e49001daf4768ad8d9.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
989	2019-08-23 19:52:16.140386+05:30	2019-08-23 19:52:16.140386+05:30	33	r1imghtlak.mmtcdn.com/0a8df3f0e1d411e4b28e32e76f7e45c9.jfif?&output-quality=75&downsize=520:*&crop=520:350;0,215&output-format=jpg
990	2019-08-23 19:52:16.151628+05:30	2019-08-23 19:52:16.151628+05:30	33	r1imghtlak.mmtcdn.com/823l690n8h16f4aovjjth4bt007l.jpg?&output-quality=75&downsize=*:350&crop=520:350;90,0&output-format=jpg
991	2019-08-23 19:52:16.163007+05:30	2019-08-23 19:52:16.163007+05:30	33	r1imghtlak.mmtcdn.com/71b764205b6611e4895b5ee5da2daa2a.jfif?&output-quality=75&downsize=*:350&crop=520:350;3,0&output-format=jpg
992	2019-08-23 19:52:16.175103+05:30	2019-08-23 19:52:16.175103+05:30	33	r1imghtlak.mmtcdn.com/0d93676a5b6a11e48f8236cfdd80c293.jfif?&output-quality=75&downsize=*:350&crop=520:350;3,0&output-format=jpg
993	2019-08-23 19:52:16.197149+05:30	2019-08-23 19:52:16.197149+05:30	33	r1imghtlak.mmtcdn.com/d2448c5ce1d311e4af4632e76f7e45c9.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
994	2019-08-23 19:52:16.219007+05:30	2019-08-23 19:52:16.219007+05:30	33	r1imghtlak.mmtcdn.com/a5339eb8e40a11e4b89cdaf4768ad8d9.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
995	2019-08-23 19:52:16.240882+05:30	2019-08-23 19:52:16.240882+05:30	33	r1imghtlak.mmtcdn.com/5fpvp7tee96it16ulmdmjk6n007h.jpg?&output-quality=75&downsize=*:350&crop=520:350;90,0&output-format=jpg
996	2019-08-23 19:52:16.264001+05:30	2019-08-23 19:52:16.264001+05:30	33	r1imghtlak.mmtcdn.com/7d8ace1ee40e11e488af001ec9b85d13.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
997	2019-08-23 19:52:16.285455+05:30	2019-08-23 19:52:16.285455+05:30	33	r1imghtlak.mmtcdn.com/b4972876e40e11e48d9d001ec9b85d13.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
998	2019-08-23 19:52:16.307431+05:30	2019-08-23 19:52:16.307431+05:30	33	r1imghtlak.mmtcdn.com/96b8ef60e41311e4a86932e76f7e45c9.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
999	2019-08-23 19:52:16.32858+05:30	2019-08-23 19:52:16.32858+05:30	33	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/20140310140119781-0a5cfa9ce41411e4895032e76f7e45c9.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1000	2019-08-23 19:52:16.340184+05:30	2019-08-23 19:52:16.340184+05:30	33	r1imghtlak.mmtcdn.com/3575d01ee41411e49d7232e76f7e45c9.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1001	2019-08-23 19:52:16.350529+05:30	2019-08-23 19:52:16.350529+05:30	33	r1imghtlak.mmtcdn.com/4d4e5f26e41411e4ad3032e76f7e45c9.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1002	2019-08-23 19:52:16.361873+05:30	2019-08-23 19:52:16.361873+05:30	33	r1imghtlak.mmtcdn.com/6a7b54a0e41411e4a23b32e76f7e45c9.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1003	2019-08-23 19:52:16.372692+05:30	2019-08-23 19:52:16.372692+05:30	33	r1imghtlak.mmtcdn.com/80a4105ae41411e48cc732e76f7e45c9.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1004	2019-08-23 19:52:16.384692+05:30	2019-08-23 19:52:16.384692+05:30	33	r1imghtlak.mmtcdn.com/bd81b9e6e41411e498fc32e76f7e45c9.jfif?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1005	2019-08-23 19:52:16.407108+05:30	2019-08-23 19:52:16.407108+05:30	33	r1imghtlak.mmtcdn.com/1608bb326e8311e7b193025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
1006	2019-08-23 19:52:16.429863+05:30	2019-08-23 19:52:16.429863+05:30	33	r1imghtlak.mmtcdn.com/1f38899e6e8311e7b193025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
1007	2019-08-23 19:52:16.4502+05:30	2019-08-23 19:52:16.4502+05:30	33	r1imghtlak.mmtcdn.com/2e4476966e8311e7b9780a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1008	2019-08-23 19:52:16.47234+05:30	2019-08-23 19:52:16.47234+05:30	33	r1imghtlak.mmtcdn.com/45d53f2a6e8311e7b9780a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1009	2019-08-23 19:52:16.483171+05:30	2019-08-23 19:52:16.483171+05:30	33	r1imghtlak.mmtcdn.com/b6fefc046e8311e7b55f025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1010	2019-08-23 19:52:54.545165+05:30	2019-08-23 19:52:54.545165+05:30	34	r1imghtlak.mmtcdn.com/aaa53428860311e6b6950224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1011	2019-08-23 19:52:54.567668+05:30	2019-08-23 19:52:54.567668+05:30	34	r1imghtlak.mmtcdn.com/abf15b72860311e687cb0224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1012	2019-08-23 19:52:54.588641+05:30	2019-08-23 19:52:54.588641+05:30	34	r1imghtlak.mmtcdn.com/acfe5b1e860311e69e3102bf5ac07431.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1013	2019-08-23 19:52:54.600184+05:30	2019-08-23 19:52:54.600184+05:30	34	r1imghtlak.mmtcdn.com/ad4a5a1e860311e69f430a209fbd0127.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1014	2019-08-23 19:52:54.610774+05:30	2019-08-23 19:52:54.610774+05:30	34	r1imghtlak.mmtcdn.com/ade5cef4860311e68a6602bf5ac07431.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1015	2019-08-23 19:52:54.621866+05:30	2019-08-23 19:52:54.621866+05:30	34	r1imghtlak.mmtcdn.com/ae454302860311e6b0da0a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1016	2019-08-23 19:52:54.632984+05:30	2019-08-23 19:52:54.632984+05:30	34	r1imghtlak.mmtcdn.com/3da08048729411e7898a0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1017	2019-08-23 19:52:54.643698+05:30	2019-08-23 19:52:54.643698+05:30	34	r1imghtlak.mmtcdn.com/5d4f72c8729411e798920a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1018	2019-08-23 19:52:54.654648+05:30	2019-08-23 19:52:54.654648+05:30	34	r1imghtlak.mmtcdn.com/69391fd0729411e7b7fa025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1019	2019-08-23 19:52:54.665757+05:30	2019-08-23 19:52:54.665757+05:30	34	r1imghtlak.mmtcdn.com/b4db1a10729411e7898a0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1020	2019-08-23 19:52:54.677316+05:30	2019-08-23 19:52:54.677316+05:30	34	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201411142133215025-0419eed2a1d711e790a50a3aafc9d67a.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1021	2019-08-23 19:52:54.688223+05:30	2019-08-23 19:52:54.688223+05:30	34	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201411142133215025-276d2a34a1d711e7870a0acf2112f784.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1022	2019-08-23 19:52:54.69978+05:30	2019-08-23 19:52:54.69978+05:30	34	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201411142133215025-3751c2dea1d711e79e270258916102ba.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1023	2019-08-23 19:52:54.71039+05:30	2019-08-23 19:52:54.71039+05:30	34	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201411142133215025-48290c20a1d711e7a47c02755708f0b3.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1024	2019-08-23 19:52:54.721575+05:30	2019-08-23 19:52:54.721575+05:30	34	r1imghtlak.mmtcdn.com/aaa53428860311e6b6950224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1025	2019-08-23 19:52:54.732856+05:30	2019-08-23 19:52:54.732856+05:30	34	r1imghtlak.mmtcdn.com/abf15b72860311e687cb0224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1026	2019-08-23 19:52:54.743962+05:30	2019-08-23 19:52:54.743962+05:30	34	r1imghtlak.mmtcdn.com/acfe5b1e860311e69e3102bf5ac07431.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1027	2019-08-23 19:52:54.75498+05:30	2019-08-23 19:52:54.75498+05:30	34	r1imghtlak.mmtcdn.com/ad4a5a1e860311e69f430a209fbd0127.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1028	2019-08-23 19:52:54.765992+05:30	2019-08-23 19:52:54.765992+05:30	34	r1imghtlak.mmtcdn.com/ade5cef4860311e68a6602bf5ac07431.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1029	2019-08-23 19:52:54.777358+05:30	2019-08-23 19:52:54.777358+05:30	34	r1imghtlak.mmtcdn.com/ae454302860311e6b0da0a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1030	2019-08-23 19:52:54.788387+05:30	2019-08-23 19:52:54.788387+05:30	34	r1imghtlak.mmtcdn.com/3da08048729411e7898a0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1031	2019-08-23 19:52:54.798996+05:30	2019-08-23 19:52:54.798996+05:30	34	r1imghtlak.mmtcdn.com/5d4f72c8729411e798920a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1032	2019-08-23 19:52:54.810453+05:30	2019-08-23 19:52:54.810453+05:30	34	r1imghtlak.mmtcdn.com/69391fd0729411e7b7fa025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1033	2019-08-23 19:52:54.821556+05:30	2019-08-23 19:52:54.821556+05:30	34	r1imghtlak.mmtcdn.com/b4db1a10729411e7898a0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1034	2019-08-23 19:52:54.832295+05:30	2019-08-23 19:52:54.832295+05:30	34	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201411142133215025-0419eed2a1d711e790a50a3aafc9d67a.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1035	2019-08-23 19:52:54.842988+05:30	2019-08-23 19:52:54.842988+05:30	34	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201411142133215025-276d2a34a1d711e7870a0acf2112f784.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1036	2019-08-23 19:52:54.854905+05:30	2019-08-23 19:52:54.854905+05:30	34	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201411142133215025-3751c2dea1d711e79e270258916102ba.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1037	2019-08-23 19:52:54.876645+05:30	2019-08-23 19:52:54.876645+05:30	34	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201411142133215025-48290c20a1d711e7a47c02755708f0b3.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1038	2019-08-23 19:52:54.899585+05:30	2019-08-23 19:52:54.899585+05:30	34	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201411142133215025-af6495c6a1d711e786870a3a83b9b380.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1039	2019-08-23 19:52:54.920936+05:30	2019-08-23 19:52:54.920936+05:30	34	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201411142133215025-9f71d066a1d711e78d0802f200671ffc.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1040	2019-08-23 19:52:54.932145+05:30	2019-08-23 19:52:54.932145+05:30	34	r1imghtlak.mmtcdn.com/252a8b22860311e682c60a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1041	2019-08-23 19:52:54.942933+05:30	2019-08-23 19:52:54.942933+05:30	34	r1imghtlak.mmtcdn.com/26a3f344860311e6828e0224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1042	2019-08-23 19:52:54.954225+05:30	2019-08-23 19:52:54.954225+05:30	34	r1imghtlak.mmtcdn.com/27342c52860311e69e3102bf5ac07431.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1043	2019-08-23 19:52:54.965337+05:30	2019-08-23 19:52:54.965337+05:30	34	r1imghtlak.mmtcdn.com/25418b56860311e6acd10a209fbd0127.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
1044	2019-08-23 19:52:54.97746+05:30	2019-08-23 19:52:54.97746+05:30	34	r1imghtlak.mmtcdn.com/42c83d2c729411e788a00a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1045	2019-08-23 19:52:54.987796+05:30	2019-08-23 19:52:54.987796+05:30	34	r1imghtlak.mmtcdn.com/6787ef2c729411e7b3400a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1046	2019-08-23 19:52:54.99833+05:30	2019-08-23 19:52:54.99833+05:30	34	r1imghtlak.mmtcdn.com/7c19609c729411e7898a0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1047	2019-08-23 19:52:55.009071+05:30	2019-08-23 19:52:55.009071+05:30	34	r1imghtlak.mmtcdn.com/7ee943be729411e7b3400a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1048	2019-08-23 19:52:55.02032+05:30	2019-08-23 19:52:55.02032+05:30	34	r1imghtlak.mmtcdn.com/91890568729411e7b3400a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1049	2019-08-23 19:52:55.031479+05:30	2019-08-23 19:52:55.031479+05:30	34	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201411142133215025-a18f650ca1d711e79acd02755708f0b3.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1050	2019-08-23 19:52:55.042927+05:30	2019-08-23 19:52:55.042927+05:30	34	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201411142133215025-af6495c6a1d711e786870a3a83b9b380.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1051	2019-08-23 19:52:55.055087+05:30	2019-08-23 19:52:55.055087+05:30	34	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201411142133215025-9f71d066a1d711e78d0802f200671ffc.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1052	2019-08-23 19:52:55.076569+05:30	2019-08-23 19:52:55.076569+05:30	34	r1imghtlak.mmtcdn.com/252a8b22860311e682c60a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1053	2019-08-23 19:52:55.097868+05:30	2019-08-23 19:52:55.097868+05:30	34	r1imghtlak.mmtcdn.com/26a3f344860311e6828e0224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1054	2019-08-23 19:52:55.108656+05:30	2019-08-23 19:52:55.108656+05:30	34	r1imghtlak.mmtcdn.com/27342c52860311e69e3102bf5ac07431.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1055	2019-08-23 19:52:55.121091+05:30	2019-08-23 19:52:55.121091+05:30	34	r1imghtlak.mmtcdn.com/25418b56860311e6acd10a209fbd0127.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
1056	2019-08-23 19:52:55.130824+05:30	2019-08-23 19:52:55.130824+05:30	34	r1imghtlak.mmtcdn.com/42c83d2c729411e788a00a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1057	2019-08-23 19:52:55.142903+05:30	2019-08-23 19:52:55.142903+05:30	34	r1imghtlak.mmtcdn.com/6787ef2c729411e7b3400a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1058	2019-08-23 19:52:55.164116+05:30	2019-08-23 19:52:55.164116+05:30	34	r1imghtlak.mmtcdn.com/7c19609c729411e7898a0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1059	2019-08-23 19:52:55.175177+05:30	2019-08-23 19:52:55.175177+05:30	34	r1imghtlak.mmtcdn.com/7ee943be729411e7b3400a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1060	2019-08-23 19:52:55.188068+05:30	2019-08-23 19:52:55.188068+05:30	34	r1imghtlak.mmtcdn.com/91890568729411e7b3400a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1061	2019-08-23 19:52:55.208483+05:30	2019-08-23 19:52:55.208483+05:30	34	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201411142133215025-a18f650ca1d711e79acd02755708f0b3.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1062	2019-08-23 19:52:55.220472+05:30	2019-08-23 19:52:55.220472+05:30	34	r1imghtlak.mmtcdn.com/25420454f52511e78b4b0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1063	2019-08-23 19:52:55.24163+05:30	2019-08-23 19:52:55.24163+05:30	34	r1imghtlak.mmtcdn.com/27e0d9d8f52511e7a7ea0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1064	2019-08-23 19:52:55.25395+05:30	2019-08-23 19:52:55.25395+05:30	34	r1imghtlak.mmtcdn.com/24c5d2bcf52511e78b4b0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;4,0&output-format=jpg
1065	2019-08-23 19:52:55.274844+05:30	2019-08-23 19:52:55.274844+05:30	34	r1imghtlak.mmtcdn.com/5d60f506860511e6b9720a209fbd0127.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1066	2019-08-23 19:52:55.285859+05:30	2019-08-23 19:52:55.285859+05:30	34	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201411142133215025-cabfa898a1d611e7b8a20a209fbd0127.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
1067	2019-08-23 19:52:55.297496+05:30	2019-08-23 19:52:55.297496+05:30	34	r1imghtlak.mmtcdn.com/24426cb0f52511e78b4b0a4cef95d023.jpg?&output-quality=75&downsize=520:*&crop=520:350;0,20&output-format=jpg
1068	2019-08-23 19:52:55.30899+05:30	2019-08-23 19:52:55.30899+05:30	34	r1imghtlak.mmtcdn.com/2872525af52511e7a7ea0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1069	2019-08-23 19:52:55.319102+05:30	2019-08-23 19:52:55.319102+05:30	34	r1imghtlak.mmtcdn.com/11e86794860511e6acd10a209fbd0127.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
1070	2019-08-23 19:52:55.330391+05:30	2019-08-23 19:52:55.330391+05:30	34	r1imghtlak.mmtcdn.com/674912787a7611e6905736cfdd80c293.jpg?&output-quality=75&downsize=*:350&crop=520:350;4,0&output-format=jpg
1071	2019-08-23 19:52:55.341372+05:30	2019-08-23 19:52:55.341372+05:30	34	r1imghtlak.mmtcdn.com/157f656a860511e6b40f0224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1072	2019-08-23 19:52:55.352217+05:30	2019-08-23 19:52:55.352217+05:30	34	r1imghtlak.mmtcdn.com/7a012938860511e696840a209fbd0127.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1073	2019-08-23 19:52:55.363441+05:30	2019-08-23 19:52:55.363441+05:30	34	r1imghtlak.mmtcdn.com/7cb753fa860511e6a8940224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1074	2019-08-23 19:52:55.374586+05:30	2019-08-23 19:52:55.374586+05:30	34	r1imghtlak.mmtcdn.com/46dd8af2729411e798920a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1075	2019-08-23 19:52:55.386277+05:30	2019-08-23 19:52:55.386277+05:30	34	r1imghtlak.mmtcdn.com/5e44a4aa729411e7a95a025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1076	2019-08-23 19:52:55.4079+05:30	2019-08-23 19:52:55.4079+05:30	34	r1imghtlak.mmtcdn.com/8343b4c6729411e7a95a025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1077	2019-08-23 19:52:55.430592+05:30	2019-08-23 19:52:55.430592+05:30	34	r1imghtlak.mmtcdn.com/8477448e729411e7b7fa025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1078	2019-08-23 19:52:55.453146+05:30	2019-08-23 19:52:55.453146+05:30	34	r1imghtlak.mmtcdn.com/8f870210729411e7a95a025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1079	2019-08-23 19:52:55.462977+05:30	2019-08-23 19:52:55.462977+05:30	34	r1imghtlak.mmtcdn.com/92b088b2729411e7898a0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1080	2019-08-23 19:52:55.474131+05:30	2019-08-23 19:52:55.474131+05:30	34	r1imghtlak.mmtcdn.com/b3c8dfea729411e7a95a025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1081	2019-08-23 19:52:55.485293+05:30	2019-08-23 19:52:55.485293+05:30	34	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201411142133215025-70a80518a1d511e791520258916102ba.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1082	2019-08-23 19:52:55.496295+05:30	2019-08-23 19:52:55.496295+05:30	34	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201411142133215025-c9acd282a1d611e7b8aa0258916102ba.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1083	2019-08-23 19:52:55.5074+05:30	2019-08-23 19:52:55.5074+05:30	34	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201411142133215025-1872f9d2a1d711e7a7e802755708f0b3.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1084	2019-08-23 19:52:55.518594+05:30	2019-08-23 19:52:55.518594+05:30	34	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201411142133215025-4a006fe8a1d711e787690224510f5e5b.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1085	2019-08-23 19:52:55.529684+05:30	2019-08-23 19:52:55.529684+05:30	34	r2imghtlak.mmtcdn.com/r2-mmt-htl-image/201411142133215025-52a5db7ea1d711e784840a9df65c8753.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1086	2019-08-23 19:53:36.425409+05:30	2019-08-23 19:53:36.425409+05:30	35	r1imghtlak.mmtcdn.com/ghenti6mgp3vt1okbbje0f170014.jpg?&output-quality=75&downsize=*:350&crop=520:350;51,0&output-format=jpg
1087	2019-08-23 19:53:36.43685+05:30	2019-08-23 19:53:36.43685+05:30	35	r1imghtlak.mmtcdn.com/ohc48u8lb10l79ojruc0a4mv002a.jpg?&output-quality=75&downsize=*:350&crop=520:350;51,0&output-format=jpg
1088	2019-08-23 19:53:36.447229+05:30	2019-08-23 19:53:36.447229+05:30	35	r1imghtlak.mmtcdn.com/ri8euuv4qh5ijd12vi0edhkk002t.jpg?&output-quality=75&downsize=*:350&crop=520:350;51,0&output-format=jpg
1089	2019-08-23 19:53:36.458009+05:30	2019-08-23 19:53:36.458009+05:30	35	r1imghtlak.mmtcdn.com/lq9e8mno7t6vb7hdm3aotkhl000l.jpg?&output-quality=75&downsize=*:350&crop=520:350;51,0&output-format=jpg
1090	2019-08-23 19:53:36.469552+05:30	2019-08-23 19:53:36.469552+05:30	35	r1imghtlak.mmtcdn.com/pqhgjh80bl16jelibp63lvr3000s.jpg?&output-quality=75&downsize=*:350&crop=520:350;51,0&output-format=jpg
1091	2019-08-23 19:53:36.480276+05:30	2019-08-23 19:53:36.480276+05:30	35	r1imghtlak.mmtcdn.com/sjopsu967h70r3sg4s2hb4k9005e.jpg?&output-quality=75&downsize=*:350&crop=520:350;51,0&output-format=jpg
1092	2019-08-23 19:53:36.491402+05:30	2019-08-23 19:53:36.491402+05:30	35	r1imghtlak.mmtcdn.com/g8ik67reh547r4iuhdr05mi60063.jpg?&output-quality=75&downsize=*:350&crop=520:350;51,0&output-format=jpg
1093	2019-08-23 19:53:36.502727+05:30	2019-08-23 19:53:36.502727+05:30	35	r1imghtlak.mmtcdn.com/a3f22ef2311211e5a63f36cfdd80c293.jfif?&output-quality=75&downsize=*:350&crop=520:350;12,0&output-format=jpg
1094	2019-08-23 19:53:36.514081+05:30	2019-08-23 19:53:36.514081+05:30	35	r1imghtlak.mmtcdn.com/411f15f84c8411e7a1a702877da2cdc7.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
1095	2019-08-23 19:53:36.524791+05:30	2019-08-23 19:53:36.524791+05:30	35	r1imghtlak.mmtcdn.com/76c79414528d11e78ee20a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1096	2019-08-23 19:53:36.535941+05:30	2019-08-23 19:53:36.535941+05:30	35	r1imghtlak.mmtcdn.com/bddbcd0c528d11e78ee20a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1097	2019-08-23 19:53:36.547527+05:30	2019-08-23 19:53:36.547527+05:30	35	r1imghtlak.mmtcdn.com/de2ebbc8528d11e7a32b025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1098	2019-08-23 19:53:36.558047+05:30	2019-08-23 19:53:36.558047+05:30	35	r1imghtlak.mmtcdn.com/96bf305a528e11e7b732025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1099	2019-08-23 19:53:36.569492+05:30	2019-08-23 19:53:36.569492+05:30	35	r1imghtlak.mmtcdn.com/299b6344528f11e7b732025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1100	2019-08-23 19:53:36.58046+05:30	2019-08-23 19:53:36.58046+05:30	35	r1imghtlak.mmtcdn.com/e6f7626a703c11e782c6025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1101	2019-08-23 19:53:36.591136+05:30	2019-08-23 19:53:36.591136+05:30	35	r1imghtlak.mmtcdn.com/0d3ef8e8703d11e782c6025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;51,0&output-format=jpg
1102	2019-08-23 19:53:36.602786+05:30	2019-08-23 19:53:36.602786+05:30	35	r1imghtlak.mmtcdn.com/107578d4703d11e7b55f025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
1103	2019-08-23 19:53:36.613835+05:30	2019-08-23 19:53:36.613835+05:30	35	r1imghtlak.mmtcdn.com/3c84c312703d11e7a5fc025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;51,0&output-format=jpg
1104	2019-08-23 19:53:36.624565+05:30	2019-08-23 19:53:36.624565+05:30	35	r1imghtlak.mmtcdn.com/8d1cdf8a703d11e782c6025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1105	2019-08-23 19:53:36.635945+05:30	2019-08-23 19:53:36.635945+05:30	35	r1imghtlak.mmtcdn.com/a7a58d98703d11e795bd025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1106	2019-08-23 19:53:36.64696+05:30	2019-08-23 19:53:36.64696+05:30	35	r1imghtlak.mmtcdn.com/aaf28078703d11e782c6025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;34,0&output-format=jpg
1107	2019-08-23 19:53:36.670322+05:30	2019-08-23 19:53:36.670322+05:30	35	r1imghtlak.mmtcdn.com/c03ad566703d11e7b55f025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1108	2019-08-23 19:53:36.690462+05:30	2019-08-23 19:53:36.690462+05:30	35	r1imghtlak.mmtcdn.com/210c69fe703e11e7b55f025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1109	2019-08-23 19:53:36.701715+05:30	2019-08-23 19:53:36.701715+05:30	35	r1imghtlak.mmtcdn.com/43185f12703e11e795bd025f77df004f.jpg?&output-quality=75&downsize=*:350&crop=520:350;2,0&output-format=jpg
1110	2019-08-23 19:55:00.550052+05:30	2019-08-23 19:55:00.550052+05:30	36	r1imghtlak.mmtcdn.com/e0dd89ae519211e7b7f90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
1111	2019-08-23 19:55:00.561268+05:30	2019-08-23 19:55:00.561268+05:30	36	r1imghtlak.mmtcdn.com/b02cc490519311e7968b0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
1112	2019-08-23 19:55:00.571792+05:30	2019-08-23 19:55:00.571792+05:30	36	r1imghtlak.mmtcdn.com/4cb6c3ce519411e7968b0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
1113	2019-08-23 19:55:00.582991+05:30	2019-08-23 19:55:00.582991+05:30	36	r1imghtlak.mmtcdn.com/01d6cb32519511e790bf02be818ef5c5.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
1114	2019-08-23 19:55:00.594019+05:30	2019-08-23 19:55:00.594019+05:30	36	r1imghtlak.mmtcdn.com/52137852519511e790bf02be818ef5c5.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
1115	2019-08-23 19:55:00.604563+05:30	2019-08-23 19:55:00.604563+05:30	36	r1imghtlak.mmtcdn.com/e0dd89ae519211e7b7f90a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
1116	2019-08-23 19:55:00.616144+05:30	2019-08-23 19:55:00.616144+05:30	36	r1imghtlak.mmtcdn.com/b02cc490519311e7968b0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
1117	2019-08-23 19:55:00.627632+05:30	2019-08-23 19:55:00.627632+05:30	36	r1imghtlak.mmtcdn.com/4cb6c3ce519411e7968b0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
1118	2019-08-23 19:55:00.638359+05:30	2019-08-23 19:55:00.638359+05:30	36	r1imghtlak.mmtcdn.com/01d6cb32519511e790bf02be818ef5c5.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
1119	2019-08-23 19:55:00.649251+05:30	2019-08-23 19:55:00.649251+05:30	36	r1imghtlak.mmtcdn.com/52137852519511e790bf02be818ef5c5.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
1120	2019-08-23 19:55:00.660636+05:30	2019-08-23 19:55:00.660636+05:30	36	r1imghtlak.mmtcdn.com/bd06e5eeb2c311e58876001ec9b85d13.jfif?&output-quality=75&downsize=520:*&crop=520:350;0,5&output-format=jpg
1121	2019-08-23 19:55:00.671667+05:30	2019-08-23 19:55:00.671667+05:30	36	r1imghtlak.mmtcdn.com/d5f5f6b2b2c311e5b771001ec9b85d13.png?&output-quality=75&output-format=jpg
1122	2019-08-23 19:55:00.68218+05:30	2019-08-23 19:55:00.68218+05:30	36	r1imghtlak.mmtcdn.com/064dc83ab2c411e5b421001ec9b85d13.png?&output-quality=75&output-format=jpg
1123	2019-08-23 19:55:00.693881+05:30	2019-08-23 19:55:00.693881+05:30	36	r1imghtlak.mmtcdn.com/5786af14b2c411e5a22736cfdd80c293.jfif?&output-quality=75&output-format=jpg
1124	2019-08-23 19:55:00.705175+05:30	2019-08-23 19:55:00.705175+05:30	36	r1imghtlak.mmtcdn.com/e5f52bd6519211e79b890a4cef95d023.jpg?&output-quality=75&output-format=jpg
1125	2019-08-23 19:55:00.716985+05:30	2019-08-23 19:55:00.716985+05:30	36	r1imghtlak.mmtcdn.com/52ec25d2519311e790bf02be818ef5c5.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
1126	2019-08-23 19:55:00.738459+05:30	2019-08-23 19:55:00.738459+05:30	36	r1imghtlak.mmtcdn.com/3736edc6519411e7968b0a4cef95d023.jpg?&output-quality=75&downsize=*:350&crop=520:350;81,0&output-format=jpg
\.


--
-- Data for Name: price_calendar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price_calendar (id, created_at, updated_at, date, deal_id, base_price, commission_in_percentage, b2b_margin_price, b2b_selling_price, b2c_margin_price, b2c_selling_price, sold_out, weekend) FROM stdin;
1	\N	\N	2019-07-30 23:50:18.421276	1	\N	\N	\N	\N	\N	\N	\N	\N
2	\N	\N	2019-07-31 23:50:38.048077	1	\N	\N	\N	\N	\N	\N	\N	\N
3	\N	\N	2019-08-01 23:56:32.357543	1	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: room; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.room (id, created_at, updated_at, hotel_id, image_url, balcony, lowest_price_room, b2b_lowest_price_room, meal_plan, max_no_of_guest, room_type) FROM stdin;
53	2019-08-23 19:49:23.921088+05:30	2019-08-23 19:49:23.921088+05:30	24	\N	f	f	f	CP	2	NON AC DELUXE DOUBLEBED ROOM
54	2019-08-23 19:49:23.943558+05:30	2019-08-23 19:49:23.943558+05:30	24	\N	f	f	f	CP	2	Ac Super Deluxe Double Bed Room with Bath Tub
55	2019-08-23 19:49:23.965127+05:30	2019-08-23 19:49:23.965127+05:30	24	\N	f	f	f	CP	2	Ac Super Deluxe Triple Bedded Room
56	2019-08-23 19:49:24.020926+05:30	2019-08-23 19:49:24.020926+05:30	24	\N	f	f	f	CP	2	NON AC SUPER DELUXE DOUBLEBED ROOM
57	2019-08-23 19:49:24.042732+05:30	2019-08-23 19:49:24.042732+05:30	24	\N	f	f	f	CP	2	Ac Super Deluxe Triple Bedded Room
58	2019-08-23 19:49:24.066339+05:30	2019-08-23 19:49:24.066339+05:30	24	\N	f	f	f	CP	2	Ac Super Deluxe Double Bed Room
59	2019-08-23 19:49:24.098996+05:30	2019-08-23 19:49:24.098996+05:30	24	\N	f	f	f	CP	2	Ac Deluxe Triple Bedded Room
60	2019-08-23 19:49:24.12047+05:30	2019-08-23 19:49:24.12047+05:30	24	\N	f	f	f	CP	2	NON AC SUPER DELUXE DOUBLEBED ROOM
61	2019-08-23 19:49:24.142345+05:30	2019-08-23 19:49:24.142345+05:30	24	\N	f	f	f	CP	2	A/C Ten Bedded Family Room (with 2 washrooms)
62	2019-08-23 19:49:24.16518+05:30	2019-08-23 19:49:24.16518+05:30	24	\N	f	f	f	CP	2	A/C Ground Level Standard Triple beded room 
63	2019-08-23 19:49:24.187041+05:30	2019-08-23 19:49:24.187041+05:30	24	\N	f	f	f	CP	2	AC Deluxe Double Bedded Room
64	2019-08-23 19:49:24.209146+05:30	2019-08-23 19:49:24.209146+05:30	24	\N	f	f	f	CP	2	Ac Super Deluxe Double Bed Room with Bath Tub
65	2019-08-23 19:49:24.231334+05:30	2019-08-23 19:49:24.231334+05:30	24	\N	f	f	f	CP	2	AC Deluxe Double Bedded Room
66	2019-08-23 19:49:24.254001+05:30	2019-08-23 19:49:24.254001+05:30	24	\N	f	f	f	CP	2	A/C Ten Bedded Family Room (with 2 washrooms)
67	2019-08-23 19:49:24.275327+05:30	2019-08-23 19:49:24.275327+05:30	24	\N	f	f	f	CP	2	A/C Ground Level Standard Triple beded room 
1	2019-06-24 18:25:46.536056+05:30	2019-06-24 18:25:46.536056+05:30	1	gilg	f	f	f	CP	\N	\N
2	2019-06-24 18:26:43.766067+05:30	2019-06-24 18:26:43.766067+05:30	1	uguygyu	f	f	f	MAP	\N	\N
3	2019-06-25 23:57:04.279128+05:30	2019-06-25 23:57:04.279128+05:30	1	\N	t	f	f	AP	\N	\N
4	2019-06-25 23:57:06.305331+05:30	2019-06-25 23:57:06.305331+05:30	9	\N	f	f	f	EP	\N	\N
5	2019-06-25 23:57:09.977846+05:30	2019-06-25 23:57:09.977846+05:30	10	\N	f	f	f	\N	\N	\N
6	2019-06-25 23:57:13.719138+05:30	2019-06-25 23:57:13.719138+05:30	11	\N	f	f	f	\N	\N	\N
7	2019-06-25 23:57:18.957622+05:30	2019-06-25 23:57:18.957622+05:30	12	\N	f	f	f	\N	\N	\N
8	2019-08-23 01:11:09.853287+05:30	2019-08-23 01:11:09.853287+05:30	14	\N	f	f	f	CP	2	Standard Room
9	2019-08-23 01:11:19.530863+05:30	2019-08-23 01:11:19.530863+05:30	15	\N	f	f	f	CP	2	Deluxe AC Room
10	2019-08-23 01:12:09.888447+05:30	2019-08-23 01:12:09.888447+05:30	16	\N	f	f	f	CP	2	Standard Room
11	2019-08-23 01:12:09.93171+05:30	2019-08-23 01:12:09.93171+05:30	16	\N	f	f	f	CP	2	Standard Room
12	2019-08-23 01:12:20.647688+05:30	2019-08-23 01:12:20.647688+05:30	17	\N	f	f	f	CP	2	Deluxe AC Room
13	2019-08-23 01:12:20.691178+05:30	2019-08-23 01:12:20.691178+05:30	17	\N	f	f	f	CP	2	Non AC Deluxe Room
14	2019-08-23 01:12:20.713528+05:30	2019-08-23 01:12:20.713528+05:30	17	\N	f	f	f	CP	2	Non AC Deluxe Room
15	2019-08-23 01:12:20.734966+05:30	2019-08-23 01:12:20.734966+05:30	17	\N	f	f	f	CP	2	Deluxe AC Room
16	2019-08-23 01:13:14.991315+05:30	2019-08-23 01:13:14.991315+05:30	18	\N	f	f	f	CP	2	Ac Deluxe Triple Bedded Room
17	2019-08-23 01:13:15.013621+05:30	2019-08-23 01:13:15.013621+05:30	18	\N	f	f	f	CP	2	Ac Super Deluxe Double Bed Room
18	2019-08-23 01:13:15.046822+05:30	2019-08-23 01:13:15.046822+05:30	18	\N	f	f	f	CP	2	NON AC DELUXE DOUBLEBED ROOM
19	2019-08-23 01:13:15.080085+05:30	2019-08-23 01:13:15.080085+05:30	18	\N	f	f	f	CP	2	NON AC DELUXE DOUBLEBED ROOM
20	2019-08-23 01:13:15.113162+05:30	2019-08-23 01:13:15.113162+05:30	18	\N	f	f	f	CP	2	Ac Super Deluxe Double Bed Room with Bath Tub
21	2019-08-23 01:13:15.15771+05:30	2019-08-23 01:13:15.15771+05:30	18	\N	f	f	f	CP	2	Ac Super Deluxe Triple Bedded Room
22	2019-08-23 01:13:15.202104+05:30	2019-08-23 01:13:15.202104+05:30	18	\N	f	f	f	CP	2	NON AC SUPER DELUXE DOUBLEBED ROOM
23	2019-08-23 01:13:15.246496+05:30	2019-08-23 01:13:15.246496+05:30	18	\N	f	f	f	CP	2	Ac Super Deluxe Triple Bedded Room
24	2019-08-23 01:13:15.278734+05:30	2019-08-23 01:13:15.278734+05:30	18	\N	f	f	f	CP	2	Ac Super Deluxe Double Bed Room
25	2019-08-23 01:13:15.301362+05:30	2019-08-23 01:13:15.301362+05:30	18	\N	f	f	f	CP	2	Ac Deluxe Triple Bedded Room
26	2019-08-23 01:13:15.322751+05:30	2019-08-23 01:13:15.322751+05:30	18	\N	f	f	f	CP	2	NON AC SUPER DELUXE DOUBLEBED ROOM
27	2019-08-23 01:13:15.345242+05:30	2019-08-23 01:13:15.345242+05:30	18	\N	f	f	f	CP	2	A/C Ten Bedded Family Room (with 2 washrooms)
28	2019-08-23 01:13:15.367544+05:30	2019-08-23 01:13:15.367544+05:30	18	\N	f	f	f	CP	2	A/C Ground Level Standard Triple beded room 
29	2019-08-23 01:13:15.389453+05:30	2019-08-23 01:13:15.389453+05:30	18	\N	f	f	f	CP	2	AC Deluxe Double Bedded Room
30	2019-08-23 01:13:15.412158+05:30	2019-08-23 01:13:15.412158+05:30	18	\N	f	f	f	CP	2	Ac Super Deluxe Double Bed Room with Bath Tub
31	2019-08-23 01:13:15.433555+05:30	2019-08-23 01:13:15.433555+05:30	18	\N	f	f	f	CP	2	AC Deluxe Double Bedded Room
32	2019-08-23 01:13:15.456056+05:30	2019-08-23 01:13:15.456056+05:30	18	\N	f	f	f	CP	2	A/C Ten Bedded Family Room (with 2 washrooms)
33	2019-08-23 01:13:15.478455+05:30	2019-08-23 01:13:15.478455+05:30	18	\N	f	f	f	CP	2	A/C Ground Level Standard Triple beded room 
34	2019-08-23 01:13:29.980846+05:30	2019-08-23 01:13:29.980846+05:30	19	\N	f	f	f	CP	2	A.C Deluxe Room With Wi-Fi
35	2019-08-23 01:13:30.001865+05:30	2019-08-23 01:13:30.001865+05:30	19	\N	f	f	f	CP	2	A.C Deluxe Room With Wi-Fi
36	2019-08-23 01:14:02.472892+05:30	2019-08-23 01:14:02.472892+05:30	20	\N	f	f	f	CP	2	Deluxe Room
37	2019-08-23 01:14:02.504089+05:30	2019-08-23 01:14:02.504089+05:30	20	\N	f	f	f	CP	2	Cottage room
38	2019-08-23 01:14:02.526458+05:30	2019-08-23 01:14:02.526458+05:30	20	\N	f	f	f	CP	2	Premium Room
39	2019-08-23 01:14:02.560228+05:30	2019-08-23 01:14:02.560228+05:30	20	\N	f	f	f	CP	2	Premium Room
40	2019-08-23 01:14:02.605333+05:30	2019-08-23 01:14:02.605333+05:30	20	\N	f	f	f	CP	2	Cottage room
41	2019-08-23 01:14:02.63658+05:30	2019-08-23 01:14:02.63658+05:30	20	\N	f	f	f	CP	2	Deluxe Room
42	2019-08-23 01:14:16.264806+05:30	2019-08-23 01:14:16.264806+05:30	21	\N	f	f	f	CP	2	Standard Room
43	2019-08-23 01:14:16.297162+05:30	2019-08-23 01:14:16.297162+05:30	21	\N	f	f	f	CP	2	Standard Room
44	2019-08-23 19:48:29.794463+05:30	2019-08-23 19:48:29.794463+05:30	22	\N	f	f	f	CP	2	Standard Room
45	2019-08-23 19:48:30.094898+05:30	2019-08-23 19:48:30.094898+05:30	22	\N	f	f	f	CP	2	Standard Room
46	2019-08-23 19:48:39.061607+05:30	2019-08-23 19:48:39.061607+05:30	23	\N	f	f	f	CP	2	Deluxe AC Room
47	2019-08-23 19:48:39.083695+05:30	2019-08-23 19:48:39.083695+05:30	23	\N	f	f	f	CP	2	Non AC Deluxe Room
48	2019-08-23 19:48:39.105425+05:30	2019-08-23 19:48:39.105425+05:30	23	\N	f	f	f	CP	2	Non AC Deluxe Room
49	2019-08-23 19:48:39.128021+05:30	2019-08-23 19:48:39.128021+05:30	23	\N	f	f	f	CP	2	Deluxe AC Room
50	2019-08-23 19:49:23.855372+05:30	2019-08-23 19:49:23.855372+05:30	24	\N	f	f	f	CP	2	Ac Deluxe Triple Bedded Room
51	2019-08-23 19:49:23.876882+05:30	2019-08-23 19:49:23.876882+05:30	24	\N	f	f	f	CP	2	Ac Super Deluxe Double Bed Room
52	2019-08-23 19:49:23.8992+05:30	2019-08-23 19:49:23.8992+05:30	24	\N	f	f	f	CP	2	NON AC DELUXE DOUBLEBED ROOM
68	2019-08-23 19:49:36.310608+05:30	2019-08-23 19:49:36.310608+05:30	25	\N	f	f	f	CP	2	A.C Deluxe Room With Wi-Fi
69	2019-08-23 19:49:36.332497+05:30	2019-08-23 19:49:36.332497+05:30	25	\N	f	f	f	CP	2	A.C Deluxe Room With Wi-Fi
70	2019-08-23 19:50:03.900365+05:30	2019-08-23 19:50:03.900365+05:30	26	\N	f	f	f	CP	2	Deluxe Room
71	2019-08-23 19:50:03.921715+05:30	2019-08-23 19:50:03.921715+05:30	26	\N	f	f	f	CP	2	Cottage room
72	2019-08-23 19:50:03.944747+05:30	2019-08-23 19:50:03.944747+05:30	26	\N	f	f	f	CP	2	Premium Room
73	2019-08-23 19:50:03.966017+05:30	2019-08-23 19:50:03.966017+05:30	26	\N	f	f	f	CP	2	Premium Room
74	2019-08-23 19:50:03.988113+05:30	2019-08-23 19:50:03.988113+05:30	26	\N	f	f	f	CP	2	Cottage room
75	2019-08-23 19:50:04.010978+05:30	2019-08-23 19:50:04.010978+05:30	26	\N	f	f	f	CP	2	Deluxe Room
76	2019-08-23 19:50:16.431488+05:30	2019-08-23 19:50:16.431488+05:30	27	\N	f	f	f	CP	2	Standard Room
77	2019-08-23 19:50:16.45367+05:30	2019-08-23 19:50:16.45367+05:30	27	\N	f	f	f	CP	2	Standard Room
78	2019-08-23 19:50:28.787579+05:30	2019-08-23 19:50:28.787579+05:30	28	\N	f	f	f	CP	2	Cottage
79	2019-08-23 19:50:28.809767+05:30	2019-08-23 19:50:28.809767+05:30	28	\N	f	f	f	CP	2	Cottage
80	2019-08-23 19:50:41.497328+05:30	2019-08-23 19:50:41.497328+05:30	29	\N	f	f	f	CP	2	3 BHK Villa
81	2019-08-23 19:50:41.58647+05:30	2019-08-23 19:50:41.58647+05:30	29	\N	f	f	f	CP	2	3 BHK Villa
82	2019-08-23 19:51:04.236278+05:30	2019-08-23 19:51:04.236278+05:30	30	\N	f	f	f	CP	2	Dormitory ( Non Attached Washroom)
83	2019-08-23 19:51:04.258262+05:30	2019-08-23 19:51:04.258262+05:30	30	\N	f	f	f	CP	2	Dormitory ( Non Attached Washroom)
84	2019-08-23 19:51:04.28033+05:30	2019-08-23 19:51:04.28033+05:30	30	\N	f	f	f	CP	2	Double Bed Room.
85	2019-08-23 19:51:04.302703+05:30	2019-08-23 19:51:04.302703+05:30	30	\N	f	f	f	CP	2	Double Bed Room.
86	2019-08-23 19:51:24.971642+05:30	2019-08-23 19:51:24.971642+05:30	31	\N	f	f	f	CP	2	Super Deluxe Room
87	2019-08-23 19:51:24.99284+05:30	2019-08-23 19:51:24.99284+05:30	31	\N	f	f	f	CP	2	Super Deluxe Room
88	2019-08-23 19:51:55.959451+05:30	2019-08-23 19:51:55.959451+05:30	32	\N	f	f	f	CP	2	Family Room
89	2019-08-23 19:51:55.980603+05:30	2019-08-23 19:51:55.980603+05:30	32	\N	f	f	f	CP	2	Family Room
90	2019-08-23 19:51:56.002463+05:30	2019-08-23 19:51:56.002463+05:30	32	\N	f	f	f	CP	2	Deluxe Room
91	2019-08-23 19:51:56.025139+05:30	2019-08-23 19:51:56.025139+05:30	32	\N	f	f	f	CP	2	Deluxe Room
92	2019-08-23 19:52:16.496469+05:30	2019-08-23 19:52:16.496469+05:30	33	\N	f	f	f	CP	2	Deluxe Room (Free Wi-fi)
93	2019-08-23 19:52:16.516563+05:30	2019-08-23 19:52:16.516563+05:30	33	\N	f	f	f	CP	2	Deluxe Room (Free Wi-fi)
94	2019-08-23 19:52:55.540697+05:30	2019-08-23 19:52:55.540697+05:30	34	\N	f	f	f	CP	2	Deluxe AC Room
95	2019-08-23 19:52:55.562831+05:30	2019-08-23 19:52:55.562831+05:30	34	\N	f	f	f	CP	2	Deluxe Non AC Room
96	2019-08-23 19:52:55.585161+05:30	2019-08-23 19:52:55.585161+05:30	34	\N	f	f	f	CP	2	Deluxe Non AC Room
97	2019-08-23 19:52:55.607218+05:30	2019-08-23 19:52:55.607218+05:30	34	\N	f	f	f	CP	2	Deluxe AC Room
98	2019-08-23 19:53:36.712444+05:30	2019-08-23 19:53:36.712444+05:30	35	\N	f	f	f	CP	2	DELUXE NON AC ROOM
99	2019-08-23 19:53:36.735669+05:30	2019-08-23 19:53:36.735669+05:30	35	\N	f	f	f	CP	2	DELUXE NON AC ROOM
100	2019-08-23 19:53:36.756931+05:30	2019-08-23 19:53:36.756931+05:30	35	\N	f	f	f	CP	2	Super Deluxe Ac
101	2019-08-23 19:53:36.779165+05:30	2019-08-23 19:53:36.779165+05:30	35	\N	f	f	f	CP	2	Super Deluxe Ac
102	2019-08-23 19:55:00.749524+05:30	2019-08-23 19:55:00.749524+05:30	36	\N	f	f	f	CP	2	Ordinary Room NON AC
103	2019-08-23 19:55:00.771201+05:30	2019-08-23 19:55:00.771201+05:30	36	\N	f	f	f	CP	2	Ordinary Room NON AC
104	2019-08-23 19:55:00.792938+05:30	2019-08-23 19:55:00.792938+05:30	36	\N	f	f	f	CP	2	Standard Cooler Room
105	2019-08-23 19:55:00.8158+05:30	2019-08-23 19:55:00.8158+05:30	36	\N	f	f	f	CP	2	Semi Deluxe AC
106	2019-08-23 19:55:00.838825+05:30	2019-08-23 19:55:00.838825+05:30	36	\N	f	f	f	CP	2	Deluxe Room AC
107	2019-08-23 19:55:00.859591+05:30	2019-08-23 19:55:00.859591+05:30	36	\N	f	f	f	CP	2	Standard Cooler Room
108	2019-08-23 19:55:00.882149+05:30	2019-08-23 19:55:00.882149+05:30	36	\N	f	f	f	CP	2	Deluxe Room AC
109	2019-08-23 19:55:00.904372+05:30	2019-08-23 19:55:00.904372+05:30	36	\N	f	f	f	CP	2	Semi Deluxe AC
\.


--
-- Data for Name: website; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.website (id, created_at, updated_at, website, logo_image) FROM stdin;
1	2019-06-24 18:27:44.615899+05:30	2019-06-24 18:27:44.615899+05:30	bhnuh	uhio
2	2019-08-18 00:17:24.82706+05:30	2019-08-18 00:17:24.82706+05:30	The Travel Square	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36931403_216842772279716_2011806305429225472_n.png?_nc_cat=0&oh=5c6993b4473bfe525b213139fbd23385&oe=5BA3054D
3	2019-08-18 00:17:24.858164+05:30	2019-08-18 00:17:24.858164+05:30	airbnb	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36885792_216843278946332_2554800182935945216_n.png?_nc_cat=0&oh=24f45f17ce9babf9aacaec189c148e90&oe=5BE19B89
4	2019-08-18 00:17:24.869041+05:30	2019-08-18 00:17:24.869041+05:30	amoma	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36914086_216842055613121_8952191564176687104_n.png?_nc_cat=0&oh=e42937bf1356e7f9717b408ad874d785&oe=5BD65294
5	2019-08-18 00:17:24.879984+05:30	2019-08-18 00:17:24.879984+05:30	booking	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36985547_216842062279787_7777784442721927168_n.png?_nc_cat=0&oh=e5c62603447fe0fbe146e13bd4de9457&oe=5BDC1466
6	2019-08-18 00:17:24.89108+05:30	2019-08-18 00:17:24.89108+05:30	booking-buddy	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36915080_216842838946376_330549487783116800_n.png?_nc_cat=0&oh=6e958718ed11a123b197c3193dc05aed&oe=5BDD448D
7	2019-08-18 00:17:24.90227+05:30	2019-08-18 00:17:24.90227+05:30	cheapoair	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36871613_216843158946344_3551985700943429632_n.png?_nc_cat=0&oh=a5a158f31d8d1f012741dd93ecb3aaea&oe=5BE8B42F
8	2019-08-18 00:17:24.913273+05:30	2019-08-18 00:17:24.913273+05:30	clear-trip	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36919085_216843172279676_6441419649337786368_n.png?_nc_cat=0&oh=56f355f41ce908b4d25829417e055c00&oe=5BC63BFC
9	2019-08-18 00:17:24.924438+05:30	2019-08-18 00:17:24.924438+05:30	cheap-tickets	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36933728_216842102279783_660553647863627776_n.png?_nc_cat=0&oh=c0e1eb976a0c944a1f420765852f3ce9&oe=5BE07D2B
10	2019-08-18 00:17:24.935429+05:30	2019-08-18 00:17:24.935429+05:30	easy-my-trip	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36866925_216842065613120_2808019613483270144_n.png?_nc_cat=0&oh=907872891a881a793944fd09f4961ed4&oe=5BD912D7
11	2019-08-18 00:17:24.946506+05:30	2019-08-18 00:17:24.946506+05:30	elvoline	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36878591_216842138946446_5193606172380233728_n.png?_nc_cat=0&oh=0ad29a61d7053926027e721d68debc23&oe=5BDD9351
12	2019-08-18 00:17:24.957679+05:30	2019-08-18 00:17:24.957679+05:30	expedia	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36940748_216842142279779_153710806440083456_n.png?_nc_cat=0&oh=2d914f9db4369665fb9cf387084994af&oe=5BD4EF3F
13	2019-08-18 00:17:24.968732+05:30	2019-08-18 00:17:24.968732+05:30	fab-hotels	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36723833_216843068946353_5485457437890707456_n.png?_nc_cat=0&oh=ff07ff939a34e04369a694387c18d22b&oe=5BDB7CDD
14	2019-08-18 00:17:24.979812+05:30	2019-08-18 00:17:24.979812+05:30	fairmont	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36957931_216843155613011_78432966182699008_n.png?_nc_cat=0&oh=4a693c859229a1f8c22a7a8419fff943&oe=5BCF27CB
15	2019-08-18 00:17:24.990798+05:30	2019-08-18 00:17:24.990798+05:30	go-ibibo	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36948567_216842145613112_6708067604373700608_n.png?_nc_cat=0&oh=d960b0031a5c47542fc1b68296c7c649&oe=5BC812E2
16	2019-08-18 00:17:25.001881+05:30	2019-08-18 00:17:25.001881+05:30	hilton	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36927789_216842875613039_873228350913511424_n.png?_nc_cat=0&oh=0bb7516fca6d785ad547d9e4e9cfe005&oe=5BDDD1CE
17	2019-08-18 00:17:25.012932+05:30	2019-08-18 00:17:25.012932+05:30	home-away	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36950644_216842538946406_7570591518101078016_n.png?_nc_cat=0&oh=c5a35e0699fe6664f9b3925eb13fb8a6&oe=5BCDD22C
18	2019-08-18 00:17:25.024039+05:30	2019-08-18 00:17:25.024039+05:30	home-stay	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36887982_216842552279738_7775908813323894784_n.png?_nc_cat=0&oh=d544f5db816b87933823b3851fd9df70&oe=5BC9B48A
19	2019-08-18 00:17:25.035117+05:30	2019-08-18 00:17:25.035117+05:30	hostels	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36983622_216843058946354_8013630228045758464_n.png?_nc_cat=0&oh=bf31e1af48bf7fc063775355b8222524&oe=5BE298A6
20	2019-08-18 00:17:25.04614+05:30	2019-08-18 00:17:25.04614+05:30	hostel-world	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36899985_216842212279772_2750645301449588736_n.png?_nc_cat=0&oh=03ca6dceb21820dd5036d8da74b53115&oe=5BDD5EEE
21	2019-08-18 00:17:25.057231+05:30	2019-08-18 00:17:25.057231+05:30	hotel-info	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36870947_216842748946385_164330100194541568_n.png?_nc_cat=0&oh=ef56567fccea5123616fdf7a00ec6312&oe=5B9F854C
22	2019-08-18 00:17:25.068326+05:30	2019-08-18 00:17:25.068326+05:30	hotel-planner	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36867574_216842985613028_6293552927587958784_n.png?_nc_cat=0&oh=2a0a5e5b52beeaba12dbd624a22a916e&oe=5BE85D64
23	2019-08-18 00:17:25.079326+05:30	2019-08-18 00:17:25.079326+05:30	hotel-quickly	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36868187_216843125613014_233834507973689344_n.png?_nc_cat=0&oh=8cd37ac1d54fce778bf75b1f30532f02&oe=5BD52230
24	2019-08-18 00:17:25.090856+05:30	2019-08-18 00:17:25.090856+05:30	hotels	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36884082_216842542279739_7552492251037827072_n.png?_nc_cat=0&oh=f94d66cddeeb5d0ee028d34cc8182b90&oe=5C0EA074
25	2019-08-18 00:17:25.102475+05:30	2019-08-18 00:17:25.102475+05:30	hotels-combined	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36887993_216843275612999_839907539364610048_n.png?_nc_cat=0&oh=636c92cc89ed525e651789db5f732505&oe=5BC98EFF
26	2019-08-18 00:17:25.112613+05:30	2019-08-18 00:17:25.112613+05:30	hotel-urbano	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36911445_216842522279741_7923094512174366720_n.png?_nc_cat=0&oh=0f17919a044d0aa910a7a4ebb9c300ac&oe=5BC5ED6B
27	2019-08-18 00:17:25.123444+05:30	2019-08-18 00:17:25.123444+05:30	hotwire	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36878567_216842222279771_1606744293316231168_n.png?_nc_cat=0&oh=a4fa4e9efbf7101d779dbc66d659c5a7&oe=5BDDDC34
28	2019-08-18 00:17:25.134698+05:30	2019-08-18 00:17:25.134698+05:30	hyatt	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36878589_216842238946436_2729499480939298816_n.png?_nc_cat=0&oh=99feacf6a4ea29000fb95906fb13c95e&oe=5BA74A18
29	2019-08-18 00:17:25.145831+05:30	2019-08-18 00:17:25.145831+05:30	ibis-hotels	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36927817_216842265613100_8191589483536187392_n.png?_nc_cat=0&oh=588a52b7ff3862310d2204aa1b4c705e&oe=5BE00E40
30	2019-08-18 00:17:25.1571+05:30	2019-08-18 00:17:25.1571+05:30	intercontinental	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36955974_216842658946394_881765809595088896_n.png?_nc_cat=0&oh=a0b0ccbd43c6e4e49edbd822a5a199bc&oe=5BD1A5A8
31	2019-08-18 00:17:25.168069+05:30	2019-08-18 00:17:25.168069+05:30	kayak	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36869923_216842318946428_6939867771022868480_n.png?_nc_cat=0&oh=7f623ada5716fede3632c3324c2041b3&oe=5BD8E2B3
32	2019-08-18 00:17:25.179222+05:30	2019-08-18 00:17:25.179222+05:30	lonely-planet	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36912945_216843028946357_950197227169513472_n.png?_nc_cat=0&oh=33082d3424ef3102c0aecd14beed1e8d&oe=5BD9C3F8
33	2019-08-18 00:17:25.190174+05:30	2019-08-18 00:17:25.190174+05:30	make-my-trip	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/37023397_216842328946427_1052161928324972544_n.png?_nc_cat=0&oh=77b905bb14d44c4c9c3539229f8aa6c2&oe=5BCEED6C
34	2019-08-18 00:17:25.201235+05:30	2019-08-18 00:17:25.201235+05:30	melia	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36965816_216842962279697_1611374057607921664_n.png?_nc_cat=0&oh=26878e6998c69ccf2e29c8a39bb589dc&oe=5BD1B9FE
35	2019-08-18 00:17:25.212457+05:30	2019-08-18 00:17:25.212457+05:30	novotel	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/37005247_216842342279759_5367885005970210816_n.png?_nc_cat=0&oh=50a287ce76f960fe92ffe1b5b273edd0&oe=5BD21F95
36	2019-08-18 00:17:25.223355+05:30	2019-08-18 00:17:25.223355+05:30	one-travel	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36887858_216842365613090_7991306237876633600_n.png?_nc_cat=0&oh=560188c14578da6d07bf7fcc828289cc&oe=5BA5253E
37	2019-08-18 00:17:25.245731+05:30	2019-08-18 00:17:25.245731+05:30	orbtiz	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36899968_216842828946377_3196799542016081920_n.png?_nc_cat=0&oh=fcf8cd3d77be3c8080ac3bdcd66333e2&oe=5BE0E82B
38	2019-08-18 00:17:25.256538+05:30	2019-08-18 00:17:25.256538+05:30	otel	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36983678_216842418946418_8645533394618286080_n.png?_nc_cat=0&oh=a2ea9c284df025ad136738477a26d541&oe=5BE0C1CE
39	2019-08-18 00:17:25.26762+05:30	2019-08-18 00:17:25.26762+05:30	priceline	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36869685_216842775613049_4132134438584713216_n.png?_nc_cat=0&oh=73720197caf7900daa7774dd29ac28e8&oe=5BA3BE33
40	2019-08-18 00:17:25.278716+05:30	2019-08-18 00:17:25.278716+05:30	rakuten	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36907538_216842725613054_2166548934812499968_n.png?_nc_cat=0&oh=32ccaa6f3e3099ec5b60120ae801846d&oe=5BEA706A
41	2019-08-18 00:17:25.290254+05:30	2019-08-18 00:17:25.290254+05:30	sky-scanner	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36926057_216842438946416_4419504000211091456_n.png?_nc_cat=0&oh=810f331dbf07f6d7fac3c6348349340c&oe=5BDF2BB3
42	2019-08-18 00:17:25.301336+05:30	2019-08-18 00:17:25.301336+05:30	roomer	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36972856_216842428946417_5190496697662308352_n.png?_nc_cat=0&oh=c2969c686acfd0d390867e235258a900&oe=5BEC770B
43	2019-08-18 00:17:25.312336+05:30	2019-08-18 00:17:25.312336+05:30	sponsor-jahan	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36975137_216843045613022_5619564647792246784_n.png?_nc_cat=0&oh=0b3d28dac37e5eea2a50aef5fd980530&oe=5BE7AE6E
44	2019-08-18 00:17:25.323405+05:30	2019-08-18 00:17:25.323405+05:30	sofitel	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36975886_216842452279748_312970517353070592_n.png?_nc_cat=0&oh=0c34177256009ad16428986987fc4638&oe=5BD4E59C
45	2019-08-18 00:17:25.33442+05:30	2019-08-18 00:17:25.33442+05:30	travel-guru	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36869916_216843252279668_4520049854625349632_n.png?_nc_cat=0&oh=75ca1555064c529a630f558de956d638&oe=5BDA75BB
46	2019-08-18 00:17:25.345495+05:30	2019-08-18 00:17:25.345495+05:30	travelo-city	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36846166_216842948946365_4734756115860946944_n.png?_nc_cat=0&oh=70599f3814be48364de1d9caa46b32b1&oe=5BD838DB
47	2019-08-18 00:17:25.356663+05:30	2019-08-18 00:17:25.356663+05:30	travel-zoo	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36863989_216843352279658_2568924693989949440_n.png?_nc_cat=0&oh=2521be451f3aeb2391889aa9c890d0e1&oe=5C12B150
48	2019-08-18 00:17:25.367808+05:30	2019-08-18 00:17:25.367808+05:30	treebo	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36870005_216842628946397_8136398359213637632_n.png?_nc_cat=0&oh=02669cdfeb27a6d463f08471cc679191&oe=5BCC6599
49	2019-08-18 00:17:25.378764+05:30	2019-08-18 00:17:25.378764+05:30	trip	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36931412_216842935613033_7890730065288232960_n.png?_nc_cat=0&oh=dc43652a625b7ef9577d185fc9ee3411&oe=5BDD9978
50	2019-08-18 00:17:25.3899+05:30	2019-08-18 00:17:25.3899+05:30	vrbo	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36978817_216842618946398_2236178407744339968_n.png?_nc_cat=0&oh=461784b05ebc4c46c5756dd6a0b748ec&oe=5BCB6747
51	2019-08-18 00:17:25.401094+05:30	2019-08-18 00:17:25.401094+05:30	wego	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36872568_216842855613041_905143475501006848_n.png?_nc_cat=0&oh=930064d0f5028e54a0f864d9422eaa74&oe=5BD6130D
52	2019-08-18 00:17:25.412005+05:30	2019-08-18 00:17:25.412005+05:30	yatra	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36957657_216843235613003_2117808142698938368_n.png?_nc_cat=0&oh=670e16501a96d5e2fededdfc6aa28895&oe=5BE815F6
53	2019-08-18 00:17:25.423189+05:30	2019-08-18 00:17:25.423189+05:30	zen-hotels	https://scontent.fdel1-4.fna.fbcdn.net/v/t1.0-9/36973017_216842642279729_1949865163259641856_n.png?_nc_cat=0&oh=85d699e9302172cd8c438f031446c82a&oe=5BC697AB
\.


--
-- Name: amenity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.amenity_id_seq', 29, true);


--
-- Name: booking_deal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_deal_id_seq', 3, true);


--
-- Name: booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_id_seq', 6, true);


--
-- Name: cart_deal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_deal_id_seq', 1, false);


--
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_id_seq', 1, false);


--
-- Name: collection_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.collection_product_id_seq', 1, false);


--
-- Name: deal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deal_id_seq', 5, true);


--
-- Name: facility_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facility_id_seq', 102, true);


--
-- Name: hotel_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hotel_collection_id_seq', 1, false);


--
-- Name: hotel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hotel_id_seq', 36, true);


--
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_id_seq', 1126, true);


--
-- Name: price_calendar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.price_calendar_id_seq', 1, true);


--
-- Name: room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.room_id_seq', 109, true);


--
-- Name: website_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.website_id_seq', 53, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: amenity amenity_hotel_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amenity
    ADD CONSTRAINT amenity_hotel_id_key UNIQUE (hotel_id);


--
-- Name: amenity amenity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amenity
    ADD CONSTRAINT amenity_pkey PRIMARY KEY (id);


--
-- Name: booking_deal booking_deal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_deal
    ADD CONSTRAINT booking_deal_pkey PRIMARY KEY (id);


--
-- Name: booking booking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (id);


--
-- Name: cart_deal cart_deal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_deal
    ADD CONSTRAINT cart_deal_pkey PRIMARY KEY (id);


--
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);


--
-- Name: collection_product collection_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_product
    ADD CONSTRAINT collection_product_pkey PRIMARY KEY (id);


--
-- Name: deal deal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deal
    ADD CONSTRAINT deal_pkey PRIMARY KEY (id);


--
-- Name: facility facility_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility
    ADD CONSTRAINT facility_pkey PRIMARY KEY (id);


--
-- Name: facility facility_room_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility
    ADD CONSTRAINT facility_room_id_key UNIQUE (room_id);


--
-- Name: hotel_collection hotel_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel_collection
    ADD CONSTRAINT hotel_collection_pkey PRIMARY KEY (id);


--
-- Name: hotel hotel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel
    ADD CONSTRAINT hotel_pkey PRIMARY KEY (id);


--
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- Name: price_calendar price_calendar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_calendar
    ADD CONSTRAINT price_calendar_pkey PRIMARY KEY (id);


--
-- Name: room room_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (id);


--
-- Name: website website_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.website
    ADD CONSTRAINT website_pkey PRIMARY KEY (id);


--
-- Name: ix_amenity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_amenity_id ON public.amenity USING btree (id);


--
-- Name: ix_booking_deal_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_booking_deal_id ON public.booking_deal USING btree (id);


--
-- Name: ix_booking_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_booking_id ON public.booking USING btree (id);


--
-- Name: ix_cart_deal_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_cart_deal_id ON public.cart_deal USING btree (id);


--
-- Name: ix_cart_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_cart_id ON public.cart USING btree (id);


--
-- Name: ix_collection_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_collection_product_id ON public.collection_product USING btree (id);


--
-- Name: ix_deal_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_deal_id ON public.deal USING btree (id);


--
-- Name: ix_facility_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_facility_id ON public.facility USING btree (id);


--
-- Name: ix_hotel_collection_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_hotel_collection_id ON public.hotel_collection USING btree (id);


--
-- Name: ix_hotel_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_hotel_id ON public.hotel USING btree (id);


--
-- Name: ix_image_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_image_id ON public.image USING btree (id);


--
-- Name: ix_price_calendar_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_price_calendar_id ON public.price_calendar USING btree (id);


--
-- Name: ix_room_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_room_id ON public.room USING btree (id);


--
-- Name: ix_website_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_website_id ON public.website USING btree (id);


--
-- Name: amenity amenity_hotel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amenity
    ADD CONSTRAINT amenity_hotel_id_fkey FOREIGN KEY (hotel_id) REFERENCES public.hotel(id);


--
-- Name: booking_deal booking_deal_booking_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_deal
    ADD CONSTRAINT booking_deal_booking_id_fkey FOREIGN KEY (booking_id) REFERENCES public.booking(id);


--
-- Name: booking_deal booking_deal_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_deal
    ADD CONSTRAINT booking_deal_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.room(id);


--
-- Name: booking_deal booking_deal_website_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_deal
    ADD CONSTRAINT booking_deal_website_id_fkey FOREIGN KEY (website_id) REFERENCES public.website(id);


--
-- Name: cart_deal cart_deal_cart_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_deal
    ADD CONSTRAINT cart_deal_cart_id_fkey FOREIGN KEY (cart_id) REFERENCES public.cart(id);


--
-- Name: cart_deal cart_deal_deal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_deal
    ADD CONSTRAINT cart_deal_deal_id_fkey FOREIGN KEY (deal_id) REFERENCES public.deal(id);


--
-- Name: collection_product collection_product_hotel_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_product
    ADD CONSTRAINT collection_product_hotel_collection_id_fkey FOREIGN KEY (hotel_collection_id) REFERENCES public.hotel_collection(id);


--
-- Name: deal deal_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deal
    ADD CONSTRAINT deal_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.room(id);


--
-- Name: deal deal_website_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deal
    ADD CONSTRAINT deal_website_id_fkey FOREIGN KEY (website_id) REFERENCES public.website(id);


--
-- Name: facility facility_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility
    ADD CONSTRAINT facility_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.room(id);


--
-- Name: hotel hotel_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel
    ADD CONSTRAINT hotel_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES public.hotel_collection(id);


--
-- Name: image image_hotel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_hotel_id_fkey FOREIGN KEY (hotel_id) REFERENCES public.hotel(id);


--
-- Name: price_calendar price_calendar_deal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_calendar
    ADD CONSTRAINT price_calendar_deal_id_fkey FOREIGN KEY (deal_id) REFERENCES public.deal(id);


--
-- Name: room room_hotel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_hotel_id_fkey FOREIGN KEY (hotel_id) REFERENCES public.hotel(id);


--
-- PostgreSQL database dump complete
--

