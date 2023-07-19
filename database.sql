--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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
-- Name: areas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.areas (
    id character varying(255) NOT NULL,
    created_by_id character varying(255),
    modified_by_id character varying(255),
    creation_date timestamp without time zone,
    last_modified_date timestamp without time zone,
    deleted_at timestamp without time zone,
    name character varying(100) NOT NULL,
    description character varying(255),
    activated boolean
);


ALTER TABLE public.areas OWNER TO postgres;

--
-- Name: box_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.box_items (
    id character varying(255) NOT NULL,
    created_by_id character varying(255),
    modified_by_id character varying(255),
    creation_date timestamp without time zone,
    last_modified_date timestamp without time zone,
    deleted_at timestamp without time zone,
    quantity integer NOT NULL,
    box_id character varying(255),
    invoice_item_id character varying(255) NOT NULL
);


ALTER TABLE public.box_items OWNER TO postgres;

--
-- Name: box_subitems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.box_subitems (
    id character varying(255) NOT NULL,
    created_by_id character varying(255),
    modified_by_id character varying(255),
    creation_date timestamp without time zone,
    last_modified_date timestamp without time zone,
    deleted_at timestamp without time zone,
    name character varying(45) NOT NULL,
    quantity integer NOT NULL,
    box_item_id character varying(255) NOT NULL
);


ALTER TABLE public.box_subitems OWNER TO postgres;

--
-- Name: boxes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boxes (
    id character varying(255) NOT NULL,
    created_by_id character varying(255),
    modified_by_id character varying(255),
    creation_date timestamp without time zone,
    last_modified_date timestamp without time zone,
    deleted_at timestamp without time zone,
    name character varying(45) NOT NULL,
    weight double precision,
    height double precision,
    width double precision,
    depth double precision,
    invoice_id character varying(255) NOT NULL
);


ALTER TABLE public.boxes OWNER TO postgres;

