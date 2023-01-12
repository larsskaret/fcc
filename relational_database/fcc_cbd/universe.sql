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
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_million_of_years integer,
    is_spherical boolean,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_spherical boolean,
    planet_id integer,
    distance_from_earth integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(30),
    distance_from_earth numeric(6,1),
    age_in_million_of_years integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 12500, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Large Magelannic Cloud', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Phobos', false, 1, NULL);
INSERT INTO public.moon VALUES (2, 'Deimos', false, 1, NULL);
INSERT INTO public.moon VALUES (3, 'Io', NULL, 4, NULL);
INSERT INTO public.moon VALUES (4, 'Europa', NULL, 4, NULL);
INSERT INTO public.moon VALUES (5, 'Ganymede', NULL, 4, NULL);
INSERT INTO public.moon VALUES (6, 'Callisto', NULL, 4, NULL);
INSERT INTO public.moon VALUES (7, 'Thebe', NULL, 4, NULL);
INSERT INTO public.moon VALUES (8, 'Amalthea', NULL, 4, NULL);
INSERT INTO public.moon VALUES (9, 'Adrastea', NULL, 4, NULL);
INSERT INTO public.moon VALUES (10, 'Metis', NULL, 4, NULL);
INSERT INTO public.moon VALUES (11, 'Leda', NULL, 4, NULL);
INSERT INTO public.moon VALUES (12, 'Ersa', NULL, 4, NULL);
INSERT INTO public.moon VALUES (13, 'Himalia', NULL, 4, NULL);
INSERT INTO public.moon VALUES (14, 'Pandia', NULL, 4, NULL);
INSERT INTO public.moon VALUES (15, 'Lysithea', NULL, 4, NULL);
INSERT INTO public.moon VALUES (16, 'Elara', NULL, 4, NULL);
INSERT INTO public.moon VALUES (17, 'Dia', NULL, 4, NULL);
INSERT INTO public.moon VALUES (18, 'Carpo', NULL, 4, NULL);
INSERT INTO public.moon VALUES (19, 'Valetudo', NULL, 4, NULL);
INSERT INTO public.moon VALUES (20, 'Euporie', NULL, 4, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mars', NULL, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', NULL, false, 1);
INSERT INTO public.planet VALUES (3, 'Mercury', NULL, false, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', NULL, false, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', NULL, false, 1);
INSERT INTO public.planet VALUES (6, 'Uranus', NULL, false, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', NULL, false, 1);
INSERT INTO public.planet VALUES (8, 'Tellus', NULL, true, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-32b', NULL, false, 2);
INSERT INTO public.planet VALUES (10, 'Kepler-32c', NULL, false, 2);
INSERT INTO public.planet VALUES (11, 'Kepler-32d', NULL, false, 2);
INSERT INTO public.planet VALUES (12, 'Kepler-32e', NULL, false, 2);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'small', NULL);
INSERT INTO public.planet_types VALUES (2, 'medium', NULL);
INSERT INTO public.planet_types VALUES (3, 'large', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (2, 'Kepler-32', NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (4, 'VY Canis Majoris', NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (5, 'KY Cygni', NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (6, 'CM Velorum', NULL, NULL, NULL, 1);


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
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon un_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT un_name UNIQUE (name);


--
-- Name: planet_types un_name_pt; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT un_name_pt UNIQUE (name);


--
-- Name: galaxy uniquectm_const; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uniquectm_const UNIQUE (name);


--
-- Name: planet uniqueplanet_const; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uniqueplanet_const UNIQUE (name);


--
-- Name: star uniquestar_const; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT uniquestar_const UNIQUE (name);


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

