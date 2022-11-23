{{ config(
        materialized='incremental',
        tags = ["transact", "hub", "datavault"]
) }}

{%- set source_model = "stage_transact"   -%}
{%- set src_pk = "transact_HK"          -%}
{%- set src_nk = "transactID"          -%}
{%- set src_ldts = "load_datetime"      -%}
{%- set src_source = "source"    -%}

{{ dbtvault.hub(
                src_pk=src_pk, 
                src_nk=src_nk, 
                src_ldts=src_ldts,
                src_source=src_source, 
                source_model=source_model
) }}