--
-- Name: branches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.branches (
    id character varying(255) NOT NULL,
    created_by_id character varying(255),
    modified_by_id character varying(255),
    creation_date timestamp without time zone,
    last_modified_date timestamp without time zone,
    deleted_at timestamp without time zone,
    code character varying(45) NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.branches OWNER TO postgres;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO postgres;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO postgres;

--
-- Name: hive_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hive_items (
    id character varying(255) NOT NULL,
    created_by_id character varying(255),
    modified_by_id character varying(255),
    creation_date timestamp without time zone,
    last_modified_date timestamp without time zone,
    deleted_at timestamp without time zone,
    quantity integer NOT NULL,
    box_item_id character varying(255),
    hive_id character varying(255)
);


ALTER TABLE public.hive_items OWNER TO postgres;

--
-- Name: hive_subitems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hive_subitems (
    id character varying(255) NOT NULL,
    created_by_id character varying(255),
    modified_by_id character varying(255),
    creation_date timestamp without time zone,
    last_modified_date timestamp without time zone,
    deleted_at timestamp without time zone,
    quantity integer NOT NULL,
    box_subitem_id character varying(255),
    hive_item_id character varying(255)
);


ALTER TABLE public.hive_subitems OWNER TO postgres;

--
-- Name: hives; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hives (
    id character varying(255) NOT NULL,
    created_by_id character varying(255),
    modified_by_id character varying(255),
    creation_date timestamp without time zone,
    last_modified_date timestamp without time zone,
    deleted_at timestamp without time zone,
    name character varying(20) NOT NULL,
    floor integer NOT NULL,
    "column" integer NOT NULL,
    shelf_id character varying(255)
);


ALTER TABLE public.hives OWNER TO postgres;

--
-- Name: invoice_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoice_items (
    id character varying(255) NOT NULL,
    created_by_id character varying(255),
    modified_by_id character varying(255),
    creation_date timestamp without time zone,
    last_modified_date timestamp without time zone,
    deleted_at timestamp without time zone,
    quantity integer NOT NULL,
    quantity_checked integer,
    product_id character varying(255) NOT NULL,
    invoice_id character varying(255) NOT NULL
);


ALTER TABLE public.invoice_items OWNER TO postgres;

--
-- Name: invoices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoices (
    id character varying(255) NOT NULL,
    created_by_id character varying(255),
    modified_by_id character varying(255),
    creation_date timestamp without time zone,
    last_modified_date timestamp without time zone,
    deleted_at timestamp without time zone,
    number character varying(45) NOT NULL,
    issue_date timestamp without time zone,
    status integer NOT NULL,
    supplier_code character varying(45) NOT NULL,
    supplier_name character varying(255),
    lot_id character varying(255),
    year character varying(4) NOT NULL,
    serie character varying(45) NOT NULL
);


ALTER TABLE public.invoices OWNER TO postgres;

--
-- Name: lots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lots (
    id character varying(255) NOT NULL,
    created_by_id character varying(255),
    modified_by_id character varying(255),
    creation_date timestamp without time zone,
    last_modified_date timestamp without time zone,
    deleted_at timestamp without time zone,
    number character varying(45) NOT NULL,
    identifier character varying(45) NOT NULL,
    description character varying(255),
    activated boolean,
    created_at timestamp without time zone,
    people_id character varying(255) NOT NULL
);


ALTER TABLE public.lots OWNER TO postgres;

--
-- Name: machines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.machines (
    id character varying(255) NOT NULL,
    created_by_id character varying(255),
    modified_by_id character varying(255),
    creation_date timestamp without time zone,
    last_modified_date timestamp without time zone,
    deleted_at timestamp without time zone,
    name character varying(100) NOT NULL,
    production_line_id character varying(255) NOT NULL
);


ALTER TABLE public.machines OWNER TO postgres;

--
-- Name: msl_levels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.msl_levels (
    id character varying(255) NOT NULL,
    created_by_id character varying(255),
    modified_by_id character varying(255),
    creation_date timestamp without time zone,
    last_modified_date timestamp without time zone,
    deleted_at timestamp without time zone,
    name character varying(45) NOT NULL,
    "time" integer NOT NULL,
    activated boolean
);


ALTER TABLE public.msl_levels OWNER TO postgres;

--
-- Name: payment_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_items (
    id character varying(255) NOT NULL,
    created_by_id character varying(255),
    modified_by_id character varying(255),
    creation_date timestamp without time zone,
    last_modified_date timestamp without time zone,
    deleted_at timestamp without time zone,
    quantity_suggested integer NOT NULL,
    balance integer NOT NULL,
    paid numeric(10,2) NOT NULL,
    payment_id character varying(255) NOT NULL,
    box_item_id character varying(255) NOT NULL,
    box_subitem_id character varying(255),
    product_id character varying(255) NOT NULL,
    hive_id character varying(255) NOT NULL
);


ALTER TABLE public.payment_items OWNER TO postgres;

--
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id character varying(255) NOT NULL,
    created_by_id character varying(255),
    modified_by_id character varying(255),
    creation_date timestamp without time zone,
    last_modified_date timestamp without time zone,
    deleted_at timestamp without time zone,
    quantity_time integer NOT NULL,
    quantity_average_productivity integer NOT NULL,
    is_paid boolean DEFAULT false NOT NULL,
    branch_id character varying(255) NOT NULL,
    production_line_id character varying(255) NOT NULL,
    production_order_id character varying(255) NOT NULL,
    lot_id character varying(255) NOT NULL
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- Name: people; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.people (
    id character varying(255) NOT NULL,
    created_by_id character varying(255),
    modified_by_id character varying(255),
    creation_date timestamp without time zone,
    last_modified_date timestamp without time zone,
    deleted_at timestamp without time zone,
    name character varying(255) NOT NULL,
    document character varying(45) NOT NULL,
    code character varying(45) NOT NULL,
    identifier character varying(5),
    category integer
);


ALTER TABLE public.people OWNER TO postgres;

--
-- Name: positions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.positions (
    id character varying(255) NOT NULL,
    created_by_id character varying(255),
    modified_by_id character varying(255),
    creation_date timestamp without time zone,
    last_modified_date timestamp without time zone,
    deleted_at timestamp without time zone,
    "position" character varying(45) NOT NULL,
    machine_id character varying(255) NOT NULL,
    product_id character varying(255) NOT NULL,
    quantity_consumed double precision
);


ALTER TABLE public.positions OWNER TO postgres;

--
-- Name: production_lines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.production_lines (
    id character varying(255) NOT NULL,
    created_by_id character varying(255),
    modified_by_id character varying(255),
    creation_date timestamp without time zone,
    last_modified_date timestamp without time zone,
    deleted_at timestamp without time zone,
    name character varying(100) NOT NULL,
    type integer,
    activated boolean,
    area_id character varying(255) NOT NULL,
    branch_id character varying(255) NOT NULL,
    production_order_id character varying(255) NOT NULL
);


ALTER TABLE public.production_lines OWNER TO postgres;

--
-- Name: production_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.production_orders (
    id character varying(255) NOT NULL,
    created_by_id character varying(255),
    modified_by_id character varying(255),
    creation_date timestamp without time zone,
    last_modified_date timestamp without time zone,
    deleted_at timestamp without time zone,
    number character varying(45) NOT NULL,
    description character varying(255),
    created_at timestamp without time zone,
    expected_quantity integer,
    lot_id character varying(255) NOT NULL,
    product_id character varying(255) NOT NULL,
    status integer
);


ALTER TABLE public.production_orders OWNER TO postgres;

--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id character varying(255) NOT NULL,
    created_by_id character varying(255),
    modified_by_id character varying(255),
    creation_date timestamp without time zone,
    last_modified_date timestamp without time zone,
    deleted_at timestamp without time zone,
    code character varying(45) NOT NULL,
    description character varying(255),
    type character varying(45),
    "group" character varying(45),
    partnumber character varying(70) NOT NULL,
    people_id character varying(255) NOT NULL,
    storage character varying(45),
    classification character varying(45),
    msl_level_id character varying(255),
    area_id character varying(255),
    warehouse_id character varying(255)
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: warehouses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.warehouses (
    id character varying(255) NOT NULL,
    created_by_id character varying(255),
    modified_by_id character varying(255),
    creation_date timestamp without time zone,
    last_modified_date timestamp without time zone,
    deleted_at timestamp without time zone,
    name character varying(45) NOT NULL,
    code integer NOT NULL,
    branch_id character varying(255) NOT NULL,
    type_warehouse_id character varying(255) NOT NULL
);


ALTER TABLE public.warehouses OWNER TO postgres;

--
-- Name: seq_code_warehouse; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_code_warehouse
    START WITH 10
    INCREMENT BY 1
    MINVALUE 10
    MAXVALUE 999999999999999
    CACHE 1
    CYCLE;


ALTER TABLE public.seq_code_warehouse OWNER TO postgres;

--
-- Name: seq_code_warehouse; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.seq_code_warehouse OWNED BY public.warehouses.code;


--
-- Name: shelves; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shelves (
    id character varying(255) NOT NULL,
    created_by_id character varying(255),
    modified_by_id character varying(255),
    creation_date timestamp without time zone,
    last_modified_date timestamp without time zone,
    deleted_at timestamp without time zone,
    name character varying(20) NOT NULL,
    width numeric(10,2) NOT NULL,
    length numeric(10,2) NOT NULL,
    column_quantity integer NOT NULL,
    floor_quantity integer NOT NULL,
    type integer NOT NULL,
    street_id character varying(255),
    warehouse_id character varying(255)
);


ALTER TABLE public.shelves OWNER TO postgres;

--
-- Name: streets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.streets (
    id character varying(255) NOT NULL,
    created_by_id character varying(255),
    modified_by_id character varying(255),
    creation_date timestamp without time zone,
    last_modified_date timestamp without time zone,
    deleted_at timestamp without time zone,
    name character varying(20) NOT NULL,
    width numeric(10,2) NOT NULL,
    length numeric(10,2) NOT NULL
);


ALTER TABLE public.streets OWNER TO postgres;

--
-- Name: type_warehouses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_warehouses (
    id character varying(255) NOT NULL,
    created_by_id character varying(255),
    modified_by_id character varying(255),
    creation_date timestamp without time zone,
    last_modified_date timestamp without time zone,
    deleted_at timestamp without time zone,
    name character varying(20) NOT NULL,
    "group" integer NOT NULL
);


ALTER TABLE public.type_warehouses OWNER TO postgres;

--
-- Name: user_invoices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_invoices (
    id character varying(255) NOT NULL,
    created_by_id character varying(255),
    modified_by_id character varying(255),
    creation_date timestamp without time zone,
    last_modified_date timestamp without time zone,
    deleted_at timestamp without time zone,
    description character varying(255),
    type integer NOT NULL,
    status boolean,
    invoice_id character varying(255) NOT NULL
);


ALTER TABLE public.user_invoices OWNER TO postgres;

--
-- Name: warehouses code; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouses ALTER COLUMN code SET DEFAULT nextval('public.seq_code_warehouse'::regclass);


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.areas (id, created_by_id, modified_by_id, creation_date, last_modified_date, deleted_at, name, description, activated) FROM stdin;
8234e2a0-b185-4c5a-9573-032cb02b470d	\N	\N	\N	\N	\N	SMT	SMT	t
f21ae3c2-4166-417f-94f8-2713dfe8f472	\N	\N	\N	\N	\N	PTH	PTH	t
\.


--
-- Data for Name: box_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.box_items (id, created_by_id, modified_by_id, creation_date, last_modified_date, deleted_at, quantity, box_id, invoice_item_id) FROM stdin;
946477ad-a951-4ddf-b421-6667f1566acb	\N	\N	\N	\N	\N	298	f83a9e8f-3862-4924-bdba-470024fc2f9a	0a2f7419-3ff2-4310-8390-e19f8abdbd4d
2d152257-1666-4082-b518-421fd5ad945c	\N	\N	\N	\N	\N	9529	f83a9e8f-3862-4924-bdba-470024fc2f9a	3f50002e-0e91-4809-9bf5-bd71b705da81
4b5a49c7-7dc3-4a7f-a564-d8d0fcf93eb9	\N	\N	\N	\N	\N	8025	f83a9e8f-3862-4924-bdba-470024fc2f9a	28c3993c-adbd-4c7b-9fa9-1408a9fc9428
f925ad68-31d9-4a0b-b922-ef994a12ce30	\N	\N	\N	\N	\N	5771	f83a9e8f-3862-4924-bdba-470024fc2f9a	0ee47eff-ce6d-401e-8cd1-3618e7a291f7
9ba50681-caa3-4404-a09f-8aa37f89422d	\N	\N	\N	\N	\N	298	dedcf10c-5170-4ed7-846e-10d374428616	0a2f7419-3ff2-4310-8390-e19f8abdbd4d
5c7b15a9-1e32-4ee1-b291-842931462f26	\N	\N	\N	\N	\N	9529	dedcf10c-5170-4ed7-846e-10d374428616	3f50002e-0e91-4809-9bf5-bd71b705da81
976c392b-23ba-4059-98ad-bf796d5b661e	\N	\N	\N	\N	\N	8025	dedcf10c-5170-4ed7-846e-10d374428616	28c3993c-adbd-4c7b-9fa9-1408a9fc9428
7ba780d0-f379-4fd6-918c-85f4cbf5c394	\N	\N	\N	\N	\N	5771	dedcf10c-5170-4ed7-846e-10d374428616	0ee47eff-ce6d-401e-8cd1-3618e7a291f7
bc5fe161-be6e-42bf-8b99-2101923c50ab	\N	\N	\N	\N	\N	298	e1cb9495-259b-49f0-bc51-9037d9326eb1	0a2f7419-3ff2-4310-8390-e19f8abdbd4d
18e8669f-21c3-4fa1-a243-717af88152ec	\N	\N	\N	\N	\N	9529	e1cb9495-259b-49f0-bc51-9037d9326eb1	3f50002e-0e91-4809-9bf5-bd71b705da81
6589b369-247b-483e-9e2d-afddcbddf421	\N	\N	\N	\N	\N	8025	e1cb9495-259b-49f0-bc51-9037d9326eb1	28c3993c-adbd-4c7b-9fa9-1408a9fc9428
bc00aa4f-d018-4327-808b-8dfcae34eff0	\N	\N	\N	\N	\N	5771	e1cb9495-259b-49f0-bc51-9037d9326eb1	0ee47eff-ce6d-401e-8cd1-3618e7a291f7
b0b62f44-0379-4a31-bdc3-8099000f8518	\N	\N	\N	\N	\N	5238	3270bb90-16a7-4f5b-845c-63b96cbdc622	f4d94c00-ef80-4650-a09c-3cd90fdc500a
9c44ac7a-67b5-4049-8d16-ebb677c25116	\N	\N	\N	\N	\N	5154	3270bb90-16a7-4f5b-845c-63b96cbdc622	9fd0b2ec-c41c-491b-ac3d-b3b01eba049c
2070e5e0-7d7d-4638-b0c6-2b4641b1de6c	\N	\N	\N	\N	\N	8727	3270bb90-16a7-4f5b-845c-63b96cbdc622	768945d2-3101-4b63-bd6f-d15c0608c039
26b5fc5c-0ab2-496d-bcbd-cfad1742eaa3	\N	\N	\N	\N	\N	482	3270bb90-16a7-4f5b-845c-63b96cbdc622	8a2c8b45-bc50-4c16-8ad0-6998b5aead4c
1aae7ff2-623e-40f3-94cb-1189c9d13fb3	\N	\N	\N	\N	\N	5238	2899a5f4-3884-44c0-83d5-f398101eb209	f4d94c00-ef80-4650-a09c-3cd90fdc500a
561147f8-19fd-44aa-94d3-9df0242f9a1c	\N	\N	\N	\N	\N	5154	2899a5f4-3884-44c0-83d5-f398101eb209	9fd0b2ec-c41c-491b-ac3d-b3b01eba049c
4aa6788c-859f-4ca9-897a-4474eadebeaf	\N	\N	\N	\N	\N	8727	2899a5f4-3884-44c0-83d5-f398101eb209	768945d2-3101-4b63-bd6f-d15c0608c039
a71bfd26-9f3d-4c6c-9512-a9b437e6128a	\N	\N	\N	\N	\N	482	2899a5f4-3884-44c0-83d5-f398101eb209	8a2c8b45-bc50-4c16-8ad0-6998b5aead4c
c32df5d3-ba8c-46b4-9af4-e2d651509411	\N	\N	\N	\N	\N	5238	50f8d3bc-5247-46a5-8756-b4b9894d9593	f4d94c00-ef80-4650-a09c-3cd90fdc500a
966492b6-0589-454a-b07c-f62523442c23	\N	\N	\N	\N	\N	5154	50f8d3bc-5247-46a5-8756-b4b9894d9593	9fd0b2ec-c41c-491b-ac3d-b3b01eba049c
95f47d67-b219-46d4-87d1-c04a7e025c54	\N	\N	\N	\N	\N	8727	50f8d3bc-5247-46a5-8756-b4b9894d9593	768945d2-3101-4b63-bd6f-d15c0608c039
2d60fd16-a421-498b-8679-f4a985ae453f	\N	\N	\N	\N	\N	482	50f8d3bc-5247-46a5-8756-b4b9894d9593	8a2c8b45-bc50-4c16-8ad0-6998b5aead4c
\.


--
-- Data for Name: box_subitems; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.box_subitems (id, created_by_id, modified_by_id, creation_date, last_modified_date, deleted_at, name, quantity, box_item_id) FROM stdin;
\.


--
-- Data for Name: boxes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.boxes (id, created_by_id, modified_by_id, creation_date, last_modified_date, deleted_at, name, weight, height, width, depth, invoice_id) FROM stdin;
f83a9e8f-3862-4924-bdba-470024fc2f9a	\N	\N	\N	\N	\N	Box36222	\N	64	\N	\N	485cda37-6cbc-43a0-9bf7-3d8b44ae4857
dedcf10c-5170-4ed7-846e-10d374428616	\N	\N	\N	\N	\N	Box43784	\N	90	\N	\N	485cda37-6cbc-43a0-9bf7-3d8b44ae4857
e1cb9495-259b-49f0-bc51-9037d9326eb1	\N	\N	\N	\N	\N	Box10645	\N	37	\N	\N	485cda37-6cbc-43a0-9bf7-3d8b44ae4857
3270bb90-16a7-4f5b-845c-63b96cbdc622	\N	\N	\N	\N	\N	Box64080	\N	87	\N	\N	47f73834-1643-4a10-a7a0-82dd5f26957c
2899a5f4-3884-44c0-83d5-f398101eb209	\N	\N	\N	\N	\N	Box68220	\N	48	\N	\N	47f73834-1643-4a10-a7a0-82dd5f26957c
50f8d3bc-5247-46a5-8756-b4b9894d9593	\N	\N	\N	\N	\N	Box42022	\N	65	\N	\N	47f73834-1643-4a10-a7a0-82dd5f26957c
\.


--
-- Data for Name: branches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.branches (id, created_by_id, modified_by_id, creation_date, last_modified_date, deleted_at, code, name) FROM stdin;
465227e8-7291-440f-a963-3759a19ea6ca	\N	\N	\N	\N	\N	05	Manaus
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
createTable-branches	Josias Gomes Lima	/db/changelog/2023/1_15-03-2023-changelog.yaml	2023-07-03 17:17:20.467008	1	EXECUTED	8:f6109a11c1f373143e784d08c67b913c	createTable tableName=branches		\N	4.9.1	\N	\N	8419040240
createTable-areas	Josias Gomes Lima	/db/changelog/2023/1_15-03-2023-changelog.yaml	2023-07-03 17:17:20.478019	2	EXECUTED	8:539ddb1698e1b3b00054c6107cd1e87e	createTable tableName=areas		\N	4.9.1	\N	\N	8419040240
createTable-products	Josias Gomes Lima	/db/changelog/2023/1_15-03-2023-changelog.yaml	2023-07-03 17:17:20.487234	3	EXECUTED	8:7f7131f900f1707b16e5875c2050cc89	createTable tableName=products		\N	4.9.1	\N	\N	8419040240
createTable-production_lines	Josias Gomes Lima	/db/changelog/2023/1_15-03-2023-changelog.yaml	2023-07-03 17:17:20.499215	4	EXECUTED	8:df6b18717ca78dee912919fe3d3c764c	createTable tableName=production_lines		\N	4.9.1	\N	\N	8419040240
createTable-machines	Josias Gomes Lima	/db/changelog/2023/1_15-03-2023-changelog.yaml	2023-07-03 17:17:20.507828	5	EXECUTED	8:d4ce8f0ea50a7df22b092e5ae27fcc80	createTable tableName=machines		\N	4.9.1	\N	\N	8419040240
createTable-positions	Josias Gomes Lima	/db/changelog/2023/1_15-03-2023-changelog.yaml	2023-07-03 17:17:20.518142	6	EXECUTED	8:c7d2dcf16c015607d3b0a9ca6a5d345e	createTable tableName=positions		\N	4.9.1	\N	\N	8419040240
createTable-lots	Josias Gomes Lima	/db/changelog/2023/2_22-03-2023-changelog.yaml	2023-07-03 17:17:20.526924	7	EXECUTED	8:8d965584ba8d3127eb79fe0b1bd41883	createTable tableName=lots		\N	4.9.1	\N	\N	8419040240
createTable-production-orders	Josias Gomes Lima	/db/changelog/2023/2_22-03-2023-changelog.yaml	2023-07-03 17:17:20.536631	8	EXECUTED	8:ce9edabbc79a24ce6154734ed08545f1	createTable tableName=production_orders		\N	4.9.1	\N	\N	8419040240
changeTable-positions-add-quantity_consumed	Josias Gomes Lima	/db/changelog/2023/3_29-03-2023-changelog.yaml	2023-07-03 17:17:20.542641	9	EXECUTED	8:9f7e50d893b2eebeaa8895ba4ddc3e7a	addColumn tableName=positions		\N	4.9.1	\N	\N	8419040240
changeTable-production_lines-add-production_order_id	Josias Gomes Lima	/db/changelog/2023/3_29-03-2023-changelog.yaml	2023-07-03 17:17:20.550478	10	EXECUTED	8:bae982a013fce1cf892493a8a33a81d8	addColumn tableName=production_lines		\N	4.9.1	\N	\N	8419040240
createTable-people	Josias Gomes Lima	/db/changelog/2023/4_30-03-2023-changelog.yaml	2023-07-03 17:17:20.560162	11	EXECUTED	8:b0b4382a8f46391b88d9756ed447a2c3	createTable tableName=people		\N	4.9.1	\N	\N	8419040240
changeTable-lots-add-people_id	Josias Gomes Lima	/db/changelog/2023/5_03-04-2023-changelog.yaml	2023-07-03 17:17:20.566164	12	EXECUTED	8:f21a630ef25618a858cea8c3b2c49642	addColumn tableName=lots		\N	4.9.1	\N	\N	8419040240
changeTable-products-add-people_id	Josias Gomes Lima	/db/changelog/2023/6_04-04-2023-changelog.yaml	2023-07-03 17:17:20.571531	13	EXECUTED	8:c964e038c57198c011b49a27ba5e17ce	addColumn tableName=products		\N	4.9.1	\N	\N	8419040240
changeTable-products-drop-name	Josias Gomes Lima	/db/changelog/2023/7_06-04-2023-changelog.yaml	2023-07-03 17:17:20.592478	14	EXECUTED	8:2a7db42a826c19776e59ac8bfa18e51f	dropColumn columnName=name, tableName=products; modifyDataType columnName=type, tableName=products; modifyDataType columnName=group, tableName=products		\N	4.9.1	\N	\N	8419040240
changeTable-people-change-store-to-identifier	Josias Gomes Lima	/db/changelog/2023/8_10-04-2023-changelog.yaml	2023-07-03 17:17:20.595938	15	EXECUTED	8:92ad232f9de17257b9af2fb16e9afba7	renameColumn newColumnName=identifier, oldColumnName=store, tableName=people		\N	4.9.1	\N	\N	8419040240
createTable-invoices	Josias Gomes Lima	/db/changelog/2023/9_13-04-2023-changelog.yaml	2023-07-03 17:17:20.603961	16	EXECUTED	8:c1cae7721c10ae648a0d61807e94f945	createTable tableName=invoices		\N	4.9.1	\N	\N	8419040240
createTable-user_invoices	Josias Gomes Lima	/db/changelog/2023/9_13-04-2023-changelog.yaml	2023-07-03 17:17:20.612402	17	EXECUTED	8:2068f129a3c8a7f7fd0e4c3bee08a158	createTable tableName=user_invoices		\N	4.9.1	\N	\N	8419040240
createTable-boxes	Josias Gomes Lima	/db/changelog/2023/9_13-04-2023-changelog.yaml	2023-07-03 17:17:20.621502	18	EXECUTED	8:374a095ae7404e17fc22033fae53e9f0	createTable tableName=boxes		\N	4.9.1	\N	\N	8419040240
createTable-box_items	Josias Gomes Lima	/db/changelog/2023/9_13-04-2023-changelog.yaml	2023-07-03 17:17:20.630423	19	EXECUTED	8:47fa900f88d473faf794e6f4ea8e5cd2	createTable tableName=box_items		\N	4.9.1	\N	\N	8419040240
createTable-box_subitems	Josias Gomes Lima	/db/changelog/2023/9_13-04-2023-changelog.yaml	2023-07-03 17:17:20.638602	20	EXECUTED	8:0fb36c2c8077350ca007416dcef64af9	createTable tableName=box_subitems		\N	4.9.1	\N	\N	8419040240
changeTable-invoices-add-columns-year-serie	Josias Gomes Lima	/db/changelog/2023/10_17-04-2023-changelog.yaml	2023-07-03 17:17:20.642933	21	EXECUTED	8:97217ab78e0dc60aa640a296bfdf3340	addColumn tableName=invoices		\N	4.9.1	\N	\N	8419040240
createTable-msl_levels	Josias Gomes Lima	/db/changelog/2023/11_19-04-2023-changelog.yaml	2023-07-03 17:17:20.652854	22	EXECUTED	8:1e64f80f1a0cdeb5f04c3cb2794f788f	createTable tableName=msl_levels		\N	4.9.1	\N	\N	8419040240
createTable-warehouses	Josias Gomes Lima	/db/changelog/2023/11_19-04-2023-changelog.yaml	2023-07-03 17:17:20.662776	23	EXECUTED	8:eed4572d2c65bb70cc05faf9bdfb6b1b	createTable tableName=warehouses		\N	4.9.1	\N	\N	8419040240
changeTable-products-add-columns-storage-classification-msl_level_id-area_id-warehouse_id	Josias Gomes Lima	/db/changelog/2023/11_19-04-2023-changelog.yaml	2023-07-03 17:17:20.672813	24	EXECUTED	8:0dee3de1969a1041c07bcc4e9ae04b53	addColumn tableName=products		\N	4.9.1	\N	\N	8419040240
createTable-invoice_items	Josias Gomes Lima	/db/changelog/2023/12_26-04-2023-changelog.yaml	2023-07-03 17:17:20.68073	25	EXECUTED	8:52a28890cd4adea867766b982420dbc0	createTable tableName=invoice_items		\N	4.9.1	\N	\N	8419040240
changeTable-box_items-drop-product_id_quantity_checked_add_invoice_item_id	Josias Gomes Lima	/db/changelog/2023/12_26-04-2023-changelog.yaml	2023-07-03 17:17:20.68778	26	EXECUTED	8:17d76d5708e9a05cdcd74fd3efdd0fb3	dropColumn columnName=product_id, tableName=box_items; dropColumn columnName=quantity_checked, tableName=box_items; dropColumn columnName=invoice_id, tableName=box_items; addColumn tableName=box_items		\N	4.9.1	\N	\N	8419040240
createTable-type_warehouses	Moisés Felipe dos Santos	/db/changelog/2023/13_09-05-2023-changelog.yaml	2023-07-03 17:17:20.696776	27	EXECUTED	8:5bd96785ebf469cfffa55956e7a1a03f	createTable tableName=type_warehouses		\N	4.9.1	\N	\N	8419040240
changeTable-warehouses-add_branch_id_add_type_warehouse_id	Moisés Felipe dos Santos	/db/changelog/2023/14_09-05-2023-changelog.yaml	2023-07-03 17:17:20.704036	28	EXECUTED	8:4f6d3c0bceb943698d94b92a7322da69	addColumn tableName=warehouses; addColumn tableName=warehouses		\N	4.9.1	\N	\N	8419040240
createTable-streets	Moisés Felipe dos Santos	/db/changelog/2023/15_09-05-2023-changelog.yaml	2023-07-03 17:17:20.711461	29	EXECUTED	8:157584bda2ae22f7d44488da6bd990de	createTable tableName=streets		\N	4.9.1	\N	\N	8419040240
createTable-shelves	Moisés Felipe dos Santos	/db/changelog/2023/16_09-05-2023-changelog.yaml	2023-07-03 17:17:20.719833	30	EXECUTED	8:866e9b6fb47a127ac699043c89d06088	createTable tableName=shelves		\N	4.9.1	\N	\N	8419040240
createTable-hives	Moisés Felipe dos Santos	/db/changelog/2023/17_09-05-2023-changelog.yaml	2023-07-03 17:17:20.727285	31	EXECUTED	8:b482f37b030243f17cb3096d44defbd6	createTable tableName=hives		\N	4.9.1	\N	\N	8419040240
createTable-hive_items	Moisés Felipe dos Santos	/db/changelog/2023/18_09-05-2023-changelog.yaml	2023-07-03 17:17:20.735053	32	EXECUTED	8:360cfa9cae25a49d392ff4f10e8dd22e	createTable tableName=hive_items		\N	4.9.1	\N	\N	8419040240
createTable-hive_subitems	Moisés Felipe dos Santos	/db/changelog/2023/19_09-05-2023-changelog.yaml	2023-07-03 17:17:20.743777	33	EXECUTED	8:67f77568ac20f438e3b76748322b6232	createTable tableName=hive_subitems		\N	4.9.1	\N	\N	8419040240
creatSequenceCode_warehouse	Moisés Felipe dos Santos	/db/changelog/2023/20_31-05-2023-changelog.yaml	2023-07-03 17:17:20.748018	34	EXECUTED	8:e577413e01cec5e0c7aef7c538301a4e	createSequence sequenceName=seq_code_warehouse		\N	4.9.1	\N	\N	8419040240
changeTable_warehouse_modify_type_code	Moisés Felipe dos Santos	/db/changelog/2023/21_01-06-2023-changelog.yaml	2023-07-03 17:17:20.763943	35	EXECUTED	8:d022efe33ffab76cf6a4d756b2a79456	modifyDataType columnName=code, tableName=warehouses; addDefaultValue columnName=code, tableName=warehouses		\N	4.9.1	\N	\N	8419040240
createTable-payments	Moisés Felipe dos Santos	/db/changelog/2023/22_13-06-2023-changelog.yaml	2023-07-03 17:17:20.774722	36	EXECUTED	8:b9814dac5c7e614b639da943dbe82e48	createTable tableName=payments		\N	4.9.1	\N	\N	8419040240
createTable-payment_items	Moisés Felipe dos Santos	/db/changelog/2023/22_13-06-2023-changelog.yaml	2023-07-03 17:17:20.785554	37	EXECUTED	8:a0b2a5da10805da01cf7a3e96ca42efe	createTable tableName=payment_items		\N	4.9.1	\N	\N	8419040240
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: hive_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hive_items (id, created_by_id, modified_by_id, creation_date, last_modified_date, deleted_at, quantity, box_item_id, hive_id) FROM stdin;
\.


--
-- Data for Name: hive_subitems; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hive_subitems (id, created_by_id, modified_by_id, creation_date, last_modified_date, deleted_at, quantity, box_subitem_id, hive_item_id) FROM stdin;
\.


--
-- Data for Name: hives; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hives (id, created_by_id, modified_by_id, creation_date, last_modified_date, deleted_at, name, floor, "column", shelf_id) FROM stdin;
bdec8a57-bb0e-4e8d-9bb4-6f50a62b5cc5	\N	\N	\N	\N	\N	Colmeia 0-0	0	0	dd09504d-438c-41fe-855d-e0b19264e0d0
b6a812c0-fe14-479b-adce-2acb9109c55a	\N	\N	\N	\N	\N	Colmeia 0-0	0	0	9b2a55f4-345c-46ae-b1da-8750443f310b
b8a73596-24a3-4f21-adeb-934f04d5ab64	\N	\N	\N	\N	\N	Colmeia 0-1	0	1	9b2a55f4-345c-46ae-b1da-8750443f310b
72e6acf1-8d18-4272-ab6a-b94ee3903bcb	\N	\N	\N	\N	\N	Colmeia 0-2	0	2	9b2a55f4-345c-46ae-b1da-8750443f310b
912151d0-6630-4fb2-beff-abd3cf149ab3	\N	\N	\N	\N	\N	Colmeia 1-0	1	0	9b2a55f4-345c-46ae-b1da-8750443f310b
e400b1c7-d314-44a6-8c01-36e75bd575de	\N	\N	\N	\N	\N	Colmeia 1-1	1	1	9b2a55f4-345c-46ae-b1da-8750443f310b
42517efc-4fdc-4338-9ebf-fd8ef9872fc0	\N	\N	\N	\N	\N	Colmeia 1-2	1	2	9b2a55f4-345c-46ae-b1da-8750443f310b
4b1a76a0-bf00-45bd-bcb6-a3a88bc6b7a3	\N	\N	\N	\N	\N	Colmeia 2-0	2	0	9b2a55f4-345c-46ae-b1da-8750443f310b
466666d4-c35c-439a-8c38-50b70a41e6da	\N	\N	\N	\N	\N	Colmeia 2-1	2	1	9b2a55f4-345c-46ae-b1da-8750443f310b
5ecd07ac-3570-4d9e-a0d8-3369a56d0040	\N	\N	\N	\N	\N	Colmeia 2-2	2	2	9b2a55f4-345c-46ae-b1da-8750443f310b
\.


--
-- Data for Name: invoice_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invoice_items (id, created_by_id, modified_by_id, creation_date, last_modified_date, deleted_at, quantity, quantity_checked, product_id, invoice_id) FROM stdin;
de2027b5-08cf-4bfa-85e8-4335035e8eff	\N	\N	\N	\N	\N	120	\N	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	31ae376c-7553-401b-aae3-9579d6345b99
05e9484e-ca97-4d4c-94ee-9574510d3830	\N	\N	\N	\N	\N	200	\N	ba2b2bc6-b145-4857-961c-2e8fc18b4526	31ae376c-7553-401b-aae3-9579d6345b99
0a2f7419-3ff2-4310-8390-e19f8abdbd4d	\N	\N	\N	\N	\N	298	298	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	485cda37-6cbc-43a0-9bf7-3d8b44ae4857
3f50002e-0e91-4809-9bf5-bd71b705da81	\N	\N	\N	\N	\N	9529	9529	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	485cda37-6cbc-43a0-9bf7-3d8b44ae4857
28c3993c-adbd-4c7b-9fa9-1408a9fc9428	\N	\N	\N	\N	\N	8025	8025	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	485cda37-6cbc-43a0-9bf7-3d8b44ae4857
0ee47eff-ce6d-401e-8cd1-3618e7a291f7	\N	\N	\N	\N	\N	5771	5771	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	485cda37-6cbc-43a0-9bf7-3d8b44ae4857
f4d94c00-ef80-4650-a09c-3cd90fdc500a	\N	\N	\N	\N	\N	5238	5238	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	47f73834-1643-4a10-a7a0-82dd5f26957c
9fd0b2ec-c41c-491b-ac3d-b3b01eba049c	\N	\N	\N	\N	\N	5154	5154	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	47f73834-1643-4a10-a7a0-82dd5f26957c
768945d2-3101-4b63-bd6f-d15c0608c039	\N	\N	\N	\N	\N	8727	8727	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	47f73834-1643-4a10-a7a0-82dd5f26957c
8a2c8b45-bc50-4c16-8ad0-6998b5aead4c	\N	\N	\N	\N	\N	482	482	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	47f73834-1643-4a10-a7a0-82dd5f26957c
\.


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invoices (id, created_by_id, modified_by_id, creation_date, last_modified_date, deleted_at, number, issue_date, status, supplier_code, supplier_name, lot_id, year, serie) FROM stdin;
31ae376c-7553-401b-aae3-9579d6345b99	\N	\N	\N	\N	\N	DT0156	2023-07-03 17:20:45.23	0	000302	ELITEGROUP COMPUTER SYSTEMS CO., LTD.	\N	2023	U
485cda37-6cbc-43a0-9bf7-3d8b44ae4857	\N	\N	\N	\N	2023-07-03 17:23:17.092	522851250882102	2023-07-03 17:23:16.68	2	000302	ELITEGROUP COMPUTER SYSTEMS CO., LTD.	bcdc4019-a882-4c1e-bdbf-f860e849d0fb	2023	U
47f73834-1643-4a10-a7a0-82dd5f26957c	\N	\N	\N	\N	2023-07-03 17:23:19.77	331528771225778	2023-07-03 17:23:19.434	2	000302	ELITEGROUP COMPUTER SYSTEMS CO., LTD.	bcdc4019-a882-4c1e-bdbf-f860e849d0fb	2023	U
\.


--
-- Data for Name: lots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lots (id, created_by_id, modified_by_id, creation_date, last_modified_date, deleted_at, number, identifier, description, activated, created_at, people_id) FROM stdin;
bcdc4019-a882-4c1e-bdbf-f860e849d0fb	\N	\N	\N	\N	\N	DT0156	DT	\N	t	2023-07-03 17:20:44.883	ebe641eb-3737-4d5e-9669-8b5b6a45a5a2
\.


--
-- Data for Name: machines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.machines (id, created_by_id, modified_by_id, creation_date, last_modified_date, deleted_at, name, production_line_id) FROM stdin;
d1da53ec-f28f-4c76-b5b2-a387f49d59b1	\N	\N	\N	\N	\N	NXT	98a6c90a-a0b8-4890-b9a2-78b8ffacb5bb
5c159e50-a538-4786-8182-03a62b216b0d	\N	\N	\N	\N	\N	Amanda B. Reckonwith	e74e9ff5-4b40-49c4-9e84-5042cf8b7a48
f456ba7c-71be-497b-99db-455da40c32e0	\N	\N	\N	\N	\N	Ken Oppenner	e74e9ff5-4b40-49c4-9e84-5042cf8b7a48
f06e89f7-c2d8-4e78-af53-4d5353a81a38	\N	\N	\N	\N	\N	Anne Ville	6d52a49b-6fec-4bc1-9764-fb3b6fb38af6
ca2caa8d-aa4d-49c9-9fdd-253163225435	\N	\N	\N	\N	\N	Renee Sance	6d52a49b-6fec-4bc1-9764-fb3b6fb38af6
53b0f617-9b43-4bd6-a228-e4dede6e3311	\N	\N	\N	\N	\N	Brooke Trout	16433bd3-8398-40f4-87a8-3a4b26b614f7
f7665fae-291d-4a4c-a098-6ec5f09d1c17	\N	\N	\N	\N	\N	Gladys Eeya	16433bd3-8398-40f4-87a8-3a4b26b614f7
93671bf8-e4a2-4ba8-97ce-4b1d6c5f641f	\N	\N	\N	\N	\N	Rusty Keyes	e238b438-57fc-44d8-815c-3cd95346a3bd
2786a24d-355b-410e-b78e-6046bc03dca2	\N	\N	\N	\N	\N	Rich Feller	e238b438-57fc-44d8-815c-3cd95346a3bd
3b2f9709-21aa-4447-b76e-3e369d7556dc	\N	\N	\N	\N	\N	Rusty Keyes	e238b438-57fc-44d8-815c-3cd95346a3bd
80e38b5a-55a7-4d0f-b610-e6edb265efe3	\N	\N	\N	\N	\N	Rich Feller	e238b438-57fc-44d8-815c-3cd95346a3bd
\.


--
-- Data for Name: msl_levels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.msl_levels (id, created_by_id, modified_by_id, creation_date, last_modified_date, deleted_at, name, "time", activated) FROM stdin;
13895648-0794-41ed-ae2d-1a347334e4fe	\N	\N	\N	\N	\N	Nível 3	168	t
011a36ae-e043-4a7f-9829-c28ee4d9c982	\N	\N	\N	\N	\N	Nível 4	72	t
171817a6-343f-4096-9246-10fccf444083	\N	\N	\N	\N	\N	Nível 5	48	t
8ccbc2b4-2fe2-4f76-a0f8-a9aa49eef957	\N	\N	\N	\N	\N	Nível 5a	24	t
\.


--
-- Data for Name: payment_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_items (id, created_by_id, modified_by_id, creation_date, last_modified_date, deleted_at, quantity_suggested, balance, paid, payment_id, box_item_id, box_subitem_id, product_id, hive_id) FROM stdin;
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id, created_by_id, modified_by_id, creation_date, last_modified_date, deleted_at, quantity_time, quantity_average_productivity, is_paid, branch_id, production_line_id, production_order_id, lot_id) FROM stdin;
\.


