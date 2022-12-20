{{ config(
        materialized='pit_incremental',
        tags = ["gri", "pit", "water", "datavault"]
        
) }}

{%- set yaml_metadata -%}

source_model: hub_gri3033
src_pk: GRI3033_HK
as_of_dates_table: as_of_date
satellites: 
  sat_company:
    pk:
      PK: COMPANY_HK
    ldts:
      LDTS: LOAD_DATETIME
  sat_gri3033:
    pk:
      PK: GRI3033_HK
    ldts:
      LDTS: LOAD_DATETIME
stage_tables: 
  stg_company: LOAD_DATETIME
  stg_gri3033: LOAD_DATETIME    
src_ldts: LOAD_DATETIME
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict['source_model'] %}
{% set src_pk = metadata_dict['src_pk'] %}
{% set as_of_dates_table = metadata_dict['as_of_dates_table'] %}
{% set satellites = metadata_dict['satellites'] %}
{% set src_ldts = metadata_dict['src_ldts'] %}

{{ dbtvault.pit(source_model=source_model, src_pk=src_pk,
                as_of_dates_table=as_of_dates_table,
                satellites=satellites,
                src_ldts=src_ldts) }}