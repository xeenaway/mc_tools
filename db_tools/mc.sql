--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

-- Started on 2017-10-22 12:51:29

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2186 (class 1262 OID 16393)
-- Name: mc; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE mc WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Ukrainian_Ukraine.1251' LC_CTYPE = 'Ukrainian_Ukraine.1251';


ALTER DATABASE mc OWNER TO postgres;

\connect mc

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2188 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 188 (class 1259 OID 16891)
-- Name: atms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE atms (
    id integer NOT NULL,
    model2 character varying(30),
    luno character varying(3),
    machine_no character varying(6),
    address character varying(100),
    serial character varying(10),
    license_ht2 character varying(16),
    license_psj character varying(16),
    bank_id integer,
    model_id integer,
    town_id integer,
    flm boolean DEFAULT false NOT NULL
);


ALTER TABLE atms OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16889)
-- Name: atms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE atms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE atms_id_seq OWNER TO postgres;

--
-- TOC entry 2189 (class 0 OID 0)
-- Dependencies: 187
-- Name: atms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE atms_id_seq OWNED BY atms.id;


--
-- TOC entry 186 (class 1259 OID 16492)
-- Name: banks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE banks (
    id integer NOT NULL,
    name_short character varying(10) NOT NULL,
    name_full character varying(100),
    name_alias character varying(100)
);


ALTER TABLE banks OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16490)
-- Name: banks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE banks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE banks_id_seq OWNER TO postgres;

--
-- TOC entry 2190 (class 0 OID 0)
-- Dependencies: 185
-- Name: banks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE banks_id_seq OWNED BY banks.id;


--
-- TOC entry 193 (class 1259 OID 25156)
-- Name: models; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE models (
    name character varying(30) NOT NULL,
    vendor_id integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE models OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 25212)
-- Name: models_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE models_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE models_id_seq OWNER TO postgres;

--
-- TOC entry 2191 (class 0 OID 0)
-- Dependencies: 196
-- Name: models_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE models_id_seq OWNED BY models.id;


--
-- TOC entry 190 (class 1259 OID 16919)
-- Name: regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE regions (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE regions OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16917)
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE regions_id_seq OWNER TO postgres;

--
-- TOC entry 2192 (class 0 OID 0)
-- Dependencies: 189
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE regions_id_seq OWNED BY regions.id;


--
-- TOC entry 191 (class 1259 OID 16935)
-- Name: towns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE towns (
    region_id integer NOT NULL,
    name character varying(30) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE towns OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 25202)
-- Name: towns_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE towns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE towns_id_seq OWNER TO postgres;

--
-- TOC entry 2193 (class 0 OID 0)
-- Dependencies: 195
-- Name: towns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE towns_id_seq OWNED BY towns.id;


--
-- TOC entry 192 (class 1259 OID 25147)
-- Name: vendors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE vendors (
    name character varying(30) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE vendors OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 25194)
-- Name: vendors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE vendors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vendors_id_seq OWNER TO postgres;

--
-- TOC entry 2194 (class 0 OID 0)
-- Dependencies: 194
-- Name: vendors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE vendors_id_seq OWNED BY vendors.id;


--
-- TOC entry 2032 (class 2604 OID 16894)
-- Name: atms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY atms ALTER COLUMN id SET DEFAULT nextval('atms_id_seq'::regclass);


--
-- TOC entry 2031 (class 2604 OID 16495)
-- Name: banks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY banks ALTER COLUMN id SET DEFAULT nextval('banks_id_seq'::regclass);


--
-- TOC entry 2037 (class 2604 OID 25214)
-- Name: models id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY models ALTER COLUMN id SET DEFAULT nextval('models_id_seq'::regclass);


--
-- TOC entry 2034 (class 2604 OID 16922)
-- Name: regions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY regions ALTER COLUMN id SET DEFAULT nextval('regions_id_seq'::regclass);


--
-- TOC entry 2035 (class 2604 OID 25204)
-- Name: towns id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY towns ALTER COLUMN id SET DEFAULT nextval('towns_id_seq'::regclass);


--
-- TOC entry 2036 (class 2604 OID 25196)
-- Name: vendors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vendors ALTER COLUMN id SET DEFAULT nextval('vendors_id_seq'::regclass);


