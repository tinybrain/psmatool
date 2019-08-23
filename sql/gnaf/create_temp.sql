-- gnaf.state_temp

drop table if exists gnaf.state_temp cascade;

create table gnaf.state_temp
(
    state_pid varchar(15) not null,
    state_json jsonb not null
);

alter table only gnaf.state_temp owner to postgres;
alter table only gnaf.state_temp add constraint state_temp_pk primary key (state_pid);

-- gnaf.locality_temp

drop table if exists gnaf.locality_temp cascade;

create table gnaf.locality_temp
(
    locality_pid varchar(15) not null,
    locality_json jsonb not null,
    geometry geometry
);

alter table only gnaf.locality_temp owner to postgres;
alter table only gnaf.locality_temp add constraint locality_temp_pk primary key (locality_pid);

-- gnaf.street_temp

drop table if exists gnaf.street_temp cascade;

create table gnaf.street_temp
(
    street_locality_pid varchar(15) not null,
    street_locality_json jsonb not null,
    geometry geometry
);

alter table only gnaf.street_temp owner to postgres;
alter table only gnaf.street_temp add constraint street_locality_temp_pk primary key (street_locality_pid);


