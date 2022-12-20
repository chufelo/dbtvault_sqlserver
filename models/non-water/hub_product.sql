{{ config(
        materialized='incremental',
        tags = ["product", "hub", "datavault"]
) }}

{%- set source_model = "stage_product"   -%}
{%- set src_pk = "product_HK"          -%}
{%- set src_nk = "productID"          -%}
{%- set src_ldts = "load_datetime"      -%}
{%- set src_source = "source"    -%}

{{ dbtvault.hub(
                src_pk=src_pk, 
                src_nk=src_nk, 
                src_ldts=src_ldts,
                src_source=src_source, 
                source_model=source_model
) }}
