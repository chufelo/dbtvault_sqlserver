{{ config( 
        materialization = 'table',
        tags = ["factory", "source", "datavault"]
)}}


select 
    FactoryID,
    Kwh_All,
    Property_Value,
    EPC_Class,
    Men,
    Women,
    Asian,
    Black,
    White,
    Other_Ethnicity,
    Total
from
    {{ ref('factory') }}
