{{ config( 
        materialization = 'table',
        tags = ["product", "source", "datavault"]
)}}


select 
    ProductID,
    Product_Family,
    Product_Category,
    Product_Name,
    Weight,
    Price,
    CostID,
    Green_Flag,
    ActivityID,
    FactoryID,
    Emission,
    Planned_Emission,
    Waste,
    Planned_Waste,
    Waste_Recycling,
    Water
from
    {{ ref('product') }}
