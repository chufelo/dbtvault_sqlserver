{{ config(
        materialized='view',
        tags = ["transact", "stage", "datavault"]
) }}

{%- set yaml_metadata -%}

source_model: 
        source_transact
hashed_columns: 
        transact_hk:
                - transactid
        transact_hashdiff:
            is_hashdiff: true
            columns:
                - "Sales_Production_Flag"
        link_transact_hash:
                - "productid"
                - "customerID"
                - "transactid"
        productid_hash:
                - "ProductID"
        customerid_hash:
                - "customerID"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ dbtvault.stage(include_source_columns=true,
                  source_model=metadata_dict['source_model'],
                  null_columns=none,
                  hashed_columns=metadata_dict['hashed_columns'],
                  ranked_columns=none) }}