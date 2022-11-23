{{ config(
        materialized='incremental',
        tags = ["region", "source", "datavault"]
) }}


select * from 
{{ source('dbo', 'region') }}