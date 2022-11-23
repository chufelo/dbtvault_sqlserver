{{ config(
        materialized='incremental',
        tags = ["transact", "sat", "datavault"]
) }}

{%- set yaml_metadata -%}
source_model: "stage_transact"
src_pk: "transact_HK"
src_hashdiff: 
    source_column: "transact_HASHDIFF"
    alias: "HASHDIFF"
src_payload:
    - "Sales_Production_Flag"
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