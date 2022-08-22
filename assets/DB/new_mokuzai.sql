--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

-- Started on 2022-08-22 21:43:11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE new_mokuzai;
--
-- TOC entry 3417 (class 1262 OID 33269)
-- Name: new_mokuzai; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE new_mokuzai WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';


ALTER DATABASE new_mokuzai OWNER TO postgres;

\connect new_mokuzai

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 33270)
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    id integer NOT NULL,
    product_id integer,
    user_id integer,
    quantity integer NOT NULL,
    status_cart character varying
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 33273)
-- Name: cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cart ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 211 (class 1259 OID 33274)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    category_name character varying
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 33279)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.category ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 213 (class 1259 OID 33280)
-- Name: chat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat (
    id integer NOT NULL,
    costumer_id integer,
    seller_id integer,
    chat text
);


ALTER TABLE public.chat OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 33285)
-- Name: chat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.chat ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.chat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 33286)
-- Name: favorite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favorite (
    id integer NOT NULL,
    product_id integer,
    user_id integer
);


ALTER TABLE public.favorite OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 33289)
-- Name: favorite_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.favorite ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.favorite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 33290)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer,
    quantity bigint,
    cart_id integer,
    payment_id integer
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 33293)
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 33294)
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    id integer NOT NULL,
    total_price bigint,
    payment_status character varying,
    cart_id integer,
    user_id integer
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 33299)
-- Name: payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.payment ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 221 (class 1259 OID 33300)
-- Name: product_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_details (
    id integer NOT NULL,
    product_name character varying,
    product_desc text,
    product_price bigint,
    product_stock bigint,
    product_condition character varying,
    picture1 character varying,
    category_id integer,
    picture2 character varying,
    picture4 character varying,
    picture3 character varying,
    user_id integer,
    archive_status boolean DEFAULT false
);


ALTER TABLE public.product_details OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 33306)
-- Name: product_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product_details ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 33307)
-- Name: profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile (
    id integer NOT NULL,
    user_id integer,
    gender character varying,
    store_name character varying,
    store_desc text,
    picture character varying,
    name character varying
);


ALTER TABLE public.profile OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 33312)
-- Name: profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.profile ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 229 (class 1259 OID 33438)
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status (
    id integer NOT NULL,
    status1 character varying,
    status2 character varying,
    status3 character varying
);


ALTER TABLE public.status OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 33313)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying,
    password character varying,
    roles character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 33318)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 227 (class 1259 OID 33319)
-- Name: wishlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wishlist (
    id integer NOT NULL,
    product_id integer,
    user_id integer
);


ALTER TABLE public.wishlist OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 33322)
-- Name: wishlist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.wishlist ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.wishlist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3391 (class 0 OID 33270)
-- Dependencies: 209
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (id, product_id, user_id, quantity, status_cart) FROM stdin;
4	5	17	1	Not Paid
5	6	17	1	Not Paid
6	5	17	1	Not Paid
\.


--
-- TOC entry 3393 (class 0 OID 33274)
-- Dependencies: 211
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, category_name) FROM stdin;
1	meja
\.


--
-- TOC entry 3395 (class 0 OID 33280)
-- Dependencies: 213
-- Data for Name: chat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat (id, costumer_id, seller_id, chat) FROM stdin;
1	16	14	tes chat
\.


--
-- TOC entry 3397 (class 0 OID 33286)
-- Dependencies: 215
-- Data for Name: favorite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorite (id, product_id, user_id) FROM stdin;
3	4	17
\.


--
-- TOC entry 3399 (class 0 OID 33290)
-- Dependencies: 217
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, quantity, cart_id, payment_id) FROM stdin;
6	17	2	4	25
7	17	2	5	26
\.


--
-- TOC entry 3401 (class 0 OID 33294)
-- Dependencies: 219
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (id, total_price, payment_status, cart_id, user_id) FROM stdin;
25	20000	Get Paid	4	17
26	300000	Get Paid	5	17
\.


--
-- TOC entry 3403 (class 0 OID 33300)
-- Dependencies: 221
-- Data for Name: product_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_details (id, product_name, product_desc, product_price, product_stock, product_condition, picture1, category_id, picture2, picture4, picture3, user_id, archive_status) FROM stdin;
6	IKEA meja	\N	\N	\N	\N	1661040222147.jpeg	1	1661040222149.jpeg	\N	\N	14	f
2	tess tess	\N	500	\N	\N	1661047374104.png	1	1661038887215.jpeg	\N	\N	14	t
3	IKEA meja	Made From Thai	100000	1	new	1661039370110.jpeg	1	1661039370111.jpeg	\N	\N	14	f
4	IKEA meja	Made From Thai	100000	2	new	1661039372878.jpeg	1	1661039372878.jpeg	\N	\N	14	f
7	IKEA meja	Made From China	200000	2	old	1661040275331.jpeg	1	1661040275332.jpeg	\N	\N	14	f
5	IKEA meja	Made From Mumbai	500000	5	old	1661040141599.jpeg	1	1661040141599.jpeg	\N	\N	14	f
\.


--
-- TOC entry 3405 (class 0 OID 33307)
-- Dependencies: 223
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile (id, user_id, gender, store_name, store_desc, picture, name) FROM stdin;
12	14	\N	\N	\N	\N	\N
13	15	\N	\N	\N	\N	\N
14	16	\N	\N	\N	\N	\N
16	\N	Trial	Moman	Help	1661081880721.png	tararaArt
17	\N	Trial	Moman	Help	1661155647354.png	tararaArt
15	17	Men	Home Gaming	\N	\N	\N
\.


