--

alter table admin_bdys_raw.comm_electoral drop constraint comm_electoral_pkey;
alter table admin_bdys_raw.comm_electoral add primary key (ce_pid);
alter table admin_bdys_raw.comm_electoral drop column gid;

alter table admin_bdys_raw.comm_electoral_polygon drop column ce_ply_pid;

--

alter table admin_bdys_raw.gccsa_2011 drop constraint gccsa_2011_pkey;
alter table admin_bdys_raw.gccsa_2011 add primary key (gcc_11pid);
alter table admin_bdys_raw.gccsa_2011 drop column gid;

alter table admin_bdys_raw.gccsa_2011_polygon drop column gcc_11ppid;

--

alter table admin_bdys_raw.gccsa_2016 drop constraint gccsa_2016_pkey;
alter table admin_bdys_raw.gccsa_2016 add primary key (gcc_16pid);
alter table admin_bdys_raw.gccsa_2016 drop column gid;

alter table admin_bdys_raw.gccsa_2016_polygon drop column gcc_16ppid;

--

alter table admin_bdys_raw.iare_2011 drop constraint iare_2011_pkey;
alter table admin_bdys_raw.iare_2011 add primary key (iare_11pid);
alter table admin_bdys_raw.iare_2011 drop column gid;

alter table admin_bdys_raw.iare_2011_polygon drop column iar_11ppid;

--

alter table admin_bdys_raw.iare_2016 drop constraint iare_2016_pkey;
alter table admin_bdys_raw.iare_2016 add primary key (iare_16pid);
alter table admin_bdys_raw.iare_2016 drop column gid;

alter table admin_bdys_raw.iare_2016_polygon drop column iar_16ppid;

--

alter table admin_bdys_raw.iloc_2011 drop constraint iloc_2011_pkey;
alter table admin_bdys_raw.iloc_2011 add primary key (iloc_11pid);
alter table admin_bdys_raw.iloc_2011 drop column gid;

alter table admin_bdys_raw.iloc_2011_polygon drop column ilo_11ppid;

--

alter table admin_bdys_raw.iloc_2016 drop constraint iloc_2016_pkey;
alter table admin_bdys_raw.iloc_2016 add primary key (iloc_16pid);
alter table admin_bdys_raw.iloc_2016 drop column gid;

alter table admin_bdys_raw.iloc_2016_polygon drop column ilo_16ppid;

--

alter table admin_bdys_raw.ireg_2011 drop constraint ireg_2011_pkey;
alter table admin_bdys_raw.ireg_2011 add primary key (ireg_11pid);
alter table admin_bdys_raw.ireg_2011 drop column gid;

alter table admin_bdys_raw.ireg_2011_polygon drop column ire_11ppid;

--

alter table admin_bdys_raw.ireg_2016 drop constraint ireg_2016_pkey;
alter table admin_bdys_raw.ireg_2016 add primary key (ireg_16pid);
alter table admin_bdys_raw.ireg_2016 drop column gid;

alter table admin_bdys_raw.ireg_2016_polygon drop column ire_16ppid;

--

alter table admin_bdys_raw.lga drop constraint lga_pkey;
alter table admin_bdys_raw.lga add primary key (lga_pid);
alter table admin_bdys_raw.lga drop column gid;

alter table admin_bdys_raw.lga_polygon drop column lg_ply_pid;

--

alter table admin_bdys_raw.locality drop constraint locality_pkey;
alter table admin_bdys_raw.locality add primary key (loc_pid);
alter table admin_bdys_raw.locality drop column gid;

alter table admin_bdys_raw.locality_class_aut drop constraint locality_class_aut_pkey;
alter table admin_bdys_raw.locality_class_aut add primary key (code_aut);
alter table admin_bdys_raw.locality_class_aut drop column gid;

alter table admin_bdys_raw.locality_polygon drop column lc_ply_pid;

---

alter table admin_bdys_raw.lga_locality drop constraint lga_locality_pkey;
alter table admin_bdys_raw.lga_locality add primary key (lg_loc_pid);
alter table admin_bdys_raw.lga_locality drop column gid;

--

alter table admin_bdys_raw.locality_town drop constraint locality_town_pkey;
alter table admin_bdys_raw.locality_town add primary key (locality_t);
alter table admin_bdys_raw.locality_town drop column gid;

--

alter table admin_bdys_raw.mb_2011 drop constraint mb_2011_pkey;
alter table admin_bdys_raw.mb_2011 add primary key (mb_11pid);
alter table admin_bdys_raw.mb_2011 drop column gid;

