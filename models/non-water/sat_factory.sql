{{ config(
        materialized='incremental',
        tags = ["factory", "sat", "datavault"]
) }}

{%- set yaml_metadata -%}
source_model: "stage_factory"
src_pk: "factory_HK"
src_hashdiff: 
    source_column: "factory_HASHDIFF"
    alias: "HASHDIFF"
src_payload:
    - "Kwh_All"
    - "Property_Value"
    - "EPC_Class"
    - "Men"
    - "Women"
    - "Asian"
    - "Black"
    - "White"
    - "Other_Ethnicity"
    - "Total"
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