--
-- TOC entry 3411 (class 0 OID 33438)
-- Dependencies: 229
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status (id, status1, status2, status3) FROM stdin;
\.


--
-- TOC entry 3407 (class 0 OID 33313)
-- Dependencies: 225
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, roles) FROM stdin;
14	admin@admin.com	$2b$10$WPMrsgZYhfuuFRoJ3vNc4u5OkRan/6VehoxXhD1ZClIj69Qz9F1Ti	seller
15	seller@seller.com	$2b$10$hNrkL5kgMNsQuU9/om5kEuW.njQGmjvUd9YHa6LeXFAmT5sPjVeJC	seller
16	costumer@costumer.com	$2b$10$jiQ2s2eTT1O1R1ENfFeFv.//7EvWv3fROBRSk2gftugMJyWewBcti	costumer
17	a@mail.com	$2b$10$H8LQVQGJeRbMuHwQE0kECegWBQ/1xaCQUllQ6xIFlSIowhOaHIs0u	2
\.


--
-- TOC entry 3409 (class 0 OID 33319)
-- Dependencies: 227
-- Data for Name: wishlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wishlist (id, product_id, user_id) FROM stdin;
4	3	17
5	4	17
\.


--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 210
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_id_seq', 6, true);


--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 212
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 1, true);


--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 214
-- Name: chat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_id_seq', 2, true);


--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 216
-- Name: favorite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favorite_id_seq', 3, true);


--
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 218
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_id_seq', 7, true);


--
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 220
-- Name: payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_id_seq', 26, true);


--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 222
-- Name: product_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_details_id_seq', 8, true);


--
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 224
-- Name: profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profile_id_seq', 17, true);


--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 226
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 17, true);


--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 228
-- Name: wishlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wishlist_id_seq', 5, true);


--
-- TOC entry 3215 (class 2606 OID 33324)
-- Name: cart cart_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pk PRIMARY KEY (id);


--
-- TOC entry 3217 (class 2606 OID 33326)
-- Name: category category_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pk PRIMARY KEY (id);


--
-- TOC entry 3219 (class 2606 OID 33328)
-- Name: chat chat_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_pk PRIMARY KEY (id);


--
-- TOC entry 3221 (class 2606 OID 33330)
-- Name: favorite favorite_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_pk PRIMARY KEY (id);


--
-- TOC entry 3223 (class 2606 OID 33332)
-- Name: orders order_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_pk PRIMARY KEY (id);


--
-- TOC entry 3225 (class 2606 OID 33334)
-- Name: payment payment_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pk PRIMARY KEY (id);


--
-- TOC entry 3227 (class 2606 OID 33336)
-- Name: product_details product_details_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_details
    ADD CONSTRAINT product_details_pk PRIMARY KEY (id);


--
-- TOC entry 3229 (class 2606 OID 33338)
-- Name: profile profile_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_pk PRIMARY KEY (id);


--
-- TOC entry 3231 (class 2606 OID 33340)
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- TOC entry 3233 (class 2606 OID 33342)
-- Name: users users_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_un UNIQUE (email);


--
-- TOC entry 3235 (class 2606 OID 33344)
-- Name: wishlist wishlist_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_pk PRIMARY KEY (id);


--
-- TOC entry 3236 (class 2606 OID 33345)
-- Name: cart cart_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_fk FOREIGN KEY (product_id) REFERENCES public.product_details(id);


--
-- TOC entry 3243 (class 2606 OID 33459)
-- Name: orders cart_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT cart_fk FOREIGN KEY (cart_id) REFERENCES public.cart(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3238 (class 2606 OID 33350)
-- Name: chat chat_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_fk FOREIGN KEY (costumer_id) REFERENCES public.users(id);


--
-- TOC entry 3239 (class 2606 OID 33355)
-- Name: chat chat_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_fk_1 FOREIGN KEY (seller_id) REFERENCES public.users(id);


--
-- TOC entry 3240 (class 2606 OID 33360)
-- Name: favorite favorite_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_fk FOREIGN KEY (product_id) REFERENCES public.product_details(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3241 (class 2606 OID 33365)
-- Name: favorite favorite_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_fk_1 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3242 (class 2606 OID 33370)
-- Name: orders order_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3244 (class 2606 OID 33464)
-- Name: orders payment_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT payment_fk FOREIGN KEY (payment_id) REFERENCES public.payment(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3245 (class 2606 OID 33476)
-- Name: payment payment_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_fk FOREIGN KEY (cart_id) REFERENCES public.cart(id);


--
-- TOC entry 3247 (class 2606 OID 33380)
-- Name: product_details product_details_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_details
    ADD CONSTRAINT product_details_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3248 (class 2606 OID 33385)
-- Name: product_details product_details_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_details
    ADD CONSTRAINT product_details_fk_2 FOREIGN KEY (category_id) REFERENCES public.category(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3249 (class 2606 OID 33390)
-- Name: profile profile_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3251 (class 2606 OID 33433)
-- Name: wishlist user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT user_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3246 (class 2606 OID 33481)
-- Name: payment user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT user_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3237 (class 2606 OID 33395)
-- Name: cart user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3250 (class 2606 OID 33400)
-- Name: wishlist wishlist_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_fk FOREIGN KEY (product_id) REFERENCES public.product_details(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2022-08-22 21:43:11

--
-- PostgreSQL database dump complete
--

