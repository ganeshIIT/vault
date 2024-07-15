{{
    config(
        materialized='incremental',
        unique_key='invocation_id',
    )
}}

SELECT 
null::varchar(256) as database_name
,null::varchar(256) as schema_name
,null::varchar(256) as table_name
,null::TIMESTAMP_TZ(9) as timestamp
,null::varchar(256) as invocation_id
,null::varchar(256) as stage
,null::varchar(256) as size
,null::varchar(256) as no_rows
