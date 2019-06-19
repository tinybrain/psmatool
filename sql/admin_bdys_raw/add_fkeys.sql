--

alter table admin_bdys_raw.comm_electoral
	add foreign key (state_pid) references admin_bdys_raw.state (state_pid);

alter table admin_bdys_raw.comm_electoral_polygon
    add foreign key (ce_pid) references admin_bdys_raw.comm_electoral (ce_pid);

--

alter table admin_bdys_raw.gccsa_2011
    add foreign key (state_pid) references admin_bdys_raw.state (state_pid);

--

alter table admin_bdys_raw.gccsa_2011_polygon
    add foreign key (gcc_11pid) references admin_bdys_raw.gccsa_2011 (gcc_11pid);

--

alter table admin_bdys_raw.gccsa_2016
    add foreign key (state_pid) references admin_bdys_raw.state (state_pid);

--

alter table admin_bdys_raw.gccsa_2016_polygon
    add foreign key (gcc_16pid) references admin_bdys_raw.gccsa_2016 (gcc_16pid);

--

alter table admin_bdys_raw.iare_2011
    add foreign key (ireg_11pid) references admin_bdys_raw.ireg_2011 (ireg_11pid);

alter table admin_bdys_raw.iare_2011
    add foreign key (state_pid) references admin_bdys_raw.state (state_pid);

--

alter table admin_bdys_raw.iare_2011_polygon
    add foreign key (iare_11pid) references admin_bdys_raw.iare_2011 (iare_11pid);

--

alter table admin_bdys_raw.iare_2016
    add foreign key (ireg_16pid) references admin_bdys_raw.ireg_2016 (ireg_16pid);

alter table admin_bdys_raw.iare_2016
    add foreign key (state_pid) references admin_bdys_raw.state (state_pid);

--

alter table admin_bdys_raw.iare_2016_polygon
    add foreign key (iare_16pid) references admin_bdys_raw.iare_2016 (iare_16pid);

--

alter table admin_bdys_raw.iloc_2011
    add foreign key (iare_11pid) references admin_bdys_raw.iare_2011 (iare_11pid);

alter table admin_bdys_raw.iloc_2011
    add foreign key (ireg_11pid) references admin_bdys_raw.ireg_2011 (ireg_11pid);

alter table admin_bdys_raw.iloc_2011
    add foreign key (state_pid) references admin_bdys_raw.state (state_pid);

--

alter table admin_bdys_raw.iloc_2011_polygon
    add foreign key (iloc_11pid) references admin_bdys_raw.iloc_2011 (iloc_11pid);

--

alter table admin_bdys_raw.iloc_2016
    add foreign key (iare_16pid) references admin_bdys_raw.iare_2016 (iare_16pid);

alter table admin_bdys_raw.iloc_2016
    add foreign key (ireg_16pid) references admin_bdys_raw.ireg_2016 (ireg_16pid);

alter table admin_bdys_raw.iloc_2016
    add foreign key (state_pid) references admin_bdys_raw.state (state_pid);

--
    
alter table admin_bdys_raw.iloc_2016_polygon
    add foreign key (iloc_16pid) references admin_bdys_raw.iloc_2016 (iloc_16pid);

--

alter table admin_bdys_raw.ireg_2011
    add foreign key (state_pid) references admin_bdys_raw.state (state_pid);

--

alter table admin_bdys_raw.ireg_2011_polygon
    add foreign key (ireg_11pid) references admin_bdys_raw.ireg_2011 (ireg_11pid);

--

alter table admin_bdys_raw.ireg_2016
    add foreign key (state_pid) references admin_bdys_raw.state (state_pid);

--

alter table admin_bdys_raw.ireg_2016_polygon
    add foreign key (ireg_16pid) references admin_bdys_raw.ireg_2016 (ireg_16pid);

--

alter table admin_bdys_raw.lga
    add foreign key (state_pid) references admin_bdys_raw.state (state_pid);

--

alter table admin_bdys_raw.lga_locality
    add foreign key (lga_pid) references admin_bdys_raw.lga (lga_pid);

alter table admin_bdys_raw.lga_locality
    add foreign key (loc_pid) references admin_bdys_raw.locality(loc_pid);

--

alter table admin_bdys_raw.lga_polygon
    add foreign key (lga_pid) references admin_bdys_raw.lga (lga_pid);

--

alter table admin_bdys_raw.locality
    add foreign key  (loccl_code) references admin_bdys_raw.locality_class_aut (code_aut);

alter table admin_bdys_raw.locality
    add foreign key (state_pid) references admin_bdys_raw.state (state_pid);

--

