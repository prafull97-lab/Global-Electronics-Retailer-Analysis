-- Sales Performance -- 
-- Total revenue --
select round(SUM(p.unitpriceUSD * s.quantity * e.`exchange`),2) as total_revenue 
from products p join sales s on p.ProductKey = s.ProductKey
join exchange_rates e on s.OrderDate = e.`date` and s.CurrencyCode = e.currency;

-- Total revenue by year --
SELECT YEAR(s.OrderDate) AS year, round(SUM(p.UnitPriceUSD * s.Quantity * e.`Exchange`),2) AS total_revenue
FROM sales s JOIN products p ON s.ProductKey = p.ProductKey
JOIN exchange_rates e ON s.OrderDate = e.`Date` AND s.CurrencyCode = e.Currency
GROUP BY year ORDER BY year;

-- Total revenue by category --
SELECT p.Category AS Category, round(SUM(p.UnitPriceUSD * s.Quantity * e.`Exchange`),2) AS total_revenue
FROM sales s JOIN products p ON s.ProductKey = p.ProductKey
JOIN exchange_rates e ON s.OrderDate = e.`Date` AND s.CurrencyCode = e.Currency
GROUP BY Category ORDER BY total_revenue DESC;

-- Total profit by category --
SELECT p.Category AS Category, round(SUM((p.UnitPriceUSD-p.UnitCostUSD) * s.Quantity * e.`Exchange`),2) AS total_profit
FROM sales s JOIN products p ON s.ProductKey = p.ProductKey
JOIN exchange_rates e ON s.OrderDate = e.`Date` AND s.CurrencyCode = e.Currency
GROUP BY Category ORDER BY total_profit DESC;

-- Total revenue by brand --
select p.brand, round(SUM(p.unitpriceUSD * s.quantity * e.`exchange`),2) as total_revenue 
from products p join sales s on p.ProductKey = s.ProductKey
join exchange_rates e on s.OrderDate = e.`date` and s.CurrencyCode = e.currency
group by p.brand order by total_revenue desc;


-- Low sales high profit brands --
select p.brand, SUM(s.quantity) as total_quantity, round(SUM((p.unitpriceUSD-p.unitcostUSD) * s.quantity * e.`exchange`),2) as total_profit 
from products p join sales s on p.ProductKey = s.ProductKey
join exchange_rates e on s.OrderDate = e.`date` and s.CurrencyCode = e.currency
group by p.brand order by total_quantity, total_profit desc;






















 

 
 









WITH daily_revenue AS (
SELECT s.OrderDate, round(SUM(p.UnitPriceUSD * s.Quantity * e.`Exchange`),2) AS total_revenue
FROM sales s JOIN products p ON s.ProductKey = p.ProductKey
JOIN exchange_rates e ON s.OrderDate = e.`Date` AND s.CurrencyCode = e.Currency
GROUP BY s.OrderDate)

SELECT OrderDate, total_revenue, round(SUM(total_revenue) OVER (order by OrderDate),2) as running_revenue from daily_revenue;





