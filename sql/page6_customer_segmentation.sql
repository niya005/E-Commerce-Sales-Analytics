-- B2B vs B2C Revenue
select 
(case b2b 
when 1 then "B2B"
ELSE "B2C"
end) as customer_type, sum(net_revenue) as revenue
from amazon_sales
group by b2b;

-- B2B vs B2C Orders
select 
(case b2b 
when 1 then "B2B"
ELSE "B2C"
end) as customer_type, count(*) as total_orders
from amazon_sales
group by b2b;

-- Category-wise Average Order Value
select category, round(avg(net_revenue),2) as avg_order_value
from amazon_sales
group by category
order by avg_order_value desc;

-- Categories Above Overall Average Revenue 
select category,sum(net_revenue) as revenue
from amazon_sales
group by category
having sum(net_revenue) > (select(avg(revenue)) from 
(select category,sum(net_revenue) as revenue
from amazon_sales
group by category) as avg_table)
order by revenue desc;

-- Rank Categories by Revenue
select category,sum(net_revenue) as revenue, rank() over(order by sum(net_revenue) desc) as revenue_rank	
from amazon_sales
group by category;

-- Revenue Percentage Contribution
select category,ROUND(SUM(net_revenue),2) AS revenue, 
round((sum(net_revenue) * 100.0/ sum(sum(net_revenue)) over()),2) as percentage_contri
from amazon_sales
group by category
order by percentage_contri desc;

-- Quartile Segmentation 
select category, ROUND(SUM(net_revenue),2) AS revenue,
ntile(4)over(order by ROUND(SUM(net_revenue),2) desc) as quartile_segmentation
from amazon_sales
group by category;

-- Pareto Analysis (80-20 Rule)
WITH category_revenue AS
(SELECT category, ROUND(SUM(net_revenue),2) AS revenue
FROM amazon_sales
GROUP BY category)

SELECT category,revenue,ROUND(SUM(revenue)
OVER(ORDER BY revenue DESC),2) AS cumulative_revenue
FROM category_revenue;