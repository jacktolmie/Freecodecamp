-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(40) NOT NULL,
    description text,
    visited_by_doctor_who boolean,
    age_in_millions_of_years numeric,
    distance_from_earth integer NOT NULL,
    galaxy_id integer NOT NULL,
    rotation_time integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(40) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric,
    distance_from_planet integer NOT NULL,
    moon_id integer NOT NULL,
    rotation_time integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(40) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric,
    distance_from_earth integer NOT NULL,
    planet_id integer NOT NULL,
    rotation_time integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(40) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric,
    distance_from_earth integer NOT NULL,
    star_id integer NOT NULL,
    rotation_time integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.star.star_id;


--
-- Name: sun; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.sun (
    name character varying(40) NOT NULL,
    description text,
    distance_from_earth numeric NOT NULL,
    age_in_millions_of_years numeric,
    size_in_light_years integer,
    sun_id integer NOT NULL
);


ALTER TABLE public.sun OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solar_system_solar_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_system_solar_system_id_seq OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solar_system_solar_system_id_seq OWNED BY public.sun.sun_id;


--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.planet.planet_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: sun sun_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun ALTER COLUMN sun_id SET DEFAULT nextval('public.solar_system_solar_system_id_seq'::regcla
ss);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Andromeda', 'Gets its name from the area fo the sky in which it appears', true, NU
LL, 20, 200, NULL);
INSERT INTO public.galaxy VALUES ('Antennae', 'Appearance similar to an insects antennae', true, NULL, 31, 201, NULL)
;
INSERT INTO public.galaxy VALUES ('Backward', 'It appears to rotate backward', false, NULL, 11, 202, NULL);
INSERT INTO public.galaxy VALUES ('Black eye', 'Has dark bands in front of the bright nucleus', false, NULL, 51, 203,
 NULL);
INSERT INTO public.galaxy VALUES ('Bode', 'Named after Johann Bode', true, NULL, 72, 204, NULL);
INSERT INTO public.galaxy VALUES ('Butterfly', 'Looks like a butterfly', false, NULL, 22, 205, NULL);
INSERT INTO public.galaxy VALUES ('Milky Way', 'Some call it home', true, NULL, 0, 206, 45);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', NULL, false, NULL, NULL, 384400, 1, NULL, 300);
INSERT INTO public.moon VALUES ('Deimos', NULL, false, NULL, NULL, 23460, 2, NULL, 300);
INSERT INTO public.moon VALUES ('Phobos', NULL, false, NULL, NULL, 9270, 3, NULL, 300);
INSERT INTO public.moon VALUES ('Aitne', NULL, false, NULL, NULL, 9, 4, NULL, 300);
INSERT INTO public.moon VALUES ('Aoede', NULL, false, NULL, NULL, 23807655, 5, NULL, 300);
INSERT INTO public.moon VALUES ('Arche', NULL, false, NULL, NULL, 2306400, 6, NULL, 300);
INSERT INTO public.moon VALUES ('Io', NULL, false, NULL, NULL, 421600, 7, NULL, 300);
INSERT INTO public.moon VALUES ('Europa', NULL, false, NULL, NULL, 670900, 8, NULL, 300);
INSERT INTO public.moon VALUES ('Iocaste', NULL, false, NULL, NULL, 2321700, 9, NULL, 300);
INSERT INTO public.moon VALUES ('Isonone', NULL, false, NULL, NULL, 23217000, 10, NULL, 300);
INSERT INTO public.moon VALUES ('Thebe', NULL, false, NULL, NULL, 221900, 11, NULL, 300);
INSERT INTO public.moon VALUES ('Aegir', NULL, false, NULL, NULL, 20735000, 12, NULL, 300);
INSERT INTO public.moon VALUES ('Anthe', NULL, false, NULL, NULL, 197700, 13, NULL, 300);
INSERT INTO public.moon VALUES ('Atlas', NULL, false, NULL, NULL, 137640, 14, NULL, 300);
INSERT INTO public.moon VALUES ('Daphnis', NULL, false, NULL, NULL, 136500, 15, NULL, 300);
INSERT INTO public.moon VALUES ('Helene', NULL, false, NULL, NULL, 377400, 16, NULL, 300);
INSERT INTO public.moon VALUES ('Janus', NULL, false, NULL, NULL, 151472, 17, NULL, 300);
INSERT INTO public.moon VALUES ('Methone', NULL, false, NULL, NULL, 19400, 18, NULL, 300);
INSERT INTO public.moon VALUES ('Mimas', NULL, false, NULL, NULL, 185520, 19, NULL, 300);
INSERT INTO public.moon VALUES ('Titan', NULL, false, NULL, NULL, 1221850, 20, NULL, 300);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 'Red planet. Martians from from there', true, true, NULL, 32, 300, NULL,
 140);
