--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-01-06 13:42:30

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
-- TOC entry 210 (class 1259 OID 16405)
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    id integer NOT NULL,
    second_name character varying(20) NOT NULL,
    first_name character varying(15) NOT NULL,
    patronymic character varying(15) NOT NULL,
    city character varying(30) NOT NULL,
    university character varying(30) NOT NULL,
    course integer NOT NULL,
    phone bigint NOT NULL,
    mail character varying(50) NOT NULL,
    avatar_url text NOT NULL
);


ALTER TABLE public.students OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16404)
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.students ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3306 (class 0 OID 16405)
-- Dependencies: 210
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.students (id, second_name, first_name, patronymic, city, university, course, phone, mail, avatar_url) OVERRIDING SYSTEM VALUE VALUES (2, 'Кон', 'Владимир', 'Андреевич', 'Уфа', 'УГАТУ', 2, 79993453158, 'hfghfgh@gmail.com', 'img/vladimir.jpg');
INSERT INTO public.students (id, second_name, first_name, patronymic, city, university, course, phone, mail, avatar_url) OVERRIDING SYSTEM VALUE VALUES (4, 'Ерёменко', 'Алексаднр', 'Андреевич', 'Неуфа', 'НУГАТУ', 1, 46993453433, 'yfa03@gmail.com', 'img/alex.jpg');
INSERT INTO public.students (id, second_name, first_name, patronymic, city, university, course, phone, mail, avatar_url) OVERRIDING SYSTEM VALUE VALUES (5, 'Андреева', 'Вероника', 'Андреевна', 'Москва', 'МГУ', 3, 89993453433, 'killerBugs@gmail.com', 'img/nika.jpg');
INSERT INTO public.students (id, second_name, first_name, patronymic, city, university, course, phone, mail, avatar_url) OVERRIDING SYSTEM VALUE VALUES (6, 'Николаев', 'Антон', 'Андреевич', 'Воркута', 'ВТУ', 1, 70123453433, 'nik03@gmail.com', 'img/anton.jpg');
INSERT INTO public.students (id, second_name, first_name, patronymic, city, university, course, phone, mail, avatar_url) OVERRIDING SYSTEM VALUE VALUES (7, 'Гришина', 'Дарья', 'Андреевна', 'Уфа', 'УГАТУ', 2, 79993453458, 'grischina03@gmail.com', 'img/darya.jpg');
INSERT INTO public.students (id, second_name, first_name, patronymic, city, university, course, phone, mail, avatar_url) OVERRIDING SYSTEM VALUE VALUES (8, 'Рассколов', 'Святослав', 'Андреевич', 'Киров', 'ЮСБ', 5, 78883453433, 'rask03@gmail.com', 'img/svyat.jpg');
INSERT INTO public.students (id, second_name, first_name, patronymic, city, university, course, phone, mail, avatar_url) OVERRIDING SYSTEM VALUE VALUES (9, 'Красавина', 'Алия', 'Андреевна', 'Уфа', 'УГАТУ', 2, 79993453789, 'kras03@gmail.com', 'img/alia.jpg');
INSERT INTO public.students (id, second_name, first_name, patronymic, city, university, course, phone, mail, avatar_url) OVERRIDING SYSTEM VALUE VALUES (10, 'Ворогуев', 'Egor', 'Стив', 'Уфа', 'АГША', 2, 79993459378, 'dfgdfg@gmail.ru', 'https://likeyou.io/wp-content/uploads/2019/02/Snimok-ekrana-2019-02-15-v-16.03.56.png');
INSERT INTO public.students (id, second_name, first_name, patronymic, city, university, course, phone, mail, avatar_url) OVERRIDING SYSTEM VALUE VALUES (11, 'Ворогуева', 'Мария', 'Андреевна', 'Guandazan', 'АГША', 4, 79993453433, 'ivanovama03@gmail.com', 'https://likeyou.io/wp-content/uploads/2019/02/Snimok-ekrana-2019-02-15-v-16.03.56.png');
INSERT INTO public.students (id, second_name, first_name, patronymic, city, university, course, phone, mail, avatar_url) OVERRIDING SYSTEM VALUE VALUES (12, 'Чекинова', 'Мария', 'Андреевна', 'Уфа', 'УГАТУ', 5, 79993453433, 'ivanovama03@gmail.com', 'https://cdn.maximonline.ru/ec/5b/70/ec5b701b6dc90d27cbde89b6e19a0d07/728x728_1_848ca9ef388ee0fdc2c538677e5709a7@1024x1024_0xac120002_17992516771550233711.jpg');
INSERT INTO public.students (id, second_name, first_name, patronymic, city, university, course, phone, mail, avatar_url) OVERRIDING SYSTEM VALUE VALUES (1, 'Иванова', 'Мария', 'Андреевна', 'Уфа', 'УГАТУ', 2, 79993651245, 'ivanov@mail.ru', 'img/Avatar.png');
INSERT INTO public.students (id, second_name, first_name, patronymic, city, university, course, phone, mail, avatar_url) OVERRIDING SYSTEM VALUE VALUES (3, 'Волкова', 'Жанна', 'Андреевна', 'Киров', 'КГБ', 4, 79993453456, 'kgb@gmail.com', 'https://bigpicture.ru/wp-content/uploads/2019/04/grandbeauty00.jpg');


--
-- TOC entry 3312 (class 0 OID 0)
-- Dependencies: 209
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_id_seq', 13, true);


--
-- TOC entry 3165 (class 2606 OID 16411)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


-- Completed on 2022-01-06 13:42:32

--
-- PostgreSQL database dump complete
--

