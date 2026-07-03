-- Product Performance --

-- Top 5 highest revenue products --
SELECT p.ProductName, round(SUM(p.UnitPriceUSD * s.Quantity * e.`Exchange`),2) AS total_revenue
FROM sales s JOIN products p ON s.ProductKey = p.ProductKey
JOIN exchange_rates e ON s.OrderDate = e.`Date` AND s.CurrencyCode = e.Currency
GROUP BY p.ProductKey, p.ProductName ORDER BY total_revenue DESC LIMIT 5;

-- Top 5 highest quantity products --
select p.ProductName, SUM(s.quantity) as total_quantity
from products p join sales s on p.ProductKey = s.ProductKey
GROUP BY p.ProductKey, p.ProductName ORDER BY total_quantity DESC LIMIT 5;

-- Top 5 highest profit products -- 
SELECT p.ProductName, round(SUM((p.UnitPriceUSD - p.UnitCostUSD)*s.Quantity * e.`Exchange`),2) AS total_profit
FROM sales s JOIN products p ON s.ProductKey = p.ProductKey
JOIN exchange_rates e ON s.OrderDate = e.`Date` AND s.CurrencyCode = e.Currency
GROUP BY p.ProductKey, p.ProductName ORDER BY total_profit DESC LIMIT 5;


-- Top product per category -- 
WITH cte1 as (
SELECT p.category, p.ProductName, round(SUM(p.UnitPriceUSD * s.Quantity * e.`Exchange`),2) AS total_revenue
FROM sales s JOIN products p ON s.ProductKey = p.ProductKey
JOIN exchange_rates e ON s.OrderDate = e.`Date` AND s.CurrencyCode = e.Currency
GROUP BY p.category, p.ProductKey, p.ProductName),

cte2 as (
SELECT category, ProductName, total_revenue, rank() over (partition by category order by total_revenue desc) as rnk from cte1)

select category,ProductName, total_revenue from cte2 where rnk = 1;
