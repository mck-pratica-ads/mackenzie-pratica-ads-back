--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2021-04-21 10:39:14 -03

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
-- TOC entry 202 (class 1259 OID 16426)
-- Name: City; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."City" (
    "ID" integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public."City" OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16424)
-- Name: City_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."City" ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."City_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 212 (class 1259 OID 16540)
-- Name: Comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Comment" (
    "ID" integer NOT NULL,
    date date,
    "user" character varying,
    review integer
);


ALTER TABLE public."Comment" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16538)
-- Name: Comment_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Comment" ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Comment_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 16607)
-- Name: Friendship; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Friendship" (
    "ID" integer NOT NULL,
    date date,
    "userOrigin" character varying NOT NULL,
    "userDestiny" character varying NOT NULL,
    accepted boolean
);


ALTER TABLE public."Friendship" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16605)
-- Name: Friendship_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Friendship" ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Friendship_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 208 (class 1259 OID 16484)
-- Name: Item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Item" (
    name character varying NOT NULL,
    creator character varying,
    "cast" character varying,
    year integer,
    "numberSeasons" integer,
    country character varying,
    type character varying
);


ALTER TABLE public."Item" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16525)
-- Name: Like; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Like" (
    "ID" integer NOT NULL,
    date date,
    "user" character varying,
    review integer
);


ALTER TABLE public."Like" OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16523)
-- Name: Like_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Like" ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Like_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 206 (class 1259 OID 16446)
-- Name: Location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Location" (
    "ID" integer NOT NULL
);


ALTER TABLE public."Location" OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16444)
-- Name: Location_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Location" ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Location_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 214 (class 1259 OID 16558)
-- Name: Review; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Review" (
    "ID" integer NOT NULL,
    date date,
    "user" character varying
);


ALTER TABLE public."Review" OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16556)
-- Name: Review_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Review" ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Review_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 16571)
-- Name: Review_Item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Review_Item" (
    review integer NOT NULL,
    item character varying NOT NULL
);


ALTER TABLE public."Review_Item" OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16436)
-- Name: State; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."State" (
    "ID" integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public."State" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16434)
-- Name: State_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."State" ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."State_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 200 (class 1259 OID 16387)
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    name character varying NOT NULL,
    email character varying NOT NULL,
    username character varying,
    birthdate character varying
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16466)
-- Name: User_Location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User_Location" (
    user_email character varying NOT NULL,
    location_id integer NOT NULL
);


ALTER TABLE public."User_Location" OWNER TO postgres;

--
-- TOC entry 3182 (class 2606 OID 16433)
-- Name: City City_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."City"
    ADD CONSTRAINT "City_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3194 (class 2606 OID 16547)
-- Name: Comment Comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comment"
    ADD CONSTRAINT "Comment_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3198 (class 2606 OID 16614)
-- Name: Friendship Friendship_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Friendship"
    ADD CONSTRAINT "Friendship_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3192 (class 2606 OID 16532)
-- Name: Like ID; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Like"
    ADD CONSTRAINT "ID" PRIMARY KEY ("ID");


--
-- TOC entry 3190 (class 2606 OID 16491)
-- Name: Item Item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Item"
    ADD CONSTRAINT "Item_pkey" PRIMARY KEY (name);


--
-- TOC entry 3186 (class 2606 OID 16450)
-- Name: Location Location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Location"
    ADD CONSTRAINT "Location_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3196 (class 2606 OID 16562)
-- Name: Review Review_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Review"
    ADD CONSTRAINT "Review_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3184 (class 2606 OID 16443)
-- Name: State State_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."State"
    ADD CONSTRAINT "State_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3188 (class 2606 OID 16473)
-- Name: User_Location User_Location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User_Location"
    ADD CONSTRAINT "User_Location_pkey" PRIMARY KEY (user_email, location_id);


--
-- TOC entry 3180 (class 2606 OID 16394)
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (email);


--
-- TOC entry 3199 (class 2606 OID 16451)
-- Name: Location city; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Location"
    ADD CONSTRAINT city FOREIGN KEY ("ID") REFERENCES public."City"("ID");


--
-- TOC entry 3209 (class 2606 OID 16582)
-- Name: Review_Item item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Review_Item"
    ADD CONSTRAINT item FOREIGN KEY (item) REFERENCES public."Item"(name);


--
-- TOC entry 3202 (class 2606 OID 16479)
-- Name: User_Location location; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User_Location"
    ADD CONSTRAINT location FOREIGN KEY (location_id) REFERENCES public."Location"("ID");


--
-- TOC entry 3208 (class 2606 OID 16577)
-- Name: Review_Item review; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Review_Item"
    ADD CONSTRAINT review FOREIGN KEY (review) REFERENCES public."Review"("ID");


--
-- TOC entry 3206 (class 2606 OID 16595)
-- Name: Comment review; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comment"
    ADD CONSTRAINT review FOREIGN KEY (review) REFERENCES public."Review"("ID") NOT VALID;


--
-- TOC entry 3204 (class 2606 OID 16600)
-- Name: Like review; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Like"
    ADD CONSTRAINT review FOREIGN KEY (review) REFERENCES public."Review"("ID") NOT VALID;


--
-- TOC entry 3200 (class 2606 OID 16456)
-- Name: Location state; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Location"
    ADD CONSTRAINT state FOREIGN KEY ("ID") REFERENCES public."State"("ID");


--
-- TOC entry 3203 (class 2606 OID 16533)
-- Name: Like user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Like"
    ADD CONSTRAINT "user" FOREIGN KEY ("user") REFERENCES public."User"(email);


--
-- TOC entry 3205 (class 2606 OID 16548)
-- Name: Comment user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comment"
    ADD CONSTRAINT "user" FOREIGN KEY ("user") REFERENCES public."User"(email);


--
-- TOC entry 3207 (class 2606 OID 16590)
-- Name: Review user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Review"
    ADD CONSTRAINT "user" FOREIGN KEY ("user") REFERENCES public."User"(email) NOT VALID;


--
-- TOC entry 3211 (class 2606 OID 16620)
-- Name: Friendship userDestiny; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Friendship"
    ADD CONSTRAINT "userDestiny" FOREIGN KEY ("userDestiny") REFERENCES public."User"(email);


--
-- TOC entry 3210 (class 2606 OID 16615)
-- Name: Friendship userOrigin; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Friendship"
    ADD CONSTRAINT "userOrigin" FOREIGN KEY ("userOrigin") REFERENCES public."User"(email);


--
-- TOC entry 3201 (class 2606 OID 16474)
-- Name: User_Location user_email; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User_Location"
    ADD CONSTRAINT user_email FOREIGN KEY (user_email) REFERENCES public."User"(email);


-- Completed on 2021-04-21 10:39:14 -03

--
-- PostgreSQL database dump complete
--

