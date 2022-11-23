{{ config(
        materialized='view',
        tags = ["factory", "stage", "datavault"]
) }}

{%- set yaml_metadata -%}

source_model: 
        source_factory
hashed_columns:
        factory_hk:
            - factoryid
        factory_hashdiff:
            is_hashdiff: true
            columns:
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
derived_columns:
        source: "!dbo.factory"
        load_datetime: "convert(varchar, CURRENT_TIMESTAMP, 126)"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ dbtvault.stage(include_source_columns=true,
                  source_model=metadata_dict['source_model'],
                  derived_columns=metadata_dict['derived_columns'],
                  null_columns=none,
                  hashed_columns=metadata_dict['hashed_columns'],
                  ranked_columns=none) }}