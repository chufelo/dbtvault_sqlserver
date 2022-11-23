{{ config(
    materialized='incremental',
    tags = ["product", "link", "datavault"]
) }}

{%- set source_model = "stage_product"        -%}
{%- set src_pk = "product_factory_hk"         -%}
{%- set src_fk = ["product_HK", "factory_HK"] -%}
{%- set src_ldts = "timest"           -%}
{%- set src_source = "source"         -%}

{{ dbtvault.link(
    src_pk=src_pk,
    src_fk=src_fk,
    src_ldts=src_ldts,
    src_source=src_source,
    source_model=source_model
) }}