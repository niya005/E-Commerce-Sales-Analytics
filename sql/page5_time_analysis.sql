-- Monthly Revenue
select month, round(sum(net_revenue),2) as monthly_revenue
from amazon_sales
group by month
order by min(date);

-- monthly orders
select month, count(*) as monthly_orders 
from amazon_sales
group by month
order by min(date);

-- Monthly Units Sold
select month, sum(qty) as monthly_units 
from amazon_sales
group by month
order by min(date);


-- Running Revenue (Window Function)
SELECT
    month,
    revenue,
    SUM(revenue) OVER(
        ORDER BY month  
    ) AS cumulative_revenue
FROM
(
    SELECT
        month,
        ROUND(SUM(net_revenue),2) AS revenue
    FROM amazon_sales
    GROUP BY month
) monthly_revenue;

-- Revenue Growth from Previous Month (LAG)
SELECT
    month,
    revenue,
    LAG(revenue) OVER(
        ORDER BY first_date
    ) AS previous_month_revenue
FROM
(
    SELECT
        month,
        min(date) as first_date,
        ROUND(SUM(net_revenue),2) AS revenue
    FROM amazon_sales
    GROUP BY month
) monthly_revenue;

-- Month-on-Month Growth %
SELECT
    month,
    revenue,
    previous_month_revenue,

    ROUND(
        (
            revenue-previous_month_revenue
        )*100.0/
        previous_month_revenue,
        2
    ) AS growth_percentage

FROM
(
    SELECT
        month,
        revenue,

        LAG(revenue) OVER(
            ORDER BY month
        ) AS previous_month_revenue

    FROM
    (
        SELECT
            month,
            ROUND(SUM(net_revenue),2) AS revenue
        FROM amazon_sales
        GROUP BY month
    ) monthly_revenue

) growth_table;

-- Ranking Months by Revenue
SELECT
    month,
    ROUND(SUM(net_revenue),2) AS revenue,
    RANK() OVER(
        ORDER BY SUM(net_revenue) DESC
    ) AS revenue_rank
FROM amazon_sales
GROUP BY month;

-- Running Orders
SELECT
    month,
    total_orders,
	SUM(total_orders) OVER(
        ORDER BY month
    ) AS cumulative_orders
FROM
(
    SELECT
        month,
        COUNT(*) AS total_orders
    FROM amazon_sales
    GROUP BY month
) monthly_orders;