--
-- TOC entry 2173 (class 0 OID 16891)
-- Dependencies: 188
-- Data for Name: atms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY atms (id, model2, luno, machine_no, address, serial, license_ht2, license_psj, bank_id, model_id, town_id, flm) FROM stdin;
265	ProCash 2000xe	400	009400	Львівська обл., Яворівський р-н, с. Підрясне, вул. Європейська, 1	5300816039	\N	\N	1	4	15	t
236	ProCash 2050xe	778	007778	м. Чернігів, вул. Рокосовського, буд. 14	5300217374	8588081A65CD3158	79F75682261482E4	1	5	24	t
111	ProCash 2050xe	757	007757	Київська обл., смт.Згурівка, вул.Українська, 19	5300527565	0E06B418572C5213	0389948937479485	1	5	\N	t
77	2050хе	300	003300	Полтавська обл., м. Глобине, вул. Жовтнева, 16	5300337860	3BF733A1F0A4A749	C8A02F9FC100C742	1	\N	\N	f
54	2050	729	003729	м. Луганськ, вул.Коцюбинського, 13	5300041954	0794AD27C4B76029	3DEEB2AAB6D57792	1	\N	\N	f
86	2050	739	003739	м. Харків, вул. Блюхера, 38-Б	5300095549	510BB64B26203350	72C5915276BA4817	1	\N	2	f
125		824	006824	Львів,    вул. Стрийська, 29	5300552593	587906263FC74111	803284350B25746C	1	\N	\N	f
204		759	007759	м.Охтирка, вул Батюка ,26	5300213044	80D85284AC90DC5E		1	\N	\N	f
80	2050xe	412	009412	Полтавська обл., м. Зіньків, вул. Леніна, 65	5300255652	EEA5FF4BA44D0E53	CD53BD76C15C8186	1	\N	\N	f
21	ProCash 2000xe USB frontload	807	007807	м. Київ, вул. Малиновського, 12	5300636371	9552F12D5204007B	558311C2A2052CFF	1	3	1	t
20	ProCash 2050xe USB	012	003012	м. Київ, вул. Луначарського, 10	5300396726	3EBE776779267117	B6D4C56FE153A898	1	1	1	t
302	\N	785	007785	\N	5300217247	\N	\N	1	\N	\N	f
303	\N	786	007786	\N	5300217394	\N	\N	1	\N	\N	f
133	ProCash 2000xe	776	006776	м. Київ, вул. Медова, 2	5300816080			1	4	1	t
304	\N	789	007789	\N	5300241514	\N	\N	1	\N	\N	f
305	\N	790	007790	\N	5300241347	\N	\N	1	\N	\N	f
246	ProCash 2000xe	819	007819	м. Київ, вул. Радищева, 10/14	5300841370	\N	\N	1	4	1	t
51	ProCash 2000xe	755	007755	м. Київ, вул. Радищева, 10/14, корпус Ю, (Фарма Старт)	5300805862			1	4	1	t
22	ProCash 2000xe USB frontload	768	007768	м. Київ, вул. Маяковського, 26	5300635936	85F6E7F7E9393A78	1AF93D55987CFC85	1	3	1	t
115	ProCash 2000xe frontload	799	007799	м. Київ, вул. Червонопрапорна, 137	5300217277	DD03000D15C77A26	9FBD82508D4C3F69	1	8	1	t
29	ProCash 1500xe	484	009484	м. Київ, пр. Перемоги, 37	5300318312	42DAD18143EE0252	303578EC33D8CF5A	1	2	1	t
26	ProCash 2050xe	487	009487	м. Київ, вул.Васильківська, 24	5300337908	1AA78E4A661A4E59	F06A2547630D1920	1	5	1	t
306	\N	793	007793	\N	5300241355	\N	\N	1	\N	\N	f
307	\N	794	007794	\N	5300241358	\N	\N	1	\N	\N	f
266	ProCash 2050xe	724	003724	м. Полтава, вул. М. Бірюзова, буд.17	5300304075	\N	\N	1	5	16	t
267	\N	979	002979	\N	5300337867	\N	\N	1	\N	\N	f
268	\N	985	002985	\N	5300337875	\N	\N	1	\N	\N	f
180		101	005101	"м. Луганськ, кВ. Зарічний, 18-Б (супермаркет ""Абсолют"") "	5300729045		61BCC99283FDC09C	\N	\N	\N	f
269	\N	010	003010	\N	5300337855	\N	\N	1	\N	\N	f
270	\N	200	003200	\N	5300337832	\N	\N	1	\N	\N	f
271	\N	369	003369	\N	5300339111	\N	\N	1	\N	\N	f
272	\N	500	003500	\N	5300461920	\N	\N	1	\N	\N	f
273	\N	501	003501	\N	5300461893	\N	\N	1	\N	\N	f
274	\N	702	003702	\N	6101413874	\N	\N	1	\N	\N	f
275	\N	705	003705	\N	5300002333	\N	\N	1	\N	\N	f
243		704	003704	м. Харків вул. Полтавський шлях, 148	5300337847	06F202D00C781D1F		1	\N	2	f
276	\N	706	003706	\N	5300002393	\N	\N	1	\N	\N	f
277	\N	709	003709	\N	5300318442	\N	\N	1	\N	\N	f
278	\N	710	003710	\N	5300024891	\N	\N	1	\N	\N	f
279	\N	713	003713	\N	5300027603	\N	\N	1	\N	\N	f
235		715	003715	м. Львів, вул. Городоцька, 167	5300027592	B252D5F1DC8E02DB	63BCA0D440B7E3EC	1	\N	12	f
280	\N	718	003718	\N	5300337871	\N	\N	1	\N	\N	f
281	\N	731	003731	\N	5300074354	\N	\N	1	\N	\N	f
282	\N	727	003727	\N	5300041952	\N	\N	1	\N	\N	f
283	\N	733	003733	\N	5300318447	\N	\N	1	\N	\N	f
285	\N	738	003738	\N	5300089379	\N	\N	1	\N	\N	f
286	\N	743	003743	\N	5300142998	\N	\N	1	\N	\N	f
287	\N	742	003742	\N	5300204682	\N	\N	1	\N	\N	f
288	\N	744	003744	\N	5300143599	\N	\N	1	\N	\N	f
289	\N	750	003750	\N	5300191427	\N	\N	1	\N	\N	f
290	\N	068	005068	\N	5300634615	\N	\N	1	\N	\N	f
291	\N	743	006743	\N	5300506248	\N	\N	1	\N	\N	f
292	\N	770	006770	\N	5300527336	\N	\N	1	\N	\N	f
293	\N	790	006790	\N	5300527035	\N	\N	1	\N	\N	f
294	\N	823	006823	\N	5300527164	\N	\N	1	\N	\N	f
295	\N	835	006835	\N	5300554511	\N	\N	1	\N	\N	f
296	\N	667	007667	\N	5300654036	\N	\N	1	\N	\N	f
297	\N	760	007760	\N	5300637775	\N	\N	1	\N	\N	f
298	\N	767	007767	\N	5300211720	\N	\N	1	\N	\N	f
299	\N	772	007772	\N	5300217302	\N	\N	1	\N	\N	f
300	\N	773	007773	\N	5300213200	\N	\N	1	\N	\N	f
301	\N	781	007781	\N	5300217356	\N	\N	1	\N	\N	f
308	\N	795	007795	\N	5300241379	\N	\N	1	\N	\N	f
309	\N	798	007798	\N	5300241351	\N	\N	1	\N	\N	f
169		797	007797	м. Ялта, вул. Боткінська, 2В	5300241352	F4209E11C327178A	646B7E31C92555D0	1	\N	\N	f
241		811	007811	м. Київ, вул. П.Тичини, 16/2	5300241349	2D54C9A8C1AD58EB		1	\N	1	f
155		878	007878	м. Донецьк, вул. Бахметьєва, 47	5300636748	C0578E282D6D8519	C9885E3A77E66253	1	\N	\N	f
168		972	007972	м. Бориспіль, вул. Київський шлях, 2/6	5300634356	79691F90B6B08F41	9C3AF61F2D1C2075	1	\N	\N	f
284	\N	737	003737	\N	5300092524	\N	\N	1	\N	\N	f
310	\N	800	007800	\N	5300217366	\N	\N	1	\N	\N	f
33	ProCash 1500xe	034	003034	м. Київ, вул. Васильківська, 34	5300339095	4529FE4B65526BC7	FE73E72185D97A63	1	2	1	t
105	ProCash 2050xe	701	003701	м. Київ, вул. Пушкінська, 42/4	5300526963	0E30C01B3CA687F1	7147E49723FFB5F3	1	5	1	t
185	ProCash 2000	703	003703	м. Київ, вул. Малишко, 3	6101475676	DC958CEA0BB9C9F0	F8C2AF3A38D9CA75	1	6	1	t
24	ProCash 2000	711	003711	м. Київ, вул. Політехнічна, 39	5300024004	164F321250614FD4	475D9EEDE1811392	1	6	1	t
28	ProCash 2000xe frontload	732	003732	м. Київ, вул. Політехнічна, 16	5300078024	D908CFE7FA577FD2	8076C73339132498	1	8	1	t
17	ProCash 2050xe USB	768	003768	м. Київ, вул. Володимирська, 23а	5300448777	D649FF924ABF3EF5	AC05B73A4AB79CE0	1	1	1	t
146	ProCash 2000xe USB frontload	928	003928	м. Київ, вул. Миколи Грінченка, 2/1	5300637221	E5F9F7B2C090AF01	FDF48C4E22E27CCB	1	3	1	t
176	ProCash 2000xe USB	091	005091	м. Київ, вул. Федорова, 32-А	5300714660	22C5199BA5C595FC	262AEE4050949ABC	1	11	1	t
178	ProCash 2000xe USB frontload	097	005097	м. Київ, вул. Спаська, 30-А	5300727563		01A45602BFE8E682	1	3	1	t
210	ProCash 2000xe USB frontload	122	005122	м. Київ, вул. Льва Толстого, 57	5300727636	3B528F2CCCE57A42	E730C1A2AFA553E7	1	3	1	t
196	ProCash 2000xe USB frontload	544	005544	м. Київ, вул. Фрунзе, 63	5300725066	863FACF15589621F	78513DA74D83D94A	1	3	1	t
203	ProCash 2000xe	723	005723	м. Київ, вул. Жилянська, 31	5300725346	F6BB1ED3EE50A463	23831337407015F6	1	4	1	t
144	ProCash 2000xe USB	427	006427	м. Київ,  пр. Московський, 28-А	5300636000	65595FF59C8A5F51	E5650655D84D3B33	1	11	1	t
165	ProCash 2000xe USB frontload	000	007000	м. Київ, вул. Фрунзе, 74	5300555225	1668E03EE8C20F4E	CA6578103304D03F	1	3	1	t
120	ProCash 2000xe USB frontload	033	007033	м. Київ, провулок Чугуївський, 21	5300603564	21892EB7F02A4D96	67E3A664CBB1DF8B	1	3	1	t
129	ProCash 2000xe USB frontload	053	007053	м. Київ, пр-т Палладіна, 7-А	5300603557	CA9C79DA0F4D11D2	DF542C9511761C85	1	3	1	t
182	ProCash 2000xe USB frontload	751	007751	м. Київ, вул. Гайдара, 58/10	5300841532	74D8B8FE590861E0	C1027E0A0F0E493D	1	3	1	t
184	ProCash 2000xe USB frontload	199	005199	м. Київ, вул. Кільцева дорога, 20/1-А (ТОВ "Вольво Україна")	5300707710		8742FABBFFC1D58F	1	3	1	t
197	ProCash 2000xe USB frontload	545	005545	м. Київ, вул. Фрунзе, 74 ("Фармак")	5300712461	7EE295D296B6DEA1	0FE5122A9FAC4FE7	1	3	1	t
233	ProCash 2000xe USB frontload	429	006429	м. Київ, вул. Радищева, 10/14 (ТОВ "Люксофт Україна")	5300841317	8A8E5AF920F7F263	56EA047D7D51818D	1	3	1	t
311	\N	801	007801	\N	5300241473	\N	\N	1	\N	\N	f
312	\N	802	007802	\N	5300241490	\N	\N	1	\N	\N	f
313	\N	809	007809	\N	5300241501	\N	\N	1	\N	\N	f
314	\N	812	007812	\N	5300396773	\N	\N	1	\N	\N	f
315	\N	814	007814	\N	5300255558	\N	\N	1	\N	\N	f
316	\N	813	007813	\N	5300241340	\N	\N	1	\N	\N	f
317	\N	820	007820	\N	5300255536	\N	\N	1	\N	\N	f
318	\N	823	007823	\N	5300318429	\N	\N	1	\N	\N	f
319	\N	401	009401	\N	5300255617	\N	\N	1	\N	\N	f
320	\N	879	007879	\N	5300817465	\N	\N	1	\N	\N	f
321	\N	404	009404	\N	5300255645	\N	\N	1	\N	\N	f
322	\N	405	009405	\N	5300255523	\N	\N	1	\N	\N	f
323	\N	410	009410	\N	5300255648	\N	\N	1	\N	\N	f
324	\N	411	009411	\N	5300255627	\N	\N	1	\N	\N	f
325	\N	413	009413	\N	5300255590	\N	\N	1	\N	\N	f
326	\N	414	009414	\N	5300255527	\N	\N	1	\N	\N	f
327	\N	415	009415	\N	5300255638	\N	\N	1	\N	\N	f
328	\N	416	009416	\N	5300278315	\N	\N	1	\N	\N	f
329	\N	418	009418	\N	5300278401	\N	\N	1	\N	\N	f
330	\N	417	009417	\N	5300278314	\N	\N	1	\N	\N	f
331	\N	420	009420	\N	5300295397	\N	\N	1	\N	\N	f
332	\N	422	009422	\N	5300278384	\N	\N	1	\N	\N	f
333	\N	424	009424	\N	5300278363	\N	\N	1	\N	\N	f
334	\N	426	009426	\N	5300278355	\N	\N	1	\N	\N	f
335	\N	429	009429	\N	5300278353	\N	\N	1	\N	\N	f
336	\N	430	009430	\N	5300278287	\N	\N	1	\N	\N	f
337	\N	434	009434	\N	5300278374	\N	\N	1	\N	\N	f
338	\N	438	009438	\N	5300304031	\N	\N	1	\N	\N	f
339	\N	440	009440	\N	5300304367	\N	\N	1	\N	\N	f
340	\N	444	009444	\N	5300278390	\N	\N	1	\N	\N	f
341	\N	448	009448	\N	5300278395	\N	\N	1	\N	\N	f
342	\N	454	009454	\N	5300305557	\N	\N	1	\N	\N	f
343	\N	456	009456	\N	5300304044	\N	\N	1	\N	\N	f
344	\N	455	009455	\N	5300304040	\N	\N	1	\N	\N	f
345	\N	457	009457	\N	5300304381	\N	\N	1	\N	\N	f
346	\N	458	009458	\N	5300304072	\N	\N	1	\N	\N	f
347	\N	459	009459	\N	5300304364	\N	\N	1	\N	\N	f
348	\N	470	009470	\N	5300304048	\N	\N	1	\N	\N	f
349	\N	469	009469	\N	5300304382	\N	\N	1	\N	\N	f
350	\N	471	009471	\N	5300304051	\N	\N	1	\N	\N	f
351	\N	473	009473	\N	5300135512	\N	\N	1	\N	\N	f
352	\N	475	009475	\N	5300304387	\N	\N	1	\N	\N	f
353	\N	476	009476	\N	5300318434	\N	\N	1	\N	\N	f
354	\N	482	009482	\N	5300318451	\N	\N	1	\N	\N	f
355	\N	490	009490	\N	5300337829	\N	\N	1	\N	\N	f
356	\N	491	009491	\N	5300337877	\N	\N	1	\N	\N	f
357	\N	495	009495	\N	5300337851	\N	\N	1	\N	\N	f
358	\N	496	009496	\N	5300337864	\N	\N	1	\N	\N	f
201	ProCash 2050xe	780	007780	м. Біла Церква, вул. Сухоярська, 14	5300217300	ACF79B440C367897	BA252377870EE541	1	\N	\N	f
27	2000xe	714	003714	м. Київ, вул.Північно-Сирецька, 3	5300727588	2F37BAE35013F1C1	A67653253DBE37BF	1	\N	1	f
19	ProCash 1500xe	008	003008	м. Київ, вул. Жилянська, 75	5300339120	71B1144C648D6506	342DBB6E3914016E	1	2	1	t
9	2050xe	730	003730	м. Житомир, вул. В. Бердичівська, 31	5300073479	B58D732F42CF65E9	D03791BC67EF1E2F	1	\N	\N	f
139	ProCash 2050xe USB	461	003461	м. Вінниця, вул. Келецька, 122-А	5300628798	43710C815EB2A794	3A3227CC874356C0	1	1	11	t
71	ProCash 1500xe USB	382	003382	м. Івано-Франківськ, вул. Юності, 23А	5300396771	A6154B597A242AFE	5BBDCF91A617DBFB	1	9	8	t
72	ProCash 1500xe USB	383	003383	м. Запоріжжя, вул. Новобудов, 7	5300396790	EAEF3D2034F85B2F	787BF6C841CFE9BB	1	9	7	t
87	ProCash 2050xe USB	310	003310	м. Харків, вул. От. Яроша, 18Д	5300396654	D601FF8C83614966	68C1D855D1155EE3	1	1	2	t
88	ProCash 2050xe USB	311	003311	м. Харків, проїзд Стадіонний, 5	5300396828	73FB51F4507D7EFA	AC2170386A608851	1	1	2	t
164	ProCash 2050xe USB	482	002482	м. Кагарлик, вул. Фрунзе, 99	5300396844	C641FE0346ADF415	9CE67B10F055D225	1	1	\N	t
136	ProCash 2050xe USB	002	003002	Харківська обл., смт. Коломак, вул. Перемоги, 123	5300638113	B9004A9803DD0DB1	059953C3297BEB18	1	1	\N	t
137	ProCash 2050xe USB	003	003003	м. Глобіно, вул. Карла Маркса, 200-Г	5300638050	301E6BF55440B187	DA072E8B4689C811	1	1	\N	t
153	ProCash 2000xe USB frontload	006	003006	с. Чижівка, вул. Чижівська, 4	5300652587	86B801BA926D37B9	246E7DEA13152F2A	1	3	\N	t
94	ProCash 1500xe	013	003013	с. Сокільники, вул. Стрийська, 30	5300339106	E441339D18809D58	48C1F8F299C92C2B	1	2	6	t
82	ProCash 2050xe USB	017	003017	м. Карлівка, вул. Первомайська, 6	5300396772	D7F7A676001CA9C0	991674B0ECE0E3F6	1	1	\N	t
38	ProCash 1500xe USB	391	003391	м. Дніпро, вул. Курсанська, 30	5300396774	9830467C55B3ED0E	2599DA821C1CD783	1	9	21	t
78	ProCash 2000xe	341	003341	Черкаська обл., Чорнобаївський р-н., с.Крутьки, вул.Устименка,104	5300555241	13B5B8F51824CD11	6B3BF0E7A0FA5DD9	1	4	\N	t
49	ProCash 2050xe USB	389	003389	м. Сєвєродонецьк, вул.Хіміків, 38	5300396696	19D8C4CE3921693A	4DCBF5D941168AD0	1	1	\N	t
63	ProCash 1500xe USB	507	003507	м. Ромни, вул. Тельмана,24	5300396791	51F7C2F980B82044	0DBE27A99A83653E	1	9	\N	t
140	ProCash 2050xe USB	509	003509	Охтирський р-н, с. Комиші, вул. Київська, 65	5300638354	A69F4DA97719F81F	9AAE75535A04D8C3	1	1	\N	t
7	ProCash 2050xe USB	518	003518	с. Жданівка, вул. Заводська, 2	5300396797	7C8E6395611DDBC2	CA8B8BBC3D299634	1	1	\N	t
59	ProCash 2050xe USB	643	003643	с. Брошнів-Осада, 22-го січня, 94	5300396729	E044C316EC646871	EEB6C99066B1253F	1	1	\N	t
142	ProCash 2000xe USB frontload	644	003644	м. Кременчук, вул. 40 років Жовтня, 14/69	5300636310	2FAD09F93CFB018A	C9B4ED47484E1452	1	3	\N	t
74	ProCash 2000xe	721	003721	м. Миколаїв, вул. Проектна, 3-В	5300137360	0377F5B4091F41BE	B9D1D64C37C1EE08	1	4	20	t
251	ProCash 2000xe	395	003395	м. Київ, провулок Тараса Шевченко, 3 (ГК "КЕРНЕЛ")	5300817073	A24C8248EB75A9F8	4A14CF20B5849F83	1	4	1	t
138	ProCash 2050xe USB	455	003455	м. Обухів, вул. Київська, 130	5300637910	930D86B8198C0AA0	4CCEA80145EF1BA7	1	1	\N	t
145	ProCash 2000xe USB frontload	712	003712	м. Обухів, вул. Київська, 130	5300636043	76E3641D4280C660	19DF5D48C605B808	1	3	\N	t
34	ProCash 2050xe	717	003717	с. Бородянка, вул. Леніна, 238	5300211716	998F2424E369D353	F6737669C2B8F99E	1	5	\N	t
8	ProCash 2000xe frontload	720	003720	м. Дергачі, вул. Залізнична, 31с	5300263883	4E4A09C4D9D818FA	3F4D38026C615961	1	8	\N	t
40	ProCash 2050	723	003723	м. Новомосковськ, вул. Перемоги, 8	5300017868	706D0CBA52C5238D	698C6C816146A65C	1	7	\N	t
219	ProCash 2050	726	003726	смт. Магдалинівка, вул. Радянська, 2	5300041968	439F527249B63BC2	2F532B12877F785B	1	7	\N	t
102	ProCash 2050xe USB	475	003475	м. Вінниця, вул. Фрунзе, 59	5300506100	F6DE4434BC60CBB8	D7DA7F40D596FB99	1	1	11	t
5	ProCash 2050	725	003725	м. Вінниця, вул. Театральна, 15	5300041947	40A3036E79FE9079	FC86C5C00BD0FB70	1	7	11	t
62	ProCash 2050xe	397	003397	м. Львів, вул. Червоної Калини, 109	5300337827	E3B38C3430401F6D	F64418CC22796672	1	5	12	t
65	ProCash 2000	708	003708	м. Львів, вул. Виговського, 100	6101476210	CCC546636639F8E9	04EF26B35C0A1B1A	1	6	12	t
68	ProCash 2050	722	003722	м. Львів, вул. Пекарська, 50	5300041657	16E716FD15174BC1	268B7D9DDCDB1602	1	7	12	t
73	ProCash 1500xe	381	003381	м. Одеса, вул. Маліновського, 51	5300339126	6297E03A73B5040A	5EC88B2DA14CED96	1	2	13	t
25	ProCash 1500xe	980	002980	м. Київ, вул. Спаська, 30А	5300318316	97944A6536288840	4C46196C02753AB7	1	2	1	t
30	ProCash 2050xe USB	009	003009	м. Яготин, вул. Незалежності, 104	5300396718	66D5FDB5F9446539	4B3015C085A8A0B2	1	1	\N	t
23	ProCash 2000xe	390	003390	м. Київ, бул. Івана Лепсе, 6-Ж (БЦ "L-Квартал")	5300806983	F3BD2402D4AFA993	9907982511862497	1	4	1	t
96	ProCash 2000xe frontload	728	003728	Рівненська обл., с. Зоря, вул. Промислова, 1	5300217298	E5A251BDE8288CD9	48550C0F3E68A606	1	8	\N	t
79	ProCash 2050xe	747	003747	м. Полтава, вул. Леніна, 69	5300165197	E77D8AB3BCBE7D58	6D5D1CDD650DD8AC	1	5	16	t
42	ProCash 2050xe	735	003735	м. Павлоград, вул. Шевченко, 118	5300278359	F815413C336D5F11	E78EEB0D3B69EB06	1	5	\N	t
90	ProCash 2050xe	740	003740	Богодухівський р-н, смт. Гути, вул. Леніна, 29	5300095706	4FD9206EAC0C862F	7AAA091E90E2B8F7	1	5	\N	t
45	ProCash 2000xe frontload	749	003749	смт. Славгород, вул. Заводська, 1-б	5300173258	508507D1A541F772	134528660E2CAD76	1	8	\N	t
143	ProCash 2000xe USB frontload	780	003780	м. Херсон, Бериславське шосе, 37	5300637294	49FDA3E5124003DC	4D5898E89F9589DB	1	3	14	t
141	ProCash 2050xe USB	778	003778	Покровський р-н, с. Коломійці, вул. Леніна, 36	5300637921	C3B8ECFD4B7F425E	CADC457A3F266129	1	1	\N	t
93	ProCash 2050xe USB	910	003910	м. Кам'янка-Бузька, вул. Я.Мудрого, 62	5300396722	A926FFB93AE1D85E	C2EA9310FFD22D41	1	1	\N	t
242	ProCash 2000xe USB frontload	956	003956	м. Дніпро, бул. Катеринославський, 1	5300841383	356A9267DB86C8C8	C6DB363C30AF69B6	1	3	21	t
171	ProCash 2050xe USB	589	006589	м. Дніпро, вул. Базова, 2	5300635495	E182F4663351BBA1	82FDDAD797D166A1	1	1	21	t
103	ProCash 2050xe	744	006744	м. Івано-Франківськ, вул. Залізнична, 30	5300527324	4EECF7C11343A31D	A82E59BC2652B804	1	5	22	t
183	ProCash 2050xe USB	145	005145	смт. Меденичі, вул. Дрогобицька, 2	5300634794	B55904D88BEFC978	D36E9EA71159075A	1	1	\N	t
186	ProCash 2050xe	218	005218	Красноармійський р-н, смт. Удачне, вул. Залізнична, 53	5300634744		3E2426C14C73FD1E	1	5	\N	t
100	ProCash 2050xe USB	418	006418	м. Пирятин, вул. Сумська, 1	5300396800	3544ADE24D7C6E41	BBE50ED48C30B33F	1	1	\N	t
193	ProCash 2000xe USB frontload	587	006587	м. Обухів, вул Київська, 119	5300704173	3CCCC26C4DFA08C0	5F4157735062062D	1	3	\N	t
174	ProCash 2050xe USB	611	006611	Липоводолинський р-н, с. Калинівське, вул. Першотравнева, 1	5300710329	B6B05ACB5AD63B38	32B0D8AB6550B81A	1	1	\N	t
173	ProCash 2000xe	628	006628	Яворівський р-н, с. Підрясне, вул. Європейська, 1	5300783893	B03F34EAD4910B4E	0A512DDAEECC8294	1	4	\N	t
117	ProCash 2050xe USB	759	006759	смт. Томашпіль, вул. Криворучко, 1	5300527014	176A2756BD2D42C9	1BE2F33FD7E7FAF0	1	1	\N	t
202	ProCash 2000xe	760	006760	Черкаська обл., с. Білозірья, вул. Леніна, 2а	5300522925	03878933C720A0B7	36530A302E92EF96	1	4	\N	t
132	ProCash 2050xe USB	011	005011	м. Вінниця, вул. Пирогова, 109	5300629453	960726BA77D7FE0F	69DE5D8C42D88FED	1	1	11	t
123	ProCash 2050xe USB	420	006420	м. Вінниця, вул. Хмельницьке шоссе, 25	5300396827	C0E52FDF1EB6D375	F47B0A8C3A365B33	1	1	11	t
234	ProCash 2050xe USB	695	006695	м. Львів, вул. Пастернака, 5	5300726721	CB54D7F9C094F42B	535DEE4C6D25E45C	1	1	12	t
149	ProCash 2050xe USB	439	006439	м. Одеса, вул. Картамишевська, 9/В	5300638710	E2B6FA10C5B1BFF6	94D50C630E7293B5	1	1	13	t
150	ProCash 2000xe USB frontload	441	006441	Київська обл., м. Миронівка, вул.Елеваторна, 1	5300636768	9D4861154633A56C	25E3935FB01D3E08	1	3	\N	t
151	ProCash 2000xe USB frontload	466	006466	м. Київ, пр-т, Московський, 13-В	5300636400	D568298EA38D0C7C	0B870E603289DF82	1	3	1	t
101	ProCash 2000xe USB frontload	742	006742	м. Київ, вул.Залізничне шосе, 6	5300524261	FC5C0AA429A4B5F3	C756C3A9E2322324	1	3	1	t
228	ProCash 2050xe	741	003741	м. Суми, вул. Горького, 1	5300135614	E3D390DC0016B749	30A8D7F4ED990884	1	5	17	t
130	ProCash 2050xe USB	009	005009	м. Дрогобич, пл. Ринок, 20 (ТЦ "Верховина")	5300629654	51134A7AA4E4972A	D68E74FAB1659B91	1	1	\N	t
175	ProCash 2050xe USB	694	006694	Бориспільский р-н, с. Любарці, вул. Леніна, 69-а	5300554164	C897D3B05B88849F	2E931188C11E74C4	1	1	\N	t
152	ProCash 2000xe frontload	769	006769	с. Струмівка, вул. Рівенська, 4	5300627979	B2B384CE729DC3F9	D155A56B3A533ED6	1	8	\N	t
109	ProCash 2000xe USB frontload	774	006774	Херсонська обл., Чаплинський р-н, с.Долинське, вул. Миру, 4	5300522948	E31C400959726186	9F3931255263E0AD	1	3	\N	t
106	ProCash 2050xe USB	778	006778	с. Човно-Федорівка, вул. Леніна, 12	5300526985	7389A563B0CFC5F4	269014025A131622	1	1	\N	t
107	ProCash 2050xe USB	798	006798	м. Карлівка, вул. Спартака, 3а	5300553010	1C5CC13FBC561A60	75FE9104450E4CE8	1	1	\N	t
108	ProCash 2000xe USB frontload	799	006799	смт. Пилиповичи, вул.Привокзальна, 15	5300554928	1034DF868BE7E0A1	2E8D173822587FF2	1	3	\N	t
116	ProCash 2050xe USB	822	006822	м. Калуш, вул. Б.Хмельницького, 30	5300552426	2D2AAE640177A7D7	0AF4127F1F52DCD4	1	1	\N	t
76	ProCash 2000xe	765	007765	м. Кропивницький, пр-т. Промисловий, 14 (ТОВ Завод модифікованих жирів)	5300816147	6947E11FA465BDD4	045724E395387E63	1	4	17	t
118	ProCash 2050xe USB	016	007016	смт. Червоногригорівка вул. Кооперативна 1	5300552384	8F9BB7A124D80E2C	E31137EDA6FADF12	1	1	\N	t
119	ProCash 2050xe	018	007018	м. Кременчук, вул. Соборна, 32-29	5300552092	5A1E931F4FC0B50C	21EAB5282B2C7B64	1	5	\N	t
114	ProCash 2000xe USB frontload	019	007019	Петриківський р-н, с.Єлизаветівка, вул. Б.Хмельницького, 1	5300604032	2C91BF008EB4A8B1	096B2C16CAB515CB	1	3	\N	t
56	ProCash 2050xe	771	007771	м. Ковель, вул. Незалежності, 138м(вул. Шевченка, 9)	5300217306	79446C58996B233F	4406C5CA3F4B79DF	1	5	19	t
121	ProCash 2000xe USB frontload	034	007034	м. Канів, вул. Леніна, 161/1	5300524268	F455139289D3D887	78FD3262242F9197	1	3	\N	t
122	ProCash 2050xe USB	040	007040	Олександрійський р-н., с. Нова Прага, вул. Жовтнева, 21	5300607535	0DF752A133EB6874	F47B820D8EDB13B0	1	1	\N	t
166	ProCash 2050xe USB	052	007052	Київська обл., м. Тараща, вул. Шевченка, 66	5300607597	E3CA5CF3160089BA	E397D32AB280DDFC	1	1	\N	t
37	ProCash 2050xe	758	007758	м. Дніпро, вул. Шмідта, 2	5300213038	A9C83D422060F50C	9BC8E7C065A95F7B	1	5	21	t
167	ProCash 2000xe frontload	075	007075	м. Бориспіль, вул. Київський шлях, 2/6	5300627938	988121552D085149	3E98C07BA88AEE5A	1	8	\N	t
131	ProCash 2050xe USB	076	007076	Одеська обл., м. Южне, вул. Леніна, 15	5300628538	D4A9E0DDFE7FD1A2	F832456198BBC244	1	1	\N	t
70	ProCash 2050xe USB	750	007750	Жовтневий р-н, смт. Первомайське, вул. Заводська, 2	5300726778	FED83FF2F12E3B53	845ACB11A8AEC5E2	1	1	\N	t
237	ProCash 2000xe USB frontload	762	007762	м. Київ, бул. Дружби Народів, 19, (БЦ "Дружби Народів")	5300841307	168FED15650C7694	AC0A4E5F6B4241DF	1	3	1	t
61	ProCash 2050xe	752	007752	м. Коломия, вул. Пл. Відродження 14	5300211749	8DA1DC7AAEB2D6DE	47B2599BD453D44F	1	5	\N	t
249	ProCash 2000xe	756	007756	с. Струмівка, вул. Рівненська, 4	5300816010	9D10070405029E44	FC74442C7F4C8529	1	4	\N	t
32	ProCash 2050xe	763	007763	смт. Баришівка, вул. Жовтнева, 10	5300211743	04431C2AA34531B9	B34C6F4E4DF539DA	1	5	\N	t
99	ProCash 2050xe	766	007766	м. Білгород-Дністровський, вул. Московська , 2	5300217305	2CFD252B12B316D6	1FF1890703303A89	1	5	\N	t
41	ProCash 2050xe	774	007774	м. Новомосковськ, вул. Радянська, 33/33	5300217248	0AC5B541A779FF03	8D55D8EE7C73FC93	1	5	\N	t
91	ProCash 2050xe	783	007783	м. Чугуїв, вул. Комарова, 12	5300217372	59DA176F8B07282F	302D5F58D6C5A64C	1	5	\N	t
89	ProCash 2000xe frontload	753	007753	м. Харків, вул. Університетська, 27	5300204669	B117E6AA3F7955E9	AEBB68C9F025F394	1	8	2	t
4	ProCash 2050xe	761	007761	м. Вінниця, Пірогова, 112	5300211770	30B45497EC356E89	0FA2F02C817BF8F6	1	5	11	t
1	ProCash 2050xe	784	007784	м. Вінниця, вул.Соборна 68	5300217365	6C2770C4FE340701	184E0DD777FA1808	1	5	11	t
159	ProCash 2000xe USB frontload	668	007668	м. Львів, вул. Заповітна, 1	5300635905	676DD484E87137B4	8A3102BFD15CDBC5	1	3	12	t
67	ProCash 2050xe	769	007769	м. Львів, вул. Люблінська, 100	5300213122	DE02C1EE60E5AECE	8D6B27BE5AD0E0D3	1	5	12	t
260	ProCash 2000xe	767	006767	Первомайський р-н, с. Бандурка, вул. Центральна, 401	5300173212	\N	\N	1	4	\N	t
113	ProCash 2050xe USB	839	006839	м. Луцьк, пр. Соборності, 11	5300553067	9995C8A225F12D8A	8E3F4277BFCF320D	1	1	2	t
227	ProCash 2000xe USB frontload	777	006777	м. Київ, вул. Миколи Грінченка, 4-В	5300841303	E0056E0ABA175D65	50603DB998B8540C	1	3	1	t
194	ProCash 1500xe	775	006775	м. Київ, вул. Краснова, 27	5300396777	EC134D63B5609EE0	C3F0F78DDEC2CD77	1	2	1	t
128	ProCash 2000xe USB frontload	035	007035	м. Київ, пр-т Возз'єднання, 2/1А	5300555205	99305D500B6C8245	6EBEF3DD1F4D96B2	1	3	1	t
95	ProCash 2050xe	791	007791	м. Глухів, вул. Києво Московська, 30 А	5300241474	B1E36F0A850F6151	C8B6A8B04DBFC5C3	1	5	\N	t
39	ProCash 2000xe frontload	796	007796	м. Нікополь, вул. Електрометалургів, 302	5300241689	165C03CF4C16C91D	7C08AEB58C05D713	1	8	\N	t
239	ProCash 2050xe	453	009453	м. Кропивницький, вул.Урожайна, 30	5300337842	43BEDC70221C1B76	16565027C680898F	1	5	17	t
66	ProCash 2050xe	806	007806	м. Бібрка, вул. Тарнавського,22	5300241508	27FC4D4544670711	02C9CB9B58CDE8D6	1	5	\N	t
83	ProCash 2000xe	787	007787	Черкаська обл., Канівський р-н, с. Степанці, вул. Польова, 1	5300841333	297E1B22ADDFD1BD	0BED6AFDCB8F5C00	1	4	\N	t
245	ProCash 2050xe	815	007815	м. Костянтинівка, бульвар космонавтів, 1а	5300241397	\N	\N	1	5	\N	t
92	ProCash 2000xe frontload	817	007817	смт. Солоницівка, вул. Заводська, 1	5300217262	2405CE0D40E549D2	16A439E01DE37FCB	1	8	\N	t
244	ProCash 2000xe USB frontload	824	007824	Київська обл., Вишгородський р-н, с. Старі Петрівці, вул. Польова, 17	5300841326	16CC8238C6B93D48	9B22AA2F15B17822	1	3	\N	t
157	ProCash 2050xe USB	892	007892	Томацький р-н, с. Запоріжжя, вул. 50 років Жовтня, 21	5300654506	58775372A66393DB	B6EA4FA487ABD600	1	1	\N	t
172	ProCash 2050xe USB	988	007988	смт. Тростянець, вул. Леніна,39	5300634649	6D996AE8F6CA8F18	E1D8F7664E7F7E6A	1	1	\N	t
98	ProCash 2050xe USB	402	009402	м. Миргород, вул. Мінзаводська, 3	5300462130	F4C15DF86849E563	A55D3013789EC189	1	1	\N	t
261	ProCash 2050xe	403	009403	м. Володимир-Волинський, вул. Ковельстка, 7	5300255636	\N	\N	1	5	\N	t
238	ProCash 2000xe	407	009407	м. Вовчанськ, пл. Привокзальна, 11	5300806974	413F6B9D071324D5	9D6150AE22CD2725	1	4	\N	t
15	ProCash 2050xe	408	009408	с. Пісківка, вул. Жовтнева, 1	5300255629	0738C78880AFF5D7	C58D5E9569673D39	1	5	\N	t
31	ProCash 2050xe USB	435	009435	Київська обл., м. Миронівка, вул. Фрунзе, 16	5300638300	3247D68C25307613	0B51B3DD381ABF3A	1	1	\N	t
43	ProCash 2000xe frontload	445	009445	м. Синельникове, вул. Миру, 26а	5300304002	9F7C3D2A1AC7F3CE	AE0C88E54BD89664	1	8	\N	t
58	ProCash 2050xe	452	009452	м. Мукачево, вул. Новий Пасаж, 6	5300318477	61497E22C0C89CC2	2148A5DCE91829DF	1	5	\N	t
81	ProCash 2050xe	460	009460	м. Миргород, вул. Гоголя, 139в	5300318480	06EA9C486EEFCD26	C154D8588E95CC18	1	5	\N	t
85	ProCash 2050xe	468	009468	c. Худяки, вул. Кірова, 30	5300304368	756FD48DF790498E	2ADAAAC476ED9CD2	1	5	\N	t
240	ProCash 2050xe	462	009462	м. Миколаїв, вул. Нікольська, 24	5300304375	D07D7C75210129FE	B7E4894293E8A872	1	5	20	t
262	ProCash 2000xe	437	009437	м. Дніпро, вул. Ударників, 54	5300304050	\N	\N	1	4	21	t
46	ProCash 2050xe	489	009489	с. Миколаївка, вул. Коцюби, 1	5300337895	2DBEF88D7BC20C08	E3DC04A251C58A74	1	5	\N	t
57	ProCash 2050xe	493	009493	Ружинський р-н, с. Немиринці, вул. Центральна, 41	5300337890	2A6506F50F5FE263	4235B0CC7E0D1039	1	5	\N	t
156	ProCash 2000xe USB frontload	883	007883	м. Харків, пр. Московський, 195	5300652237	A6C31D4E1C635BEE	1D13BBBB6434F3F5	1	3	2	t
60	ProCash 2050xe	436	009436	м. Івано-Франківськ, вул. Галицька, 22	5300304063	D040BA6890DE6283	FB2DEF9CF030B571	1	5	8	t
2	ProCash 2050xe	465	009465	м. Вінниця, вул. Келецька, 36/66	5300318472	E91CA1F663FC7296	BE6EC5389C811A91	1	5	11	t
6	ProCash 2050xe USB	497	009497	м. Вінниця, пл. Героїв Сталінграду	5300396727	A9B52CD7F263228E	BEA2CD3289AF2E43	1	1	11	t
64	ProCash 2000xe frontload	810	007810	м. Львів, вул. Богдана Хмельницького, 176	5300241700	4C99477AAB99850E	F3A1B0EEABD4DB37	1	8	12	t
97	ProCash 2050xe	472	009472	м. Львів, пр. Чорновола, 95	5300318465	B8D2E931893A5A13	0B9DAF30F8F3743A	1	5	12	t
84	ProCash 2050xe USB	498	009498	м. Львів, вул. Клепарівська, 18	5300396639	F6AD50BE312D153B	56E597FA7EC1DCDE	1	1	12	t
35	ProCash 2000xe frontload	406	009406	м. Запоріжжя, вул. Сапожнікова, 6	5300263992	7C32B555002B547A	EDCD9B97513339C9	1	8	7	t
247	ProCash 2000xe	464	009464	м. Київ, вул. Московська, 32-34/Резницька,2	5300783727	\N	\N	1	4	1	t
135	ProCash 2000xe frontload	439	009439	м. Суми, вул. Лушпи, 4/1	5300304015	FB422B82F68EEDFD	4A6115FB0487056F	1	8	17	t
75	ProCash 2000xe USB	483	009483	м. Тростянець, вул. Набережна, 28-А	5300841392	A3911221DF63EC95	DEA7E6830241E1BE	1	11	\N	t
250	ProCash 2000xe	494	009494	м. Шостка, вул. Свободи, 30	5300817091	\N	\N	1	4	\N	t
18	ProCash 2050xe	446	009446	м. Київ, вул. Драгоманова, 29	5300304384	0A016B49495520D8	3874F9CF6AC9EDE4	1	5	1	t
160	ProCash 2000xe USB frontload	880	007880	м. Київ, вул. Академіка Янгеля, 3	5300636441	C5EF4D004708FE37	D9A09066A6C1A887	1	3	1	t
223	ProCash 2050xe	425	009425	м. Ужгород, Гагаріна, 30	5300278388	41BB88EBD4DE3329	E76EB5D5EE8B59E1	1	5	23	t
12	ProCash 2050xe	821	007821	смт. Білогір'я, вул. Миру, 3а	5300255557	A9D4219DAD03BDCB	37FFDE12C0D8D876	1	5	\N	t
163	ProCash 2000xe	888	007888	смт. Приколотне, вул. Центральна, 45	5300807513	7EDFFABF493046B2	D3A3EE81771B0116	1	4	\N	t
14	ProCash 2050xe USB	499	009499	м. Березань, вул. Привокзальна, 1А	5300396843	D86C4BD3EB738ED3	C1C52F8546E5BC1E	1	1	\N	t
\.


