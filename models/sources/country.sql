{{ config(
        materialized='incremental',
        tags = ["country", "source", "datavault"]
) }}


select * from 
{{ source('dbo', 'country') }}