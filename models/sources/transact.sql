{{ config(
        materialized='incremental',
        tags = ["transact", "source", "datavault"]
) }}


select * from 
{{ source('dbo', 'transact') }}