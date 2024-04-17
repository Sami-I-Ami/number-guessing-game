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
-- Name: guess_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.guess_info (
    username character varying(25) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.guess_info OWNER TO freecodecamp;

--
-- Data for Name: guess_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.guess_info VALUES ('Sami', 1, 20);
INSERT INTO public.guess_info VALUES ('user_1713385217891', NULL, NULL);
INSERT INTO public.guess_info VALUES ('user_1713385217890', NULL, NULL);
INSERT INTO public.guess_info VALUES ('sAMI', NULL, NULL);
INSERT INTO public.guess_info VALUES ('Me', 1, 10);


--
-- Name: guess_info guess_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guess_info
    ADD CONSTRAINT guess_info_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

