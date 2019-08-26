-- gnaf.address

drop table if exists gnaf.address cascade;

create table gnaf.address
(
    id varchar(23) not null primary key,
    type varchar(15) not null,
    address jsonb not null,
    street jsonb not null,
    locality jsonb not null,
    state jsonb not null,
    geometry geometry
);

alter table only gnaf.address owner to postgres;

insert into gnaf.address(id, type, address, street, locality, state, geometry)
select
    ('A:' || a.address_detail_pid) as id,
    'Address' as type,
    at.address_detail_json as address,
    str.street_locality_json as street,
    lt.locality_json as locality,
    st.state_json as state,
    str.geometry as geometry
from
    gnaf_raw.address_detail a
        join gnaf.address_temp at on at.address_detail_pid = a.address_detail_pid
        join gnaf.street_temp str on str.street_locality_pid = a.street_locality_pid
        join gnaf.locality_temp lt on lt.locality_pid = a.locality_pid
        join gnaf_raw.locality l on l.locality_pid = a.locality_pid
        join gnaf.state_temp st on st.state_pid = l.state_pid;
