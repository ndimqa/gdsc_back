--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Homebrew)
-- Dumped by pg_dump version 14.7 (Homebrew)

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
-- Name: appointments; Type: TABLE; Schema: public; Owner: pg
--

CREATE TABLE public.appointments (
    id bigint NOT NULL,
    user_mail text,
    doctors_mail text,
    "time" text,
    day_month_year text,
    doctor_id bigint,
    end_time text
);


ALTER TABLE public.appointments OWNER TO pg;

--
-- Name: appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: pg
--

CREATE SEQUENCE public.appointments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointments_id_seq OWNER TO pg;

--
-- Name: appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pg
--

ALTER SEQUENCE public.appointments_id_seq OWNED BY public.appointments.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: pg
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name text
);


ALTER TABLE public.categories OWNER TO pg;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: pg
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO pg;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pg
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: pg
--

CREATE TABLE public.comments (
    id bigint NOT NULL,
    text text,
    medicine_id bigint
);


ALTER TABLE public.comments OWNER TO pg;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: pg
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO pg;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pg
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: doctors; Type: TABLE; Schema: public; Owner: pg
--

CREATE TABLE public.doctors (
    id bigint NOT NULL,
    name text,
    description text,
    image text,
    mail text
);


ALTER TABLE public.doctors OWNER TO pg;

--
-- Name: doctors_id_seq; Type: SEQUENCE; Schema: public; Owner: pg
--

CREATE SEQUENCE public.doctors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctors_id_seq OWNER TO pg;

--
-- Name: doctors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pg
--

ALTER SEQUENCE public.doctors_id_seq OWNED BY public.doctors.id;


--
-- Name: medicines; Type: TABLE; Schema: public; Owner: pg
--

CREATE TABLE public.medicines (
    id bigint NOT NULL,
    name text,
    rus_name text,
    description text
);


ALTER TABLE public.medicines OWNER TO pg;

--
-- Name: medicines_id_seq; Type: SEQUENCE; Schema: public; Owner: pg
--

CREATE SEQUENCE public.medicines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medicines_id_seq OWNER TO pg;

--
-- Name: medicines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pg
--

ALTER SEQUENCE public.medicines_id_seq OWNED BY public.medicines.id;


--
-- Name: metrics; Type: TABLE; Schema: public; Owner: pg
--

CREATE TABLE public.metrics (
    id bigint NOT NULL,
    weight numeric,
    bpm bigint,
    saturation numeric,
    temperature numeric,
    pressure text,
    date text
);


ALTER TABLE public.metrics OWNER TO pg;

--
-- Name: metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: pg
--

CREATE SEQUENCE public.metrics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metrics_id_seq OWNER TO pg;

--
-- Name: metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pg
--

ALTER SEQUENCE public.metrics_id_seq OWNED BY public.metrics.id;


--
-- Name: post_categories; Type: TABLE; Schema: public; Owner: pg
--

CREATE TABLE public.post_categories (
    post_id bigint NOT NULL,
    categories_id bigint NOT NULL
);


ALTER TABLE public.post_categories OWNER TO pg;

--
-- Name: post_comments; Type: TABLE; Schema: public; Owner: pg
--

CREATE TABLE public.post_comments (
    id bigint NOT NULL,
    text text,
    post_id bigint
);


ALTER TABLE public.post_comments OWNER TO pg;

--
-- Name: post_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: pg
--

CREATE SEQUENCE public.post_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_comments_id_seq OWNER TO pg;

--
-- Name: post_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pg
--

ALTER SEQUENCE public.post_comments_id_seq OWNED BY public.post_comments.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: pg
--

CREATE TABLE public.posts (
    id bigint NOT NULL,
    image text,
    text text,
    header text,
    time_to_read bigint
);


ALTER TABLE public.posts OWNER TO pg;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: pg
--

CREATE SEQUENCE public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO pg;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pg
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: time_slots; Type: TABLE; Schema: public; Owner: pg
--

CREATE TABLE public.time_slots (
    id bigint NOT NULL,
    "time" text,
    date text,
    mail text
);


ALTER TABLE public.time_slots OWNER TO pg;

--
-- Name: time_slots_id_seq; Type: SEQUENCE; Schema: public; Owner: pg
--

CREATE SEQUENCE public.time_slots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.time_slots_id_seq OWNER TO pg;

--
-- Name: time_slots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pg
--

ALTER SEQUENCE public.time_slots_id_seq OWNED BY public.time_slots.id;


