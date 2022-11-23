{{ config( 
        materialization = 'table',
        tags = ["country", "source", "datavault"]
)}}


select 
    id,
    name,
    code
from
    {{ ref('country') }}
