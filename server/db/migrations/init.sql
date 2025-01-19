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


CREATE TABLE public.cargos (
    cargo_id uuid NOT NULL,
    shipment_id uuid NOT NULL,
    amount integer NOT NULL,
    volume integer NOT NULL,
    name character varying NOT NULL
);


CREATE TABLE public.cars (
    plate character varying NOT NULL,
    model character varying NOT NULL,
    type character varying NOT NULL,
    pic character varying NOT NULL,
    load integer NOT NULL
);

CREATE TABLE public.destinations (
    destination_id integer NOT NULL,
    destination character varying NOT NULL
);


CREATE SEQUENCE public.destinations_destination_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.destinations_destination_id_seq OWNED BY public.destinations.destination_id;


CREATE TABLE public.shipments (
    id uuid NOT NULL,
    car_plate character varying NOT NULL,
    destination integer NOT NULL,
    order_sh integer NOT NULL
);



--
-- TOC entry 222 (class 1259 OID 25482)
--

CREATE SEQUENCE public.shipments_destination_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 222
--

ALTER SEQUENCE public.shipments_destination_seq OWNED BY public.shipments.destination;


--
-- TOC entry 223 (class 1259 OID 25495)
--

CREATE SEQUENCE public.shipments_order_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 223
--

ALTER SEQUENCE public.shipments_order_seq OWNED BY public.shipments.order_sh;


--
-- TOC entry 215 (class 1259 OID 25423)
--

CREATE TABLE public.users (
    id integer NOT NULL,
    login character varying(16) NOT NULL,
    password character varying(32) NOT NULL
);



--
-- TOC entry 216 (class 1259 OID 25426)
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 216
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3225 (class 2604 OID 25474)
--

ALTER TABLE ONLY public.destinations ALTER COLUMN destination_id SET DEFAULT nextval('public.destinations_destination_id_seq'::regclass);


--
-- TOC entry 3223 (class 2604 OID 25483)
--

ALTER TABLE ONLY public.shipments ALTER COLUMN destination SET DEFAULT nextval('public.shipments_destination_seq'::regclass);


--
-- TOC entry 3224 (class 2604 OID 25496)
--

ALTER TABLE ONLY public.shipments ALTER COLUMN order_sh SET DEFAULT nextval('public.shipments_order_seq'::regclass);


--
-- TOC entry 3222 (class 2604 OID 25427)
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3388 (class 0 OID 25458)
-- Dependencies: 219
--

COPY public.cargos (cargo_id, shipment_id, amount, volume, name) FROM stdin;
c2866481-1049-404f-ab6e-c997b8b5505d	77d57c77-e611-4824-a0e9-d801c348d3d6	1	250	Такси Романа
c3ee3805-125c-4432-9f42-8c3df81cadcb	59938593-e94d-434e-b5cb-5dcf41188a07	2	5	Томми Ган
57d25d07-0709-4e10-8308-36af8c39d355	bfb7ea7b-c7e7-4d9b-848a-9b2594b5d57c	10	2	Кофе с пирогами
c5de7254-f117-4b9c-8a3e-3c5fb8300bc7	e84f280a-2c2e-4fd5-a556-1508ae4ed7f9	7	5	Бриллианты
3e2c3e50-e3cd-4b36-b5c4-b63dff76fc92	e84f280a-2c2e-4fd5-a556-1508ae4ed7f9	1	15	Бейсбольные биты
34c42215-eb54-4ea4-9074-9434dab12a34	0b4ca48a-72eb-42be-8eba-14b116bdcb73	10	4	Кегли для боулинга
\.


--
-- TOC entry 3386 (class 0 OID 25435)
-- Dependencies: 217
--

COPY public.cars (plate, model, type, pic, load) FROM stdin;
B888PX197	Mercedes-Benz V-Class	A	vclass.png	50
A001MP97	Газель Long Edition	B	gazel_long.jpg	250
M864MM98	Range Rover Konstantin	A	rr.jpg	52
O001MP98	Газель Шаверма	B	shawerma.png	150
A001AA77	Rolls Royce Truck	C	rr.png	1777
C978CC177	Газель Вездеход	A	vezdehod.jpg	10
M571AK50	Kamaz	C	kamaz.png	2000
E777KX177	Volkswagen KGB	A	vw_fsb.png	228
\.


--
-- TOC entry 3389 (class 0 OID 25470)
-- Dependencies: 220
--

COPY public.destinations (destination_id, destination) FROM stdin;
5	Твин Пикс
4	Лост-Хэвен
3	Либерти-Сити
2	Бобруйск
1	Душанбе
\.




COPY public.shipments (id, car_plate, destination, order_sh) FROM stdin;
59938593-e94d-434e-b5cb-5dcf41188a07	A001AA77	4	3
e84f280a-2c2e-4fd5-a556-1508ae4ed7f9	B888PX197	4	4
bfb7ea7b-c7e7-4d9b-848a-9b2594b5d57c	M864MM98	5	2
0b4ca48a-72eb-42be-8eba-14b116bdcb73	O001MP98	3	5
77d57c77-e611-4824-a0e9-d801c348d3d6	M571AK50	3	1
\.


COPY public.users (id, login, password) FROM stdin;
1	sample	text
\.



SELECT pg_catalog.setval('public.destinations_destination_id_seq', 1, false);



SELECT pg_catalog.setval('public.shipments_destination_seq', 2, true);


SELECT pg_catalog.setval('public.shipments_order_seq', 5, true);




SELECT pg_catalog.setval('public.users_id_seq', 1, false);




ALTER TABLE ONLY public.cargos
    ADD CONSTRAINT cargos_pkey PRIMARY KEY (cargo_id);




ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (plate);


--
-- TOC entry 3237 (class 2606 OID 25481)
--

ALTER TABLE ONLY public.destinations
    ADD CONSTRAINT destinations_pkey PRIMARY KEY (destination_id);


--
-- TOC entry 3233 (class 2606 OID 25452)
--

ALTER TABLE ONLY public.shipments
    ADD CONSTRAINT shipments_pkey PRIMARY KEY (id);


--
-- TOC entry 3227 (class 2606 OID 25432)
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3229 (class 2606 OID 25434)
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_unique UNIQUE (login);


--
-- TOC entry 3238 (class 2606 OID 25453)
--

ALTER TABLE ONLY public.shipments
    ADD CONSTRAINT car_ref FOREIGN KEY (car_plate) REFERENCES public.cars(plate) NOT VALID;


--
-- TOC entry 3240 (class 2606 OID 25465)
--

ALTER TABLE ONLY public.cargos
    ADD CONSTRAINT cargos_shipment_id_fkey FOREIGN KEY (shipment_id) REFERENCES public.shipments(id) NOT VALID;


--
-- TOC entry 3239 (class 2606 OID 25490)
--

ALTER TABLE ONLY public.shipments
    ADD CONSTRAINT dest_ref FOREIGN KEY (destination) REFERENCES public.destinations(destination_id) NOT VALID;

COMMIT

