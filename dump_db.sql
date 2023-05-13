--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

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
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts (
    id integer NOT NULL,
    login character varying NOT NULL,
    password character varying NOT NULL,
    fio character varying,
    age integer,
    id_pol integer
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_id_seq OWNER TO postgres;

--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;


--
-- Name: oprosi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oprosi (
    id integer NOT NULL,
    name character varying,
    id_accounts integer,
    id_tematiki integer
);


ALTER TABLE public.oprosi OWNER TO postgres;

--
-- Name: oprosi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oprosi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oprosi_id_seq OWNER TO postgres;

--
-- Name: oprosi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oprosi_id_seq OWNED BY public.oprosi.id;


--
-- Name: otveti; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.otveti (
    id integer NOT NULL,
    text character varying,
    count_otvetov integer DEFAULT 0,
    id_vopros integer NOT NULL
);


ALTER TABLE public.otveti OWNER TO postgres;

--
-- Name: otveti_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.otveti_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.otveti_id_seq OWNER TO postgres;

--
-- Name: otveti_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.otveti_id_seq OWNED BY public.otveti.id;


--
-- Name: pol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pol (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.pol OWNER TO postgres;

--
-- Name: pol_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pol_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pol_id_seq OWNER TO postgres;

--
-- Name: pol_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pol_id_seq OWNED BY public.pol.id;


--
-- Name: tematiki; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tematiki (
    id integer NOT NULL,
    name character varying,
    id_accounts integer
);


ALTER TABLE public.tematiki OWNER TO postgres;

--
-- Name: tematiki_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tematiki_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tematiki_id_seq OWNER TO postgres;

--
-- Name: tematiki_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tematiki_id_seq OWNED BY public.tematiki.id;


--
-- Name: voprosi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.voprosi (
    id integer NOT NULL,
    text character varying,
    id_opros integer NOT NULL
);


ALTER TABLE public.voprosi OWNER TO postgres;

--
-- Name: voprosi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.voprosi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.voprosi_id_seq OWNER TO postgres;

--
-- Name: voprosi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.voprosi_id_seq OWNED BY public.voprosi.id;


--
-- Name: accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);


--
-- Name: oprosi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oprosi ALTER COLUMN id SET DEFAULT nextval('public.oprosi_id_seq'::regclass);


--
-- Name: otveti id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otveti ALTER COLUMN id SET DEFAULT nextval('public.otveti_id_seq'::regclass);


--
-- Name: pol id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pol ALTER COLUMN id SET DEFAULT nextval('public.pol_id_seq'::regclass);


--
-- Name: tematiki id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tematiki ALTER COLUMN id SET DEFAULT nextval('public.tematiki_id_seq'::regclass);


--
-- Name: voprosi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voprosi ALTER COLUMN id SET DEFAULT nextval('public.voprosi_id_seq'::regclass);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts (id, login, password, fio, age, id_pol) FROM stdin;
2	admin	sha256$ATxtGABPSH2vUU59$0742f9ead29122e81d136d64c51cf7b313d9918df4d37aad10f5e35737f8a651	Daniil Kuznetsov	18	1
\.


--
-- Data for Name: oprosi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oprosi (id, name, id_accounts, id_tematiki) FROM stdin;
1	Тест	2	1
2	Тест 2	2	2
\.


--
-- Data for Name: otveti; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.otveti (id, text, count_otvetov, id_vopros) FROM stdin;
10	Вариант 2	0	5
11	Вариант 3	0	5
13	Вар 2	0	6
15	Вар 2	0	7
16	Вар 3	0	7
9	Вариает 1	1	5
12	Вар 1	1	6
14	Вар 1	1	7
\.


--
-- Data for Name: pol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pol (id, name) FROM stdin;
1	Мужской
2	Женский
\.


--
-- Data for Name: tematiki; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tematiki (id, name, id_accounts) FROM stdin;
1	Книги	2
2	Политика	2
3	Обучение	2
\.


--
-- Data for Name: voprosi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.voprosi (id, text, id_opros) FROM stdin;
5	Тестовый вопрос	1
6	Тестовый вопрос №2	1
7	Тест 3	1
\.


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_id_seq', 2, true);


--
-- Name: oprosi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oprosi_id_seq', 2, true);


--
-- Name: otveti_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.otveti_id_seq', 16, true);


--
-- Name: pol_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pol_id_seq', 2, true);


--
-- Name: tematiki_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tematiki_id_seq', 3, true);


--
-- Name: voprosi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.voprosi_id_seq', 7, true);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: oprosi oprosi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oprosi
    ADD CONSTRAINT oprosi_pkey PRIMARY KEY (id);


--
-- Name: otveti otveti_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otveti
    ADD CONSTRAINT otveti_pkey PRIMARY KEY (id);


--
-- Name: pol pol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pol
    ADD CONSTRAINT pol_pkey PRIMARY KEY (id);


--
-- Name: tematiki tematiki_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tematiki
    ADD CONSTRAINT tematiki_pkey PRIMARY KEY (id);


--
-- Name: voprosi voprosi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voprosi
    ADD CONSTRAINT voprosi_pkey PRIMARY KEY (id);


--
-- Name: oprosi accounts_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oprosi
    ADD CONSTRAINT accounts_fkey FOREIGN KEY (id_accounts) REFERENCES public.accounts(id);


--
-- Name: tematiki accounts_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tematiki
    ADD CONSTRAINT accounts_fkey FOREIGN KEY (id_accounts) REFERENCES public.accounts(id) NOT VALID;


--
-- Name: voprosi oprosi_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voprosi
    ADD CONSTRAINT oprosi_fkey FOREIGN KEY (id_opros) REFERENCES public.oprosi(id);


--
-- Name: accounts pol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT pol_fkey FOREIGN KEY (id_pol) REFERENCES public.pol(id) NOT VALID;


--
-- Name: oprosi tematiki_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oprosi
    ADD CONSTRAINT tematiki_fkey FOREIGN KEY (id_tematiki) REFERENCES public.tematiki(id);


--
-- Name: otveti voprosi_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otveti
    ADD CONSTRAINT voprosi_fkey FOREIGN KEY (id_vopros) REFERENCES public.voprosi(id);


--
-- PostgreSQL database dump complete
--

