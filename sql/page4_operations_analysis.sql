-- Revenue by Fulfilment
select fulfilment, sum(net_revenue) as revenue
from amazon_sales
group by fulfilment
order by revenue desc;

-- Orders by Fulfilment
select fulfilment, count(*) as orders
from amazon_sales
group by fulfilment
order by orders desc;

-- Revenue by Sales Channel
select sales_channel, sum(net_revenue) as revenue
from amazon_sales
group by sales_channel
order by revenue desc;

-- Revenue by Courier Status
select courier_status, sum(net_revenue) as revenue
from amazon_sales
group by courier_status
order by revenue desc;

-- Cancellation Rate by Fulfilment
select fulfilment,
(sum(case status
when "cancelled" then 1
else 0 
end)*100.0/count(*)) as cancellation_rate
from amazon_sales
group by fulfilment
order by cancellation_rate desc;

-- B2B vs B2C Revenue
select b2b, sum(net_revenue) as revenue
from amazon_sales
group by b2b;

-- Status-wise Revenue and Orders
select status, round(sum(net_revenue),2) as revenue, count(*) as total_orders
from amazon_sales
group by status
order by revenue desc;

-- Problem vs Successful Orders
with order_summary as
(select
case status 
when "cancelled" then "problem orders"
else "successful orders"
end as order_type, sum(net_revenue), count(*)
from amazon_sales
group by order_type)

select * 
from order_summary;

-- Top Courier Status by Revenue
select courier_status, sum(net_revenue) as revenue
from amazon_sales
group by courier_status
order by revenue desc;

