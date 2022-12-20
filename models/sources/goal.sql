{{ config(
        materialized='table',
        tags = ["company", "source", "datavault"]
) }}


select * from 
{{ source('dbo', 'goal') }}