{{
  config(
    materialized='table'
  )
}}

select
    -- OG.CustomerID,
    CAST(OG.CustomerID AS STRING) AS CustomerID, 
    ip.Init_Purchase_Date,
    ip.Init_Purchase_YrMo,
    OG.InvoiceDate as Order_Date,
    OG.InvoiceNo,
    OG.Quantity as Order_Quantity,
    OG.UnitPrice,
    date_diff(date(OG.InvoiceDate), date(ip.Init_Purchase_Date), month)
        as Period,
    OG.Quantity * OG.UnitPrice as Order_Spend
from `transformed_rtheman.ecommerce_data` as OG
left join {{ ref('initial_purchase') }} as ip
    on CAST(OG.CustomerID AS STRING) = ip.CustomerID
where
    (OG.CustomerID is not null)
