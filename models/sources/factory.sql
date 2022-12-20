{{ config(
        materialized='table',
        tags = ["factory", "source", "datavault"]
) }}


select * from 
{{ source('dbo', 'factory') }}