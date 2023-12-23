select
    CustomerID, 
    Init_Purchase_YrMo, 
    Period, 
    count(distinct InvoiceNo) as orders_cnt, 
    sum(Order_Spend) as spending_total
from {{ ref('transactions') }}
where (Period >= 0)
group by 1,2,3