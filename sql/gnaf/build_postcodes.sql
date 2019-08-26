-- gnaf.locality_postcode

drop table if exists gnaf.locality_postcode cascade;

create table gnaf.locality_postcode
(
    locality_pid varchar(15) not null primary key,
    postcodes jsonb
);

alter table only gnaf.locality_postcode owner to postgres;

insert into gnaf.locality_postcode(locality_pid, postcodes)
select
    ad.locality_pid,
    jsonb_agg(distinct ad.postcode)
from
    gnaf_raw.address_detail ad
group by
    ad.locality_pid;

-- gnaf.street_postcode

drop table if exists gnaf.street_postcode cascade;

create table gnaf.street_postcode
(
    street_locality_pid varchar(15) not null primary key,
    postcodes jsonb
);

alter table only gnaf.street_postcode owner to postgres;

insert into gnaf.street_postcode(street_locality_pid, postcodes)
select
    ad.street_locality_pid,
    jsonb_agg(distinct ad.postcode)
from
    gnaf_raw.address_detail ad
group by
    ad.street_locality_pid;
