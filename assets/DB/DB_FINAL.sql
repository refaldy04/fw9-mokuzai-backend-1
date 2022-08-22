--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

-- Started on 2022-08-23 00:19:26

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
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 25985)
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
-- TOC entry 210 (class 1259 OID 25990)
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
-- TOC entry 211 (class 1259 OID 25991)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    category_name character varying
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 25996)
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
-- TOC entry 213 (class 1259 OID 25997)
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
-- TOC entry 214 (class 1259 OID 26002)
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
-- TOC entry 215 (class 1259 OID 26003)
-- Name: favorite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favorite (
    id integer NOT NULL,
    product_id integer,
    user_id integer
);


ALTER TABLE public.favorite OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 26006)
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
-- TOC entry 217 (class 1259 OID 26007)
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
-- TOC entry 218 (class 1259 OID 26010)
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
-- TOC entry 219 (class 1259 OID 26011)
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
-- TOC entry 220 (class 1259 OID 26016)
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
-- TOC entry 231 (class 1259 OID 26148)
-- Name: payment_new; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_new (
    id integer NOT NULL,
    name character varying,
    address character varying,
    phone character varying,
    metode_trans character varying,
    shipping bigint,
    total bigint,
    user_id integer
);


ALTER TABLE public.payment_new OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 26147)
-- Name: payment_new_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.payment_new ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.payment_new_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 221 (class 1259 OID 26017)
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
-- TOC entry 222 (class 1259 OID 26023)
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
-- TOC entry 223 (class 1259 OID 26024)
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
-- TOC entry 224 (class 1259 OID 26029)
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
-- TOC entry 225 (class 1259 OID 26030)
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
-- TOC entry 226 (class 1259 OID 26035)
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
-- TOC entry 227 (class 1259 OID 26040)
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
-- TOC entry 228 (class 1259 OID 26041)
-- Name: wishlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wishlist (
    id integer NOT NULL,
    product_id integer,
    user_id integer
);


ALTER TABLE public.wishlist OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 26044)
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
-- TOC entry 3399 (class 0 OID 25985)
-- Dependencies: 209
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (id, product_id, user_id, quantity, status_cart) FROM stdin;
\.


--
-- TOC entry 3401 (class 0 OID 25991)
-- Dependencies: 211
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, category_name) FROM stdin;
\.


--
-- TOC entry 3403 (class 0 OID 25997)
-- Dependencies: 213
-- Data for Name: chat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat (id, costumer_id, seller_id, chat) FROM stdin;
\.


--
-- TOC entry 3405 (class 0 OID 26003)
-- Dependencies: 215
-- Data for Name: favorite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorite (id, product_id, user_id) FROM stdin;
\.


--
-- TOC entry 3407 (class 0 OID 26007)
-- Dependencies: 217
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, quantity, cart_id, payment_id) FROM stdin;
\.


--
-- TOC entry 3409 (class 0 OID 26011)
-- Dependencies: 219
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (id, total_price, payment_status, cart_id, user_id) FROM stdin;
\.


--
-- TOC entry 3421 (class 0 OID 26148)
-- Dependencies: 231
-- Data for Name: payment_new; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_new (id, name, address, phone, metode_trans, shipping, total, user_id) FROM stdin;
2	zepsi uhuy	virginia	082216115722	COD	10	5000	18
\.


--
-- TOC entry 3411 (class 0 OID 26017)
-- Dependencies: 221
-- Data for Name: product_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_details (id, product_name, product_desc, product_price, product_stock, product_condition, picture1, category_id, picture2, picture4, picture3, user_id, archive_status) FROM stdin;
\.


--
-- TOC entry 3413 (class 0 OID 26024)
-- Dependencies: 223
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile (id, user_id, gender, store_name, store_desc, picture, name) FROM stdin;
18	18	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3415 (class 0 OID 26030)
-- Dependencies: 225
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status (id, status1, status2, status3) FROM stdin;
\.


--
-- TOC entry 3416 (class 0 OID 26035)
-- Dependencies: 226
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, roles) FROM stdin;
18	costumer@costumer.com	$2b$10$Ocya/rSxe21pDdQRFQF2..x193UZT2XfcuYL.ZPZZ9awpch8jOjqK	costumer
\.


--
-- TOC entry 3418 (class 0 OID 26041)
-- Dependencies: 228
-- Data for Name: wishlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wishlist (id, product_id, user_id) FROM stdin;
\.


--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 210
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_id_seq', 1, true);


--
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 212
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 1, true);


--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 214
-- Name: chat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_id_seq', 2, true);


--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 216
-- Name: favorite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favorite_id_seq', 3, true);


--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 218
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_id_seq', 7, true);


