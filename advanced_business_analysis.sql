-- Advanced Business Analysis --

-- categories with High revenue and high profit margin --
SELECT p.Category AS Category, round(SUM(p.UnitPriceUSD * s.Quantity * e.`Exchange`),2) AS total_revenue, 
round(SUM((p.UnitPriceUSD-p.UnitCostUSD) * s.Quantity * e.`Exchange`),2) as total_profit,
round((SUM((p.UnitPriceUSD-p.UnitCostUSD) * s.Quantity * e.`Exchange`)/SUM(p.UnitPriceUSD * s.Quantity * e.`Exchange`))*100.0,2) AS profit_margin
FROM sales s JOIN products p ON s.ProductKey = p.ProductKey
JOIN exchange_rates e ON s.OrderDate = e.`Date` AND s.CurrencyCode = e.Currency
GROUP BY Category ORDER BY total_revenue desc, profit_margin DESC;

-- Products with High sales volume low profit -- 
select p.ProductName, SUM(s.quantity) as total_quantity, round(SUM((p.UnitPriceUSD - p.UnitCostUSD)*s.Quantity * e.Exchange),2) AS total_profit,
round(SUM((p.UnitPriceUSD - p.UnitCostUSD)*s.Quantity * e.Exchange)/SUM(s.quantity),2) as profit_per_unit
from products p join sales s on p.ProductKey = s.ProductKey
JOIN exchange_rates e ON s.OrderDate = e.Date AND s.CurrencyCode = e.Currency
GROUP BY p.ProductKey, p.ProductName ORDER BY total_quantity desc, profit_per_unit asc limit 5; 

-- Brands with High margin low revenue --
select p.brand, round(SUM(p.UnitPriceUSD * s.Quantity * e.`Exchange`),2) AS total_revenue, 
round(SUM((p.unitpriceUSD-p.unitcostUSD) * s.quantity * e.`exchange`),2) as total_profit,
round((SUM((p.UnitPriceUSD-p.UnitCostUSD) * s.Quantity * e.`Exchange`)/SUM(p.UnitPriceUSD * s.Quantity * e.`Exchange`))*100.0,2) AS profit_margin
from products p join sales s on p.ProductKey = s.ProductKey
join exchange_rates e on s.OrderDate = e.`date` and s.CurrencyCode = e.currency
group by p.brand order by profit_margin desc, total_revenue asc;

-- Countries for expansion --
select c.country, count(distinct c.customerkey) as total_customers, round(SUM(p.unitpriceUSD * s.quantity * e.`exchange`),2) as total_revenue, 
round(round(SUM(p.unitpriceUSD * s.quantity * e.`exchange`),2)/count(distinct c.customerkey),2) as revenuepercustomer
from products p join sales s on p.ProductKey = s.ProductKey
join exchange_rates e on s.OrderDate = e.`date` and s.CurrencyCode = e.currency
join customers c on c.CustomerKey = s.CustomerKey
group by c.country order by revenuepercustomer desc;

-- Customer segments by revenue -- 
select c.country, c.gender, round(SUM(p.unitpriceUSD * s.quantity * e.`exchange`),2) as total_revenue 
from products p join sales s on p.ProductKey = s.ProductKey
join exchange_rates e on s.OrderDate = e.`date` and s.CurrencyCode = e.currency
join customers c on c.CustomerKey = s.CustomerKey
group by c.country, c.gender order by total_revenue DESC;

-- Products to be discontinued -- 
select p.ProductName, SUM(s.quantity) as total_quantity, round(SUM((p.UnitPriceUSD - p.UnitCostUSD)*s.Quantity * e.Exchange),2) AS total_profit,
round(SUM((p.UnitPriceUSD - p.UnitCostUSD)*s.Quantity * e.Exchange)/SUM(s.quantity),2) as profit_per_unit
from products p join sales s on p.ProductKey = s.ProductKey
JOIN exchange_rates e ON s.OrderDate = e.Date AND s.CurrencyCode = e.Currency
GROUP BY p.ProductKey, p.ProductName order by profit_per_unit asc limit 5;

-- Revenue over time trend ( factors affecting revenue) 
SELECT YEAR(s.OrderDate) AS year, p.Category,
round(SUM(p.UnitPriceUSD * s.Quantity * e.`Exchange`),2) AS total_revenue
FROM sales s JOIN products p ON s.ProductKey = p.ProductKey
JOIN exchange_rates e ON s.OrderDate = e.`Date` AND s.CurrencyCode = e.Currency
GROUP BY year, p.Category ORDER BY year, total_revenue DESC;