--
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.people (id, created_by_id, modified_by_id, creation_date, last_modified_date, deleted_at, name, document, code, identifier, category) FROM stdin;
ebe641eb-3737-4d5e-9669-8b5b6a45a5a2	\N	\N	\N	\N	\N	LOGIN INFORMATICA COM REP LTDA	00066716000353	000001	53	2
\.


--
-- Data for Name: positions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.positions (id, created_by_id, modified_by_id, creation_date, last_modified_date, deleted_at, "position", machine_id, product_id, quantity_consumed) FROM stdin;
1d63b933-adaf-403d-ad54-a35923fed7d1	\N	\N	\N	\N	\N	NXT-1-1	d1da53ec-f28f-4c76-b5b2-a387f49d59b1	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	6
44bc10c0-3ca8-4409-a1fe-5320c0d39743	\N	\N	\N	\N	\N	NXT-1-2	d1da53ec-f28f-4c76-b5b2-a387f49d59b1	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	0
5b40565e-1029-4d1b-b439-d39f6abd0d77	\N	\N	\N	\N	\N	NXT-1-3	d1da53ec-f28f-4c76-b5b2-a387f49d59b1	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	1
813d3e62-85b4-4ce3-8bec-f21a62fababe	\N	\N	\N	\N	\N	Amanda B. Reckonwith-2-65882	5c159e50-a538-4786-8182-03a62b216b0d	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	75
fbb835b6-8b42-4b4b-bcbf-7f8941dd1898	\N	\N	\N	\N	\N	Amanda B. Reckonwith-4-25973	5c159e50-a538-4786-8182-03a62b216b0d	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	70
bc52a0fd-540d-4921-ba65-180c92144a04	\N	\N	\N	\N	\N	Amanda B. Reckonwith-0-95743	5c159e50-a538-4786-8182-03a62b216b0d	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	59
5f623e78-69ed-4f86-be32-4bb96c91a43f	\N	\N	\N	\N	\N	Ken Oppenner-8-51830	f456ba7c-71be-497b-99db-455da40c32e0	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	41
3aac796c-2b46-4d03-8859-e6771eadb83d	\N	\N	\N	\N	\N	Ken Oppenner-8-02102	f456ba7c-71be-497b-99db-455da40c32e0	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	21
fba8d6dd-e836-4193-898f-4e9b091ec0e3	\N	\N	\N	\N	\N	Ken Oppenner-0-81745	f456ba7c-71be-497b-99db-455da40c32e0	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	45
264da443-e348-45a8-a607-f480c960dc88	\N	\N	\N	\N	\N	Anne Ville-6-02883	f06e89f7-c2d8-4e78-af53-4d5353a81a38	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	33
475a7370-2816-4f9d-a668-edc531dab324	\N	\N	\N	\N	\N	Anne Ville-4-48281	f06e89f7-c2d8-4e78-af53-4d5353a81a38	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	8
395fcbc5-870b-4b89-96ed-36cfb54dc2cb	\N	\N	\N	\N	\N	Anne Ville-3-65334	f06e89f7-c2d8-4e78-af53-4d5353a81a38	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	19
1b0dbb8f-532c-4af3-949c-8111ddafc205	\N	\N	\N	\N	\N	Renee Sance-7-32660	ca2caa8d-aa4d-49c9-9fdd-253163225435	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	45
428dbbef-878d-4ff6-bd8c-bfdf91a3d54a	\N	\N	\N	\N	\N	Renee Sance-3-53701	ca2caa8d-aa4d-49c9-9fdd-253163225435	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	85
245e45dc-1d73-495d-85bb-daf21f3876b0	\N	\N	\N	\N	\N	Renee Sance-0-11124	ca2caa8d-aa4d-49c9-9fdd-253163225435	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	32
7d552b67-f5de-42ef-af2f-a972ce2f4609	\N	\N	\N	\N	\N	Brooke Trout-0-55132	53b0f617-9b43-4bd6-a228-e4dede6e3311	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	25
3ee641af-4b8d-4471-977f-b1d5dcc4d1f7	\N	\N	\N	\N	\N	Brooke Trout-0-26281	53b0f617-9b43-4bd6-a228-e4dede6e3311	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	17
616bb2c1-8592-4a64-9632-e4c7083b5b3e	\N	\N	\N	\N	\N	Brooke Trout-2-81523	53b0f617-9b43-4bd6-a228-e4dede6e3311	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	3
adecdf30-e7e1-45a9-af8d-dc972afdf0d8	\N	\N	\N	\N	\N	Gladys Eeya-5-06560	f7665fae-291d-4a4c-a098-6ec5f09d1c17	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	58
e58f3171-63c9-4a28-a72d-16c87991e23d	\N	\N	\N	\N	\N	Gladys Eeya-6-16518	f7665fae-291d-4a4c-a098-6ec5f09d1c17	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	14
eda9f991-0d9b-44db-92ce-737ba865412e	\N	\N	\N	\N	\N	Gladys Eeya-8-20451	f7665fae-291d-4a4c-a098-6ec5f09d1c17	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	72
d2765737-4102-4492-9e4f-8b0b9f25e57f	\N	\N	\N	\N	\N	Rusty Keyes-5-13197	93671bf8-e4a2-4ba8-97ce-4b1d6c5f641f	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	17
cb0816be-147a-4d75-9522-fb689735f07d	\N	\N	\N	\N	\N	Rusty Keyes-0-63495	93671bf8-e4a2-4ba8-97ce-4b1d6c5f641f	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	67
ff6f1427-0991-4c8c-b63b-f9032d3086d4	\N	\N	\N	\N	\N	Rusty Keyes-5-01821	93671bf8-e4a2-4ba8-97ce-4b1d6c5f641f	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	41
e41917b6-dd81-40fd-b1cd-b163d0de7fc7	\N	\N	\N	\N	\N	Rich Feller-8-13075	2786a24d-355b-410e-b78e-6046bc03dca2	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	23
222c08cf-c9a0-48c9-9164-09d87acec9fa	\N	\N	\N	\N	\N	Rich Feller-2-21612	2786a24d-355b-410e-b78e-6046bc03dca2	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	65
3a0a94c6-8e42-4644-8ce3-0938642b44b9	\N	\N	\N	\N	\N	Rich Feller-6-48174	2786a24d-355b-410e-b78e-6046bc03dca2	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	36
2de1d4db-bc81-4b6c-8749-04e6165033f3	\N	\N	\N	\N	\N	Rusty Keyes-5-13197	3b2f9709-21aa-4447-b76e-3e369d7556dc	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	17
3b0cd795-1f84-422f-9b54-86c73eed7653	\N	\N	\N	\N	\N	Rusty Keyes-0-63495	3b2f9709-21aa-4447-b76e-3e369d7556dc	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	67
0c79e61e-d2dc-40a6-ac19-39301a5e445b	\N	\N	\N	\N	\N	Rusty Keyes-5-01821	3b2f9709-21aa-4447-b76e-3e369d7556dc	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	41
1a71709d-a4d8-4c47-841f-e713e81721e5	\N	\N	\N	\N	\N	Rich Feller-8-13075	80e38b5a-55a7-4d0f-b610-e6edb265efe3	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	23
a4ad3f0a-c545-4357-9e35-a1fecbb2c887	\N	\N	\N	\N	\N	Rich Feller-2-21612	80e38b5a-55a7-4d0f-b610-e6edb265efe3	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	65
dcbd18b9-d390-4b3f-a138-a0850e76b24c	\N	\N	\N	\N	\N	Rich Feller-6-48174	80e38b5a-55a7-4d0f-b610-e6edb265efe3	f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	36
\.


