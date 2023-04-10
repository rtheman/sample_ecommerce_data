{{
  config(
    materialized='table'
  )
}}

select 
    OG.CustomerID
    , OG.Country
    , OG.InvoiceDate
    , date_diff(date(OG.InvoiceDate), date(fp.Init_Purchase_Date), MONTH) as Period
    , OG.InvoiceNo
    , OG.StockCode
    , OG.Description
    , OG.Quantity
    , OG.UnitPrice
    , (OG.UnitPrice * OG.Quantity) as TotalPrice
    , fp.Init_Purchase_Date
    , fp.Init_Purchase_YrMo
    , fp.Init_Purchase_YrQtr
from `landingzone.ecommerce_data` as OG
left join `dbtPROD___sample_eCommerce_data.initial_purchase` as fp
    on OG.CustomerID = fp.CustomerID
where
    (OG.CustomerID is not null)