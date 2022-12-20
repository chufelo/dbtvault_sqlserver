{{ config(
        materialized='table',
        tags = ["region", "source", "datavault"]
) }}


select * from 
{{ source('dbo', 'region') }}