INSERT INTO public.planet VALUES ('Venus', 'They created Venetian blinds', true, true, NULL, 22, 301, NULL, 140);
INSERT INTO public.planet VALUES ('Saturn', 'They make good vehicles', true, true, NULL, 42, 302, NULL, 140);
INSERT INTO public.planet VALUES ('Venus', 'They exported some mean plants that eat our insects', true, true, NULL, 5
2, 304, NULL, 140);
INSERT INTO public.planet VALUES ('Mercury', 'It grows or shrinks, depending on how hot it is', false, true, NULL, 62
, 305, NULL, 140);
INSERT INTO public.planet VALUES ('Uranus', 'The butt of many jokes', false, true, NULL, 7, 306, NULL, 140);
INSERT INTO public.planet VALUES ('Neptune', 'Creator of a salad dish they brought to Earth', true, true, NULL, 90, 3
07, NULL, 140);
INSERT INTO public.planet VALUES ('Jupiter', 'Cannot sustain life due to the big hurricane always going there', false
, true, NULL, 90, 308, NULL, 140);
INSERT INTO public.planet VALUES ('Earth', 'Protected by Doctor Who', true, true, NULL, 0, 309, NULL, 140);
INSERT INTO public.planet VALUES ('Kepler-16b', 'It is the older brother of Kepler-22b. Mom was always more proud of 
this child', true, true, NULL, 0, 310, NULL, 140);
INSERT INTO public.planet VALUES ('Kepler-22b', 'Became a doctor and a lawyer at the age of 5 billion', false, true, 
NULL, 0, 311, NULL, 140);
INSERT INTO public.planet VALUES ('CoRot 7b', 'It was supposed to be called Carrot, but its parents both had speech d
isorders', false, true, NULL, 0, 312, NULL, 140);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('a centauri c', 'It is a planet.', false, true, NULL, 4, 123, 36, 206);
INSERT INTO public.star VALUES ('a centauri b', 'It is a another planet.', false, true, NULL, 4, 143, 36, 206);
INSERT INTO public.star VALUES ('a centauri a', 'It is a yet another planet.', false, true, NULL, 4, 144, 36, 206);
INSERT INTO public.star VALUES ('wolf star', 'It is a yet another planet.', false, true, NULL, 4, 134, 36, 206);
INSERT INTO public.star VALUES ('Burnards star', 'Some other star', false, true, NULL, 6, 136, 48, 206);
INSERT INTO public.star VALUES ('Tau Ceti', 'Some other star again', false, true, NULL, 11, 137, 48, 206);
INSERT INTO public.star VALUES ('Sun', NULL, NULL, NULL, NULL, 1, 140, NULL, 206);


--
-- Data for Name: sun; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.sun VALUES ('Milky Way', 'It was named because it was the path used go to the dairy farm', 0, NULL
, NULL, 100);
INSERT INTO public.sun VALUES ('Sun', 'The main one we seem to worship for some reason', 1, NULL, NULL, 1);
INSERT INTO public.sun VALUES ('Stephenson 2 DFK 1', 'It was named this because twice Stephenson didnt #$%& know what
 to call it', 123, NULL, NULL, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solar_system_solar_system_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: star planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT planet_pkey PRIMARY KEY (star_id);


--
-- Name: star planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT planet_planet_id_key UNIQUE (star_id);


--
-- Name: sun solar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT solar_system_pkey PRIMARY KEY (sun_id);


--
-- Name: sun solar_system_solar_system_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT solar_system_solar_system_id_key UNIQUE (sun_id);


--
-- Name: planet star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_pkey PRIMARY KEY (planet_id);


--
-- Name: planet star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_star_id_key UNIQUE (planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
