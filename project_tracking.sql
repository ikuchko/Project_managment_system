--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: histories; Type: TABLE; Schema: public; Owner: iliak; Tablespace: 
--

CREATE TABLE histories (
    id integer NOT NULL,
    task_id integer,
    change_type character varying,
    created_date timestamp(0) without time zone DEFAULT now(),
    previous_condition character varying,
    current_condition character varying
);


ALTER TABLE histories OWNER TO iliak;

--
-- Name: histories_id_seq; Type: SEQUENCE; Schema: public; Owner: iliak
--

CREATE SEQUENCE histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE histories_id_seq OWNER TO iliak;

--
-- Name: histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: iliak
--

ALTER SEQUENCE histories_id_seq OWNED BY histories.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: iliak; Tablespace: 
--

CREATE TABLE messages (
    id integer NOT NULL,
    description text,
    user_id integer,
    task_id integer,
    date_created timestamp(0) without time zone DEFAULT now()
);


ALTER TABLE messages OWNER TO iliak;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: iliak
--

CREATE SEQUENCE messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE messages_id_seq OWNER TO iliak;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: iliak
--

ALTER SEQUENCE messages_id_seq OWNED BY messages.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: iliak; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE roles OWNER TO iliak;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: iliak
--

CREATE SEQUENCE role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE role_id_seq OWNER TO iliak;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: iliak
--

ALTER SEQUENCE role_id_seq OWNED BY roles.id;


--
-- Name: status; Type: TABLE; Schema: public; Owner: iliak; Tablespace: 
--

CREATE TABLE status (
    id integer NOT NULL,
    status character varying
);


ALTER TABLE status OWNER TO iliak;

--
-- Name: status_id_seq; Type: SEQUENCE; Schema: public; Owner: iliak
--

CREATE SEQUENCE status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE status_id_seq OWNER TO iliak;

--
-- Name: status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: iliak
--

ALTER SEQUENCE status_id_seq OWNED BY status.id;


--
-- Name: tasks; Type: TABLE; Schema: public; Owner: iliak; Tablespace: 
--

CREATE TABLE tasks (
    id integer NOT NULL,
    title character varying,
    creator_user_id integer,
    description text,
    type_task_id integer,
    developer_id integer,
    status_id integer,
    date_created timestamp(0) without time zone DEFAULT now(),
    on_board boolean DEFAULT false
);


ALTER TABLE tasks OWNER TO iliak;

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: iliak
--

CREATE SEQUENCE tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tasks_id_seq OWNER TO iliak;

--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: iliak
--

ALTER SEQUENCE tasks_id_seq OWNED BY tasks.id;


--
-- Name: tasks_messages; Type: TABLE; Schema: public; Owner: iliak; Tablespace: 
--

CREATE TABLE tasks_messages (
    id integer NOT NULL,
    task_id integer,
    message_id integer
);


ALTER TABLE tasks_messages OWNER TO iliak;

--
-- Name: tasks_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: iliak
--

CREATE SEQUENCE tasks_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tasks_messages_id_seq OWNER TO iliak;

--
-- Name: tasks_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: iliak
--

ALTER SEQUENCE tasks_messages_id_seq OWNED BY tasks_messages.id;


--
-- Name: tasks_relationships; Type: TABLE; Schema: public; Owner: iliak; Tablespace: 
--

CREATE TABLE tasks_relationships (
    id integer NOT NULL,
    main_task_id integer,
    subtask_id integer
);


ALTER TABLE tasks_relationships OWNER TO iliak;

--
-- Name: tasks_relationships_id_seq; Type: SEQUENCE; Schema: public; Owner: iliak
--

CREATE SEQUENCE tasks_relationships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tasks_relationships_id_seq OWNER TO iliak;

--
-- Name: tasks_relationships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: iliak
--

ALTER SEQUENCE tasks_relationships_id_seq OWNED BY tasks_relationships.id;


--
-- Name: type_task; Type: TABLE; Schema: public; Owner: iliak; Tablespace: 
--

CREATE TABLE type_task (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE type_task OWNER TO iliak;

--
-- Name: type_task_id_seq; Type: SEQUENCE; Schema: public; Owner: iliak
--

CREATE SEQUENCE type_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE type_task_id_seq OWNER TO iliak;

--
-- Name: type_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: iliak
--

ALTER SEQUENCE type_task_id_seq OWNED BY type_task.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: iliak; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying,
    email character varying,
    role_id integer
);


ALTER TABLE users OWNER TO iliak;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: iliak
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO iliak;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: iliak
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: iliak
--