alter table admin_bdys_raw.locality_polygon
    add foreign key (loc_pid) references admin_bdys_raw.locality (loc_pid);

--

alter table admin_bdys_raw.locality_town
    add foreign key (locality_p) references admin_bdys_raw.locality (loc_pid);

alter table admin_bdys_raw.locality_town
    add foreign key (town_pid) references admin_bdys_raw.town (town_pid);

--

alter table admin_bdys_raw.mb_2011
    add foreign key (sa1_11pid) references admin_bdys_raw.sa1_2011 (sa1_11pid);

-- alter table admin_bdys_raw.mb_2011
--     add foreign key (mb_cat_cd) references admin_bdys_raw.mb_category_class_aut (code);

alter table admin_bdys_raw.mb_2011
    add foreign key (state_pid) references admin_bdys_raw.state(state_pid);

--

alter table admin_bdys_raw.mb_2011_polygon
    add foreign key (mb_11pid) references admin_bdys_raw.mb_2011 (mb_11pid);

--

alter table admin_bdys_raw.mb_2016
    add foreign key (sa1_16pid) references admin_bdys_raw.sa1_2016 (sa1_16pid);

-- alter table admin_bdys_raw.mb_2016
--     add foreign key (mb_cat_cd) references admin_bdys_raw.mb_category_class_aut (code);

alter table admin_bdys_raw.mb_2016
    add foreign key (state_pid) references admin_bdys_raw.state(state_pid);

--

alter table admin_bdys_raw.mb_2016_polygon
    add foreign key (mb_16pid) references admin_bdys_raw.mb_2016 (mb_16pid);

--

alter table admin_bdys_raw.remoteness_2011
    add foreign key (state_pid) references admin_bdys_raw.state(state_pid);

--

alter table admin_bdys_raw.remoteness_2011_polygon
    add foreign key (rem11_pid) references admin_bdys_raw.remoteness_2011 (rem11_pid);

--

alter table admin_bdys_raw.remoteness_2016
    add foreign key (state_pid) references admin_bdys_raw.state(state_pid);

--

alter table admin_bdys_raw.remoteness_2016_polygon
    add foreign key (rem16_pid) references admin_bdys_raw.remoteness_2016 (rem16_pid);

--

alter table admin_bdys_raw.sa1_2011
    add foreign key (sa2_11pid) references admin_bdys_raw.sa2_2011 (sa2_11pid);

alter table admin_bdys_raw.sa1_2011
    add foreign key (state_pid) references admin_bdys_raw.state (state_pid);

--

alter table admin_bdys_raw.sa1_2011_polygon
    add foreign key (sa1_11pid) references admin_bdys_raw.sa1_2011 (sa1_11pid);

--

alter table admin_bdys_raw.sa1_2016
    add foreign key (sa2_16pid) references admin_bdys_raw.sa2_2016 (sa2_16pid);

alter table admin_bdys_raw.sa1_2016
    add foreign key (state_pid) references admin_bdys_raw.state (state_pid);

--

alter table admin_bdys_raw.sa1_2016_polygon
    add foreign key (sa1_16pid) references admin_bdys_raw.sa1_2016 (sa1_16pid);

--

alter table admin_bdys_raw.sa2_2011
    add foreign key (sa3_11pid) references admin_bdys_raw.sa3_2011 (sa3_11pid);

alter table admin_bdys_raw.sa2_2011
    add foreign key (state_pid) references admin_bdys_raw.state (state_pid);

--

alter table admin_bdys_raw.sa2_2011_polygon
    add foreign key (sa2_11pid) references admin_bdys_raw.sa2_2011 (sa2_11pid);

--

alter table admin_bdys_raw.sa2_2016
    add foreign key (sa3_16pid) references admin_bdys_raw.sa3_2016 (sa3_16pid);

alter table admin_bdys_raw.sa2_2016
    add foreign key (state_pid) references admin_bdys_raw.state (state_pid);

--

alter table admin_bdys_raw.sa2_2016_polygon
    add foreign key (sa2_16pid) references admin_bdys_raw.sa2_2016 (sa2_16pid);

--

alter table admin_bdys_raw.sa3_2011
    add foreign key (sa4_11pid) references admin_bdys_raw.sa4_2011 (sa4_11pid);

alter table admin_bdys_raw.sa3_2011
    add foreign key (state_pid) references admin_bdys_raw.state (state_pid);

--

alter table admin_bdys_raw.sa3_2011_polygon
    add foreign key (sa3_11pid) references admin_bdys_raw.sa3_2011 (sa3_11pid);

--

alter table admin_bdys_raw.sa3_2016
    add foreign key (sa4_16pid) references admin_bdys_raw.sa4_2016 (sa4_16pid);