--
-- Data for Name: production_lines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.production_lines (id, created_by_id, modified_by_id, creation_date, last_modified_date, deleted_at, name, type, activated, area_id, branch_id, production_order_id) FROM stdin;
98a6c90a-a0b8-4890-b9a2-78b8ffacb5bb	\N	\N	\N	\N	\N	Linha 1	1	t	8234e2a0-b185-4c5a-9573-032cb02b470d	465227e8-7291-440f-a963-3759a19ea6ca	e9bb0607-dfc4-4ba7-8113-7a065dfa5bee
e74e9ff5-4b40-49c4-9e84-5042cf8b7a48	\N	\N	\N	\N	2023-07-03 17:23:19.304	Test line	1	t	8234e2a0-b185-4c5a-9573-032cb02b470d	465227e8-7291-440f-a963-3759a19ea6ca	e9bb0607-dfc4-4ba7-8113-7a065dfa5bee
6d52a49b-6fec-4bc1-9764-fb3b6fb38af6	\N	\N	\N	\N	2023-07-03 17:23:20.751	Test line	1	t	8234e2a0-b185-4c5a-9573-032cb02b470d	465227e8-7291-440f-a963-3759a19ea6ca	e9bb0607-dfc4-4ba7-8113-7a065dfa5bee
16433bd3-8398-40f4-87a8-3a4b26b614f7	\N	\N	\N	\N	2023-07-03 17:23:22.08	Test line	1	t	8234e2a0-b185-4c5a-9573-032cb02b470d	465227e8-7291-440f-a963-3759a19ea6ca	e9bb0607-dfc4-4ba7-8113-7a065dfa5bee
e238b438-57fc-44d8-815c-3cd95346a3bd	\N	\N	\N	\N	2023-07-03 17:23:23.165	Teste	1	f	8234e2a0-b185-4c5a-9573-032cb02b470d	465227e8-7291-440f-a963-3759a19ea6ca	e9bb0607-dfc4-4ba7-8113-7a065dfa5bee
\.


