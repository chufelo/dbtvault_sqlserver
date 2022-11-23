{{ config(
        materialized='incremental',
        tags = ["customer", "sat", "datavault"]
) }}

{%- set yaml_metadata -%}
source_model: "stage_customer"
src_pk: "customer_HK"
src_hashdiff: 
    source_column: "customer_HASHDIFF"
    alias: "HASHDIFF"
src_payload:
    - "customer_name"
    - "customer_group"
    - "customer_region"
src_ldts: "timest"
src_source: "source"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ dbtvault.sat(src_pk=metadata_dict["src_pk"],
                src_hashdiff=metadata_dict["src_hashdiff"],
                src_payload=metadata_dict["src_payload"],
                src_ldts=metadata_dict["src_ldts"],
                src_source=metadata_dict["src_source"],
                source_model=metadata_dict["source_model"])   }}