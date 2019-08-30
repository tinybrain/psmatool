-- gnaf.state_temp

drop table if exists gnaf.state_temp cascade;

create table gnaf.state_temp
(
    state_pid varchar(15) not null,
    state_json jsonb not null
);

alter table only gnaf.state_temp owner to postgres;
alter table only gnaf.state_temp add constraint state_temp_pk primary key (state_pid);

insert into gnaf.state_temp(state_pid, state_json)
select * from gnaf.state_json;

-- gnaf.locality_temp

drop table if exists gnaf.locality_temp cascade;

create table gnaf.locality_temp
(
    locality_pid varchar(15) not null,
    locality_json jsonb not null,
    geometry jsonb
);

alter table only gnaf.locality_temp owner to postgres;
alter table only gnaf.locality_temp add constraint locality_temp_pk primary key (locality_pid);

insert into gnaf.locality_temp(locality_pid, locality_json, geometry)
select * from gnaf.locality_json;

-- gnaf.street_temp

drop table if exists gnaf.street_temp cascade;

create table gnaf.street_temp
(
    street_locality_pid varchar(15) not null,
    street_locality_json jsonb not null,
    geometry jsonb
);

alter table only gnaf.street_temp owner to postgres;
alter table only gnaf.street_temp add constraint street_locality_temp_pk primary key (street_locality_pid);

insert into gnaf.street_temp(street_locality_pid, street_locality_json, geometry)
select * from gnaf.street_json;

-- gnaf.address_temp

drop table if exists gnaf.address_temp cascade;

create table gnaf.address_temp
(
    address_detail_pid varchar(15) not null,
    address_detail_json jsonb not null,
    poastcode varchar(4),
    geometry jsonb
);

alter table only gnaf.address_temp owner to postgres;
alter table only gnaf.address_temp add constraint address_temp_pk primary key (address_detail_pid);

insert into gnaf.address_temp(address_detail_pid, address_detail_json, poastcode, geometry)
select * from gnaf.address_json;

