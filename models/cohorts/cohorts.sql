select 
    Init_Purchase_YrMo, 
    Period, 
    count(distinct CustomerID) as cust_cnt, 
    sum(orders_cnt) as orders_total, 
    sum(spending_total) as spending_total
from {{ref('transactions_aggt')}}
where
    (orders_cnt > 0)
group by 1,2
order by 1,2