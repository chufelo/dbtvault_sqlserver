{{ config(
        materialized='table',
        tags = ["product", "source", "datavault"]
) }}


select * from 
{{ source('dbo', 'product') }}