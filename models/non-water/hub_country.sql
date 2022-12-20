{{ config(
        materialized='incremental',
        tags = ["country", "hub", "datavault"]
) }}

{%- set source_model = "stage_country"   -%}
{%- set src_pk = "country_hk"          -%}
{%- set src_nk = "id"          -%}
{%- set src_ldts = "load_datetime"      -%}
{%- set src_source = "source"    -%}

{{ dbtvault.hub(
                src_pk=src_pk, 
                src_nk=src_nk, 
                src_ldts=src_ldts,
                src_source=src_source, 
                source_model=source_model
) }}
