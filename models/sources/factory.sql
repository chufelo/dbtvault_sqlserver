{{ config(
        materialized='incremental',
        tags = ["factory", "source", "datavault"]
) }}


select * from 
{{ source('dbo', 'factory') }}