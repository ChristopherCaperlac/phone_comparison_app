--
-- PostgreSQL database dump
--

\restrict 8l3jvDtmqgcKqQUJQc8JrXYvk42dQ5MdHKAmroSsWbGmmPLMii1Bf7iu9fRkowW

-- Dumped from database version 16.11 (Ubuntu 16.11-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.11 (Ubuntu 16.11-0ubuntu0.24.04.1)

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
-- Name: cellphonecompany; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.cellphonecompany (
    name text NOT NULL
);


ALTER TABLE public.cellphonecompany OWNER TO "user";

--
-- Name: chip; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.chip (
    companyname text NOT NULL,
    modelname text NOT NULL,
    rating numeric(3,1),
    corecount integer,
    clockspeed numeric,
    source text
);


ALTER TABLE public.chip OWNER TO "user";

--
-- Name: chipmanufacturer; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.chipmanufacturer (
    name text NOT NULL
);


ALTER TABLE public.chipmanufacturer OWNER TO "user";

--
-- Name: company; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.company (
    name text NOT NULL,
    ceo text,
    website text
);


ALTER TABLE public.company OWNER TO "user";

--
-- Name: contains; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.contains (
    p_companyname text NOT NULL,
    p_modelname text NOT NULL,
    c_companyname text NOT NULL,
    c_modelname text NOT NULL
);


ALTER TABLE public.contains OWNER TO "user";

--
-- Name: phonemodel; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.phonemodel (
    companyname text NOT NULL,
    modelname text NOT NULL,
    rating numeric(3,1),
    displaysize numeric,
    price money,
    weight numeric,
    batterycapacity integer,
    releaseyear integer,
    iprating integer[],
    source text,
    CONSTRAINT phonemodel_iprating_check CHECK ((cardinality(iprating) = 2))
);


ALTER TABLE public.phonemodel OWNER TO "user";

--
-- Data for Name: cellphonecompany; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.cellphonecompany (name) FROM stdin;
Samsung
Apple Inc
Sony
Motorola
Google
Nothing
\.


--
-- Data for Name: chip; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.chip (companyname, modelname, rating, corecount, clockspeed, source) FROM stdin;
TSMC	A19 Pro	98.0	6	4260	https://nanoreview.net/en/soc/apple-a19-pro
TSMC	A19	97.0	6	4260	https://nanoreview.net/en/soc/apple-a19
Samsung	Exynos 2400	87.0	10	3210	https://nanoreview.net/en/soc/samsung-exynos-2400
TSMC	Helio G99	33.0	8	2200	https://nanoreview.net/en/soc/mediatek-helio-g99
Samsung	Exynos 133-	34.0	8	2400	https://nanoreview.net/en/soc/samsung-exynos-1330
TSMC	Snapdragon 8 Elite (Gen 4)	98.0	8	4320	https://nanoreview.net/en/soc/qualcomm-snapdragon-8-gen-4
Samsung	Snapdragon 6 Gen 3	43.0	8	2400	https://nanoreview.net/en/soc/qualcomm-snapdragon-6-gen-3
TSMC	Snapdragon 8 Gen 3	92.0	8	3300	https://nanoreview.net/en/soc/qualcomm-snapdragon-8-gen-3
Samsung	Snapdragon 6 Gen 1	40.0	8	2200	https://nanoreview.net/en/soc/qualcomm-snapdragon-6-gen-1
TSMC	Dimensity 6300	35.0	8	2400	https://nanoreview.net/en/soc/mediatek-dimensity-6300
Samsung	Snapdragon 7s Gen 2	42.0	8	2400	https://nanoreview.net/en/soc/qualcomm-snapdragon-7s-gen-2
TSMC	Snapdragon 7 Gen 3	50.0	8	2630	https://nanoreview.net/en/soc/qualcomm-snapdragon-7-gen-3
TSMC	Snapdragon 695 5G	35.0	8	2200	https://nanoreview.net/en/soc/qualcomm-snapdragon-695
TSMC	Google Tensor G5	71.0	8	3780	https://nanoreview.net/en/soc/google-tensor-g5
Samsung	Google Tensor G4	72.0	8	3100	https://nanoreview.net/en/soc/google-tensor-g4
TSMC	Snapdragon 778G+ 5G	43.0	8	2500	https://nanoreview.net/en/soc/qualcomm-snapdragon-778g-plus
TSMC	Dimensity 7200 Pro	46.0	8	2800	https://nanoreview.net/en/soc/mediatek-dimensity-7200
TSMC	Snapdragon 8+ Gen 1	70.0	8	3200	https://nanoreview.net/en/soc/snapdragon-8-plus-gen-1
TSMC	Snapdragon 7s Gen 3	50.0	8	2500	https://nanoreview.net/en/soc/qualcomm-snapdragon-7s-gen-3
\.


--
-- Data for Name: chipmanufacturer; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.chipmanufacturer (name) FROM stdin;
TSMC
Samsung
\.


--
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.company (name, ceo, website) FROM stdin;
TSMC	C. C. Wei	https://www.tsmc.com/english
Samsung	Jun Young Hyun	https://www.samsung.com/us/
Apple Inc	Tim Cook	https://www.apple.com/
Sony	Hiroki Totoki	https://www.sony.com/en/
Motorola	Christopher Galvin	https://web.archive.org/web/20101231101257/http://www.motorola.com/
Google	Sundar Pichai	https://about.google/
Nothing	Carl Pei	https://nothing.tech/
\.


--
-- Data for Name: contains; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.contains (p_companyname, p_modelname, c_companyname, c_modelname) FROM stdin;
Apple Inc	iPhone 17 Pro Max	TSMC	A19 Pro
Apple Inc	iPhone 17	TSMC	A19
Apple Inc	iPhone 17 Pro	TSMC	A19 Pro
Apple Inc	iPhone Air	TSMC	A19 Pro
Samsung	Samsung Galaxy S25 FE	Samsung	Exynos 2400
Samsung	Samsung Galaxy A07 4G	TSMC	Helio G99
Samsung	Samsung Galaxy A17	Samsung	Exynos 133-
Samsung	Samsung Galaxy S25 Edge	TSMC	Snapdragon 8 Elite (Gen 4)
Sony	Sony Xperia 10 VII	Samsung	Snapdragon 6 Gen 3
Sony	Sony Xperia 1 VII	TSMC	Snapdragon 8 Elite (Gen 4)
Sony	Sony Xperia 10 VI	Samsung	Snapdragon 6 Gen 1
Motorola	Motorola Moto G Power	TSMC	Dimensity 6300
Motorola	Motorola Edge 50 Fusion	Samsung	Snapdragon 7s Gen 2
Motorola	Motorola Edge 50 Pro	TSMC	Snapdragon 7 Gen 3
Motorola	Motorola Moto G84	TSMC	Snapdragon 695 5G
Google	Google Pixel 10 Pro XL	TSMC	Google Tensor G5
Google	Google Pixel 10 Pro	TSMC	Google Tensor G5
Google	Google Pixel 10	TSMC	Google Tensor G5
Google	Google Pixel 9a	Samsung	Google Tensor G4
Nothing	Nothing Phone (1)	TSMC	Snapdragon 778G+ 5G
Nothing	Nothing Phone (2a)	TSMC	Dimensity 7200 Pro
Nothing	Nothing Phone (2)	TSMC	Snapdragon 8+ Gen 1
Nothing	Nothing Phone (3a)	TSMC	Snapdragon 7s Gen 3
Sony	Sony Xperia 1 VI	TSMC	Snapdragon 8 Gen 3
\.


--
-- Data for Name: phonemodel; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.phonemodel (companyname, modelname, rating, displaysize, price, weight, batterycapacity, releaseyear, iprating, source) FROM stdin;
Apple Inc	iPhone 17 Pro Max	4.4	6.9	$1,750.00	233	5088	2025	{6,8}	https://www.gsmarena.com/apple_iphone_17_pro_max-13964.php
Apple Inc	iPhone 17	4.3	6.3	$1,128.00	177	3692	2025	{6,8}	https://www.gsmarena.com/apple_iphone_17-14050.php
Apple Inc	iPhone 17 Pro	4.4	6.3	$1,550.00	206	4252	2025	{6,8}	https://www.gsmarena.com/apple_iphone_17_pro-14049.php
Apple Inc	iPhone Air	4.0	6.5	$960.00	165	3149	2025	{6,8}	https://www.gsmarena.com/apple_iphone_17_air-13502.php
Samsung	Samsung Galaxy S25 FE	4.2	6.7	$650.00	190	4900	2025	{6,8}	https://www.gsmarena.com/samsung_galaxy_s25_fe_5g-14042.php
Samsung	Samsung Galaxy A07 4G	3.5	6.7	$145.00	184	5000	2025	{5,4}	https://www.gsmarena.com/samsung_galaxy_a07-14066.php
Samsung	Samsung Galaxy A17	3.4	6.7	$203.00	192	5000	2025	{5,4}	https://www.gsmarena.com/samsung_galaxy_a17_5g-14041.php
Samsung	Samsung Galaxy S25 Edge	4.2	6.7	$540.00	163	3900	2025	{6,8}	https://www.gsmarena.com/samsung_galaxy_s25_edge-13506.php
Sony	Sony Xperia 10 VII	3.9	6.1	$522.00	168	5000	2025	{6,8}	https://www.gsmarena.com/sony_xperia_10_vii_5g-14137.php
Sony	Sony Xperia 1 VII	4.3	6.5	$1,633.00	197	5000	2025	{6,8}	https://www.gsmarena.com/sony_xperia_1_vii_5g-13843.php
Sony	Sony Xperia 1 VI	4.5	6.5	$1,796.00	192	5000	2025	{6,8}	https://www.gsmarena.com/sony_xperia_1_vi-13003.php
Sony	Sony Xperia 10 VI	3.7	6.1	$600.00	164	5000	2024	{6,8}	https://www.gsmarena.com/sony_xperia_10_vi-13002.php
Motorola	Motorola Moto G Power	3.7	6.8	$170.00	208	5000	2025	{6,9}	https://www.gsmarena.com/motorola_moto_g_power_(2025)-13623.php
Motorola	Motorola Edge 50 Fusion	4.0	6.7	$289.00	174.9	5000	2024	{6,8}	https://www.gsmarena.com/motorola_edge_50_fusion-12871.php
Motorola	Motorola Edge 50 Pro	4.1	6.7	$399.00	186	4500	2024	{6,8}	https://www.gsmarena.com/motorola_edge_50_pro-12909.php
Motorola	Motorola Moto G84	4.0	6.5	$455.00	166.8	5000	2023	{5,4}	https://www.gsmarena.com/motorola_moto_g84-12526.php
Google	Google Pixel 10 Pro XL	4.4	6.8	$1,000.00	232	5200	2025	{6,8}	https://www.gsmarena.com/google_pixel_10_pro_xl_5g-13988.php
Google	Google Pixel 10 Pro	4.4	6.3	$1,219.00	207	4870	2025	{6,8}	https://www.gsmarena.com/google_pixel_10_pro_5g-13987.php
Google	Google Pixel 10	4.1	6.3	$715.00	204	4970	2025	{6,8}	https://www.gsmarena.com/google_pixel_10_5g-13979.php
Google	Google Pixel 9a	4.0	6.3	$490.00	186	5100	2025	{6,8}	https://www.gsmarena.com/google_pixel_9a-13478.php
Nothing	Nothing Phone (1)	4.3	6.55	$700.00	193.5	4500	2022	{5,3}	https://www.gsmarena.com/nothing_phone_(1)-11636.php
Nothing	Nothing Phone (2a)	4.2	6.7	$399.00	190	5000	2024	{5,4}	https://www.gsmarena.com/nothing_phone_(2a)-12760.php
Nothing	Nothing Phone (2)	4.4	6.7	$650.00	201.2	4700	2023	{5,4}	https://www.gsmarena.com/nothing_phone_(2)-12386.php
Nothing	Nothing Phone (3a)	4.1	6.77	$470.00	201	5000	2025	{6,4}	https://www.gsmarena.com/nothing_phone_(3a)-13672.php
\.


--
-- Name: cellphonecompany cellphonecompany_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.cellphonecompany
    ADD CONSTRAINT cellphonecompany_pkey PRIMARY KEY (name);


--
-- Name: chip chip_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.chip
    ADD CONSTRAINT chip_pkey PRIMARY KEY (companyname, modelname);


--
-- Name: chipmanufacturer chipmanufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.chipmanufacturer
    ADD CONSTRAINT chipmanufacturer_pkey PRIMARY KEY (name);


--
-- Name: company company_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (name);


--
-- Name: contains contains_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.contains
    ADD CONSTRAINT contains_pkey PRIMARY KEY (p_companyname, p_modelname, c_companyname, c_modelname);


--
-- Name: phonemodel phonemodel_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.phonemodel
    ADD CONSTRAINT phonemodel_pkey PRIMARY KEY (companyname, modelname);


--
-- Name: cellphonecompany cellphonecompany_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.cellphonecompany
    ADD CONSTRAINT cellphonecompany_name_fkey FOREIGN KEY (name) REFERENCES public.company(name) ON DELETE CASCADE;


--
-- Name: chip chip_companyname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.chip
    ADD CONSTRAINT chip_companyname_fkey FOREIGN KEY (companyname) REFERENCES public.chipmanufacturer(name) ON DELETE CASCADE;


--
-- Name: chipmanufacturer chipmanufacturer_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.chipmanufacturer
    ADD CONSTRAINT chipmanufacturer_name_fkey FOREIGN KEY (name) REFERENCES public.company(name) ON DELETE CASCADE;


--
-- Name: contains contains_c_companyname_c_modelname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.contains
    ADD CONSTRAINT contains_c_companyname_c_modelname_fkey FOREIGN KEY (c_companyname, c_modelname) REFERENCES public.chip(companyname, modelname) ON DELETE CASCADE;


--
-- Name: contains contains_p_companyname_p_modelname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.contains
    ADD CONSTRAINT contains_p_companyname_p_modelname_fkey FOREIGN KEY (p_companyname, p_modelname) REFERENCES public.phonemodel(companyname, modelname) ON DELETE CASCADE;


--
-- Name: phonemodel phonemodel_companyname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.phonemodel
    ADD CONSTRAINT phonemodel_companyname_fkey FOREIGN KEY (companyname) REFERENCES public.cellphonecompany(name) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict 8l3jvDtmqgcKqQUJQc8JrXYvk42dQ5MdHKAmroSsWbGmmPLMii1Bf7iu9fRkowW

