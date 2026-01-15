sql
{{ config(
    materialized='table',
    tags=['finance', 'monthly']
) }}

with orders as (
    select * from {{ ref('stg_ecommerce_orders') }}
),

payments as (
    select * from {{ ref('stg_stripe_payments') }}
),

-- Aggregate revenue by month
monthly_metrics as (
    select
        date_trunc('month', order_date) as order_month,
        count(distinct order_id) as total_orders,
        sum(amount) as gross_revenue,
        -- Calculate average order value
        sum(amount) / count(distinct order_id) as aov
    from orders
    join payments using (order_id)
    where status = 'success'
    group by 1
)

select 
    order_month,
    total_orders,
    gross_revenue,
    aov,
    lag(gross_revenue) over (order_by order_month) as prev_month_revenue
from monthly_metrics
