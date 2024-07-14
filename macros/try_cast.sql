{% macro try_cast(column, data_type, data_format=none ) -%}
    {%- if data_type == 'date' -%}
        {%- if data_format == none -%}
            TRY_TO_DATE( {{column}} )
        {%- else -%}
            TRY_TO_DATE( {{column}},  '{{data_format}}')
        {%- endif -%}
    {%- elif data_type == 'timestamp' -%}
        {%- if data_format == none -%}
            TRY_TO_TIMESTAMP( {{column}} )
        {%- else -%}
            TRY_TO_TIMESTAMP( {{column}},  '{{data_format}}')
        {%- endif -%}
    {%- elif data_type in ['string','varchar'] -%}
        {{column}}::varchar
    {%- else -%}
        TRY_CAST( {{column}} as {{data_type}} )
    {%- endif -%}
 
{%- endmacro %}

{% macro escape_regex(rgx) -%}
    {{ "'" + rgx.replace('\\','\\\\') + "'" }}
{%- endmacro %}