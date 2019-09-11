drop view if exists gnaf.address cascade;

create or replace view gnaf.address as
select
    ('A:' || ad.address_detail_pid) as id,
    'address' as type,

    jsonb_build_object(
        'building', initcap(ad.building_name),
        'lot', jsonb_build_object(
            'prefix', ad.lot_number_prefix,
            'number', ad.lot_number,
            'suffix', ad.lot_number_suffix
        ),
        'flat', jsonb_build_object(
            'type_code', ad.flat_type_code,
            'type', initcap(ft.name),
            'prefix', ad.flat_number_prefix,
            'number', ad.flat_number,
            'suffix', ad.flat_number_suffix
        ),
        'level', jsonb_build_object(
            'type_code', ad.level_type_code,
            'type', initcap(lt.name),
            'prefix', ad.level_number_prefix,
            'number', ad.level_number,
            'suffix', ad.level_number_suffix
        ),
        'number', jsonb_build_object(
            'first_prefix', ad.number_first_prefix,
            'first', ad.number_first,
            'first_suffix', ad.number_first_suffix,
            'last_prefix', ad.number_last_prefix,
            'last', ad.number_last,
            'last_suffix', ad.number_last_suffix
        ),
        'street', jsonb_build_object(
            'name', initcap(sl.street_name),
            'type', initcap(sl.street_type_code),
            'type_abbrev', initcap(sta.name),
            'suffix_code', sl.street_suffix_code,
            'suffix', initcap(ssa.name)
        ),
        'locality', initcap(l.locality_name),
        'state', s.state_abbreviation,
        'postcode', ad.postcode

    ) as components,

    jsonb_build_object(
        'ref', jsonb_build_object(
            'address_detail_pid', ad.address_detail_pid,
            'street_locality_pid', sl.street_locality_pid,
            'locality_pid', l.locality_pid,
            'state_pid', s.state_pid
        ),
        'address', jsonb_build_object(
            'alias_principal', ad.alias_principal,
            'primary_secondary', ad.primary_secondary
        )
    ) as metadata,
    st_asgeojson(st_point(ag.longitude, ag.latitude))::jsonb as geometry

from
    gnaf_raw.address_detail ad
        join gnaf_raw.street_locality sl on sl.street_locality_pid = ad.street_locality_pid
        join gnaf_raw.locality l on l.locality_pid = ad.locality_pid
        join gnaf_raw.state s on s.state_pid = l.state_pid
        left outer join gnaf_raw.flat_type_aut ft on ft.code = ad.flat_type_code
        left outer join gnaf_raw.level_type_aut lt on lt.code = ad.level_type_code
        left outer join gnaf_raw.address_site ads on ads.address_site_pid = ad.address_site_pid
        left outer join gnaf_raw.address_default_geocode ag on ag.address_detail_pid = ad.address_detail_pid
        left outer join gnaf_raw.street_type_aut sta on sta.code = sl.street_type_code
        left outer join gnaf_raw.street_suffix_aut ssa on ssa.code = sl.street_suffix_code;