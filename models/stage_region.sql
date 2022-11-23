{{ config(
        materialized='view',
        tags = ["region", "stage", "datavault"]
) }}

{%- set yaml_metadata -%}

source_model: 
        source_region
hashed_columns:
        region_hk: "id"
        region_hashdiff:
                is_hashdiff: true
                columns:
                        - "name"
                        - "code"
derived_columns:
        source: "!dbo.region"
        load_datetime: "convert(varchar, CURRENT_TIMESTAMP, 126)"

{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ dbtvault.stage(include_source_columns=true,
                  source_model=metadata_dict['source_model'],
                  derived_columns=metadata_dict['derived_columns'],
                  null_columns=none,
                  hashed_columns=metadata_dict['hashed_columns'],
                  ranked_columns=none) }}