{{ config(
        materialized='incremental',
        tags = ["orders", "source", "datavault"]
) }}


select * from 
{{ source('testdbo', 'orders') }}