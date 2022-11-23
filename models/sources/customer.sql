{{ config(
        materialized='incremental',
        tags = ["customer", "source", "datavault"]
) }}


select * from 
{{ source('dbo', 'customer') }}