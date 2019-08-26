-- gnaf.locality

drop table if exists gnaf.locality cascade;

create table gnaf.locality
(
    id varchar(15) not null primary key,
    type varchar(15) not null,
    locality jsonb not null,
    state jsonb not null,
    geometry geometry
);

alter table only gnaf.locality owner to postgres;

insert into gnaf.locality(id, type, locality, state, geometry)
select
    ('L:' || l.locality_pid) as id,
    'Locality' as type,
    lt.locality_json as locality,
    st.state_json as state,
    lt.geometry as geometry
from
    gnaf_raw.locality l
    join gnaf.locality_temp lt on lt.locality_pid = l.locality_pid
    join gnaf.state_temp st on st.state_pid = l.state_pid;