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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    num_stars numeric(7,3),
    galaxy_type character varying(30),
    age_in_million_years numeric(9,3)
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
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    distance_from_planet_in_thousand_km numeric(12,3),
    age_in_million_years numeric(9,3)
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
-- Name: other_body; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.other_body (
    other_body_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_spherical boolean,
    body_type character varying(30)
);


ALTER TABLE public.other_body OWNER TO freecodecamp;

--
-- Name: other_bodies_body_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.other_bodies_body_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.other_bodies_body_id_seq OWNER TO freecodecamp;

--
-- Name: other_bodies_body_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.other_bodies_body_id_seq OWNED BY public.other_body.other_body_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    num_moons integer,
    description text,
    possible_water boolean
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    num_planets integer,
    star_type character varying(30),
    age_in_millions_of_years numeric(5,3)
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: other_body other_body_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_body ALTER COLUMN other_body_id SET DEFAULT nextval('public.other_bodies_body_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Andromeda', 2, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Black Eye', 3, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Condor', 4, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Eye of Sauron', 5, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Little Sombrero', 6, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 1, 3, NULL, NULL);
INSERT INTO public.moon VALUES ('Metis', 2, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Adrastea', 3, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Amalthea', 4, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Thebe', 5, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Io', 6, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Europa', 7, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Ganymede', 8, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Callisto', 9, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Themisto', 10, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Leda', 11, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Hersa', 12, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Himalia', 13, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Pandia', 14, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Lysithea', 15, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Elara', 16, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Dia', 17, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Mimas', 18, 6, NULL, NULL);
INSERT INTO public.moon VALUES ('Enceladus', 19, 6, NULL, NULL);
INSERT INTO public.moon VALUES ('Tethys', 20, 6, NULL, NULL);
INSERT INTO public.moon VALUES ('Dione', 21, 6, NULL, NULL);
INSERT INTO public.moon VALUES ('Rhea', 22, 6, NULL, NULL);
INSERT INTO public.moon VALUES ('Titan', 23, 6, NULL, NULL);
INSERT INTO public.moon VALUES ('Iapetus', 24, 6, NULL, NULL);


--
-- Data for Name: other_body; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.other_body VALUES (1, 'Pluto', NULL, NULL);
INSERT INTO public.other_body VALUES (2, 'Eris', NULL, NULL);
INSERT INTO public.other_body VALUES (3, 'Ceres', NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 1, 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES ('Venus', 2, 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES ('Earth', 3, 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES ('Mars', 4, 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES ('Jupiter', 5, 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES ('Saturn', 6, 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES ('Uranus', 7, 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES ('Neptune', 8, 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES ('Proxima Centauri b', 9, 2, NULL, NULL, NULL);
INSERT INTO public.planet VALUES ('Proxima Centauri c', 10, 2, NULL, NULL, NULL);
INSERT INTO public.planet VALUES ('Proxima Centauri d', 11, 2, NULL, NULL, NULL);
INSERT INTO public.planet VALUES ('TOI-1452b', 12, 8, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1, 1, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('Proxima Centauri', 2, 1, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('Antares', 3, 1, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('Betelgeuse', 4, 1, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('Sirius', 5, 1, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('Alpha Andromedae', 6, 2, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('Beta Andromedae', 7, 2, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('TOI-1452', 8, 1, NULL, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: other_bodies_body_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.other_bodies_body_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique UNIQUE (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique UNIQUE (moon_id);


--
-- Name: other_body other_bodies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_body
    ADD CONSTRAINT other_bodies_pkey PRIMARY KEY (other_body_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique UNIQUE (star_id);


--
-- Name: other_body unique_body; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_body
    ADD CONSTRAINT unique_body UNIQUE (other_body_id);


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
