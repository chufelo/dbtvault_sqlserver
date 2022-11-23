{{ config(
    materialized='incremental',
    tags = ["company", "postingmonth", "link", "water", "datavault"]
) }}

{{ config(materialized='incremental')         }}

{%- set source_model = "stage_gri3033"        -%}
{%- set src_pk = "gri3033_hk"         -%}
{%- set src_fk = ["company_hk", "postingmonth_hk"] -%}
{%- set src_ldts = "LOAD_DATETIME"           -%}
{%- set src_source = "source"         -%}

{{ dbtvault.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                 src_source=src_source, source_model=source_model) }}