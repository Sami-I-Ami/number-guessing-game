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

INSERT INTO public.guess_info VALUES ('user_1713433930080', 2, 211);
INSERT INTO public.guess_info VALUES ('user_1713433930081', 5, 157);
INSERT INTO public.guess_info VALUES ('user_1713434442547', 2, 146);
INSERT INTO public.guess_info VALUES ('user_1713434442548', 5, 143);
INSERT INTO public.guess_info VALUES ('user_1713434499958', 2, 135);
INSERT INTO public.guess_info VALUES ('user_1713434499959', 5, 328);
INSERT INTO public.guess_info VALUES ('user_1713434861433', 2, 987);
INSERT INTO public.guess_info VALUES ('user_1713434861434', 5, 42);
INSERT INTO public.guess_info VALUES ('Sami', 4, 0);
INSERT INTO public.guess_info VALUES ('user_1713435128574', 2, 376);
INSERT INTO public.guess_info VALUES ('user_1713435128575', 5, 113);
INSERT INTO public.guess_info VALUES ('user_1713435180162', 2, 348);
INSERT INTO public.guess_info VALUES ('user_1713435180163', 5, 104);


--
-- Name: guess_info guess_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guess_info
    ADD CONSTRAINT guess_info_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

