drop view if exists gnaf_raw.state_json;

create or replace view gnaf_raw.state_json as
    select
        s.state_pid,
        json_build_object(
            'state_pid', s.state_pid,
            'name', initcap(s.state_name),
            'abbrev', s.state_abbreviation
        ) as state_json
    from gnaf_raw.state s
;

-- select * from gnaf_raw.state_json;