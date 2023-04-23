--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2023-04-23 13:13:08 MSK

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 16721)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16720)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- TOC entry 3638 (class 0 OID 0)
-- Dependencies: 209
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 212 (class 1259 OID 16728)
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);


ALTER TABLE public.image OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16727)
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
-- TOC entry 3639 (class 0 OID 0)
-- Dependencies: 211
-- Name: image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;


--
-- TOC entry 218 (class 1259 OID 16766)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16765)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 3640 (class 0 OID 0)
-- Dependencies: 217
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 214 (class 1259 OID 16735)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(100),
    password character varying(255),
    role character varying(255)
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16734)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO postgres;

--
-- TOC entry 3641 (class 0 OID 0)
-- Dependencies: 213
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- TOC entry 216 (class 1259 OID 16744)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16773)
-- Name: product_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);


ALTER TABLE public.product_cart OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16772)
-- Name: product_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_cart_id_seq OWNER TO postgres;

--
-- TOC entry 3642 (class 0 OID 0)
-- Dependencies: 219
-- Name: product_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_cart_id_seq OWNED BY public.product_cart.id;


--
-- TOC entry 215 (class 1259 OID 16743)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;

--
-- TOC entry 3643 (class 0 OID 0)
-- Dependencies: 215
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 3455 (class 2604 OID 16724)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3456 (class 2604 OID 16731)
-- Name: image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);


--
-- TOC entry 3460 (class 2604 OID 16769)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3457 (class 2604 OID 16738)
-- Name: person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- TOC entry 3458 (class 2604 OID 16747)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 3461 (class 2604 OID 16776)
-- Name: product_cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart ALTER COLUMN id SET DEFAULT nextval('public.product_cart_id_seq'::regclass);


--
-- TOC entry 3622 (class 0 OID 16721)
-- Dependencies: 210
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (id, name) VALUES (3, 'Распродажа');
INSERT INTO public.category (id, name) VALUES (1, 'Новые двери');
INSERT INTO public.category (id, name) VALUES (2, 'Двери с историей');


