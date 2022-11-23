{{ config(
        materialized='incremental',
        tags = ["company", "hub", "water", "datavault"]
) }}

{%- set source_model = "stage_gri3033"   -%}
{%- set src_pk = "company_HK"          -%}
{%- set src_nk = "companyID"          -%}
{%- set src_ldts = "load_datetime"      -%}
{%- set src_source = "source"    -%}

{{ dbtvault.hub(
                src_pk=src_pk, 
                src_nk=src_nk, 
                src_ldts=src_ldts,
                src_source=src_source, 
                source_model=source_model
) }}
