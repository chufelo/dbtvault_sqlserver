{{ config(
        materialized='incremental',
        tags = ["company","gri", "water", "source", "datavault"]
) }}


select * from 
{{ source('staging', 'gri3033') }}