ALTER TABLE ONLY histories ALTER COLUMN id SET DEFAULT nextval('histories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: iliak
--

ALTER TABLE ONLY messages ALTER COLUMN id SET DEFAULT nextval('messages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: iliak
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('role_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: iliak
--

ALTER TABLE ONLY status ALTER COLUMN id SET DEFAULT nextval('status_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: iliak
--

ALTER TABLE ONLY tasks ALTER COLUMN id SET DEFAULT nextval('tasks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: iliak
--

ALTER TABLE ONLY tasks_messages ALTER COLUMN id SET DEFAULT nextval('tasks_messages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: iliak
--

ALTER TABLE ONLY tasks_relationships ALTER COLUMN id SET DEFAULT nextval('tasks_relationships_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: iliak
--

ALTER TABLE ONLY type_task ALTER COLUMN id SET DEFAULT nextval('type_task_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: iliak
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: histories; Type: TABLE DATA; Schema: public; Owner: iliak
--

COPY histories (id, task_id, change_type, created_date, previous_condition, current_condition) FROM stdin;
\.


--
-- Name: histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iliak
--

SELECT pg_catalog.setval('histories_id_seq', 18, true);


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: iliak
--

COPY messages (id, description, user_id, task_id, date_created) FROM stdin;
1	New message	1	2	2016-02-04 11:59:02
2	One more message	1	2	2016-02-04 11:59:02
5	Hello!	1	2	2016-02-04 13:21:11
6	whatsup!	1	2	2016-02-04 16:43:12
\.


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iliak
--

SELECT pg_catalog.setval('messages_id_seq', 6, true);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iliak
--

SELECT pg_catalog.setval('role_id_seq', 2, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: iliak
--

COPY roles (id, name) FROM stdin;
1	PM
2	Developer
\.


--
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: iliak
--

COPY status (id, status) FROM stdin;
1	To Do
2	In Progress
3	Test
4	Done
\.


--
-- Name: status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iliak
--

SELECT pg_catalog.setval('status_id_seq', 4, true);


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: iliak
--

COPY tasks (id, title, creator_user_id, description, type_task_id, developer_id, status_id, date_created, on_board) FROM stdin;
3	Story 1	1	some description	1	1	1	2016-02-03 11:15:16	f
5	Story 2	1	Some brief description	1	1	1	2016-02-04 11:02:44	f
6	Task 1	1	This is task	3	1	1	2016-02-04 11:03:03	f
8	awd	1	dad	1	1	1	2016-02-04 21:57:19	f
9	asd	1	asd	3	3	1	2016-02-04 21:57:35	f
7	Epic task, Products that must be created on 	1	dadawdw d awdawdaw da wd aw d a wd a wd	2	1	2	2016-02-04 21:40:24	f
\.


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iliak
--

SELECT pg_catalog.setval('tasks_id_seq', 9, true);


--
-- Data for Name: tasks_messages; Type: TABLE DATA; Schema: public; Owner: iliak
--

COPY tasks_messages (id, task_id, message_id) FROM stdin;
1	2	1
2	2	2
4	2	4
5	2	5
6	2	6
\.


--
-- Name: tasks_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iliak
--

SELECT pg_catalog.setval('tasks_messages_id_seq', 6, true);


--
-- Data for Name: tasks_relationships; Type: TABLE DATA; Schema: public; Owner: iliak
--

COPY tasks_relationships (id, main_task_id, subtask_id) FROM stdin;
1	2	3
2	2	4
3	2	5
4	3	6
5	7	8
6	8	9
\.


--
-- Name: tasks_relationships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iliak
--

SELECT pg_catalog.setval('tasks_relationships_id_seq', 6, true);


--
-- Data for Name: type_task; Type: TABLE DATA; Schema: public; Owner: iliak
--

COPY type_task (id, name) FROM stdin;
1	Story
2	Epic
3	Task
4	Bug
\.


--
-- Name: type_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iliak
--

SELECT pg_catalog.setval('type_task_id_seq', 4, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: iliak
--

COPY users (id, name, email, role_id) FROM stdin;
1	John Snow	night@watch.com	1
2	Petr I	dawd@ddd	2
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: iliak
--

SELECT pg_catalog.setval('users_id_seq', 2, true);


--
-- Name: histories_pkey; Type: CONSTRAINT; Schema: public; Owner: iliak; Tablespace: 
--

ALTER TABLE ONLY histories
    ADD CONSTRAINT histories_pkey PRIMARY KEY (id);


--
-- Name: messages_pkey; Type: CONSTRAINT; Schema: public; Owner: iliak; Tablespace: 
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: iliak; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: status_pkey; Type: CONSTRAINT; Schema: public; Owner: iliak; Tablespace: 
--

ALTER TABLE ONLY status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);


--
-- Name: tasks_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: iliak; Tablespace: 
--

ALTER TABLE ONLY tasks_messages
    ADD CONSTRAINT tasks_messages_pkey PRIMARY KEY (id);


--
-- Name: tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: iliak; Tablespace: 
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: tasks_relationships_pkey; Type: CONSTRAINT; Schema: public; Owner: iliak; Tablespace: 
--

ALTER TABLE ONLY tasks_relationships
    ADD CONSTRAINT tasks_relationships_pkey PRIMARY KEY (id);


--
-- Name: type_task_pkey; Type: CONSTRAINT; Schema: public; Owner: iliak; Tablespace: 
--

ALTER TABLE ONLY type_task
    ADD CONSTRAINT type_task_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: iliak; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

