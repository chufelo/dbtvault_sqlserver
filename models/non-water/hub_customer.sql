{{ config(
        materialized='incremental',
        tags = ["customer", "hub", "datavault"]
) }}

{%- set source_model = "stage_customer"   -%}
{%- set src_pk = "CUSTOMER_HK"          -%}
{%- set src_nk = "CUSTOMERID"          -%}
{%- set src_ldts = "load_datetime"      -%}
{%- set src_source = "source"    -%}

{{ dbtvault.hub(
                src_pk=src_pk, 
                src_nk=src_nk, 
                src_ldts=src_ldts,
                src_source=src_source, 
                source_model=source_model
) }}
