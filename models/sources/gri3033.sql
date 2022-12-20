{{ config(
        materialized='table',
        tags = ["company","gri", "source", "datavault"]
) }}


select * from 
{{ source('staging', 'gri3033') }}