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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(225) NOT NULL,
    galaxy_type text NOT NULL,
    diameter_in_ly integer NOT NULL,
    distance_in_ly integer NOT NULL
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
    name character varying(100) NOT NULL,
    orbital_motion text,
    planet_id integer,
    diameter_in_km integer NOT NULL
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
    name character varying(100) NOT NULL,
    has_life boolean NOT NULL,
    exoplanet boolean NOT NULL,
    star_id integer
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
-- Name: planetary_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planetary_system (
    planetary_system_id integer NOT NULL,
    star_id integer,
    planet_id integer,
    name character varying(100),
    habitable_zone boolean NOT NULL
);


ALTER TABLE public.planetary_system OWNER TO freecodecamp;

--
-- Name: planetary_system_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planetary_system_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planetary_system_system_id_seq OWNER TO freecodecamp;

--
-- Name: planetary_system_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planetary_system_system_id_seq OWNED BY public.planetary_system.planetary_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_type character varying(100) NOT NULL,
    luminosity_in_lo numeric,
    galaxy_id integer,
    special_classification character varying(100)
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planetary_system planetary_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_system ALTER COLUMN planetary_system_id SET DEFAULT nextval('public.planetary_system_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way Galaxy', 'Spiral galaxy', 87400, 26996);
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 'Spiral galaxy', 32200, 163000);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'Spiral galaxy', 152000, 2500000);
INSERT INTO public.galaxy VALUES (4, 'Cigar Galaxy', 'Starburst galaxy', 40800, 12000000);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel Galaxy', 'Spiral galaxy', 170000, 21000000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'Peculiar galaxy', 94900, 31100000);
INSERT INTO public.galaxy VALUES (7, 'Whirlpool Galaxy', 'Spiral galaxy', 76900, 23500000);
INSERT INTO public.galaxy VALUES (8, 'NGC 1300', 'Spiral galaxy', 110000, 61300000);
INSERT INTO public.galaxy VALUES (9, 'Tadpole Galaxy', 'Spiral galaxy', 280000, 400000000);
INSERT INTO public.galaxy VALUES (10, 'Hoag''s Object', 'Ring galaxy', 148000, 612800000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Prograde', 3, 3474);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Retrograde', 4, 22);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Retrograde', 4, 13);
INSERT INTO public.moon VALUES (4, 'Io', 'Prograde', 5, 3643);
INSERT INTO public.moon VALUES (5, 'Europa', 'Prograde', 5, 3122);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Prograde', 5, 5268);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Prograde', 5, 4821);
INSERT INTO public.moon VALUES (8, 'Metis', 'Prograde', 5, 43);
INSERT INTO public.moon VALUES (9, 'Adrastea', 'Prograde', 5, 16);
INSERT INTO public.moon VALUES (10, 'Amalthea', 'Prograde', 5, 167);
INSERT INTO public.moon VALUES (11, 'Thebe', 'Prograde', 5, 99);
INSERT INTO public.moon VALUES (12, 'Titan', 'Prograde', 6, 5149);
INSERT INTO public.moon VALUES (13, 'Enceladus', 'Prograde', 6, 500);
INSERT INTO public.moon VALUES (14, 'Triton', 'Retrograde', 8, 2710);
INSERT INTO public.moon VALUES (15, 'Rhea', 'Prograde', 6, 1527);
INSERT INTO public.moon VALUES (16, 'Iapetus', 'Prograde', 6, 1469);
INSERT INTO public.moon VALUES (17, 'Dione', 'Prograde', 6, 1123);
INSERT INTO public.moon VALUES (18, 'Tethys', 'Prograde', 6, 1060);
INSERT INTO public.moon VALUES (19, 'Miranda', 'Prograde', 7, 470);
INSERT INTO public.moon VALUES (20, 'Nereid', 'Prograde', 8, 357);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, false, 11);
INSERT INTO public.planet VALUES (2, 'Venus', false, false, 11);
INSERT INTO public.planet VALUES (3, 'Earth', true, false, 11);
INSERT INTO public.planet VALUES (4, 'Mars', false, false, 11);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, false, 11);
INSERT INTO public.planet VALUES (6, 'Saturn', false, false, 11);
INSERT INTO public.planet VALUES (7, 'Uranus', false, false, 11);
INSERT INTO public.planet VALUES (8, 'Neptune', false, false, 11);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', false, true, 3);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', false, true, 12);
INSERT INTO public.planet VALUES (11, '51 Pegasi b', false, true, 13);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', false, true, 14);


--
-- Data for Name: planetary_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planetary_system VALUES (1, 14, 12, 'Trappist-1 system', true);
INSERT INTO public.planetary_system VALUES (2, 12, 10, 'Kepler-186', true);
INSERT INTO public.planetary_system VALUES (3, 11, 3, 'Solar System', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius A', 'A-type', 25.4, 1, 'None');
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'M-type', 65000, 1, 'Red Supergiant');
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'M-type', 0.0017, 1, 'Red Dwarf');
INSERT INTO public.star VALUES (4, 'Rigel', 'B-type', 120000, 1, 'Blue Supergiant');
INSERT INTO public.star VALUES (5, 'Vega', 'A-type', 47.2, 1, 'None');
INSERT INTO public.star VALUES (6, 'R136a1', 'O-type', 4677000, 2, 'Wolf-Rayet');
INSERT INTO public.star VALUES (7, 'LMC X-1', 'B-type', NULL, 2, 'Black Hold Companion Star');
INSERT INTO public.star VALUES (8, 'S Doradus', 'O-type', 910000, 2, 'Luminous Blue Variable (LBV)');
INSERT INTO public.star VALUES (9, 'HV 2112', 'M-type', 50100, 2, 'Asymptotic Giant Branch Star');
INSERT INTO public.star VALUES (10, 'WOH G64', 'M-type', 282000, 2, 'Red Supergiant');
INSERT INTO public.star VALUES (11, 'Sun', 'G-type', 1, 1, 'Main Sequence');
INSERT INTO public.star VALUES (12, 'Kepler-186', 'M-type', 0.04, 1, 'None');
INSERT INTO public.star VALUES (13, '51 Pegasi', 'G-type', 1.3, 1, 'Yellow dwarf');
INSERT INTO public.star VALUES (14, 'TRAPPIST-1', 'M-type', 0.00052, 1, 'Ultracool dwarf');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planetary_system_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planetary_system_system_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 15, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


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
-- Name: planetary_system planetary_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_system
    ADD CONSTRAINT planetary_system_pkey PRIMARY KEY (planetary_system_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: planetary_system unique_system_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_system
    ADD CONSTRAINT unique_system_name UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE SET NULL;


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE SET NULL;


--
-- Name: planetary_system fk_ps_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_system
    ADD CONSTRAINT fk_ps_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE SET NULL;


--
-- Name: planetary_system fk_ps_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_system
    ADD CONSTRAINT fk_ps_star FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE SET NULL;


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

