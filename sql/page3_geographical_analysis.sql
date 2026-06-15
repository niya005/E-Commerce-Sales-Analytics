-- Revenue by State
select ship_state, round(sum(net_revenue),2) as revenue
from amazon_sales
group by ship_state
order by revenue desc;

-- orders by State
select ship_state, count(*) as total_orders
from amazon_sales
group by ship_state
order by total_orders desc;

-- Units Sold by State
select ship_state, sum(qty) as units_sold
from amazon_sales
group by ship_state
order by units_sold desc;

-- Cancellation Rate by State
SELECT
    ship_state,
    ROUND(
        SUM(
            CASE
                WHEN status='Cancelled' THEN 1
                ELSE 0
            END
        )*100.0/COUNT(*),2
    ) AS cancellation_rate
FROM amazon_sales
GROUP BY ship_state
ORDER BY cancellation_rate DESC;

-- States Above Average Revenue
 select *
 from 
   (select ship_state, round(sum(net_revenue),2) as revenue
   from amazon_sales
   group by ship_state) as revenue_table
 where revenue > (select avg(revenue) 
				  from (select ship_state, round(sum(net_revenue),2) as revenue from amazon_sales
				  group by ship_state) as avg_revenue_table)
 order by revenue desc;
 
 -- Rank States by Revenue
select ship_state, sum(net_revenue) as revenue,
rank() over(order by sum(net_revenue) desc) as revenue_rank
from amazon_sales
group by ship_state;
 
 -- Revenue Share %
 select ship_state,sum(net_revenue) as revenue,
 (sum(net_revenue)*100.0/sum(sum(net_revenue)) over()) as revenue_share
 from amazon_sales
 group by ship_state
 order by revenue_share desc;
 
 -- DENSE_RANK
 
 select ship_state,sum(net_revenue) as revenue, 
 dense_rank() over (order by sum(net_revenue) desc) as state_rank
 from amazon_sales
 group by ship_state;
