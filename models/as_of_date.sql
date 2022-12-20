
{{ config( 
        materialization = 'table',
        tags = ["dates", "businessvault", "water", "datavault"]
)}}


{% set granularity = 'day' %}
{% set start_date = "'2022-01-01'" %}
{% set end_date = "'2023-02-01'" %}

WITH 
prenumbers AS (
    SELECT 
        n 
    FROM 
        (VALUES (0),(1),(2),(3),(4),(5),(6),(7),(8),(9)) v(n))
,

numbers as (
    SELECT 
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) as dates
    FROM 
        prenumbers ones, 
        prenumbers tens, 
        prenumbers hundreds, 
        prenumbers thousands, 
        prenumbers tenthousand
)

select 
    {% if granularity == 'hour' %}
        cast(dateadd(hour, dates - 1, {{start_date}}) as date)
    {% elif granularity == 'day' %}
        cast(dateadd(day, dates - 1, {{start_date}}) as date)
    {% elif granularity == 'week' %}
        cast(dateadd(week, dates - 1, {{start_date}}) as date)
    {% elif granularity == 'month' %}
        cast(dateadd(month, dates - 1, {{start_date}}) as date)
    {% elif granularity == 'quarter' %}
        cast(dateadd(quarter, dates - 1, {{start_date}}) as date)
    {% elif granularity == 'year' %}
        cast(dateadd(year, dates - 1, {{start_date}}) as date)
    {% endif %}
     as as_of_date
from 
    numbers
where 
    {% if granularity == 'hour' %}
        dates < DATEDIFF(hour, {{start_date}}, {{end_date}}) + 1
    {% elif granularity == 'day' %}
        dates < DATEDIFF(day, {{start_date}}, {{end_date}}) + 1
    {% elif granularity == 'week' %}
        dates < DATEDIFF(week, {{start_date}}, {{end_date}}) + 1
    {% elif granularity == 'month' %}
        dates < DATEDIFF(month, {{start_date}}, {{end_date}}) + 1
    {% elif granularity == 'quarter' %}
        dates < DATEDIFF(quarter, {{start_date}}, {{end_date}}) + 1
    {% elif granularity == 'year' %}
        dates < DATEDIFF(year, {{start_date}}, {{end_date}}) + 1
    {% endif %}
