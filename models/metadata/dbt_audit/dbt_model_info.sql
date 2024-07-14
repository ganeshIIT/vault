{{
    config(
        materialized='incremental',
        unique_key='unique_id',
    )
}}

SELECT 
null::varchar(256) as name
,null::varchar(256) as unique_id
,null::varchar(256) as resource_type
,null::varchar(256) as database_name
,null::varchar(256) as schema_name
,null::varchar(256) as table_name
,null::varchar(5000) as path