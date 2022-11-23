{{ config( 
        materialization = 'table',
        tags = ["location", "source", "datavault"]
)}}


select 
    id,
    city,
    street_address,
    state_province,
    postal_code
from
    {{ ref('location') }}
