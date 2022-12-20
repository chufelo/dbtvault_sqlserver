{{ config(
        materialized='view',
        tags = ["gri3033", "stage", "water", "datavault"]
) }}

{%- set yaml_metadata -%}

source_model: 
        source_gri3033
hashed_columns: 
        gri3033_hk:
                - "companyid"
                - "postingmonth"
        company_hk:
                - "companyid"
        postingmonth_hk:
                - "postingmonth"
        gri3033_hashdiff:
            is_hashdiff: true
            columns:
                - "fw_surf_withd"
                - "nfw_surf_withd"
                - "fw_gr_withd"
                - "nfw_gr_withd"
                - "fw_sea_withd"
                - "nfw_sea_withd"
                - "fw_prod_withd"
                - "nfw_prod_withd"
                - "fw_third_withd"
                - "nfw_third_withd"
                - "fw_surf_withd_s"
                - "nfw_surf_withd_s"
                - "fw_gr_withd_s"
                - "nfw_gr_withd_s"
                - "fw_sea_withd_s"
                - "nfw_sea_withd_s"
                - "fw_prod_withd_s"
                - "nfw_prod_withd_s"
                - "fw_third_withd_s"
                - "nfw_third_withd_s"
        company_hashdiff:
            is_hashdiff: true
            columns:
                - "company"
        postingmonth_hashdiff:
            is_hashdiff: true
            columns:
                - "postingmonth"
derived_columns:
        source: "!staging.gri3033 + dbo.goal"
        load_datetime: "convert(varchar, CURRENT_TIMESTAMP, 126)"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ dbtvault.stage(include_source_columns=true,
                  source_model=metadata_dict['source_model'],
                  derived_columns=metadata_dict['derived_columns'],
                  null_columns=none,
                  hashed_columns=metadata_dict['hashed_columns'],
                  ranked_columns=none) }}