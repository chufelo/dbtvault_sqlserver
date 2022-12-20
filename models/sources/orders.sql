{{ config(
        materialized='table',
        tags = ["orders", "source", "datavault"]
) }}


select * from 
{{ source('testdbo', 'orders') }}