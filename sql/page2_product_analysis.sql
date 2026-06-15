-- Revenue by Category
select category, round(sum(net_revenue),2) as revenue
from amazon_sales
group by category
order by revenue desc ;

-- Units Sold by Category
select category, sum(qty) as units_sold
from amazon_sales
group by category
order by units_sold desc ;

-- revenue by size
select size, round(sum(net_revenue),2) as revenue
from amazon_sales
group by size
order by revenue desc ;

-- units sold by size
select size, sum(qty) as units_sold
from amazon_sales
group by size
order by units_sold desc ;

-- Average Order Value by Category
select category, round(avg(net_revenue),2) as average_order
from amazon_sales
group by category
order by average_order desc ;

-- Number of Orders by Category
select category, count(*) as Number_of_Orders
from amazon_sales
group by category
order by Number_of_Orders desc ;

-- Revenue Contribution %
SELECT
category,
ROUND(
SUM(net_revenue)/
(
SELECT SUM(net_revenue)
FROM amazon_sales
)*100,2
) AS revenue_percentage
FROM amazon_sales
GROUP BY category
ORDER BY revenue_percentage DESC;

-- Top 10 Styles by Revenue
select style, round(sum(net_revenue),2) as revenue
from amazon_sales
group by style
order by revenue desc limit 10 ;