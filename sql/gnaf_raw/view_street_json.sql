drop view if exists gnaf_raw.street_json;

create view gnaf_raw.street_json as
    select
        sl.street_locality_pid,
        json_build_object(
            'street_locality_pid', sl.street_locality_pid,
            'name', initcap(sl.street_name),
            'type', initcap(sl.street_type_code),
            'suffix_code', sl.street_suffix_code,
            'suffix', initcap(ss.name),
            'aliases', (
                select json_agg(json_build_object(
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
            )
        ) as street_locality_json
    from
         gnaf_raw.street_locality sl
        left outer join gnaf_raw.street_suffix_aut ss on ss.code = sl.street_suffix_code
;

-- select * from gnaf_raw.street_json