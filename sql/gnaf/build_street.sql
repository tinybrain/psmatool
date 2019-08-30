-- gnaf.street

drop table if exists gnaf.street cascade;

create table gnaf.street
(
    id varchar(15) not null primary key,
    type varchar(15) not null,
    street jsonb not null,
    locality jsonb not null,
    state jsonb not null,
    geometry jsonb
);

alter table only gnaf.street owner to postgres;

insert into gnaf.street(id, type, street, locality, state, geometry)
select
    ('S:' || s.street_locality_pid) as id,
    'Street' as type,
    str.street_locality_json as street,
    lt.locality_json as locality,
    st.state_json as state,
    str.geometry as geometry
from
    gnaf_raw.street_locality s
    join gnaf.street_temp str on str.street_locality_pid = s.street_locality_pid
    join gnaf.locality_temp lt on lt.locality_pid = s.locality_pid
    join gnaf_raw.locality l on l.locality_pid = s.locality_pid
    join gnaf.state_temp st on st.state_pid = l.state_pid;
