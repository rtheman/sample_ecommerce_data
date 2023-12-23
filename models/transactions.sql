{{
  config(
    materialized='table'
  )
}}

select 
    OG.CustomerID
    , ip.Init_Purchase_Date
    , ip.Init_Purchase_YrMo
    , OG.InvoiceDate as order_date
    , date_diff(date(OG.InvoiceDate), date(ip.Init_Purchase_Date), MONTH) as Period
    , OG.InvoiceNo
    , OG.Quantity as order_quantity
    , OG.UnitPrice
    , OG.Quantity * OG.UnitPrice as order_spend
from `landingzone.ecommerce_data` as OG
left join `dbtPROD___sample_eCommerce_data.initial_purchase` as ip
    on OG.CustomerID = ip.CustomerID
where
    (OG.CustomerID is not null)