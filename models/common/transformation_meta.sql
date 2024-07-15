{{
    config(
        materialized='incremental',
        transient = False,
        unique_key='invocation_id',
    )
}}

with empty_table as (
SELECT 
null::varchar(256) as database_name
,null::varchar(256) as schema_name
,null::varchar(256) as table_name
,null::TIMESTAMP_TZ(9) as timestamp
,null::varchar(256) as invocation_id
,null::varchar(256) as stage
,null::varchar(256) as size
,null::varchar(256) as no_rows
)
select * from empty_table
where 1 = 0