{{ config(
        materialized='view',
        tags = ["customer", "stage", "datavault"]
) }}

{%- set yaml_metadata -%}

source_model: 
        source_customer
hashed_columns:
        customer_hk: "customerid"
        customer_hashdiff:
                is_hashdiff: true
                columns:
                        - "customer_name"
                        - "customer_group"
                        - "customer_region"
derived_columns:
        source: "!dbo.customer"
        load_datetime: "convert(varchar, CURRENT_TIMESTAMP, 126)"

{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ dbtvault.stage(include_source_columns=true,
                  source_model=metadata_dict['source_model'],
                  derived_columns=metadata_dict['derived_columns'],
                  null_columns=none,
                  hashed_columns=metadata_dict['hashed_columns'],
                  ranked_columns=none) }}