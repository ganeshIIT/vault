{{
    config(
        materialized='incremental',
        unique_key='unique_id',
    )
}}

SELECT 
null::varchar(256) as invocation_id
,null::varchar(256) as unique_id
,null::varchar(256) as result_generated_at
,null::varchar(256) as total_elapsed_time_sec
,null::varchar(256) as rpc_method
,null::varchar(5000) as select_command
,null::varchar(256) as status
,null::varchar(256) as complie_started_at
,null::varchar(256) as complie_completed_at
,null::varchar(256) as execute_started_at
,null::varchar(256) as execute_completed_at
,null::varchar(256) as thread_id
,null::varchar(256) as execution_time
,null::varchar(5000) as adapter_response_message
,null::varchar(256) as adapter_response_code
,null::varchar(256) as adapter_response_rows_affected
,null::varchar(5000) as message
,null::varchar(256) as failures
