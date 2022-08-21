--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

-- Started on 2022-08-21 09:34:37

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
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 17008)
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    id integer NOT NULL,
    product_id integer,
    user_id integer,
    quantity integer NOT NULL
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 17011)
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
-- TOC entry 226 (class 1259 OID 25081)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    category_name character varying
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 25080)
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
-- TOC entry 211 (class 1259 OID 17017)
-- Name: favorite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favorite (
    id integer NOT NULL,
    product_id integer,
    user_id integer
);


ALTER TABLE public.favorite OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 17020)
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
-- TOC entry 213 (class 1259 OID 17021)
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order" (
    id integer NOT NULL,
    user_id integer,
    quantity bigint
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17024)
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."order" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 17025)
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    id integer NOT NULL,
    total_price bigint,
    payment_status character varying,
    order_id integer
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17030)
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
-- TOC entry 217 (class 1259 OID 17031)
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
-- TOC entry 218 (class 1259 OID 17036)
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
-- TOC entry 219 (class 1259 OID 17037)
-- Name: profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile (
    id integer NOT NULL,
    user_id integer,
    gender character varying,
    store_name character varying,
    store_desc text,
    picture character varying
);


ALTER TABLE public.profile OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17042)
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
-- TOC entry 221 (class 1259 OID 17043)
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
-- TOC entry 222 (class 1259 OID 17048)
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
-- TOC entry 223 (class 1259 OID 17049)
-- Name: wishlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wishlist (
    id integer NOT NULL,
    product_id integer,
    user_id integer
);


ALTER TABLE public.wishlist OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17052)
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
-- TOC entry 3375 (class 0 OID 17008)
-- Dependencies: 209
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (id, product_id, user_id, quantity) FROM stdin;
\.


--
-- TOC entry 3392 (class 0 OID 25081)
-- Dependencies: 226
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, category_name) FROM stdin;
1	meja
\.


--
-- TOC entry 3377 (class 0 OID 17017)
-- Dependencies: 211
-- Data for Name: favorite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorite (id, product_id, user_id) FROM stdin;
\.


--
-- TOC entry 3379 (class 0 OID 17021)
-- Dependencies: 213
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."order" (id, user_id, quantity) FROM stdin;
\.


--
-- TOC entry 3381 (class 0 OID 17025)
-- Dependencies: 215
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (id, total_price, payment_status, order_id) FROM stdin;
\.


--
-- TOC entry 3383 (class 0 OID 17031)
-- Dependencies: 217
-- Data for Name: product_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_details (id, product_name, product_desc, product_price, product_stock, product_condition, picture1, category_id, picture2, picture4, picture3, user_id, archive_status) FROM stdin;
3	IKEA meja	\N	\N	\N	\N	1661039370110.jpeg	1	1661039370111.jpeg	\N	\N	14	f
4	IKEA meja	\N	\N	\N	\N	1661039372878.jpeg	1	1661039372878.jpeg	\N	\N	14	f
7	IKEA meja	\N	\N	\N	\N	1661040275331.jpeg	1	1661040275332.jpeg	\N	\N	14	f
5	IKEA meja	\N	\N	\N	\N	1661040141599.jpeg	1	1661040141599.jpeg	\N	\N	14	f
6	IKEA meja	\N	\N	\N	\N	1661040222147.jpeg	1	1661040222149.jpeg	\N	\N	14	f
2	tess tess	\N	500	\N	\N	1661047374104.png	1	1661038887215.jpeg	\N	\N	14	t
\.


--
-- TOC entry 3385 (class 0 OID 17037)
-- Dependencies: 219
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile (id, user_id, gender, store_name, store_desc, picture) FROM stdin;
12	14	\N	\N	\N	\N
\.


--
-- TOC entry 3387 (class 0 OID 17043)
-- Dependencies: 221
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, roles) FROM stdin;
14	admin@admin.com	$2b$10$WPMrsgZYhfuuFRoJ3vNc4u5OkRan/6VehoxXhD1ZClIj69Qz9F1Ti	seller
\.


--
-- TOC entry 3389 (class 0 OID 17049)
-- Dependencies: 223
-- Data for Name: wishlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wishlist (id, product_id, user_id) FROM stdin;
\.


--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 210
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_id_seq', 1, false);


--
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 225
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 1, true);


--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 212
-- Name: favorite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favorite_id_seq', 1, false);


--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 214
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_id_seq', 5, true);


--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 216
-- Name: payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_id_seq', 24, true);


--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 218
-- Name: product_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_details_id_seq', 8, true);


--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 220
-- Name: profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profile_id_seq', 12, true);


--
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 222
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 14, true);


--
-- TOC entry 3407 (class 0 OID 0)
-- Dependencies: 224
-- Name: wishlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wishlist_id_seq', 1, false);


--
-- TOC entry 3206 (class 2606 OID 17054)
-- Name: cart cart_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pk PRIMARY KEY (id);


--
-- TOC entry 3224 (class 2606 OID 25087)
-- Name: category category_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pk PRIMARY KEY (id);


--
-- TOC entry 3208 (class 2606 OID 17058)
-- Name: favorite favorite_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_pk PRIMARY KEY (id);


--
-- TOC entry 3210 (class 2606 OID 17060)
-- Name: order order_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pk PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 17062)
-- Name: payment payment_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pk PRIMARY KEY (id);


--
-- TOC entry 3214 (class 2606 OID 17064)
-- Name: product_details product_details_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_details
    ADD CONSTRAINT product_details_pk PRIMARY KEY (id);


--
-- TOC entry 3216 (class 2606 OID 17066)
-- Name: profile profile_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_pk PRIMARY KEY (id);


--
-- TOC entry 3218 (class 2606 OID 17068)
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- TOC entry 3220 (class 2606 OID 17070)
-- Name: users users_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_un UNIQUE (email);


--
-- TOC entry 3222 (class 2606 OID 17072)
-- Name: wishlist wishlist_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_pk PRIMARY KEY (id);


--
-- TOC entry 3225 (class 2606 OID 17073)
-- Name: cart cart_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_fk FOREIGN KEY (product_id) REFERENCES public.product_details(id);


--
-- TOC entry 3227 (class 2606 OID 17083)
-- Name: favorite favorite_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_fk FOREIGN KEY (product_id) REFERENCES public.product_details(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3228 (class 2606 OID 17088)
-- Name: favorite favorite_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_fk_1 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3229 (class 2606 OID 17093)
-- Name: order order_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3230 (class 2606 OID 17098)
-- Name: payment payment_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_fk FOREIGN KEY (order_id) REFERENCES public."order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3231 (class 2606 OID 25088)
-- Name: product_details product_details_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_details
    ADD CONSTRAINT product_details_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3232 (class 2606 OID 25093)
-- Name: product_details product_details_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_details
    ADD CONSTRAINT product_details_fk_2 FOREIGN KEY (category_id) REFERENCES public.category(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3233 (class 2606 OID 17103)
-- Name: profile profile_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3226 (class 2606 OID 17108)
-- Name: cart user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3234 (class 2606 OID 17113)
-- Name: wishlist wishlist_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_fk FOREIGN KEY (product_id) REFERENCES public.product_details(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3235 (class 2606 OID 17118)
-- Name: wishlist wishlist_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_fk_1 FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2022-08-21 09:34:37

--
-- PostgreSQL database dump complete
--

