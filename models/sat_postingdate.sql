{{ config(
        materialized='incremental',
        tags = ["postingmonth", "gri", "sat", "water", "datavault"]
) }}

{%- set yaml_metadata -%}
source_model: "stage_gri3033"
src_pk: "postingmonth_hk"
src_hashdiff: 
    source_column: "postingmonth_hashdiff"
    alias: "HASHDIFF"
src_payload:
    - "postingmonth"
src_ldts: "load_datetime"
src_source: "source"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ dbtvault.sat(src_pk=metadata_dict["src_pk"],
                src_hashdiff=metadata_dict["src_hashdiff"],
                src_payload=metadata_dict["src_payload"],
                src_ldts=metadata_dict["src_ldts"],
                src_source=metadata_dict["src_source"],
                source_model=metadata_dict["source_model"])   }}