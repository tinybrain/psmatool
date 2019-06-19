--
-- Name: address_alias_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.address_alias
    ADD CONSTRAINT address_alias_pk PRIMARY KEY (address_alias_pid);


--
-- Name: address_alias_type_aut_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.address_alias_type_aut
    ADD CONSTRAINT address_alias_type_aut_pk PRIMARY KEY (code);


--
-- Name: address_default_geocode_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.address_default_geocode
    ADD CONSTRAINT address_default_geocode_pk PRIMARY KEY (address_default_geocode_pid);


--
-- Name: address_detail_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.address_detail
    ADD CONSTRAINT address_detail_pk PRIMARY KEY (address_detail_pid);


--
-- Name: address_mesh_block_2011_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.address_mesh_block_2011
    ADD CONSTRAINT address_mesh_block_2011_pk PRIMARY KEY (address_mesh_block_2011_pid);


--
-- Name: address_mesh_block_2016_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.address_mesh_block_2016
    ADD CONSTRAINT address_mesh_block_2016_pk PRIMARY KEY (address_mesh_block_2016_pid);


--
-- Name: address_site_geocode_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.address_site_geocode
    ADD CONSTRAINT address_site_geocode_pk PRIMARY KEY (address_site_geocode_pid);


--
-- Name: address_site_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.address_site
    ADD CONSTRAINT address_site_pk PRIMARY KEY (address_site_pid);


--
-- Name: address_type_aut_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.address_type_aut
    ADD CONSTRAINT address_type_aut_pk PRIMARY KEY (code);


--
-- Name: flat_type_aut_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.flat_type_aut
    ADD CONSTRAINT flat_type_aut_pk PRIMARY KEY (code);


--
-- Name: geocode_reliability_aut_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.geocode_reliability_aut
    ADD CONSTRAINT geocode_reliability_aut_pk PRIMARY KEY (code);


--
-- Name: geocode_type_aut_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.geocode_type_aut
    ADD CONSTRAINT geocode_type_aut_pk PRIMARY KEY (code);


--
-- Name: geocoded_level_type_aut_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.geocoded_level_type_aut
    ADD CONSTRAINT geocoded_level_type_aut_pk PRIMARY KEY (code);


--
-- Name: level_type_aut_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.level_type_aut
    ADD CONSTRAINT level_type_aut_pk PRIMARY KEY (code);


--
-- Name: locality_alias_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.locality_alias
    ADD CONSTRAINT locality_alias_pk PRIMARY KEY (locality_alias_pid);


--
-- Name: locality_alias_type_aut_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.locality_alias_type_aut
    ADD CONSTRAINT locality_alias_type_aut_pk PRIMARY KEY (code);


--
-- Name: locality_class_aut_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.locality_class_aut
    ADD CONSTRAINT locality_class_aut_pk PRIMARY KEY (code);


--
-- Name: locality_neighbour_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.locality_neighbour
    ADD CONSTRAINT locality_neighbour_pk PRIMARY KEY (locality_neighbour_pid);


--
-- Name: locality_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.locality
    ADD CONSTRAINT locality_pk PRIMARY KEY (locality_pid);


--
-- Name: locality_point_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.locality_point
    ADD CONSTRAINT locality_point_pk PRIMARY KEY (locality_point_pid);


--
-- Name: mb_2011_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.mb_2011
    ADD CONSTRAINT mb_2011_pk PRIMARY KEY (mb_2011_pid);


--
-- Name: mb_2016_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.mb_2016
    ADD CONSTRAINT mb_2016_pk PRIMARY KEY (mb_2016_pid);


--
-- Name: mb_match_code_aut_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.mb_match_code_aut
    ADD CONSTRAINT mb_match_code_aut_pk PRIMARY KEY (code);


--
-- Name: primary_secondary_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.primary_secondary
    ADD CONSTRAINT primary_secondary_pk PRIMARY KEY (primary_secondary_pid);


--
-- Name: ps_join_type_aut_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.ps_join_type_aut
    ADD CONSTRAINT ps_join_type_aut_pk PRIMARY KEY (code);


--
-- Name: state_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.state
    ADD CONSTRAINT state_pk PRIMARY KEY (state_pid);


--
-- Name: street_class_aut_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.street_class_aut
    ADD CONSTRAINT street_class_aut_pk PRIMARY KEY (code);


--
-- Name: street_locality_alias_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.street_locality_alias
    ADD CONSTRAINT street_locality_alias_pk PRIMARY KEY (street_locality_alias_pid);


--
-- Name: street_locality_alias_type__pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.street_locality_alias_type_aut
    ADD CONSTRAINT street_locality_alias_type__pk PRIMARY KEY (code);


--
-- Name: street_locality_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.street_locality
    ADD CONSTRAINT street_locality_pk PRIMARY KEY (street_locality_pid);


--
-- Name: street_locality_point_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.street_locality_point
    ADD CONSTRAINT street_locality_point_pk PRIMARY KEY (street_locality_point_pid);


--
-- Name: street_suffix_aut_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.street_suffix_aut
    ADD CONSTRAINT street_suffix_aut_pk PRIMARY KEY (code);


--
-- Name: street_type_aut_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.street_type_aut
    ADD CONSTRAINT street_type_aut_pk PRIMARY KEY (code);


--
-- Name: address_feature_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.address_feature
    ADD CONSTRAINT address_feature_pk PRIMARY KEY (address_feature_id);


--
-- Name: address_change_type_aut_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gnaf_raw.address_change_type_aut
    ADD CONSTRAINT address_change_type_aut_pk PRIMARY KEY (code);
