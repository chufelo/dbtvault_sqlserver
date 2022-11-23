{{ config(
        materialized='incremental',
        tags = ["product", "source", "datavault"]
) }}


select * from 
{{ source('dbo', 'product') }}