--
-- TOC entry 2195 (class 0 OID 0)
-- Dependencies: 187
-- Name: atms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('atms_id_seq', 360, true);


--
-- TOC entry 2171 (class 0 OID 16492)
-- Dependencies: 186
-- Data for Name: banks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY banks (id, name_short, name_full, name_alias) FROM stdin;
2	usb	UniCredit Bank	УкрСоц Банк
1	index	Credit Agricole	Індекс Банк
\.


--
-- TOC entry 2196 (class 0 OID 0)
-- Dependencies: 185
-- Name: banks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('banks_id_seq', 6, true);


--
-- TOC entry 2178 (class 0 OID 25156)
-- Dependencies: 193
-- Data for Name: models; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY models (name, vendor_id, id) FROM stdin;
ProCash 2050xe USB	1	1
ProCash 1500xe	1	2
ProCash 2000xe USB frontload	1	3
ProCash 2000xe	1	4
ProCash 2050xe	1	5
ProCash 2000	1	6
ProCash 2050	1	7
ProCash 2000xe frontload	1	8
ProCash 1500xe USB	1	9
ProCash 2050xe USB frontload	1	10
ProCash 2000xe USB	1	11
ProCash 2050xe frontload	1	15
\.


--
-- TOC entry 2197 (class 0 OID 0)
-- Dependencies: 196
-- Name: models_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('models_id_seq', 15, true);


