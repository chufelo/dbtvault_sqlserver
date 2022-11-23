{{ config(
        materialized='view',
        tags = ["product", "stage", "datavault"]
) }}

{%- set yaml_metadata -%}

source_model: 
        source_product
hashed_columns: 
        product_hk:
                - productid
        product_hashdiff:
            is_hashdiff: true
            columns:
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
        product_factory_hk:
                - "productid"
                - "FactoryID"
                - "ActivityID"
        factory_hk:
                - "FactoryID"
derived_columns:
        source: "!dbo.product"
        load_datetime: "convert(varchar, CURRENT_TIMESTAMP, 126)"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ dbtvault.stage(include_source_columns=true,
                  source_model=metadata_dict['source_model'],
                  derived_columns=metadata_dict['derived_columns'],
                  null_columns=none,
                  hashed_columns=metadata_dict['hashed_columns'],
                  ranked_columns=none) }}