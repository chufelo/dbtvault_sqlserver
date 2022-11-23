{{ config( 
        materialization = 'table',
        tags = ["region", "source", "datavault"]
)}}


select 
    id,
    name,
    code
from
    {{ ref('region') }}