--
-- TOC entry 2175 (class 0 OID 16919)
-- Dependencies: 190
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY regions (id, name) FROM stdin;
1	Вінницька
2	Волинська
3	Дніпропетровська
4	Донецька
5	Житомирська
6	Закарпатська
7	Запорізька
8	Івано-Франківська
9	Київська
10	Кіровоградська
11	Луганська
12	Львівська
13	Миколаївська
14	Одеська
15	Полтавська
16	Рівненська
17	Сумська
18	Тернопільська
19	Харківська
20	Херсонська
21	Хмельницька
22	Черкаська
23	Чернівецька
24	Чернігівська
\.


--
-- TOC entry 2198 (class 0 OID 0)
-- Dependencies: 189
-- Name: regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('regions_id_seq', 27, true);


--
-- TOC entry 2176 (class 0 OID 16935)
-- Dependencies: 191
-- Data for Name: towns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY towns (region_id, name, id) FROM stdin;
9	Київ м.	1
19	Харків м.	2
15	Глобіно м.	3
5	Чижівка с.	4
9	Яготин м.	5
12	Сокільники с.	6
1	Вінниця м.	11
12	Львів м.	12
14	Одеса м.	13
20	Херсон м.	14
12	Підрясне с.	15
15	Полтава м.	16
10	Кропивницький м.	17
2	Ковель м.	19
13	Миколаїв м.	20
3	Дніпро м.	21
8	Івано-Франківськ м.	22
6	Ужгород м.	23
\.