--
-- Data for Name: production_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.production_orders (id, created_by_id, modified_by_id, creation_date, last_modified_date, deleted_at, number, description, created_at, expected_quantity, lot_id, product_id, status) FROM stdin;
e9bb0607-dfc4-4ba7-8113-7a065dfa5bee	\N	\N	\N	\N	\N	DT015601	MOTHERBOARD DA3MT V1E C/TPM PPB	2023-07-03 17:20:44.919	3000	bcdc4019-a882-4c1e-bdbf-f860e849d0fb	ba2b2bc6-b145-4857-961c-2e8fc18b4526	2
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, created_by_id, modified_by_id, creation_date, last_modified_date, deleted_at, code, description, type, "group", partnumber, people_id, storage, classification, msl_level_id, area_id, warehouse_id) FROM stdin;
f3f2dbf0-2d00-4834-ae6a-2f38423e8f69	\N	\N	\N	\N	\N	MBNBDTP00011	MOTHERBOARD TL03-4 I7-1165G7 PPB 	ME	MBPC	FGHFGHWEE	ebe641eb-3737-4d5e-9669-8b5b6a45a5a2	\N	\N	\N	\N	\N
ba2b2bc6-b145-4857-961c-2e8fc18b4526	\N	\N	\N	\N	\N	MBDTDTP00090	MOTHERBOARD DA3MT V1E C/TPM PPB	ME	MBPC	FGHFGHWEE	ebe641eb-3737-4d5e-9669-8b5b6a45a5a2	\N	\N	\N	\N	\N
f2205014-5eaf-450b-9be9-8c7633e29467	\N	\N	\N	\N	2023-07-03 17:23:15.515	30437448866656342633	Rob Banks	dinosaur	Lowden Clear	52817851226627867816	ebe641eb-3737-4d5e-9669-8b5b6a45a5a2	test storage	test classification	13895648-0794-41ed-ae2d-1a347334e4fe	8234e2a0-b185-4c5a-9573-032cb02b470d	e1f5c9aa-0742-4ab7-b1a5-9c7839b5313e
\.


