--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: uw_colorsize_color; Type: TABLE DATA; Schema: public; Owner: scott
--

INSERT INTO uw_colorsize_color (uw_id, uw_nam) VALUES (3, 'red');
INSERT INTO uw_colorsize_color (uw_id, uw_nam) VALUES (4, 'green');
INSERT INTO uw_colorsize_color (uw_id, uw_nam) VALUES (5, 'blue');


--
-- Name: uw_colorsize_color_seq; Type: SEQUENCE SET; Schema: public; Owner: scott
--

SELECT pg_catalog.setval('uw_colorsize_color_seq', 9, true);


--
-- Data for Name: uw_colorsize_size; Type: TABLE DATA; Schema: public; Owner: scott
--

INSERT INTO uw_colorsize_size (uw_id, uw_nam) VALUES (1, 'Small');
INSERT INTO uw_colorsize_size (uw_id, uw_nam) VALUES (2, 'Medium');
INSERT INTO uw_colorsize_size (uw_id, uw_nam) VALUES (3, 'Large');


--
-- Name: uw_colorsize_size_seq; Type: SEQUENCE SET; Schema: public; Owner: scott
--

SELECT pg_catalog.setval('uw_colorsize_size_seq', 6, true);


--
-- Data for Name: uw_colorsize_thing; Type: TABLE DATA; Schema: public; Owner: scott
--

INSERT INTO uw_colorsize_thing (uw_id, uw_nam, uw_color, uw_size) VALUES (1, 'Thing 111', 5, 3);
INSERT INTO uw_colorsize_thing (uw_id, uw_nam, uw_color, uw_size) VALUES (2, 'Thing 222', 5, 2);
INSERT INTO uw_colorsize_thing (uw_id, uw_nam, uw_color, uw_size) VALUES (3, 'Thing 333', 5, 1);
INSERT INTO uw_colorsize_thing (uw_id, uw_nam, uw_color, uw_size) VALUES (4, 'Thing 444', 4, 3);
INSERT INTO uw_colorsize_thing (uw_id, uw_nam, uw_color, uw_size) VALUES (5, 'Thing 555', 4, 2);
INSERT INTO uw_colorsize_thing (uw_id, uw_nam, uw_color, uw_size) VALUES (7, 'Thing 777', 3, 3);
INSERT INTO uw_colorsize_thing (uw_id, uw_nam, uw_color, uw_size) VALUES (8, 'Thing 888', 3, 2);
INSERT INTO uw_colorsize_thing (uw_id, uw_nam, uw_color, uw_size) VALUES (9, 'Thing 999', 3, 1);
INSERT INTO uw_colorsize_thing (uw_id, uw_nam, uw_color, uw_size) VALUES (11, 'Another "red Small" Thing', 3, 1);
INSERT INTO uw_colorsize_thing (uw_id, uw_nam, uw_color, uw_size) VALUES (6, 'Thing 66', 4, 1);


--
-- Name: uw_colorsize_thing_seq; Type: SEQUENCE SET; Schema: public; Owner: scott
--

SELECT pg_catalog.setval('uw_colorsize_thing_seq', 24, true);


--
-- PostgreSQL database dump complete
--

