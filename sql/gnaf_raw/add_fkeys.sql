

--
-- Name: address_alias_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.address_alias
    ADD CONSTRAINT address_alias_fk1 FOREIGN KEY (alias_pid) REFERENCES gnaf_raw.address_detail(address_detail_pid);


--
-- Name: address_alias_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.address_alias
    ADD CONSTRAINT address_alias_fk2 FOREIGN KEY (alias_type_code) REFERENCES gnaf_raw.address_alias_type_aut(code);


--
-- Name: address_alias_fk3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.address_alias
    ADD CONSTRAINT address_alias_fk3 FOREIGN KEY (principal_pid) REFERENCES gnaf_raw.address_detail(address_detail_pid);


--
-- Name: address_default_geocode_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.address_default_geocode
    ADD CONSTRAINT address_default_geocode_fk1 FOREIGN KEY (address_detail_pid) REFERENCES gnaf_raw.address_detail(address_detail_pid);


--
-- Name: address_default_geocode_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.address_default_geocode
    ADD CONSTRAINT address_default_geocode_fk2 FOREIGN KEY (geocode_type_code) REFERENCES gnaf_raw.geocode_type_aut(code);


--
-- Name: address_detail_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.address_detail
    ADD CONSTRAINT address_detail_fk1 FOREIGN KEY (address_site_pid) REFERENCES gnaf_raw.address_site(address_site_pid);


--
-- Name: address_detail_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.address_detail
    ADD CONSTRAINT address_detail_fk2 FOREIGN KEY (flat_type_code) REFERENCES gnaf_raw.flat_type_aut(code);


--
-- Name: address_detail_fk3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.address_detail
    ADD CONSTRAINT address_detail_fk3 FOREIGN KEY (level_geocoded_code) REFERENCES gnaf_raw.geocoded_level_type_aut(code);


--
-- Name: address_detail_fk4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.address_detail
    ADD CONSTRAINT address_detail_fk4 FOREIGN KEY (level_type_code) REFERENCES gnaf_raw.level_type_aut(code);


--
-- Name: address_detail_fk5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.address_detail
    ADD CONSTRAINT address_detail_fk5 FOREIGN KEY (locality_pid) REFERENCES gnaf_raw.locality(locality_pid);


--
-- Name: address_detail_fk6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.address_detail
    ADD CONSTRAINT address_detail_fk6 FOREIGN KEY (street_locality_pid) REFERENCES gnaf_raw.street_locality(street_locality_pid);


--
-- Name: address_mesh_block_2011_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.address_mesh_block_2011
    ADD CONSTRAINT address_mesh_block_2011_fk1 FOREIGN KEY (address_detail_pid) REFERENCES gnaf_raw.address_detail(address_detail_pid);


--
-- Name: address_mesh_block_2011_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.address_mesh_block_2011
    ADD CONSTRAINT address_mesh_block_2011_fk2 FOREIGN KEY (mb_2011_pid) REFERENCES gnaf_raw.mb_2011(mb_2011_pid);


--
-- Name: address_mesh_block_2011_fk3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.address_mesh_block_2011
    ADD CONSTRAINT address_mesh_block_2011_fk3 FOREIGN KEY (mb_match_code) REFERENCES gnaf_raw.mb_match_code_aut(code);


--
-- Name: address_mesh_block_2016_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.address_mesh_block_2016
    ADD CONSTRAINT address_mesh_block_2016_fk1 FOREIGN KEY (address_detail_pid) REFERENCES gnaf_raw.address_detail(address_detail_pid);


--
-- Name: address_mesh_block_2016_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.address_mesh_block_2016
    ADD CONSTRAINT address_mesh_block_2016_fk2 FOREIGN KEY (mb_2016_pid) REFERENCES gnaf_raw.mb_2016(mb_2016_pid);


--
-- Name: address_mesh_block_2016_fk3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.address_mesh_block_2016
    ADD CONSTRAINT address_mesh_block_2016_fk3 FOREIGN KEY (mb_match_code) REFERENCES gnaf_raw.mb_match_code_aut(code);


--
-- Name: address_site_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.address_site
    ADD CONSTRAINT address_site_fk1 FOREIGN KEY (address_type) REFERENCES gnaf_raw.address_type_aut(code);


--
-- Name: address_site_geocode_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.address_site_geocode
    ADD CONSTRAINT address_site_geocode_fk1 FOREIGN KEY (address_site_pid) REFERENCES gnaf_raw.address_site(address_site_pid);


--
-- Name: address_site_geocode_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.address_site_geocode
    ADD CONSTRAINT address_site_geocode_fk2 FOREIGN KEY (geocode_type_code) REFERENCES gnaf_raw.geocode_type_aut(code);


--
-- Name: address_site_geocode_fk3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.address_site_geocode
    ADD CONSTRAINT address_site_geocode_fk3 FOREIGN KEY (reliability_code) REFERENCES gnaf_raw.geocode_reliability_aut(code);


