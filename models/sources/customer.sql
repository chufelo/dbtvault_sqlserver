{{ config(
        materialized='table',
        tags = ["customer", "source", "datavault"]
) }}


select * from 
{{ source('dbo', 'customer') }}