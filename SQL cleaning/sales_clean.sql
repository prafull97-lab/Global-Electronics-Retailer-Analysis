select * from sales;

-- To check nulls -- 
select count(*) from sales where OrderNumber is null or OrderNumber ='';
select count(*) from sales where lineitem is null or LineItem ='';
select count(*) from sales where OrderDate is null or orderdate ='';
select count(*) from sales where DeliveryDate is null or deliverydate ='';
select count(*) from sales where CustomerKey is null or customerkey ='';
select count(*) from sales where StoreKey is null or StoreKey =''; 
select count(*) from sales where ProductKey is null or ProductKey ='';
select count(*) from sales where Quantity is null or Quantity ='';
select count(*) from sales where CurrencyCode is null or CurrencyCode ='';


-- Data consistency --
select min(quantity), max(quantity) from sales;

-- To check if there are whitespaces -- 
select distinct currencycode from sales;


-- To change text orderdate column to date orderdate -- 
UPDATE sales
SET OrderDate = STR_TO_DATE(OrderDate, '%d-%m-%Y');

ALTER TABLE sales
MODIFY COLUMN OrderDate DATE;

-- To change text deliverydate column to date deliverydate -- 
UPDATE sales
SET DeliveryDate = STR_TO_DATE(DeliveryDate, '%d-%m-%Y');

ALTER TABLE sales
MODIFY COLUMN DeliveryDate DATE;


