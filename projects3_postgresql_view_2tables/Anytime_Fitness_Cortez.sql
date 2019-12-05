--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10

-- Started on 2019-12-05 08:11:27

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 31 (class 2615 OID 16754)
-- Name: gccortez; Type: SCHEMA; Schema: -; Owner: datama2mi181
--

CREATE SCHEMA gccortez;


ALTER SCHEMA gccortez OWNER TO datama2mi181;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 244 (class 1259 OID 16953)
-- Name: batch; Type: TABLE; Schema: gccortez; Owner: datama2mi181
--

CREATE TABLE gccortez.batch (
    id integer NOT NULL,
    batch_start time without time zone NOT NULL,
    batch_end time without time zone NOT NULL,
    trainer_id integer NOT NULL,
    batch_type character varying(20) NOT NULL
);


ALTER TABLE gccortez.batch OWNER TO datama2mi181;

--
-- TOC entry 245 (class 1259 OID 16956)
-- Name: batch_id_seq; Type: SEQUENCE; Schema: gccortez; Owner: datama2mi181
--

CREATE SEQUENCE gccortez.batch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gccortez.batch_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3414 (class 0 OID 0)
-- Dependencies: 245
-- Name: batch_id_seq; Type: SEQUENCE OWNED BY; Schema: gccortez; Owner: datama2mi181
--

ALTER SEQUENCE gccortez.batch_id_seq OWNED BY gccortez.batch.id;


--
-- TOC entry 246 (class 1259 OID 16958)
-- Name: trainer; Type: TABLE; Schema: gccortez; Owner: datama2mi181
--

CREATE TABLE gccortez.trainer (
    id integer NOT NULL,
    train_hoursalary smallint,
    train_address character varying(60) NOT NULL,
    train_fname character varying(15) NOT NULL,
    train_lname character varying(15) NOT NULL,
    train_mi character varying(6),
    train_sex character varying(6) NOT NULL
);


ALTER TABLE gccortez.trainer OWNER TO datama2mi181;

--
-- TOC entry 247 (class 1259 OID 16961)
-- Name: batch_trainer; Type: VIEW; Schema: gccortez; Owner: datama2mi181
--

CREATE VIEW gccortez.batch_trainer AS
 SELECT trainer.id,
    trainer.train_lname,
    trainer.train_fname,
    batch.batch_type,
    batch.batch_start,
    batch.batch_end
   FROM (gccortez.trainer
     JOIN gccortez.batch ON ((trainer.id = batch.trainer_id)));


ALTER TABLE gccortez.batch_trainer OWNER TO datama2mi181;

--
-- TOC entry 391 (class 1259 OID 24817)
-- Name: batch_trainer2; Type: VIEW; Schema: gccortez; Owner: datama2mi181
--

CREATE VIEW gccortez.batch_trainer2 AS
 SELECT trainer.id,
    trainer.train_lname,
    trainer.train_fname,
    batch.batch_type,
    batch.batch_start,
    batch.batch_end
   FROM (gccortez.trainer
     JOIN gccortez.batch ON ((trainer.id = batch.trainer_id)));


ALTER TABLE gccortez.batch_trainer2 OWNER TO datama2mi181;

--
-- TOC entry 248 (class 1259 OID 16965)
-- Name: trainer_id_seq; Type: SEQUENCE; Schema: gccortez; Owner: datama2mi181
--

CREATE SEQUENCE gccortez.trainer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gccortez.trainer_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3415 (class 0 OID 0)
-- Dependencies: 248
-- Name: trainer_id_seq; Type: SEQUENCE OWNED BY; Schema: gccortez; Owner: datama2mi181
--

ALTER SEQUENCE gccortez.trainer_id_seq OWNED BY gccortez.trainer.id;


--
-- TOC entry 3262 (class 2604 OID 16967)
-- Name: batch id; Type: DEFAULT; Schema: gccortez; Owner: datama2mi181
--

ALTER TABLE ONLY gccortez.batch ALTER COLUMN id SET DEFAULT nextval('gccortez.batch_id_seq'::regclass);


--
-- TOC entry 3263 (class 2604 OID 16968)
-- Name: trainer id; Type: DEFAULT; Schema: gccortez; Owner: datama2mi181
--

ALTER TABLE ONLY gccortez.trainer ALTER COLUMN id SET DEFAULT nextval('gccortez.trainer_id_seq'::regclass);


--
-- TOC entry 3405 (class 0 OID 16953)
-- Dependencies: 244
-- Data for Name: batch; Type: TABLE DATA; Schema: gccortez; Owner: datama2mi181
--

INSERT INTO gccortez.batch VALUES (4, '11:30:00', '13:30:00', 3, 'Zumba');
INSERT INTO gccortez.batch VALUES (5, '14:00:00', '16:00:00', 1, 'Crossfit');
INSERT INTO gccortez.batch VALUES (6, '16:30:00', '18:30:00', 3, 'Crossfit');


--
-- TOC entry 3407 (class 0 OID 16958)
-- Dependencies: 246
-- Data for Name: trainer; Type: TABLE DATA; Schema: gccortez; Owner: datama2mi181
--

INSERT INTO gccortez.trainer VALUES (1, 800, 'Los Angeles, US', 'Mylene', 'Sal', 'S.', 'Female');
INSERT INTO gccortez.trainer VALUES (2, 650, 'California, US', 'Angel', 'Bruce', 'O.', 'Male');
INSERT INTO gccortez.trainer VALUES (3, 780, 'Texas, US', 'Isaac', 'Clarke', 'K.', 'Male');


--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 245
-- Name: batch_id_seq; Type: SEQUENCE SET; Schema: gccortez; Owner: datama2mi181
--

SELECT pg_catalog.setval('gccortez.batch_id_seq', 6, true);


--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 248
-- Name: trainer_id_seq; Type: SEQUENCE SET; Schema: gccortez; Owner: datama2mi181
--

SELECT pg_catalog.setval('gccortez.trainer_id_seq', 3, true);


--
-- TOC entry 3265 (class 2606 OID 16970)
-- Name: trainer trainer_pkey; Type: CONSTRAINT; Schema: gccortez; Owner: datama2mi181
--

ALTER TABLE ONLY gccortez.trainer
    ADD CONSTRAINT trainer_pkey PRIMARY KEY (id);


-- Completed on 2019-12-05 08:11:27

--
-- PostgreSQL database dump complete
--

