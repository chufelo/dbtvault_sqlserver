{{ config(
        materialized='table',
        tags = ["country", "source", "datavault"]
) }}


select * from 
{{ source('dbo', 'country') }}