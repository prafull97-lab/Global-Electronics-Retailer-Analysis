-- Customer Analysis -- 

-- Top 10 highest value customers --
select c.`name`, round(SUM(p.unitpriceUSD * s.quantity * e.`exchange`),2) as total_revenue 
from products p join sales s on p.ProductKey = s.ProductKey
join exchange_rates e on s.OrderDate = e.`date` and s.CurrencyCode = e.currency
join customers c on c.CustomerKey = s.CustomerKey
group by c.CustomerKey, c.`name` order by total_revenue desc limit 10;


-- Customers above average revenue order --
WITH customer_revenue AS (
select c.`name`, round(SUM(p.unitpriceUSD * s.quantity * e.`exchange`),2) as total_revenue 
from products p join sales s on p.ProductKey = s.ProductKey
join exchange_rates e on s.OrderDate = e.`date` and s.CurrencyCode = e.currency
join customers c on c.CustomerKey = s.CustomerKey
group by c.CustomerKey, c.`name`)

select `name`, total_revenue from customer_revenue where (total_revenue > (select avg(total_revenue) from customer_revenue)) order by total_revenue desc;

-- Countries with the largest customer base --
select c.country, count(distinct c.customerkey) as total_customers
from customers c
group by c.country order by total_customers DESC;

-- Total revenue by gender --
select c.gender, round(SUM(p.unitpriceUSD * s.quantity * e.`exchange`),2) as total_revenue 
from products p join sales s on p.ProductKey = s.ProductKey
join exchange_rates e on s.OrderDate = e.`date` and s.CurrencyCode = e.currency
join customers c on c.CustomerKey = s.CustomerKey
group by c.gender order by total_revenue DESC;

-- Total revenue by country -- 
select c.country, round(SUM(p.unitpriceUSD * s.quantity * e.`exchange`),2) as total_revenue 
from products p join sales s on p.ProductKey = s.ProductKey
join exchange_rates e on s.OrderDate = e.`date` and s.CurrencyCode = e.currency
join customers c on c.CustomerKey = s.CustomerKey
group by c.country order by total_revenue DESC;

-- High customers low revenue --
select c.country, count(distinct c.customerkey) as total_customers, round(SUM(p.unitpriceUSD * s.quantity * e.`exchange`),2) as total_revenue, 
round(round(SUM(p.unitpriceUSD * s.quantity * e.`exchange`),2)/count(distinct c.customerkey),2) as revenuepercustomer
from products p join sales s on p.ProductKey = s.ProductKey
join exchange_rates e on s.OrderDate = e.`date` and s.CurrencyCode = e.currency
join customers c on c.CustomerKey = s.CustomerKey
group by c.country order by total_customers desc, revenuepercustomer asc;
