use ecommerce_sales_analytics;
select * from clean_sale_report
limit 10;

ALTER TABLE clean_sale_report
RENAME COLUMN `SKU Code` TO sku_code;

ALTER TABLE clean_sale_report
RENAME COLUMN `Design No.` TO design_no;

ALTER TABLE clean_sale_report
RENAME COLUMN Stock TO stock;

ALTER TABLE clean_sale_report
RENAME COLUMN Category TO category;

ALTER TABLE clean_sale_report
RENAME COLUMN Size TO size;

ALTER TABLE clean_sale_report
RENAME COLUMN Color TO color;

SELECT * FROM clean_sale_report LIMIT 10;

select * from amazon_sales as a inner join clean_sale_report as c
on a.sku = c.sku_code
limit 10;

select count(*) from 
amazon_sales as a inner join clean_sale_report as c
on a.sku = c.sku_code;

-- Top Revenue-Producing Designs
select c.design_no,sum(a.net_revenue) as revenue, max(c.stock) as stock_left 
from amazon_sales as a INNER join clean_sale_report as c
on a.sku = c.sku_code
group by c.design_no
order by revenue desc limit 10;

-- Top Selling Designs
select c.design_no, sum(a.qty) as units_sold, max(c.stock) as stock_left
from amazon_sales as a inner join clean_sale_report as c
on a.sku = c.sku_code
group by c.design_no
order by units_sold desc limit 10;

-- Products at Risk of Stock-Out
select c.design_no,sum(a.qty) as units_sold,
(case 
when max(c.stock)<10 then "critical"
when max(c.stock)<30 then "low stock"
else "healthy"
end) as stock_status
from amazon_sales as a inner join clean_sale_report as c
on a.sku = c.sku_code
group by c.design_no
order by units_sold desc;

-- Category-wise Revenue and Stock
select c.category, sum(a.net_revenue) as revenue, max(c.stock) as stock_left
from amazon_sales as a inner join clean_sale_report as c 
on a.sku = c.sku_code
group by c.category
order by revenue desc;

-- High Revenue but Low Stock Products 
with revenue_table as
(select c.design_no, sum(a.net_revenue) as revenue,max(c.stock) as stock_left
from amazon_sales as a inner join clean_sale_report as c 
on a.sku = c.sku_code
group by c.design_no
order by revenue desc) 

select * 
from revenue_table 
having stock_left < 30;


-- Which products are present in inventory but have never been sold?
select 
c.design_no, c.category,c.stock
from clean_sale_report as c left join amazon_sales as a 
on c.sku_code=a.sku 
where a.sku is null;

-- Rank products by revenue within each category
SELECT category, design_no, revenue,
    RANK() OVER(
        PARTITION BY category
        ORDER BY revenue DESC
    ) AS category_rank
FROM(SELECT s.category,s.design_no,
        ROUND(SUM(a.net_revenue),2) AS revenue
    FROM amazon_sales a
    INNER JOIN clean_sale_report s
    ON a.sku = s.sku_code
    GROUP BY s.category, s.design_no
) product_revenue;
