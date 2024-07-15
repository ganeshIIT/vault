{% macro log_model_meta(node, stage) -%}
    {%- if node.table.lower() !=  'transformation_meta' -%}
    -- depends_on: {{ ref('transformation_meta') }}
    {{ br }}
        {%- if execute -%}
            

                INSERT into {{ ref('transformation_meta') }} (database_name, schema_name, table_name, size, no_rows, timestamp, stage, invocation_id)
                SELECT table_catalog, table_schema, table_name, bytes, row_count, CONVERT_TIMEZONE( 'UTC' , current_timestamp ), '{{stage}}', '{{invocation_id}}'
                FROM {{node.database}}.information_schema.tables
                where UPPER(table_catalog) = UPPER('{{node.database}}')
                and UPPER(table_schema) = UPPER('{{node.schema}}')
                and UPPER(table_name) = UPPER('{{node.identifier}}')

            {%- endif -%}
    {%- endif -%}

{%- endmacro %}