alter table admin_bdys_raw.sa3_2016
    add foreign key (state_pid) references admin_bdys_raw.state (state_pid);

--

alter table admin_bdys_raw.sa3_2016_polygon
    add foreign key (sa3_16pid) references admin_bdys_raw.sa3_2016 (sa3_16pid);

--

alter table admin_bdys_raw.sa4_2011
    add foreign key (state_pid) references admin_bdys_raw.state (state_pid);

--

alter table admin_bdys_raw.sa4_2011_polygon
    add foreign key (sa4_11pid) references admin_bdys_raw.sa4_2011 (sa4_11pid);

--

alter table admin_bdys_raw.sa4_2016
    add foreign key (state_pid) references admin_bdys_raw.state (state_pid);

--

alter table admin_bdys_raw.sa4_2016_polygon
    add foreign key (sa4_16pid) references admin_bdys_raw.sa4_2016 (sa4_16pid);

--

alter table admin_bdys_raw.seifa_2011
    add foreign key (sa1_11pid) references admin_bdys_raw.sa1_2011 (sa1_11pid);

--

alter table admin_bdys_raw.seifa_2016
    add foreign key (sa1_16pid) references admin_bdys_raw.sa1_2016 (sa1_16pid);

--

alter table admin_bdys_raw.sos_2011
    add foreign key (state_pid) references admin_bdys_raw.state (state_pid);

--

alter table admin_bdys_raw.sos_2011_polygon
    add foreign key (sos_11pid) references admin_bdys_raw.sos_2011 (sos_11pid);

--

alter table admin_bdys_raw.sos_2016
    add foreign key (state_pid) references admin_bdys_raw.state (state_pid);

--

alter table admin_bdys_raw.sos_2016_polygon
    add foreign key (sos_16pid) references admin_bdys_raw.sos_2016 (sos_16pid);

--

alter table admin_bdys_raw.sosr_2011
    add foreign key (state_pid) references admin_bdys_raw.state (state_pid);

--

alter table admin_bdys_raw.sosr_2011_polygon
    add foreign key (ssr_11pid) references admin_bdys_raw.sosr_2011 (ssr_11pid);

--

alter table admin_bdys_raw.sosr_2016
    add foreign key (state_pid) references admin_bdys_raw.state (state_pid);

--

alter table admin_bdys_raw.sosr_2016_polygon
    add foreign key (ssr_16pid) references admin_bdys_raw.sosr_2016 (ssr_16pid);

--

alter table admin_bdys_raw.state_electoral
    add foreign key (state_pid) references admin_bdys_raw.state (state_pid);

alter table admin_bdys_raw.state_electoral
    add foreign key (secl_code) references admin_bdys_raw.state_electoral_class_aut (code_aut);

--

alter table admin_bdys_raw.state_electoral_polygon
    add foreign key (se_pid) references admin_bdys_raw.state_electoral (se_pid);

--

alter table admin_bdys_raw.sua_2011_polygon
    add foreign key (sua_11pid) references admin_bdys_raw.sua_2011 (sua_11pid);

--

alter table admin_bdys_raw.sua_2016_polygon
    add foreign key (sua_16pid) references admin_bdys_raw.sua_2016 (sua_16pid);

--

alter table admin_bdys_raw.town
    add foreign key (town_class) references admin_bdys_raw.town_class_aut (code);

alter table admin_bdys_raw.town
    add foreign key (state_pid) references admin_bdys_raw.state (state_pid);

--

alter table admin_bdys_raw.town_point
    add foreign key (town_pid) references admin_bdys_raw.town (town_pid);

--

alter table admin_bdys_raw.ucl_2011
    add foreign key (state_pid) references admin_bdys_raw.state (state_pid);

--

alter table admin_bdys_raw.ucl_2011_polygon
    add foreign key (ucl_11pid) references admin_bdys_raw.ucl_2011 (ucl_11pid);

--

alter table admin_bdys_raw.ucl_2016
    add foreign key (state_pid) references admin_bdys_raw.state (state_pid);

--

alter table admin_bdys_raw.ucl_2016_polygon
    add foreign key (ucl_16pid) references admin_bdys_raw.ucl_2016 (ucl_16pid);


--

alter table admin_bdys_raw.ward
    add foreign key (lga_pid) references admin_bdys_raw.lga (lga_pid);

alter table admin_bdys_raw.ward
    add foreign key (state_pid) references admin_bdys_raw.state (state_pid);

--

alter table admin_bdys_raw.ward_polygon
    add foreign key (ward_pid) references admin_bdys_raw.ward (ward_pid);

--






