-- Store Performance -- 

-- Highest revenue stores --
select s1.StoreKey, s1.state, s1.country, round(SUM(p.unitpriceUSD * s.quantity * e.`exchange`),2) as total_revenue 
from products p join sales s on p.ProductKey = s.ProductKey
join exchange_rates e on s.OrderDate = e.`date` and s.CurrencyCode = e.currency
join stores s1 on s1.StoreKey = s.StoreKey
group by s1.StoreKey, s1.state, s1.country order by total_revenue DESC limit 10;


-- Best stores by country --
WITH cte1 as (
SELECT s1.StoreKey, s1.country, round(SUM(p.UnitPriceUSD * s.Quantity * e.`Exchange`),2) AS total_revenue
FROM sales s JOIN products p ON s.ProductKey = p.ProductKey
JOIN exchange_rates e ON s.OrderDate = e.`Date` AND s.CurrencyCode = e.Currency
join stores s1 on s1.StoreKey = s.StoreKey
group by s1.StoreKey, s1.country order by total_revenue DESC),

cte2 as (
SELECT storekey, country, total_revenue, dense_rank() over (partition by country order by total_revenue desc) as rnk from cte1)

select country,storekey, total_revenue from cte2 where rnk = 1;

-- Store size vs revenue -- 
select case when s1.SquareMeters>=245 and s1.SquareMeters<=600 then "Small store (245-600)"
						when s1.SquareMeters>=601 and s1.SquareMeters<=1000 then "Medium store (601-1000)"
                        when s1.SquareMeters>=1001 and s1.SquareMeters<=1500 then "Large store (1001-1500)"
                        when s1.SquareMeters>=1501 and s1.SquareMeters<=2105 then "Extra Large store (1501-2105)"
					end as store_size,
                    round(AVG(p.unitpriceUSD * s.quantity * e.`exchange`),2) as avg_revenue 
from products p join sales s on p.ProductKey = s.ProductKey
join exchange_rates e on s.OrderDate = e.`date` and s.CurrencyCode = e.currency
join stores s1 on s1.StoreKey = s.StoreKey
where s1.StoreKey!= 0
group by store_size order by avg_revenue DESC;


-- Older vs Newer stores --
select case when year(s1.opendate)>=2005 and year(s1.opendate)<=2008 then "Pioneer stores (2005-2008)"
						when year(s1.opendate)>=2009 and year(s1.opendate)<=2012 then "Growth era stores (2009-2012)"
                        when year(s1.opendate)>=2013 and year(s1.opendate)<=2016 then "Expansion era stores (2013-2016)"
                        when year(s1.opendate)>=2017 and year(s1.opendate)<=2019 then "Recent stores (2017-2019)"
					end as store_open_year,
                    round(AVG(p.unitpriceUSD * s.quantity * e.`exchange`),2) as avg_revenue 
from products p join sales s on p.ProductKey = s.ProductKey
join exchange_rates e on s.OrderDate = e.`date` and s.CurrencyCode = e.currency
join stores s1 on s1.StoreKey = s.StoreKey
where s1.storekey !=0
group by store_open_year order by avg_revenue DESC;