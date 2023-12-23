select *
    , FIRST_VALUE(cust_cnt) OVER (
        PARTITION BY Init_Purchase_YrMo
        ORDER BY Period
    ) AS init_cnt
from {{ref('cohorts')}}