--
-- Data for Name: shelves; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shelves (id, created_by_id, modified_by_id, creation_date, last_modified_date, deleted_at, name, width, length, column_quantity, floor_quantity, type, street_id, warehouse_id) FROM stdin;
dd09504d-438c-41fe-855d-e0b19264e0d0	\N	\N	\N	\N	\N	Pallet 01	1.00	1.00	1	1	1	cd4f58f7-c714-4fdd-ad0a-0ae67e7cd84e	e1f5c9aa-0742-4ab7-b1a5-9c7839b5313e
9b2a55f4-345c-46ae-b1da-8750443f310b	\N	\N	\N	\N	\N	Estante 01	1.00	1.00	3	3	0	cd4f58f7-c714-4fdd-ad0a-0ae67e7cd84e	e1f5c9aa-0742-4ab7-b1a5-9c7839b5313e
\.


--
-- Data for Name: streets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.streets (id, created_by_id, modified_by_id, creation_date, last_modified_date, deleted_at, name, width, length) FROM stdin;
cd4f58f7-c714-4fdd-ad0a-0ae67e7cd84e	\N	\N	\N	\N	\N	RUA A1	1.00	1.00
9997defa-9533-4939-9d20-0826e82e78d5	\N	\N	\N	\N	\N	RUA A2	1.00	1.00
\.


