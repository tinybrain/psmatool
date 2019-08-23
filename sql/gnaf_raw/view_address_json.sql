drop view if exists gnaf_raw.address_json;

create view gnaf_raw.address_json as
    select
        ad.address_detail_pid as pid,
        jsonb_build_object(
            'id', ad.address_detail_pid,
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
        left outer join gnaf_raw.address_default_geocode ag on ag.address_detail_pid = ad.address_detail_pid
;

select * from gnaf_raw.address_json limit 500;