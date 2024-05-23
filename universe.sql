--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: colony_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.colony_planet (
    colony_planet_id integer NOT NULL,
    star_id integer,
    planet_id integer,
    name character varying(20),
    candidate boolean NOT NULL
);


ALTER TABLE public.colony_planet OWNER TO freecodecamp;

--
-- Name: colony_planet_colony_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.colony_planet_colony_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.colony_planet_colony_planet_id_seq OWNER TO freecodecamp;

--
-- Name: colony_planet_colony_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.colony_planet_colony_planet_id_seq OWNED BY public.colony_planet.colony_planet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20),
    num_stars integer NOT NULL,
    num_planets integer NOT NULL,
    num_moons integer NOT NULL
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
    moon_id integer NOT NULL,
    name character varying(20),
    planet_id integer NOT NULL,
    moon_at_planet boolean,
    dist integer
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
    planet_id integer NOT NULL,
    name character varying(20),
    star_id integer NOT NULL,
    planet_has_moon boolean,
    description text,
    oxygen_per numeric(4,2)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

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

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20),
    galaxy_id integer NOT NULL,
    temp integer,
    size numeric(7,0)
);


ALTER TABLE public.star OWNER TO freecodecamp;

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

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: colony_planet colony_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.colony_planet ALTER COLUMN colony_planet_id SET DEFAULT nextval('public.colony_planet_colony_planet_id_seq'::regclass);


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

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: colony_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.colony_planet VALUES (1, 5, 22, 'Levi', true);
INSERT INTO public.colony_planet VALUES (2, 3, 13, 'Promitheas', true);
INSERT INTO public.colony_planet VALUES (3, 6, 10, 'Dimitra', true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 1000, 20, 3);
INSERT INTO public.galaxy VALUES (2, 'Black Eye Galaxy', 3506, 49, 6);
INSERT INTO public.galaxy VALUES (3, 'Large Mega Cloud', 10892, 106, 22);
INSERT INTO public.galaxy VALUES (4, 'Cigar Galaxy', 856, 13, 0);
INSERT INTO public.galaxy VALUES (5, 'Comet Galaxy', 23800, 57, 4);
INSERT INTO public.galaxy VALUES (6, 'Milky Way', 7689, 43, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, NULL, 1, false, NULL);
INSERT INTO public.moon VALUES (2, NULL, 2, false, NULL);
INSERT INTO public.moon VALUES (3, NULL, 3, false, NULL);
INSERT INTO public.moon VALUES (4, 'Nemea', 4, true, 800653);
INSERT INTO public.moon VALUES (5, NULL, 5, false, NULL);
INSERT INTO public.moon VALUES (6, 'Xerxis', 6, true, 263509);
INSERT INTO public.moon VALUES (7, 'Light', 8, true, 563024);
INSERT INTO public.moon VALUES (8, NULL, 9, false, NULL);
INSERT INTO public.moon VALUES (9, 'Plant', 10, true, 669320);
INSERT INTO public.moon VALUES (10, NULL, 12, false, NULL);
INSERT INTO public.moon VALUES (11, NULL, 13, false, NULL);
INSERT INTO public.moon VALUES (12, NULL, 14, false, NULL);
INSERT INTO public.moon VALUES (13, NULL, 15, false, NULL);
INSERT INTO public.moon VALUES (14, NULL, 16, false, NULL);
INSERT INTO public.moon VALUES (15, 'Harry', 17, true, 720325);
INSERT INTO public.moon VALUES (16, NULL, 19, false, NULL);
INSERT INTO public.moon VALUES (17, NULL, 20, false, NULL);
INSERT INTO public.moon VALUES (18, NULL, 21, false, NULL);
INSERT INTO public.moon VALUES (19, 'Gullas', 22, true, 963520);
INSERT INTO public.moon VALUES (20, 'Rio', 23, true, 1963520);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Ades', 1, false, 'A very deadful place. No condition for human life', 5.11);
INSERT INTO public.planet VALUES (2, 'Thhiseas', 2, false, 'Pieceful place but couldnt support human life cause of oxygen percentance', 23.80);
INSERT INTO public.planet VALUES (3, 'Ira', 3, false, 'It is a dry place, not even rocks could live there', 15.02);
INSERT INTO public.planet VALUES (4, 'Iraklis', 4, true, 'There is plenty of water, sometime may supports human life', 45.67);
INSERT INTO public.planet VALUES (5, 'Kentauros', 5, false, 'There is enough exygen to support humnan life but there is too high temparature that could boil water less than 1 second', 64.66);
INSERT INTO public.planet VALUES (6, 'Leonidas', 6, true, 'Too much aggresive enviroment with toxic storms too often', 64.54);
INSERT INTO public.planet VALUES (8, 'Andromache', 1, true, 'Andromache is a colorful planet occuring many similarities with eart', 59.99);
INSERT INTO public.planet VALUES (9, 'Hlios', 5, false, 'Its next to the sun resulting to too high temperatures', 33.30);
INSERT INTO public.planet VALUES (10, 'Dimitra', 6, true, 'Quitfriendly enviroment with showing many similarities with earths', 32.53);
INSERT INTO public.planet VALUES (12, 'Efialtes', 2, false, 'No probability of survival', 41.00);
INSERT INTO public.planet VALUES (13, 'Promitheas', 3, false, 'A very promising place to move in a emergency situation', 61.03);
INSERT INTO public.planet VALUES (14, 'Socrates', 4, false, 'Poisonous amount of exygen in the atmosphere', 89.01);
INSERT INTO public.planet VALUES (15, 'Alkiviades', 4, false, 'Very aggresive nature such as deadly plants', 55.01);
INSERT INTO public.planet VALUES (16, 'Spartan', 3, false, 'A place full of mountains and wild nature, too low per of oxygen', 9.11);
INSERT INTO public.planet VALUES (17, 'Ermioni', 3, true, 'Piecefull place , too low per of oxygen', 19.43);
INSERT INTO public.planet VALUES (18, 'Rapsodos', 3, true, 'Piecefull place , too low per of oxygen', 19.43);
INSERT INTO public.planet VALUES (19, 'Roman', 1, false, 'To low temperature to live a human', 42.43);
INSERT INTO public.planet VALUES (20, 'Spartakos', 2, false, 'To close to the sun of galaxy resulting to eye issues for a human', 30.55);
INSERT INTO public.planet VALUES (21, 'Amerio', 5, false, 'Aggresive atmosphere, for now no ship will enter the planet', 44.55);
INSERT INTO public.planet VALUES (22, 'Levi', 5, true, 'Ideal planet for human life', 60.23);
INSERT INTO public.planet VALUES (23, 'Vardos', 4, true, 'No oxygen at all', 3.23);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Lynx', 1, 723, 10068);
INSERT INTO public.star VALUES (2, 'Cassiopia', 2, 906, 3210069);
INSERT INTO public.star VALUES (3, 'Eridanus', 3, 1006, 5630876);
INSERT INTO public.star VALUES (4, 'Lux', 4, 910, 2303971);
INSERT INTO public.star VALUES (5, 'Lyra', 5, 2006, 5607956);
INSERT INTO public.star VALUES (6, 'Corvus', 6, 859, 637950);


--
-- Name: colony_planet_colony_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.colony_planet_colony_planet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 23, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: colony_planet colony_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.colony_planet
    ADD CONSTRAINT colony_planet_pkey PRIMARY KEY (colony_planet_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: colony_planet unique_galaxy_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.colony_planet
    ADD CONSTRAINT unique_galaxy_planet UNIQUE (star_id, planet_id);


--
-- Name: galaxy unique_name_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name_galaxy UNIQUE (name);


--
-- Name: moon unique_name_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name_moon UNIQUE (name);


--
-- Name: planet unique_name_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name_planet UNIQUE (name);


--
-- Name: star unique_name_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name_star UNIQUE (name);


--
-- Name: colony_planet colony_planet_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.colony_planet
    ADD CONSTRAINT colony_planet_name_fkey FOREIGN KEY (name) REFERENCES public.planet(name);


--
-- Name: colony_planet colony_planet_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.colony_planet
    ADD CONSTRAINT colony_planet_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: colony_planet colony_planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.colony_planet
    ADD CONSTRAINT colony_planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