--
-- Data for Name: type_warehouses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_warehouses (id, created_by_id, modified_by_id, creation_date, last_modified_date, deleted_at, name, "group") FROM stdin;
419edc39-c0fa-4cb6-b8b8-f9fa2b5f385f	\N	\N	\N	\N	\N	Comum	0
f279dbf0-2fee-4ed8-8e81-8c20c85e5685	\N	\N	\N	\N	\N	Mercado SMT	1
7c9ac328-ac11-40d4-a4cc-9a818d80d881	\N	\N	\N	\N	\N	Conferência	2
c2c7d2ab-afaf-4a7f-883b-50348d2216d7	\N	\N	\N	\N	2023-07-03 17:23:17.925	Test Tipo de Armazém	0
ef56ed1d-4635-40b8-8525-3045c78b46b2	\N	\N	\N	\N	\N	Test Tipo de Armazém	0
\.


--
-- Data for Name: user_invoices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_invoices (id, created_by_id, modified_by_id, creation_date, last_modified_date, deleted_at, description, type, status, invoice_id) FROM stdin;
4ecc8fb0-7aa9-4e48-b28d-61970c98f0c9	3cf16275-43c3-471f-a991-e97115f72546	\N	2023-07-03 17:23:17.034	\N	\N	\N	0	t	485cda37-6cbc-43a0-9bf7-3d8b44ae4857
20785c2a-a149-4980-959b-609c42998aeb	ce493122-5cd2-4846-bbdb-a92e01bbd978	\N	2023-07-03 17:23:19.465	\N	\N	Produto veio quebrado!	0	f	47f73834-1643-4a10-a7a0-82dd5f26957c
6f8a8eb9-2b83-4fef-9629-edbfdeb2da3f	94dc23a7-c41b-4663-982e-a857865481c1	\N	2023-07-03 17:23:19.717	\N	\N	aprovado	1	t	47f73834-1643-4a10-a7a0-82dd5f26957c
\.


--
-- Data for Name: warehouses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.warehouses (id, created_by_id, modified_by_id, creation_date, last_modified_date, deleted_at, name, code, branch_id, type_warehouse_id) FROM stdin;
e1f5c9aa-0742-4ab7-b1a5-9c7839b5313e	\N	\N	\N	\N	\N	Produção	10	465227e8-7291-440f-a963-3759a19ea6ca	419edc39-c0fa-4cb6-b8b8-f9fa2b5f385f
84005630-4abb-44be-9880-e04ea6dbfd8f	\N	\N	\N	\N	\N	Cofre	11	465227e8-7291-440f-a963-3759a19ea6ca	419edc39-c0fa-4cb6-b8b8-f9fa2b5f385f
\.


--
-- Name: seq_code_warehouse; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_code_warehouse', 11, true);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: areas pk_areas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areas
    ADD CONSTRAINT pk_areas PRIMARY KEY (id);


--
-- Name: box_items pk_box_items; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.box_items
    ADD CONSTRAINT pk_box_items PRIMARY KEY (id);


--
-- Name: box_subitems pk_box_subitems; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.box_subitems
    ADD CONSTRAINT pk_box_subitems PRIMARY KEY (id);


--
-- Name: boxes pk_boxes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boxes
    ADD CONSTRAINT pk_boxes PRIMARY KEY (id);


--
-- Name: branches pk_branches; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT pk_branches PRIMARY KEY (id);


--
-- Name: hive_items pk_hive_items; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hive_items
    ADD CONSTRAINT pk_hive_items PRIMARY KEY (id);


--
-- Name: hive_subitems pk_hive_subitems; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hive_subitems
    ADD CONSTRAINT pk_hive_subitems PRIMARY KEY (id);


--
-- Name: hives pk_hives; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hives
    ADD CONSTRAINT pk_hives PRIMARY KEY (id);


--
-- Name: invoice_items pk_invoice_items; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_items
    ADD CONSTRAINT pk_invoice_items PRIMARY KEY (id);


--
-- Name: invoices pk_invoices; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT pk_invoices PRIMARY KEY (id);


--
-- Name: lots pk_lots; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lots
    ADD CONSTRAINT pk_lots PRIMARY KEY (id);