alter table admin_bdys_raw.mb_2011_polygon drop column mb_11ppid;

--

alter table admin_bdys_raw.mb_2016 drop constraint mb_2016_pkey;
alter table admin_bdys_raw.mb_2016 add primary key (mb_16pid);
alter table admin_bdys_raw.mb_2016 drop column gid;

alter table admin_bdys_raw.mb_2016_polygon drop column mb_16ppid;

--

alter table admin_bdys_raw.mb_category_class_aut drop constraint mb_category_class_aut_pkey;
alter table admin_bdys_raw.mb_category_class_aut add primary key (code);
alter table admin_bdys_raw.mb_category_class_aut drop column gid;

--

alter table admin_bdys_raw.remoteness_2011 drop constraint remoteness_2011_pkey;
alter table admin_bdys_raw.remoteness_2011 add primary key (rem11_pid);
alter table admin_bdys_raw.remoteness_2011 drop column gid;

alter table admin_bdys_raw.remoteness_2011_polygon drop column rem11_ppid;

--

alter table admin_bdys_raw.remoteness_2016 drop constraint remoteness_2016_pkey;
alter table admin_bdys_raw.remoteness_2016 add primary key (rem16_pid);
alter table admin_bdys_raw.remoteness_2016 drop column gid;

alter table admin_bdys_raw.remoteness_2016_polygon drop column rem16_ppid;

--

alter table admin_bdys_raw.remoteness_category_aut drop constraint remoteness_category_aut_pkey;
alter table admin_bdys_raw.remoteness_category_aut add primary key (code);
alter table admin_bdys_raw.remoteness_category_aut drop column gid;

--

alter table admin_bdys_raw.sa1_2011 drop constraint sa1_2011_pkey;
alter table admin_bdys_raw.sa1_2011 add primary key (sa1_11pid);
alter table admin_bdys_raw.sa1_2011 drop column gid;

alter table admin_bdys_raw.sa1_2011_polygon drop column sa1_11ppid;

--

alter table admin_bdys_raw.sa1_2016 drop constraint sa1_2016_pkey;
alter table admin_bdys_raw.sa1_2016 add primary key (sa1_16pid);
alter table admin_bdys_raw.sa1_2016 drop column gid;

alter table admin_bdys_raw.sa1_2016_polygon drop column sa1_16ppid;

--

alter table admin_bdys_raw.sa2_2011 drop constraint sa2_2011_pkey;
alter table admin_bdys_raw.sa2_2011 add primary key (sa2_11pid);
alter table admin_bdys_raw.sa2_2011 drop column gid;

alter table admin_bdys_raw.sa2_2011_polygon drop column sa2_11ppid;

--

alter table admin_bdys_raw.sa2_2016 drop constraint sa2_2016_pkey;
alter table admin_bdys_raw.sa2_2016 add primary key (sa2_16pid);
alter table admin_bdys_raw.sa2_2016 drop column gid;

alter table admin_bdys_raw.sa2_2016_polygon drop column sa2_16ppid;

--

alter table admin_bdys_raw.sa3_2011 drop constraint sa3_2011_pkey;
alter table admin_bdys_raw.sa3_2011 add primary key (sa3_11pid);
alter table admin_bdys_raw.sa3_2011 drop column gid;

alter table admin_bdys_raw.sa3_2011_polygon drop column sa3_11ppid;

--

alter table admin_bdys_raw.sa3_2016 drop constraint sa3_2016_pkey;
alter table admin_bdys_raw.sa3_2016 add primary key (sa3_16pid);
alter table admin_bdys_raw.sa3_2016 drop column gid;

alter table admin_bdys_raw.sa3_2016_polygon drop column sa3_16ppid;

--

alter table admin_bdys_raw.sa4_2011 drop constraint sa4_2011_pkey;
alter table admin_bdys_raw.sa4_2011 add primary key (sa4_11pid);
alter table admin_bdys_raw.sa4_2011 drop column gid;

alter table admin_bdys_raw.sa4_2011_polygon drop column sa4_11ppid;

--

alter table admin_bdys_raw.sa4_2016 drop constraint sa4_2016_pkey;
alter table admin_bdys_raw.sa4_2016 add primary key (sa4_16pid);
alter table admin_bdys_raw.sa4_2016 drop column gid;

alter table admin_bdys_raw.sa4_2016_polygon drop column sa4_16ppid;

--

alter table admin_bdys_raw.seifa_2011 drop constraint seifa_2011_pkey;
alter table admin_bdys_raw.seifa_2011 add primary key (seifa11pid);
alter table admin_bdys_raw.seifa_2011 drop column gid;

