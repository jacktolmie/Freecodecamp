--
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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 0,
    user_id integer NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1705277299955', 2, 2, 92);
INSERT INTO public.users VALUES ('user_1705277299956', 5, 3, 91);
INSERT INTO public.users VALUES ('user_1705277733917', 5, 2, 105);
INSERT INTO public.users VALUES ('user_1705276824764', 2, 0, 75);
INSERT INTO public.users VALUES ('user_1705277303232', 2, 4, 94);
INSERT INTO public.users VALUES ('user_1705276824765', 5, 0, 74);
INSERT INTO public.users VALUES ('user_1705277303233', 5, 3, 93);
INSERT INTO public.users VALUES ('user_1705276985267', 2, 0, 77);
INSERT INTO public.users VALUES ('user_1705277758782', 2, 9, 108);
INSERT INTO public.users VALUES ('asdf', 2, 2, 95);
INSERT INTO public.users VALUES ('user_1705276985268', 5, 0, 76);
INSERT INTO public.users VALUES ('user_1705277758783', 5, 2, 107);
INSERT INTO public.users VALUES ('user_1705277360709', 2, 230, 97);
INSERT INTO public.users VALUES ('user_1705277168244', 2, 4, 80);
INSERT INTO public.users VALUES ('user_1705277360710', 5, 19, 96);
INSERT INTO public.users VALUES ('user_1705277168245', 5, 2, 79);
INSERT INTO public.users VALUES ('werwe', 0, 0, 98);
INSERT INTO public.users VALUES ('asdf asdf', 2, 1, 78);
INSERT INTO public.users VALUES ('asdfadfs', 0, 0, 99);
INSERT INTO public.users VALUES ('asdfasdf', 1, 2, 100);
INSERT INTO public.users VALUES ('user_1705277280897', 2, 5, 82);
INSERT INTO public.users VALUES ('user_1705277840307', 2, 6, 110);
INSERT INTO public.users VALUES ('user_1705277280898', 5, 3, 81);
INSERT INTO public.users VALUES ('user_1705277840308', 5, 5, 109);
INSERT INTO public.users VALUES ('user_1705277702932', 2, 4, 102);
INSERT INTO public.users VALUES ('user_1705277284870', 2, 2, 84);
INSERT INTO public.users VALUES ('user_1705277702933', 5, 3, 101);
INSERT INTO public.users VALUES ('user_1705277284871', 5, 4, 83);
INSERT INTO public.users VALUES ('user_1705277289560', 2, 7, 86);
INSERT INTO public.users VALUES ('user_1705277726703', 2, 4, 104);
INSERT INTO public.users VALUES ('user_1705277289561', 5, 5, 85);
INSERT INTO public.users VALUES ('user_1705277726704', 5, 3, 103);
INSERT INTO public.users VALUES ('user_1705277293065', 2, 3, 88);
INSERT INTO public.users VALUES ('user_1705277293066', 5, 2, 87);
INSERT INTO public.users VALUES ('user_1705277733916', 2, 8, 106);
INSERT INTO public.users VALUES ('user_1705277296528', 2, 7, 90);
INSERT INTO public.users VALUES ('user_1705277296529', 5, 2, 89);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 110, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

