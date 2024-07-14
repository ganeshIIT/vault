{{
    config(
        materialized='view',
        bind=False,
    )
}}

with 
start_meta as (
    select * from {{ref('transformation_meta')}}
    where stage = 'start'
),
end_meta as (
    select * from {{ref('transformation_meta')}}
    where stage = 'end'
)

SELECT 
B.database_name
,B.schema_name
,B.table_name
,A.invocation_id
,A.unique_id
,{{try_cast('A.result_generated_at','timestamptz')}} result_generated_at
,{{try_cast('A.total_elapsed_time_sec','float')}} total_elapsed_time_sec
,A.rpc_method
,A.select_command
,A.status
,{{try_cast('A.complie_started_at','timestamptz')}} complie_started_at
,{{try_cast('A.complie_completed_at','timestamptz')}} complie_completed_at
,{{try_cast('A.execute_started_at','timestamptz')}} execute_started_at
,{{try_cast('A.execute_completed_at','timestamptz')}} execute_completed_at
,A.thread_id
,{{try_cast('A.execution_time','float')}} execution_time
,A.adapter_response_message
,A.adapter_response_code
,A.adapter_response_rows_affected
,A.message
,A.failures
,{{try_cast('sm.size','float')}}  start_size_bytes
,{{try_cast('sm.no_rows','float')}} start_no_rows
,{{try_cast('em.size','float')}}  end_size_bytes
,{{try_cast('em.no_rows','float')}} end_no_rows

FROM {{ref('dbt_results')}} A
LEFT JOIN  {{ref('dbt_model_info')}} B
ON A.unique_id = B.unique_id

LEFT JOIN  start_meta sm
ON lower(B.database_name) = lower(sm.database_name) AND lower(B.schema_name) = lower(sm.schema_name) AND lower(B.table_name) = lower(sm.table_name) AND A.invocation_id = sm.invocation_id

LEFT JOIN  end_meta em
ON lower(B.database_name) = lower(em.database_name) AND lower(B.schema_name) = lower(em.schema_name) AND lower(B.table_name) = lower(em.table_name) AND A.invocation_id = em.invocation_id

where A.invocation_id is not null