--
-- Name: appointments id; Type: DEFAULT; Schema: public; Owner: pg
--

ALTER TABLE ONLY public.appointments ALTER COLUMN id SET DEFAULT nextval('public.appointments_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: pg
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: pg
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: doctors id; Type: DEFAULT; Schema: public; Owner: pg
--

ALTER TABLE ONLY public.doctors ALTER COLUMN id SET DEFAULT nextval('public.doctors_id_seq'::regclass);


--
-- Name: medicines id; Type: DEFAULT; Schema: public; Owner: pg
--

ALTER TABLE ONLY public.medicines ALTER COLUMN id SET DEFAULT nextval('public.medicines_id_seq'::regclass);


--
-- Name: metrics id; Type: DEFAULT; Schema: public; Owner: pg
--

ALTER TABLE ONLY public.metrics ALTER COLUMN id SET DEFAULT nextval('public.metrics_id_seq'::regclass);


--
-- Name: post_comments id; Type: DEFAULT; Schema: public; Owner: pg
--

ALTER TABLE ONLY public.post_comments ALTER COLUMN id SET DEFAULT nextval('public.post_comments_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: pg
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: time_slots id; Type: DEFAULT; Schema: public; Owner: pg
--

ALTER TABLE ONLY public.time_slots ALTER COLUMN id SET DEFAULT nextval('public.time_slots_id_seq'::regclass);


--
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: pg
--

COPY public.appointments (id, user_mail, doctors_mail, "time", day_month_year, doctor_id, end_time) FROM stdin;
2	kolbar33@gmail.com	a.serikbayevv@gmail.com	12:00:00-07:00	2023-06-03	1	13:00:00-07:00
1	dinmukhamednuran@gmail.com	a.serikbayevv@gmail.com	17:00:00-07:00	2023-06-28	1	18:00:00-07:00
7	kolbar33@gmail.com	a.serikbayevv@gmail.com	13:00:00+06:00	2023-10-10	1	14:00:00+06:00
8	kolbar33@gmail.com	a.serikbayevv@gmail.com	13:00:00+06:00	2023-06-06	1	14:00:00+06:00
9	kolbar33@gmail.com	a.serikbayevv@gmail.com	13:00:00+06:00	2023-06-06	1	14:00:00+06:00
10	kolbar33@gmail.com	a.serikbayevv@gmail.com	03:00 PM+06:00	2023-06-03+06:00	1	04:00+06:00
11	kolbar33@gmail.com	a.serikbayevv@gmail.com	01:00 PM:00+06:00	2023-06-03	1	02:00:00+06:00
12	kolbar33@gmail.com	a.serikbayevv@gmail.com	03:00 PM:00+06:00	2023-06-03	1	04:00:00+06:00
13	kolbar33@gmail.com	a.serikbayevv@gmail.com	09:00 AM:00+06:00	2023-06-04	1	10:00:00+06:00
14	kolbar33@gmail.com	a.serikbayevv@gmail.com	10:00:00+06:00	2023-06-05	1	11:00:00+06:00
15	kolbar33@gmail.com	a.serikbayevv@gmail.com	11:00:00+06:00	2023-06-05	1	12:00:00+06:00
16	kolbar33@gmail.com	a.serikbayevv@gmail.com	11:00:00+06:00	2023-06-06	1	12:00:00+06:00
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: pg
--

COPY public.categories (id, name) FROM stdin;
1	Health
2	Emotions
3	Sports
4	Nutrition
5	Rehabilitation
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: pg
--

COPY public.comments (id, text, medicine_id) FROM stdin;
\.


--
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: pg
--

COPY public.doctors (id, name, description, image, mail) FROM stdin;
1	Octavius	test	https://drive.google.com/uc?export=view&id=18qtQkM-0F1YZIBtxMhiZQqmahxZ-aTfK	a.serikbayevv@gmail.com
\.


--
-- Data for Name: medicines; Type: TABLE DATA; Schema: public; Owner: pg
--

COPY public.medicines (id, name, rus_name, description) FROM stdin;
\.


--
-- Data for Name: metrics; Type: TABLE DATA; Schema: public; Owner: pg
--

COPY public.metrics (id, weight, bpm, saturation, temperature, pressure, date) FROM stdin;
\.


--
-- Data for Name: post_categories; Type: TABLE DATA; Schema: public; Owner: pg
--

COPY public.post_categories (post_id, categories_id) FROM stdin;
1	2
1	1
\.


--
-- Data for Name: post_comments; Type: TABLE DATA; Schema: public; Owner: pg
--

COPY public.post_comments (id, text, post_id) FROM stdin;
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: pg
--

COPY public.posts (id, image, text, header, time_to_read) FROM stdin;
1	https://drive.google.com/uc?export=view&id=13L5vUbchBJ21--KSe5IlknLJE2Nxw5MQ	When most people think about getting an organ transplant, they focus on the obvious physical aspects: the illness, the operation, and the healing. They're less likely to think about the emotional impact. But that can be profound too, both for you and the people around you.\nNearly all people who receive a transplant, experts say, feel elated and experience a sense of relief and hope after a surgery that goes well. But with time, that initial optimism may be tinged with other feelings. You may start to worry about your condition coming back. You may be afraid of organ rejection. Or you may fixate on the uncertainty of the future.\nIt's perfectly natural to have these feelings. But if these worries take over your life, you need to do something about it.\nGuilt After an Organ Transplant\nGuilt is a common reaction people have after a transplant. Patients often report thinking a lot 	Coping Emotionally After an Organ Transplant	10
\.


--
-- Data for Name: time_slots; Type: TABLE DATA; Schema: public; Owner: pg
--

COPY public.time_slots (id, "time", date, mail) FROM stdin;
\.


--
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pg
--

SELECT pg_catalog.setval('public.appointments_id_seq', 16, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pg
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, false);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pg
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, false);


--
-- Name: doctors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pg
--

SELECT pg_catalog.setval('public.doctors_id_seq', 1, false);


--
-- Name: medicines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pg
--

SELECT pg_catalog.setval('public.medicines_id_seq', 1, false);


--
-- Name: metrics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pg
--

SELECT pg_catalog.setval('public.metrics_id_seq', 1, false);


--
-- Name: post_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pg
--

SELECT pg_catalog.setval('public.post_comments_id_seq', 1, false);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pg
--

SELECT pg_catalog.setval('public.posts_id_seq', 1, false);


--
-- Name: time_slots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pg
--

SELECT pg_catalog.setval('public.time_slots_id_seq', 1, false);


--
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: pg
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: pg
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: pg
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: doctors doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: pg
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (id);


--
-- Name: medicines medicines_pkey; Type: CONSTRAINT; Schema: public; Owner: pg
--

ALTER TABLE ONLY public.medicines
    ADD CONSTRAINT medicines_pkey PRIMARY KEY (id);


--
-- Name: metrics metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: pg
--

ALTER TABLE ONLY public.metrics
    ADD CONSTRAINT metrics_pkey PRIMARY KEY (id);


--
-- Name: post_categories post_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: pg
--

ALTER TABLE ONLY public.post_categories
    ADD CONSTRAINT post_categories_pkey PRIMARY KEY (post_id, categories_id);


--
-- Name: post_comments post_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: pg
--

ALTER TABLE ONLY public.post_comments
    ADD CONSTRAINT post_comments_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: pg
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: time_slots time_slots_pkey; Type: CONSTRAINT; Schema: public; Owner: pg
--

ALTER TABLE ONLY public.time_slots
    ADD CONSTRAINT time_slots_pkey PRIMARY KEY (id);


--
-- Name: appointments fk_doctors_appointments; Type: FK CONSTRAINT; Schema: public; Owner: pg
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT fk_doctors_appointments FOREIGN KEY (doctor_id) REFERENCES public.doctors(id);


--
-- Name: comments fk_medicines_comments; Type: FK CONSTRAINT; Schema: public; Owner: pg
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_medicines_comments FOREIGN KEY (medicine_id) REFERENCES public.medicines(id);


--
-- Name: post_categories fk_post_categories_categories; Type: FK CONSTRAINT; Schema: public; Owner: pg
--

ALTER TABLE ONLY public.post_categories
    ADD CONSTRAINT fk_post_categories_categories FOREIGN KEY (categories_id) REFERENCES public.categories(id);


--
-- Name: post_categories fk_post_categories_post; Type: FK CONSTRAINT; Schema: public; Owner: pg
--

ALTER TABLE ONLY public.post_categories
    ADD CONSTRAINT fk_post_categories_post FOREIGN KEY (post_id) REFERENCES public.posts(id);


--
-- Name: post_comments fk_posts_comments; Type: FK CONSTRAINT; Schema: public; Owner: pg
--

ALTER TABLE ONLY public.post_comments
    ADD CONSTRAINT fk_posts_comments FOREIGN KEY (post_id) REFERENCES public.posts(id);


--
-- PostgreSQL database dump complete
--