--
-- TOC entry 2199 (class 0 OID 0)
-- Dependencies: 195
-- Name: towns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('towns_id_seq', 23, true);


--
-- TOC entry 2177 (class 0 OID 25147)
-- Dependencies: 192
-- Data for Name: vendors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vendors (name, id) FROM stdin;
WincorNixdorf	1
Diebold	2
NCR	3
\.


--
-- TOC entry 2200 (class 0 OID 0)
-- Dependencies: 194
-- Name: vendors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('vendors_id_seq', 6, true);


--
-- TOC entry 2041 (class 2606 OID 16896)
-- Name: atms atms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY atms
    ADD CONSTRAINT atms_pkey PRIMARY KEY (id);


--
-- TOC entry 2043 (class 2606 OID 25245)
-- Name: atms atms_serial_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY atms
    ADD CONSTRAINT atms_serial_key UNIQUE (serial);


--
-- TOC entry 2039 (class 2606 OID 16497)
-- Name: banks banks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY banks
    ADD CONSTRAINT banks_pkey PRIMARY KEY (id);


--
-- TOC entry 2051 (class 2606 OID 25219)
-- Name: models models_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY models
    ADD CONSTRAINT models_pkey PRIMARY KEY (id);


--
-- TOC entry 2045 (class 2606 OID 16924)
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- TOC entry 2047 (class 2606 OID 25211)
-- Name: towns towns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY towns
    ADD CONSTRAINT towns_pkey PRIMARY KEY (id);


--
-- TOC entry 2049 (class 2606 OID 25201)
-- Name: vendors vendors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vendors
    ADD CONSTRAINT vendors_pkey PRIMARY KEY (id);


--
-- TOC entry 2052 (class 2606 OID 16941)
-- Name: towns towns_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY towns
    ADD CONSTRAINT towns_region_id_fkey FOREIGN KEY (region_id) REFERENCES regions(id);


-- Completed on 2017-10-22 12:53:50

--
-- PostgreSQL database dump complete
--

