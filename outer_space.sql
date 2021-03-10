--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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

ALTER TABLE ONLY public.planets DROP CONSTRAINT planets_star_id_fkey;
ALTER TABLE ONLY public.moons DROP CONSTRAINT moons_planets_id_fkey;
ALTER TABLE ONLY public.stars DROP CONSTRAINT stars_pkey;
ALTER TABLE ONLY public.planets DROP CONSTRAINT planets_pkey;
ALTER TABLE ONLY public.moons DROP CONSTRAINT moons_pkey;
ALTER TABLE public.stars ALTER COLUMN stars_id DROP DEFAULT;
ALTER TABLE public.planets ALTER COLUMN planets_id DROP DEFAULT;
ALTER TABLE public.moons ALTER COLUMN moon_id DROP DEFAULT;
DROP SEQUENCE public.stars_stars_id_seq;
DROP TABLE public.stars;
DROP SEQUENCE public.planets_planets_id_seq;
DROP TABLE public.planets;
DROP SEQUENCE public.moons_moon_id_seq;
DROP TABLE public.moons;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: moons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.moons (
    moon_id integer NOT NULL,
    moon_name text,
    planets_id integer NOT NULL
);


--
-- Name: moons_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.moons_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: moons_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.moons_moon_id_seq OWNED BY public.moons.moon_id;


--
-- Name: planets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.planets (
    planets_id integer NOT NULL,
    planet_name text NOT NULL,
    yrs numeric(5,3) NOT NULL,
    star_id integer NOT NULL
);


--
-- Name: planets_planets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.planets_planets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: planets_planets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.planets_planets_id_seq OWNED BY public.planets.planets_id;


--
-- Name: stars; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stars (
    stars_id integer NOT NULL,
    star_name text NOT NULL,
    star_temp character varying(7) NOT NULL
);


--
-- Name: stars_stars_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.stars_stars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stars_stars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.stars_stars_id_seq OWNED BY public.stars.stars_id;


--
-- Name: moons moon_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moons ALTER COLUMN moon_id SET DEFAULT nextval('public.moons_moon_id_seq'::regclass);


--
-- Name: planets planets_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planets ALTER COLUMN planets_id SET DEFAULT nextval('public.planets_planets_id_seq'::regclass);


--
-- Name: stars stars_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stars ALTER COLUMN stars_id SET DEFAULT nextval('public.stars_stars_id_seq'::regclass);


--
-- Data for Name: moons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.moons (moon_id, moon_name, planets_id) FROM stdin;
1	The Moon	1
2	Phobos	2
3	Deimos	2
\.


--
-- Data for Name: planets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.planets (planets_id, planet_name, yrs, star_id) FROM stdin;
1	Earth	1.000	1
2	Mars	1.882	1
3	Venus	0.620	1
4	Proxima Centauri b	0.030	2
5	Gliese 876 b	0.236	3
\.


--
-- Data for Name: stars; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.stars (stars_id, star_name, star_temp) FROM stdin;
1	THE SUN	5800K
2	Proxima Centauri	3042K
3	Gliese 876	3192K
\.


--
-- Name: moons_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.moons_moon_id_seq', 3, true);


--
-- Name: planets_planets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.planets_planets_id_seq', 5, true);


--
-- Name: stars_stars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.stars_stars_id_seq', 3, true);


--
-- Name: moons moons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moons
    ADD CONSTRAINT moons_pkey PRIMARY KEY (moon_id);


--
-- Name: planets planets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planets
    ADD CONSTRAINT planets_pkey PRIMARY KEY (planets_id);


--
-- Name: stars stars_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stars
    ADD CONSTRAINT stars_pkey PRIMARY KEY (stars_id);


--
-- Name: moons moons_planets_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moons
    ADD CONSTRAINT moons_planets_id_fkey FOREIGN KEY (planets_id) REFERENCES public.planets(planets_id);


--
-- Name: planets planets_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planets
    ADD CONSTRAINT planets_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.stars(stars_id);


--
-- PostgreSQL database dump complete
--

