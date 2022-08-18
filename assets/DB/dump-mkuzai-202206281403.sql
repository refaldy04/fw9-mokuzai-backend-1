--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

-- Started on 2022-08-18 15:57:20

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

DROP DATABASE mokuzai;
--
-- TOC entry 3404 (class 1262 OID 82043)
-- Name: mokuzai; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE mokuzai WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';


ALTER DATABASE mokuzai OWNER TO postgres;

\connect mokuzai

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
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 227 (class 1259 OID 82090)
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    id integer NOT NULL,
    product_id integer,
    user_id integer
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 82089)
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
-- TOC entry 221 (class 1259 OID 82074)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    category_name character varying,
    product_name character varying,
    product_id integer
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 82067)
-- Name: favorite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favorite (
    id integer NOT NULL,
    product_id integer,
    user_id integer
);


ALTER TABLE public.favorite OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 82066)
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
-- TOC entry 225 (class 1259 OID 82086)
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order" (
    id integer NOT NULL,
    user_id integer,
    quantity bigint,
    payment_id integer
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 82085)
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
-- TOC entry 223 (class 1259 OID 82080)
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    id integer NOT NULL,
    order_id integer,
    total_price bigint,
    payment_status character varying
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 82079)
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
-- TOC entry 212 (class 1259 OID 82051)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    product_id integer,
    category_id integer
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 82055)
-- Name: product_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_details (
    id integer NOT NULL,
    product_name character varying,
    product_desc text,
    product_price bigint,
    product_stock bigint,
    product_condition character varying,
    product_picture character varying
);


ALTER TABLE public.product_details OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 82054)
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
-- TOC entry 211 (class 1259 OID 82050)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 82061)
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
-- TOC entry 215 (class 1259 OID 82060)
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
-- TOC entry 210 (class 1259 OID 82045)
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
-- TOC entry 209 (class 1259 OID 82044)
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
-- TOC entry 220 (class 1259 OID 82071)
-- Name: wishlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wishlist (
    id integer NOT NULL,
    product_id integer,
    user_id integer
);


ALTER TABLE public.wishlist OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 82070)
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
-- TOC entry 3398 (class 0 OID 82090)
-- Dependencies: 227
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (id, product_id, user_id) FROM stdin;
\.


--
-- TOC entry 3392 (class 0 OID 82074)
-- Dependencies: 221
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, category_name, product_name, product_id) FROM stdin;
\.


--
-- TOC entry 3389 (class 0 OID 82067)
-- Dependencies: 218
-- Data for Name: favorite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorite (id, product_id, user_id) FROM stdin;
\.


--
-- TOC entry 3396 (class 0 OID 82086)
-- Dependencies: 225
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."order" (id, user_id, quantity, payment_id) FROM stdin;
\.


--
-- TOC entry 3394 (class 0 OID 82080)
-- Dependencies: 223
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (id, order_id, total_price, payment_status) FROM stdin;
\.


--
-- TOC entry 3383 (class 0 OID 82051)
-- Dependencies: 212
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, product_id, category_id) FROM stdin;
\.


--
-- TOC entry 3385 (class 0 OID 82055)
-- Dependencies: 214
-- Data for Name: product_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_details (id, product_name, product_desc, product_price, product_stock, product_condition, product_picture) FROM stdin;
\.


--
-- TOC entry 3387 (class 0 OID 82061)
-- Dependencies: 216
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile (id, user_id, gender, store_name, store_desc, picture) FROM stdin;
\.


--
-- TOC entry 3381 (class 0 OID 82045)
-- Dependencies: 210
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, roles) FROM stdin;
\.


--
-- TOC entry 3391 (class 0 OID 82071)
-- Dependencies: 220
-- Data for Name: wishlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wishlist (id, product_id, user_id) FROM stdin;
\.


--
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 226
-- Name: cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_id_seq', 1, false);


--
-- TOC entry 3407 (class 0 OID 0)
-- Dependencies: 217
-- Name: favorite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favorite_id_seq', 1, false);


--
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 224
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_id_seq', 1, false);


--
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 222
-- Name: payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_id_seq', 1, false);


--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 213
-- Name: product_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_details_id_seq', 1, false);


--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 211
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 1, false);


--
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 215
-- Name: profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profile_id_seq', 1, false);


--
-- TOC entry 3413 (class 0 OID 0)
-- Dependencies: 209
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 3414 (class 0 OID 0)
-- Dependencies: 219
-- Name: wishlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wishlist_id_seq', 1, false);


--
-- TOC entry 3227 (class 2606 OID 82108)
-- Name: cart cart_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pk PRIMARY KEY (id);


--
-- TOC entry 3221 (class 2606 OID 82124)
-- Name: category category_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pk PRIMARY KEY (id);


--
-- TOC entry 3217 (class 2606 OID 82100)
-- Name: favorite favorite_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_pk PRIMARY KEY (id);


--
-- TOC entry 3225 (class 2606 OID 82106)
-- Name: order order_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pk PRIMARY KEY (id);


--
-- TOC entry 3223 (class 2606 OID 82104)
-- Name: payment payment_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pk PRIMARY KEY (id);


--
-- TOC entry 3213 (class 2606 OID 82096)
-- Name: product_details product_details_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_details
    ADD CONSTRAINT product_details_pk PRIMARY KEY (id);


--
-- TOC entry 3211 (class 2606 OID 82094)
-- Name: product product_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pk PRIMARY KEY (id);


--
-- TOC entry 3215 (class 2606 OID 82098)
-- Name: profile profile_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_pk PRIMARY KEY (id);


--
-- TOC entry 3209 (class 2606 OID 82122)
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- TOC entry 3219 (class 2606 OID 82102)
-- Name: wishlist wishlist_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_pk PRIMARY KEY (id);


--
-- TOC entry 3239 (class 2606 OID 82109)
-- Name: cart cart_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_fk FOREIGN KEY (product_id) REFERENCES public.product_details(id);


--
-- TOC entry 3235 (class 2606 OID 82161)
-- Name: category category_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_fk FOREIGN KEY (product_id) REFERENCES public.product_details(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3231 (class 2606 OID 82135)
-- Name: favorite favorite_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_fk FOREIGN KEY (product_id) REFERENCES public.product_details(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3232 (class 2606 OID 82140)
-- Name: favorite favorite_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_fk_1 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3237 (class 2606 OID 82171)
-- Name: order order_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3238 (class 2606 OID 82176)
-- Name: order order_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_fk_1 FOREIGN KEY (payment_id) REFERENCES public.payment(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3236 (class 2606 OID 82166)
-- Name: payment payment_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_fk FOREIGN KEY (order_id) REFERENCES public."order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3228 (class 2606 OID 82114)
-- Name: product product_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_fk FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3229 (class 2606 OID 82125)
-- Name: product product_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_fk_1 FOREIGN KEY (category_id) REFERENCES public.category(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3230 (class 2606 OID 82130)
-- Name: profile profile_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3240 (class 2606 OID 82181)
-- Name: cart user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3233 (class 2606 OID 82145)
-- Name: wishlist wishlist_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_fk FOREIGN KEY (product_id) REFERENCES public.product_details(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3234 (class 2606 OID 82150)
-- Name: wishlist wishlist_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_fk_1 FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2022-08-18 15:57:21

--
-- PostgreSQL database dump complete
--

