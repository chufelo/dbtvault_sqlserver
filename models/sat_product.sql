{{ config(
        materialized='incremental',
        tags = ["product", "sat", "datavault"]
) }}

{%- set yaml_metadata -%}
source_model: "stage_product"
src_pk: "product_HK"
src_hashdiff: 
    source_column: "product_HASHDIFF"
    alias: "HASHDIFF"
src_payload:
    - "Product_Family"
    - "Product_Category"
    - "Product_Name"
    - "Weight"
    - "Price"
    - "CostID"
    - "Green_Flag"
    - "ActivityID"
    - "FactoryID"
    - "Emission"
    - "Planned_Emission"
    - "Waste"
    - "Planned_Waste"
    - "Waste_Recycling"
    - "Water"
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