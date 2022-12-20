{{ config( 
        materialization = 'table',
        tags = ["transact", "source", "datavault"]
)}}


select 
    TransactID,
	ProductID,
	Sales_Production_Flag,
	CustomerID,
	Date,
	Quantity
from
    {{ ref('transact') }}