--
-- Name: locality_alias_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.locality_alias
    ADD CONSTRAINT locality_alias_fk1 FOREIGN KEY (alias_type_code) REFERENCES gnaf_raw.locality_alias_type_aut(code);


--
-- Name: locality_alias_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.locality_alias
    ADD CONSTRAINT locality_alias_fk2 FOREIGN KEY (locality_pid) REFERENCES gnaf_raw.locality(locality_pid);


--
-- Name: locality_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.locality
    ADD CONSTRAINT locality_fk1 FOREIGN KEY (gnaf_reliability_code) REFERENCES gnaf_raw.geocode_reliability_aut(code);


--
-- Name: locality_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.locality
    ADD CONSTRAINT locality_fk2 FOREIGN KEY (locality_class_code) REFERENCES gnaf_raw.locality_class_aut(code);


--
-- Name: locality_fk3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.locality
    ADD CONSTRAINT locality_fk3 FOREIGN KEY (state_pid) REFERENCES gnaf_raw.state(state_pid);


--
-- Name: locality_neighbour_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.locality_neighbour
    ADD CONSTRAINT locality_neighbour_fk1 FOREIGN KEY (locality_pid) REFERENCES gnaf_raw.locality(locality_pid);


--
-- Name: locality_neighbour_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.locality_neighbour
    ADD CONSTRAINT locality_neighbour_fk2 FOREIGN KEY (neighbour_locality_pid) REFERENCES gnaf_raw.locality(locality_pid);


--
-- Name: locality_point_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.locality_point
    ADD CONSTRAINT locality_point_fk1 FOREIGN KEY (locality_pid) REFERENCES gnaf_raw.locality(locality_pid);


--
-- Name: primary_secondary_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.primary_secondary
    ADD CONSTRAINT primary_secondary_fk1 FOREIGN KEY (primary_pid) REFERENCES gnaf_raw.address_detail(address_detail_pid);


--
-- Name: primary_secondary_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.primary_secondary
    ADD CONSTRAINT primary_secondary_fk2 FOREIGN KEY (ps_join_type_code) REFERENCES gnaf_raw.ps_join_type_aut(code);


--
-- Name: primary_secondary_fk3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.primary_secondary
    ADD CONSTRAINT primary_secondary_fk3 FOREIGN KEY (secondary_pid) REFERENCES gnaf_raw.address_detail(address_detail_pid);


--
-- Name: street_locality_alias_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.street_locality_alias
    ADD CONSTRAINT street_locality_alias_fk1 FOREIGN KEY (alias_type_code) REFERENCES gnaf_raw.street_locality_alias_type_aut(code);


--
-- Name: street_locality_alias_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.street_locality_alias
    ADD CONSTRAINT street_locality_alias_fk2 FOREIGN KEY (street_locality_pid) REFERENCES gnaf_raw.street_locality(street_locality_pid);


--
-- Name: street_locality_alias_fk3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.street_locality_alias
    ADD CONSTRAINT street_locality_alias_fk3 FOREIGN KEY (street_suffix_code) REFERENCES gnaf_raw.street_suffix_aut(code);


--
-- Name: street_locality_alias_fk4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.street_locality_alias
    ADD CONSTRAINT street_locality_alias_fk4 FOREIGN KEY (street_type_code) REFERENCES gnaf_raw.street_type_aut(code);


--
-- Name: street_locality_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.street_locality
    ADD CONSTRAINT street_locality_fk1 FOREIGN KEY (gnaf_reliability_code) REFERENCES gnaf_raw.geocode_reliability_aut(code);


--
-- Name: street_locality_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.street_locality
    ADD CONSTRAINT street_locality_fk2 FOREIGN KEY (locality_pid) REFERENCES gnaf_raw.locality(locality_pid);


--
-- Name: street_locality_fk3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.street_locality
    ADD CONSTRAINT street_locality_fk3 FOREIGN KEY (street_class_code) REFERENCES gnaf_raw.street_class_aut(code);


--
-- Name: street_locality_fk4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.street_locality
    ADD CONSTRAINT street_locality_fk4 FOREIGN KEY (street_suffix_code) REFERENCES gnaf_raw.street_suffix_aut(code);


--
-- Name: street_locality_fk5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.street_locality
    ADD CONSTRAINT street_locality_fk5 FOREIGN KEY (street_type_code) REFERENCES gnaf_raw.street_type_aut(code);


--
-- Name: street_locality_point_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.street_locality_point
    ADD CONSTRAINT street_locality_point_fk1 FOREIGN KEY (street_locality_pid) REFERENCES gnaf_raw.street_locality(street_locality_pid);


--
-- Name: address_alias_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.address_feature
    ADD CONSTRAINT address_feature_fk1 FOREIGN KEY (address_detail_pid) REFERENCES gnaf_raw.address_detail(address_detail_pid);


--
-- Name: address_feature_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gnaf_raw.address_feature
    ADD CONSTRAINT address_feature_fk2 FOREIGN KEY (address_change_type_code) REFERENCES gnaf_raw.address_change_type_aut(code);