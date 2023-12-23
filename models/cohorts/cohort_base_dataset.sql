SELECT
    Init_Purchase_YrMo,
    init_cnt AS cohort_size,
    Period,
    cust_cnt,
    -- , CAST( CAST(cust_cnt AS DOUBLE) / CAST(init_cnt AS DOUBLE) AS DECIMAL(10,4) ) AS cnt_pctg
    orders_total,
    spending_total,
    (cust_cnt / init_cnt) AS cnt_pctg
FROM {{ref('cohort_w_init_cnt')}}