-- gnaf.state_json

drop view if exists gnaf.state_json cascade;

create or replace view gnaf.state_json as
    select
        s.state_pid,
        jsonb_build_object(
            'state_pid', s.state_pid,
            'name', initcap(s.state_name),
            'abbrev', s.state_abbreviation
        ) as state_json
    from gnaf_raw.state s;

-- gnaf.locality_json

drop view if exists gnaf.locality_json cascade;

create or replace view gnaf.locality_json as
select
    l.locality_pid,
    jsonb_build_object(
        'locality_pid', l.locality_pid,
        'name', initcap(l.locality_name),
        'locality_class_code', l.locality_class_code,
        'locality_class', initcap(lca.description),
        'aliases', (
            select jsonb_agg(jsonb_build_object(
                'name', initcap(la.name),
                'alias_type_code', la.alias_type_code,
                'alias_type', initcap(lat.description)
            ))
            from gnaf_raw.locality_alias la
            join gnaf_raw.locality_alias_type_aut lat on la.alias_type_code = lat.code
            where la.locality_pid = l.locality_pid
        ),
        'postcodes', lpc.postcodes
    ) as locality_json,
    st_point(lcp.longitude, lcp.latitude) as geometry

from
    gnaf_raw.locality l
        left outer join gnaf_raw.locality_class_aut lca on l.locality_class_code = lca.code
        left outer join gnaf_raw.locality_point lcp on l.locality_pid = lcp.locality_pid
        left outer join gnaf.locality_postcode lpc on l.locality_pid = lpc.locality_pid;

-- gnaf.street_json

drop view if exists gnaf.street_json cascade;

create view gnaf.street_json as
select
    sl.street_locality_pid,
    jsonb_build_object(
        'street_locality_pid', sl.street_locality_pid,
        'name', initcap(sl.street_name),
        'type', initcap(sl.street_type_code),
        'suffix_code', sl.street_suffix_code,
        'suffix', initcap(ss.name),
        'aliases', (
            select jsonb_agg(jsonb_build_object(
                'street_locality_alias_pid', sla.street_locality_alias_pid,
                'alias_type_code', sla.alias_type_code,
                'name', initcap(sla.street_name),
                'type', initcap(sla.street_type_code),
                'suffix_code', sla.street_suffix_code,
                'suffix', initcap(ssa.name)
            ))
            from gnaf_raw.street_locality_alias sla
            left outer join gnaf_raw.street_locality_alias_type_aut slat on sla.alias_type_code = slat.code
            left outer join gnaf_raw.street_suffix_aut ssa on ssa.code = sla.street_suffix_code
            where sla.street_locality_pid = sl.street_locality_pid
        ),
        'postcodes', spc.postcodes
    ) as street_locality_json,
    st_point(sp.longitude, sp.latitude) as geometry

from
    gnaf_raw.street_locality sl
        left outer join gnaf_raw.street_suffix_aut ss on ss.code = sl.street_suffix_code
        left outer join gnaf_raw.street_locality_point sp on sp.street_locality_pid = sl.street_locality_pid
        left outer join gnaf.street_postcode spc on spc.street_locality_pid = sl.street_locality_pid;

-- gnaf.address_json

drop view if exists gnaf.address_json cascade;

create view gnaf.address_json as
select
    ad.address_detail_pid,
    jsonb_build_object(
        'address_detail_pid', ad.address_detail_pid,
        'alias_principal', ad.alias_principal,
        'primary_secondary', ad.primary_secondary,
        'address_site_name', initcap(ads.address_site_name),
        'building_name', initcap(ad.building_name),
        'lot_number_prefix', ad.lot_number_prefix,
        'lot_number', ad.lot_number,
        'lot_number_suffix', ad.lot_number_suffix,
        'flat_type_code', ad.flat_type_code,
        'flat_type', initcap(ft.name),
        'flat_number_prefix', ad.flat_number_prefix,
        'flat_number', ad.flat_number,
        'flat_number_suffix', ad.flat_number_suffix,
        'level_type_code', ad.level_type_code,
        'level_type', initcap(lt.name),
        'level_number_prefix', ad.level_number_prefix,
        'level_number', ad.level_number,
        'level_number_suffix', ad.level_number_suffix,
        'number_first_prefix', ad.number_first_prefix,
        'number_first', ad.number_first,
        'number_first_suffix', ad.number_first_suffix,
        'number_last_prefix', ad.number_last_prefix,
        'number_last', ad.number_last,
        'number_last_suffix', ad.number_last_suffix,
        'location_description', ad.location_description,
        'postcode', ad.postcode,
        'private_street', ad.private_street,
        'confidence', ad.confidence,
        'level_geocoded_code', ad.level_geocoded_code,
        'legal_parcel_id', ad.legal_parcel_id
    ) as address_detail_json,
    ad.postcode as postcode,
    st_point(ag.longitude, ag.latitude) as geometry

from
    gnaf_raw.address_detail ad
        left outer join gnaf_raw.flat_type_aut ft on ft.code = ad.flat_type_code
        left outer join gnaf_raw.level_type_aut lt on lt.code = ad.level_type_code
        left outer join gnaf_raw.address_site ads on ads.address_site_pid = ad.address_site_pid
        left outer join gnaf_raw.address_default_geocode ag on ag.address_detail_pid = ad.address_detail_pid;
