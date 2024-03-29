with Init_Purchase as (
    select 
        -- CustomerID
        CAST(CustomerID AS STRING) AS CustomerID
        , min(InvoiceDate) as Init_Purchase_Date
    from `transformed_rtheman.ecommerce_data`
    where 
        (CustomerID is not null)    -- ensure legit transactions
        and (Quantity >= 0)         -- avoid returns transactions (negative Quantity value)
  group by 1
)

select 
  CustomerID
  , Init_Purchase_Date
  , date_trunc(Init_Purchase_Date, month) as Init_Purchase_YrMo
  , date_trunc(Init_Purchase_Date, quarter) as Init_Purchase_YrQtr
from Init_Purchase