--
-- TOC entry 3624 (class 0 OID 16728)
-- Dependencies: 212
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.image (id, file_name, product_id) VALUES (21, '47c694fc-46d9-4fb6-a18b-271f0891d162.MD-07-blok-.png', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (22, '8643b173-0ea7-41ac-b909-759128fc03dd.MD-07-Venge-vneshnyaya--552x600.png', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (23, '6180f243-ffee-473e-943e-23b2ed64a333.MD-07-vneshnyaya-zamki-552x600.png', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (24, 'ed7b6c94-90a2-430e-a351-c6dd8c1346c2.MD-07-vnutrennyaya-zamki-552x600.png', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (25, '93a983b8-f41e-4148-b311-f57a6d4ea481.MD-07-Dub-Filadelfiya-krem-vnutrennyaya-552x600.png', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (26, 'e120a1d5-5f79-468b-84e7-0f2d9c231de0.MD-30-blok-Zerkalo.png', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (27, '12b3c1e5-7def-42cf-a64f-be73cd967967.md-30-mirror_3-552x600.png', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (28, '477babb2-3082-4256-b4ba-4cf95ac47458.MD-30-vneshnyaya-552x600.png', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (29, '9a01056b-74e2-4332-9d76-7dee2064f648.MD-30-vnutrennyaya-Zerkalo-552x600.png', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (30, '68e79ad6-2775-47ae-b1e5-0991b02bf4da.', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (31, '17fc08a2-ea8f-42d1-8752-a147864df18e.MD-32-Venge-Dub-blook-SD.png', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (32, '23dc8ebf-8eae-4242-bd8a-5467a6180caa.MD-32-Dub-Filadelfiya-krem-vnutrennyayaSD-552x600.png', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (33, 'f4bbb069-cc76-4773-8035-fdc184c2816a.MD-32-Venge-vneshnyaya-SD-552x600.png', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (34, 'eb2ac874-0627-441b-808a-5b42b872ad8b.zamki-gardien-md-32-552x600-552x600.png', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (35, 'de7469f9-8d4a-4511-b143-632479c18de8.', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (36, 'a8afd141-5060-4b34-9355-66e0d78c3df1.MD-40-zerkalo-blok.png', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (37, 'dc94592a-df6e-4988-a279-41663b2c374f.MD-40-zerkalo-vneshnyaya-552x600.png', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (38, '42f7f1ed-c764-4923-86bc-aca807da136c.M-15-Belyj-rama-chyornaya-552x600.png', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (39, '68d871ce-fbe6-45ab-88d9-816874bae8c9.', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (40, 'f9dfe61b-7877-411c-b894-7c2144d0bda1.', 9);


--
-- TOC entry 3630 (class 0 OID 16766)
-- Dependencies: 218
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (2, 1, '2023-04-22 19:18:08.327517', 'db1ffbdc-0c6c-49f5-b80c-d6353615d7c9', 35900, 1, 5, 7);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (3, 1, '2023-04-22 19:18:08.391216', 'db1ffbdc-0c6c-49f5-b80c-d6353615d7c9', 20000, 1, 5, 6);


--
-- TOC entry 3626 (class 0 OID 16735)
-- Dependencies: 214
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person (id, login, password, role) VALUES (4, 'admin', '$2a$10$sYggRCzkcNDNWIDJ8SQ32ujNeGMSBDZ9yRIzLLDZZLOYSdIHD0uoK', 'ROLE_ADMIN');
INSERT INTO public.person (id, login, password, role) VALUES (5, 'user1', '$2a$10$0dMUYuyMZstnQaJXkK73G.mduk0lgSVuclWpp4qDFVIi31NPV6xN.', 'ROLE_USER');


--
-- TOC entry 3628 (class 0 OID 16744)
-- Dependencies: 216
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (6, '2023-04-22 19:09:34.067703', 'Основные размеры дверей (в мм): 860×2050, 960×2050;
Толщина дверного блока — 100 мм;
Цвет внешней отделки — Венге, рис. Президент;
Цвет внутренней отделки — Дуб Филадельфия крем, рис. Президент или Венге, рис. Президент;
Наполнитель дверного полотна — Минеральная плита ISOVER + пенопласт.
Вес 100кг', 20000, 'БелакоП', 'МД-07', 'Владимир', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (7, '2023-04-22 19:12:14.764', 'Основные размеры дверей (в мм): 860×2050, 960×2050;
Толщина дверного блока — 80 мм;
Цвет внешней отделки — Венге, рис. ФЛ-183;
Цвет внутренней отделки — Дуб беленый, рис. ФЛ-183 + Зеркало Оптима;
Наполнитель дверного полотна — Минеральная плита ISOVER + пенопласт.
Вес 98кг', 35900, 'БелакоФ', 'МД-30 Зеркало', 'Михаил', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (8, '2023-04-22 19:13:50.741128', 'Основные размеры дверей (в мм): 860×2050, 960×2050;
Толщина дверного блока — 80 мм;
Цвет внешней отделки — Венге;
Цвет внутренней отделки — Дуб беленый;
Наполнитель дверного полотна — Минеральная плита ISOVER + пенопласт.
Вес 90кг', 38850, 'БелакоП', 'МД-32', 'Калуга', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (9, '2023-04-22 19:16:38.369981', 'Основные размеры дверей (в мм): 860×2050, 960×2050;
Толщина дверного полотна — 100 мм;
Внешнее покрытие — Титан;
Цвет внутренней отделки — Белый софт, рисунок Д-15 Зеркало
Вес 88кг', 38000, 'БелакоК', 'МД-40 Зеркало', 'Владимир', 2);


--
-- TOC entry 3632 (class 0 OID 16773)
-- Dependencies: 220
-- Data for Name: product_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_cart (id, person_id, product_id) VALUES (6, 5, 6);


--
-- TOC entry 3644 (class 0 OID 0)
-- Dependencies: 209
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 1, false);


--
-- TOC entry 3645 (class 0 OID 0)
-- Dependencies: 211
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_id_seq', 40, true);


--
-- TOC entry 3646 (class 0 OID 0)
-- Dependencies: 217
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 3, true);


--
-- TOC entry 3647 (class 0 OID 0)
-- Dependencies: 213
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 5, true);


--
-- TOC entry 3648 (class 0 OID 0)
-- Dependencies: 219
-- Name: product_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cart_id_seq', 6, true);


--
-- TOC entry 3649 (class 0 OID 0)
-- Dependencies: 215
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 9, true);


--
-- TOC entry 3463 (class 2606 OID 16726)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3465 (class 2606 OID 16733)
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- TOC entry 3473 (class 2606 OID 16771)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3467 (class 2606 OID 16742)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 3475 (class 2606 OID 16778)
-- Name: product_cart product_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3469 (class 2606 OID 16752)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3471 (class 2606 OID 16754)
-- Name: product uk_qka6vxqdy1dprtqnx9trdd47c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);


--
-- TOC entry 3478 (class 2606 OID 16779)
-- Name: orders fk1b0m4muwx1t377w9if3w6wwqn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3477 (class 2606 OID 16760)
-- Name: product fk1mtsbur82frn64de7balymq9s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3479 (class 2606 OID 16784)
-- Name: orders fk787ibr3guwp6xobrpbofnv7le; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3476 (class 2606 OID 16755)
-- Name: image fkgpextbyee3uk9u6o2381m7ft1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3481 (class 2606 OID 16794)
-- Name: product_cart fkhpnrxdy3jhujameyod08ilvvw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3480 (class 2606 OID 16789)
-- Name: product_cart fksgnkc1ko2i1o9yr2p63ysq3rn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);


-- Completed on 2023-04-23 13:13:10 MSK

--
-- PostgreSQL database dump complete
--

