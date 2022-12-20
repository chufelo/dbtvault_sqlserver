{{ config(
        materialized='table',
        tags = ["location", "source", "datavault"]
) }}


select * from 
{{ source('dbo', 'location') }}