{{ config(
        materialized='incremental',
        tags = ["company", "water", "source", "datavault"]
) }}


select * from 
{{ source('dbo', 'goal') }}