--
-- TOC entry 3433 (class 0 OID 0)
-- Dependencies: 220
-- Name: payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_id_seq', 26, true);


--
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 230
-- Name: payment_new_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_new_id_seq', 2, true);


--
-- TOC entry 3435 (class 0 OID 0)
-- Dependencies: 222
-- Name: product_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_details_id_seq', 8, true);


--
-- TOC entry 3436 (class 0 OID 0)
-- Dependencies: 224
-- Name: profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profile_id_seq', 18, true);


--
-- TOC entry 3437 (class 0 OID 0)
-- Dependencies: 227
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 18, true);


--
-- TOC entry 3438 (class 0 OID 0)
-- Dependencies: 229
-- Name: wishlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wishlist_id_seq', 5, true);


--
-- TOC entry 3220 (class 2606 OID 26046)
-- Name: cart cart_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pk PRIMARY KEY (id);


--
-- TOC entry 3222 (class 2606 OID 26048)
-- Name: category category_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pk PRIMARY KEY (id);


--
-- TOC entry 3224 (class 2606 OID 26050)
-- Name: chat chat_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_pk PRIMARY KEY (id);


--
-- TOC entry 3226 (class 2606 OID 26052)
-- Name: favorite favorite_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_pk PRIMARY KEY (id);


--
-- TOC entry 3228 (class 2606 OID 26054)
-- Name: orders order_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_pk PRIMARY KEY (id);


--
-- TOC entry 3242 (class 2606 OID 26155)
-- Name: payment_new payment_new_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_new
    ADD CONSTRAINT payment_new_pk PRIMARY KEY (id);


--
-- TOC entry 3230 (class 2606 OID 26056)
-- Name: payment payment_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pk PRIMARY KEY (id);


--
-- TOC entry 3232 (class 2606 OID 26058)
-- Name: product_details product_details_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_details
    ADD CONSTRAINT product_details_pk PRIMARY KEY (id);


--
-- TOC entry 3234 (class 2606 OID 26060)
-- Name: profile profile_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_pk PRIMARY KEY (id);


--
-- TOC entry 3236 (class 2606 OID 26062)
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- TOC entry 3238 (class 2606 OID 26064)
-- Name: users users_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_un UNIQUE (email);


--
-- TOC entry 3240 (class 2606 OID 26066)
-- Name: wishlist wishlist_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_pk PRIMARY KEY (id);


--
-- TOC entry 3243 (class 2606 OID 26067)
-- Name: cart cart_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_fk FOREIGN KEY (product_id) REFERENCES public.product_details(id);


--
-- TOC entry 3249 (class 2606 OID 26072)
-- Name: orders cart_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT cart_fk FOREIGN KEY (cart_id) REFERENCES public.cart(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3245 (class 2606 OID 26077)
-- Name: chat chat_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_fk FOREIGN KEY (costumer_id) REFERENCES public.users(id);


--
-- TOC entry 3246 (class 2606 OID 26082)
-- Name: chat chat_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_fk_1 FOREIGN KEY (seller_id) REFERENCES public.users(id);


--
-- TOC entry 3247 (class 2606 OID 26087)
-- Name: favorite favorite_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_fk FOREIGN KEY (product_id) REFERENCES public.product_details(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3248 (class 2606 OID 26092)
-- Name: favorite favorite_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_fk_1 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3250 (class 2606 OID 26097)
-- Name: orders order_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3251 (class 2606 OID 26102)
-- Name: orders payment_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT payment_fk FOREIGN KEY (payment_id) REFERENCES public.payment(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3252 (class 2606 OID 26107)
-- Name: payment payment_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_fk FOREIGN KEY (cart_id) REFERENCES public.cart(id);


--
-- TOC entry 3259 (class 2606 OID 26156)
-- Name: payment_new payment_new_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_new
    ADD CONSTRAINT payment_new_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3254 (class 2606 OID 26112)
-- Name: product_details product_details_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_details
    ADD CONSTRAINT product_details_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3255 (class 2606 OID 26117)
-- Name: product_details product_details_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_details
    ADD CONSTRAINT product_details_fk_2 FOREIGN KEY (category_id) REFERENCES public.category(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3256 (class 2606 OID 26122)
-- Name: profile profile_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3257 (class 2606 OID 26127)
-- Name: wishlist user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT user_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3253 (class 2606 OID 26132)
-- Name: payment user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT user_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3244 (class 2606 OID 26137)
-- Name: cart user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3258 (class 2606 OID 26142)
-- Name: wishlist wishlist_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_fk FOREIGN KEY (product_id) REFERENCES public.product_details(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2022-08-23 00:19:26

--
-- PostgreSQL database dump complete
--

