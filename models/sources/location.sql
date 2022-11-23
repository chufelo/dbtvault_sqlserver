{{ config(
        materialized='incremental',
        tags = ["location", "source", "datavault"]
) }}


select * from 
{{ source('dbo', 'location') }}