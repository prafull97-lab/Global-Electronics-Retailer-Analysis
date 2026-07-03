-- Operational Analysis -- 

-- Average delivery time --
select avg(datediff(DeliveryDate, OrderDate)) as avg_delivery_time from sales where DeliveryDate is not null;

-- Pending orders --
select count(*) as pending_orders from sales where DeliveryDate is null;

-- Average delivery time by country --
select c.country, avg(datediff(s.DeliveryDate, s.OrderDate)) as avg_delivery_time from sales s join customers c on c.CustomerKey = s.CustomerKey
 where s.DeliveryDate is not null group by c.country;
 
-- Average delivery time over the years -- 
select year(s.orderdate) as year, avg(datediff(s.DeliveryDate, s.OrderDate)) as avg_delivery_time from sales s
where s.DeliveryDate is not null group by year;