--
-- Name: machines pk_machines; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.machines
    ADD CONSTRAINT pk_machines PRIMARY KEY (id);


--
-- Name: msl_levels pk_msl_levels; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.msl_levels
    ADD CONSTRAINT pk_msl_levels PRIMARY KEY (id);


--
-- Name: payment_items pk_payment_items; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_items
    ADD CONSTRAINT pk_payment_items PRIMARY KEY (id);


--
-- Name: payments pk_payments; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT pk_payments PRIMARY KEY (id);


--
-- Name: people pk_people; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT pk_people PRIMARY KEY (id);


--
-- Name: positions pk_positions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.positions
    ADD CONSTRAINT pk_positions PRIMARY KEY (id);


--
-- Name: production_lines pk_production_lines; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_lines
    ADD CONSTRAINT pk_production_lines PRIMARY KEY (id);


--
-- Name: production_orders pk_production_orders; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_orders
    ADD CONSTRAINT pk_production_orders PRIMARY KEY (id);


--
-- Name: products pk_products; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT pk_products PRIMARY KEY (id);


--
-- Name: shelves pk_shelves; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shelves
    ADD CONSTRAINT pk_shelves PRIMARY KEY (id);


--
-- Name: streets pk_streets; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.streets
    ADD CONSTRAINT pk_streets PRIMARY KEY (id);


--
-- Name: type_warehouses pk_type_warehouses; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_warehouses
    ADD CONSTRAINT pk_type_warehouses PRIMARY KEY (id);


--
-- Name: user_invoices pk_user_invoices; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_invoices
    ADD CONSTRAINT pk_user_invoices PRIMARY KEY (id);


--
-- Name: warehouses pk_warehouses; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouses
    ADD CONSTRAINT pk_warehouses PRIMARY KEY (id);


--
-- Name: box_items fk_box_item_box; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.box_items
    ADD CONSTRAINT fk_box_item_box FOREIGN KEY (box_id) REFERENCES public.boxes(id);


--
-- Name: box_subitems fk_box_item_box_subitem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.box_subitems
    ADD CONSTRAINT fk_box_item_box_subitem FOREIGN KEY (box_item_id) REFERENCES public.box_items(id);


--
-- Name: box_items fk_box_item_invoice_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.box_items
    ADD CONSTRAINT fk_box_item_invoice_item FOREIGN KEY (invoice_item_id) REFERENCES public.invoice_items(id);


--
-- Name: warehouses fk_branch_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouses
    ADD CONSTRAINT fk_branch_warehouse FOREIGN KEY (branch_id) REFERENCES public.branches(id);


--
-- Name: hive_items fk_hive_item_box_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hive_items
    ADD CONSTRAINT fk_hive_item_box_item FOREIGN KEY (box_item_id) REFERENCES public.box_items(id);


--
-- Name: hive_items fk_hive_item_hive; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hive_items
    ADD CONSTRAINT fk_hive_item_hive FOREIGN KEY (hive_id) REFERENCES public.hives(id);


--
-- Name: hive_subitems fk_hive_subitem_box_subitem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hive_subitems
    ADD CONSTRAINT fk_hive_subitem_box_subitem FOREIGN KEY (box_subitem_id) REFERENCES public.box_subitems(id);


--
-- Name: hive_subitems fk_hive_subitem_hive_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hive_subitems
    ADD CONSTRAINT fk_hive_subitem_hive_item FOREIGN KEY (hive_item_id) REFERENCES public.hive_items(id);


--
-- Name: invoice_items fk_invoice_item_invoice; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_items
    ADD CONSTRAINT fk_invoice_item_invoice FOREIGN KEY (invoice_id) REFERENCES public.invoices(id);


--
-- Name: invoice_items fk_invoice_item_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_items
    ADD CONSTRAINT fk_invoice_item_product FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: invoices fk_invoice_lot; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT fk_invoice_lot FOREIGN KEY (lot_id) REFERENCES public.lots(id);


--
-- Name: user_invoices fk_invoice_user_invoice; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_invoices
    ADD CONSTRAINT fk_invoice_user_invoice FOREIGN KEY (invoice_id) REFERENCES public.invoices(id);


--
-- Name: boxes fk_invoice_user_invoice; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boxes
    ADD CONSTRAINT fk_invoice_user_invoice FOREIGN KEY (invoice_id) REFERENCES public.invoices(id);


--
-- Name: lots fk_lot_people; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lots
    ADD CONSTRAINT fk_lot_people FOREIGN KEY (people_id) REFERENCES public.people(id);


--
-- Name: machines fk_machine_production_line; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.machines
    ADD CONSTRAINT fk_machine_production_line FOREIGN KEY (production_line_id) REFERENCES public.production_lines(id);


--
-- Name: payments fk_payment_branches; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT fk_payment_branches FOREIGN KEY (branch_id) REFERENCES public.branches(id);


--
-- Name: payment_items fk_payment_item_box_items; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_items
    ADD CONSTRAINT fk_payment_item_box_items FOREIGN KEY (box_item_id) REFERENCES public.box_items(id);


--
-- Name: payment_items fk_payment_item_box_subitems; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_items
    ADD CONSTRAINT fk_payment_item_box_subitems FOREIGN KEY (box_subitem_id) REFERENCES public.box_subitems(id);


--
-- Name: payment_items fk_payment_item_hives; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_items
    ADD CONSTRAINT fk_payment_item_hives FOREIGN KEY (hive_id) REFERENCES public.hives(id);


--
-- Name: payment_items fk_payment_item_payments; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_items
    ADD CONSTRAINT fk_payment_item_payments FOREIGN KEY (payment_id) REFERENCES public.payments(id);


--
-- Name: payment_items fk_payment_item_products; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_items
    ADD CONSTRAINT fk_payment_item_products FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: payments fk_payment_lots; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT fk_payment_lots FOREIGN KEY (lot_id) REFERENCES public.lots(id);


--
-- Name: payments fk_payment_production_lines; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT fk_payment_production_lines FOREIGN KEY (production_line_id) REFERENCES public.production_lines(id);


--
-- Name: payments fk_payment_production_orders; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT fk_payment_production_orders FOREIGN KEY (production_order_id) REFERENCES public.production_orders(id);


--
-- Name: positions fk_position_machine; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.positions
    ADD CONSTRAINT fk_position_machine FOREIGN KEY (machine_id) REFERENCES public.machines(id);


--
-- Name: positions fk_position_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.positions
    ADD CONSTRAINT fk_position_product FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: products fk_product_area; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_product_area FOREIGN KEY (area_id) REFERENCES public.areas(id);


--
-- Name: products fk_product_msl_level; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_product_msl_level FOREIGN KEY (msl_level_id) REFERENCES public.msl_levels(id);


--
-- Name: products fk_product_people; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_product_people FOREIGN KEY (people_id) REFERENCES public.people(id);


--
-- Name: products fk_product_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_product_warehouse FOREIGN KEY (warehouse_id) REFERENCES public.warehouses(id);


--
-- Name: production_lines fk_production_line_area; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_lines
    ADD CONSTRAINT fk_production_line_area FOREIGN KEY (area_id) REFERENCES public.areas(id);


--
-- Name: production_lines fk_production_line_branch; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_lines
    ADD CONSTRAINT fk_production_line_branch FOREIGN KEY (branch_id) REFERENCES public.branches(id);


--
-- Name: production_lines fk_production_line_production_order; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_lines
    ADD CONSTRAINT fk_production_line_production_order FOREIGN KEY (production_order_id) REFERENCES public.production_orders(id);


--
-- Name: production_orders fk_production_order_lot; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_orders
    ADD CONSTRAINT fk_production_order_lot FOREIGN KEY (lot_id) REFERENCES public.lots(id);


--
-- Name: production_orders fk_production_order_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_orders
    ADD CONSTRAINT fk_production_order_product FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: shelves fk_shelf_has_street; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shelves
    ADD CONSTRAINT fk_shelf_has_street FOREIGN KEY (street_id) REFERENCES public.streets(id);


--
-- Name: hives fk_shelf_hive; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hives
    ADD CONSTRAINT fk_shelf_hive FOREIGN KEY (shelf_id) REFERENCES public.shelves(id);


--
-- Name: shelves fk_warehouse_shelf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shelves
    ADD CONSTRAINT fk_warehouse_shelf FOREIGN KEY (warehouse_id) REFERENCES public.warehouses(id);


--
-- Name: warehouses fk_warehouse_type_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouses
    ADD CONSTRAINT fk_warehouse_type_warehouse FOREIGN KEY (type_warehouse_id) REFERENCES public.type_warehouses(id);


--
-- PostgreSQL database dump complete
--

