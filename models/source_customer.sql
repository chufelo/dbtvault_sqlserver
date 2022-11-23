{{ config( 
        materialization = 'table',
        tags = ["customer", "source", "datavault"]
)}}


select 
    CustomerID,
    Customer_Name,
    Customer_Group,
    Customer_Region
from
    {{ ref('customer') }}
