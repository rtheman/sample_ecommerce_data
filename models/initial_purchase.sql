-- override dbt_project.yml and persist result as table
{{
    config(
        materialized='view'
    )
}}


with Init_Purchase as (
  select 
    CustomerID
    , min(InvoiceDate) as Init_Purchase_Date
  from `landingzone.ecommerce_data` 
  where 
    (CustomerID is not null)
    and (Quantity >= 0)
  group by 1
)

select 
  CustomerID
  , Init_Purchase_Date
  , date_trunc(Init_Purchase_Date, month) as Init_Purchase_YrMo
  , date_trunc(Init_Purchase_Date, quarter) as Init_Purchase_YrQtr
from Init_Purchase