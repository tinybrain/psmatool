drop view if exists gnaf_raw.locality_json;

create or replace view gnaf_raw.locality_json as
    select
        l.locality_pid,
        json_build_object(
            'locality_pid', l.locality_pid,
            'name', initcap(l.locality_name),
            'locality_class_code', l.locality_class_code,
            'locality_class', initcap(lca.description),
            'aliases', (
                select json_agg(json_build_object(
                    'name', initcap(la.name),
                    'alias_type_code', la.alias_type_code,
                    'alias_type', initcap(lat.description)
                ))
                from gnaf_raw.locality_alias la
                join gnaf_raw.locality_alias_type_aut lat on la.alias_type_code = lat.code
                where la.locality_pid = l.locality_pid
           )
        ) as locality_json

    from gnaf_raw.locality l
        inner join gnaf_raw.locality_class_aut lca on l.locality_class_code = lca.code

;

-- select * from gnaf_raw.locality_json where locality_pid = '500221759';