alter table admin_bdys_raw.seifa_2016 drop column seifa16pid;

--

alter table admin_bdys_raw.sos_2011 drop constraint sos_2011_pkey;
alter table admin_bdys_raw.sos_2011 add primary key (sos_11pid);
alter table admin_bdys_raw.sos_2011 drop column gid;

alter table admin_bdys_raw.sos_2011_polygon drop column sos_11ppid;

--

alter table admin_bdys_raw.sos_2016 drop constraint sos_2016_pkey;
alter table admin_bdys_raw.sos_2016 add primary key (sos_16pid);
alter table admin_bdys_raw.sos_2016 drop column gid;

alter table admin_bdys_raw.sos_2016_polygon drop column sos_16ppid;

--

alter table admin_bdys_raw.sosr_2011 drop constraint sosr_2011_pkey;
alter table admin_bdys_raw.sosr_2011 add primary key (ssr_11pid);
alter table admin_bdys_raw.sosr_2011 drop column gid;

alter table admin_bdys_raw.sosr_2011_polygon drop column ssr_11ppid;

--

alter table admin_bdys_raw.sosr_2016 drop constraint sosr_2016_pkey;
alter table admin_bdys_raw.sosr_2016 add primary key (ssr_16pid);
alter table admin_bdys_raw.sosr_2016 drop column gid;

alter table admin_bdys_raw.sosr_2016_polygon drop column ssr_16ppid;

--

alter table admin_bdys_raw.state drop constraint state_pkey;
alter table admin_bdys_raw.state add primary key (state_pid);
alter table admin_bdys_raw.state drop column gid;

alter table admin_bdys_raw.state_polygon drop column st_ply_pid;

--

alter table admin_bdys_raw.state_electoral drop constraint state_electoral_pkey;
alter table admin_bdys_raw.state_electoral add primary key (se_pid);
alter table admin_bdys_raw.state_electoral drop column gid;

alter table admin_bdys_raw.state_electoral_polygon drop column se_ply_pid;

alter table admin_bdys_raw.state_electoral_class_aut drop constraint state_electoral_class_aut_pkey;
alter table admin_bdys_raw.state_electoral_class_aut add primary key (code_aut);
alter table admin_bdys_raw.state_electoral_class_aut drop column gid;

--

alter table admin_bdys_raw.sua_2011 drop constraint sua_2011_pkey;
alter table admin_bdys_raw.sua_2011 add primary key (sua_11pid);
alter table admin_bdys_raw.sua_2011 drop column gid;

alter table admin_bdys_raw.sua_2011_polygon drop column sua_11ppid;

--

alter table admin_bdys_raw.sua_2016 drop constraint sua_2016_pkey;
alter table admin_bdys_raw.sua_2016 add primary key (sua_16pid);
alter table admin_bdys_raw.sua_2016 drop column gid;

alter table admin_bdys_raw.sua_2016_polygon drop column sua_16ppid;

--

alter table admin_bdys_raw.town drop constraint town_pkey;
alter table admin_bdys_raw.town add primary key (town_pid);
alter table admin_bdys_raw.town drop column gid;

alter table admin_bdys_raw.town_point drop constraint town_point_pkey;
alter table admin_bdys_raw.town_point add primary key (town_point);
alter table admin_bdys_raw.town_point drop column gid;

alter table admin_bdys_raw.town_class_aut drop constraint town_class_aut_pkey;
alter table admin_bdys_raw.town_class_aut add primary key (code);
alter table admin_bdys_raw.town_class_aut drop column gid;

--

alter table admin_bdys_raw.ucl_2011 drop constraint ucl_2011_pkey;
alter table admin_bdys_raw.ucl_2011 add primary key (ucl_11pid);
alter table admin_bdys_raw.ucl_2011 drop column gid;

alter table admin_bdys_raw.ucl_2011_polygon drop column ucl_11ppid;

--

alter table admin_bdys_raw.ucl_2016 drop constraint ucl_2016_pkey;
alter table admin_bdys_raw.ucl_2016 add primary key (ucl_16pid);
alter table admin_bdys_raw.ucl_2016 drop column gid;

alter table admin_bdys_raw.ucl_2016_polygon drop column ucl_16ppid;

--

alter table admin_bdys_raw.ward drop constraint ward_pkey;
alter table admin_bdys_raw.ward add primary key (ward_pid);
alter table admin_bdys_raw.ward drop column gid;

alter table admin_bdys_raw.ward_polygon drop column wd_ply_pid;