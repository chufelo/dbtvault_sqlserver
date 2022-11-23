{{ config(
        materialized='incremental',
        tags = ["gri", "sat", "water", "datavault"]
) }}

{%- set yaml_metadata -%}
source_model: "stage_gri3033"
src_pk: "gri3033_hk"
src_hashdiff: 
    source_column: "gri3033_HASHDIFF"
    alias: "HASHDIFF"
src_payload:
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